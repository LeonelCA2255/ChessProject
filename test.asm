;-------------------------------------
; Chess Game - Men� Principal
;-------------------------------------
INCLUDE Irvine32.inc

.data
    titleLabel  BYTE "CHESS GAME", 0
    menuOption1 BYTE "1. Usuario (Iniciar sesi�n / Registrar)", 0
    menuOption2 BYTE "2. Iniciar Juego", 0
    menuOption3 BYTE "3. Salir del sistema", 0
    promptText  BYTE "Ingrese una opci�n: ", 0
    userInput   BYTE 10 DUP (?)            ; Buffer para la entrada del usuario

    ; Variables para el submen� de usuario
    subMenuTitle BYTE "Submen� Usuario", 0
    menuLogin    BYTE "1. Iniciar sesi�n", 0
    menuCreate   BYTE "2. Crear cuenta", 0
    enterUser    BYTE "Ingrese su nombre de usuario: ", 0
    enterPass    BYTE "Ingrese su contrase�a: ", 0

.code
main PROC
    ;-------------------------------------
    ; Men� Principal
    ;-------------------------------------
    call Clrscr                 ; Limpiar pantalla
    mov edx, OFFSET titleLabel   ; Mostrar el t�tulo
    call WriteString
    call Crlf                    ; Nueva l�nea

    ; Mostrar opciones del men� principal
    mov edx, OFFSET menuOption1
    call WriteString
    call Crlf

    mov edx, OFFSET menuOption2
    call WriteString
    call Crlf

    mov edx, OFFSET menuOption3
    call WriteString
    call Crlf

    ; Solicitar la entrada del usuario
    mov edx, OFFSET promptText
    call WriteString
    call ReadUserInput            ; Leer la entrada del usuario

    ; Procesar la opci�n del usuario
    mov al, userInput[0]
    cmp al, '1'
    je UserMenu                  ; Saltar al submen� de usuario

    cmp al, '2'
    je StartGame                 ; Saltar al inicio del juego

    cmp al, '3'
    je ExitGame                  ; Salir del sistema

    jmp main                     ; Si no es v�lida, volver a mostrar el men�

    ;-------------------------------------
    ; Submen� de Usuario
    ;-------------------------------------
UserMenu PROC
    call Clrscr
    mov edx, OFFSET subMenuTitle  ; Mostrar t�tulo del submen�
    call WriteString
    call Crlf

    mov edx, OFFSET menuLogin     ; Opci�n 1: Iniciar sesi�n
    call WriteString
    call Crlf

    mov edx, OFFSET menuCreate    ; Opci�n 2: Crear cuenta
    call WriteString
    call Crlf

    ; Solicitar la entrada del usuario
    mov edx, OFFSET promptText
    call WriteString
    call ReadUserInput

    ; Procesar la opci�n del submen�
    mov al, userInput[0]
    cmp al, '1'
    je Login

    cmp al, '2'
    je CreateAccount

    jmp UserMenu                  ; Si no es v�lida, volver a mostrar el submen�
UserMenu ENDP

;-------------------------------------
; Login (Iniciar sesi�n)
;-------------------------------------
Login PROC
    call Clrscr
    mov edx, OFFSET enterUser     ; Solicitar nombre de usuario
    call WriteString
    lea edx, userInput
    call ReadString

    mov edx, OFFSET enterPass     ; Solicitar contrase�a
    call WriteString
    lea edx, userInput
    call ReadString

    ; Aqu� se realizar�a la l�gica de validaci�n del usuario.
    jmp main                     ; Volver al men� principal despu�s de iniciar sesi�n
Login ENDP

;-------------------------------------
; CreateAccount (Crear cuenta)
;-------------------------------------
CreateAccount PROC
    call Clrscr
    mov edx, OFFSET enterUser     ; Solicitar nombre de usuario
    call WriteString
    lea edx, userInput
    call ReadString

    mov edx, OFFSET enterPass     ; Solicitar contrase�a
    call WriteString
    lea edx, userInput
    call ReadString

    ; Aqu� se guardar�a el nuevo usuario y contrase�a en un archivo.
    jmp main                     ; Volver al men� principal despu�s de crear cuenta
CreateAccount ENDP

;-------------------------------------
; Procedimiento StartGame (Iniciar juego)
;-------------------------------------
StartGame PROC
    call Clrscr
    mov edx, OFFSET menuOption2
    call WriteString
    call Crlf
    jmp main
StartGame ENDP

;-------------------------------------
; Procedimiento ExitGame (Salir del sistema)
;-------------------------------------
ExitGame PROC
    call ExitProcess            ; Salir del programa
ExitGame ENDP

;-------------------------------------
; ReadUserInput
;-------------------------------------
; Lee una entrada de texto del usuario y la almacena en userInput.
;-------------------------------------
ReadUserInput PROC
    lea edx, userInput           ; Cargar la direcci�n del buffer
    mov ecx, 10                  ; Tama�o m�ximo del buffer
    call ReadString              ; Leer la entrada del usuario
    ret
ReadUserInput ENDP

.END main

;-------------------------------------
; Chess Game - Menú Principal
;-------------------------------------
INCLUDE Irvine32.inc

.data
    titleLabel  BYTE "CHESS GAME", 0
    menuOption1 BYTE "1. Usuario (Iniciar sesión / Registrar)", 0
    menuOption2 BYTE "2. Iniciar Juego", 0
    menuOption3 BYTE "3. Salir del sistema", 0
    promptText  BYTE "Ingrese una opción: ", 0
    userInput   BYTE 10 DUP (?)            ; Buffer para la entrada del usuario

    ; Variables para el submenú de usuario
    subMenuTitle BYTE "Submenú Usuario", 0
    menuLogin    BYTE "1. Iniciar sesión", 0
    menuCreate   BYTE "2. Crear cuenta", 0
    enterUser    BYTE "Ingrese su nombre de usuario: ", 0
    enterPass    BYTE "Ingrese su contraseña: ", 0

.code
main PROC
    ;-------------------------------------
    ; Menú Principal
    ;-------------------------------------
    call Clrscr                 ; Limpiar pantalla
    mov edx, OFFSET titleLabel   ; Mostrar el título
    call WriteString
    call Crlf                    ; Nueva línea

    ; Mostrar opciones del menú principal
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

    ; Procesar la opción del usuario
    mov al, userInput[0]
    cmp al, '1'
    je UserMenu                  ; Saltar al submenú de usuario

    cmp al, '2'
    je StartGame                 ; Saltar al inicio del juego

    cmp al, '3'
    je ExitGame                  ; Salir del sistema

    jmp main                     ; Si no es válida, volver a mostrar el menú

    ;-------------------------------------
    ; Submenú de Usuario
    ;-------------------------------------
UserMenu PROC
    call Clrscr
    mov edx, OFFSET subMenuTitle  ; Mostrar título del submenú
    call WriteString
    call Crlf

    mov edx, OFFSET menuLogin     ; Opción 1: Iniciar sesión
    call WriteString
    call Crlf

    mov edx, OFFSET menuCreate    ; Opción 2: Crear cuenta
    call WriteString
    call Crlf

    ; Solicitar la entrada del usuario
    mov edx, OFFSET promptText
    call WriteString
    call ReadUserInput

    ; Procesar la opción del submenú
    mov al, userInput[0]
    cmp al, '1'
    je Login

    cmp al, '2'
    je CreateAccount

    jmp UserMenu                  ; Si no es válida, volver a mostrar el submenú
UserMenu ENDP

;-------------------------------------
; Login (Iniciar sesión)
;-------------------------------------
Login PROC
    call Clrscr
    mov edx, OFFSET enterUser     ; Solicitar nombre de usuario
    call WriteString
    lea edx, userInput
    call ReadString

    mov edx, OFFSET enterPass     ; Solicitar contraseña
    call WriteString
    lea edx, userInput
    call ReadString

    ; Aquí se realizaría la lógica de validación del usuario.
    jmp main                     ; Volver al menú principal después de iniciar sesión
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

    mov edx, OFFSET enterPass     ; Solicitar contraseña
    call WriteString
    lea edx, userInput
    call ReadString

    ; Aquí se guardaría el nuevo usuario y contraseña en un archivo.
    jmp main                     ; Volver al menú principal después de crear cuenta
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
    lea edx, userInput           ; Cargar la dirección del buffer
    mov ecx, 10                  ; Tamaño máximo del buffer
    call ReadString              ; Leer la entrada del usuario
    ret
ReadUserInput ENDP

.END main

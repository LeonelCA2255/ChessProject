INCLUDE Irvine32.inc

.data
    titleLabel  BYTE "CHESS GAME", 0
    menuOption1 BYTE "1. Usuario (Iniciar sesion / Registrar)", 0
    menuOption2 BYTE "2. Iniciar Juego", 0
    menuOption3 BYTE "3. Salir del sistema", 0
    promptText  BYTE "Ingrese una opcion: ", 0
    userInput   BYTE 10 DUP (?)            ; Buffer para la entrada del usuario

    subMenuTitle BYTE "Submenu Usuario", 0
    menuLogin    BYTE "1. Iniciar sesion", 0
    menuCreate   BYTE "2. Crear cuenta", 0
    enterUser    BYTE "Ingrese su nombre de usuario: ", 0
    enterPass    BYTE "Ingrese su contrasena: ", 0
    username     BYTE 50 DUP (?)           ; Buffer para el nombre de usuario
    password     BYTE 50 DUP (?)           ; Buffer para la contrasena

.code
MainMenu PROC
    ; Funcion que muestra el menu principal del juego
    call Clrscr                 ; Limpiar pantalla
    mov edx, OFFSET titleLabel   ; Mostrar el titulo
    call WriteString
    call Crlf                    ; Nueva linea

    ; Funcion que muestra las opciones del menu principal
    mov edx, OFFSET menuOption1
    call WriteString
    call Crlf

    mov edx, OFFSET menuOption2
    call WriteString
    call Crlf

    mov edx, OFFSET menuOption3
    call WriteString
    call Crlf

    ; Funcion que solicita la entrada del usuario
    mov edx, OFFSET promptText
    call WriteString
    call ReadUserInput            ; Leer la entrada del usuario

    ; Funcion que procesa la opcion seleccionada por el usuario
    mov al, userInput[0]
    cmp al, '1'
    je UserMenu                  ; Saltar al submenu de usuario

    cmp al, '2'
    je StartGame                 ; Saltar al inicio del juego

    cmp al, '3'
    je ExitGame                  ; Salir del sistema

    jmp MainMenu                 ; Si no es valida, volver a mostrar el menu
MainMenu ENDP

UserMenu PROC
    ; Funcion que muestra el submenu de usuario
    call Clrscr
    mov edx, OFFSET subMenuTitle  ; Mostrar titulo del submenu
    call WriteString
    call Crlf

    mov edx, OFFSET menuLogin     ; Opcion 1: Iniciar sesion
    call WriteString
    call Crlf

    mov edx, OFFSET menuCreate    ; Opcion 2: Crear cuenta
    call WriteString
    call Crlf

    ; Funcion que solicita la entrada del usuario en el submenu
    mov edx, OFFSET promptText
    call WriteString
    call ReadUserInput

    ; Funcion que procesa la opcion seleccionada en el submenu
    mov al, userInput[0]
    cmp al, '1'
    je Login

    cmp al, '2'
    je CreateAccount

    jmp UserMenu                  ; Si no es valida, volver a mostrar el submenu
UserMenu ENDP

Login PROC
    ; Funcion que gestiona el inicio de sesion del usuario
    call Clrscr
    mov edx, OFFSET enterUser     ; Solicitar nombre de usuario
    call WriteString
    lea edx, username
    call ReadString

    mov edx, OFFSET enterPass     ; Solicitar contrasena
    call WriteString
    lea edx, password
    call ReadString

    ; Simulacion de inicio de sesion sin validacion
    call Crlf
    mov edx, OFFSET username
    call WriteString
    call Crlf

    mov edx, OFFSET password
    call WriteString
    call Crlf

    jmp MainMenu                  ; Volver al menu principal despues de iniciar sesion
Login ENDP

CreateAccount PROC
    ; Funcion que gestiona la creacion de una nueva cuenta
    call Clrscr
    mov edx, OFFSET enterUser     ; Solicitar nombre de usuario
    call WriteString
    lea edx, username
    call ReadString

    mov edx, OFFSET enterPass     ; Solicitar contrasena
    call WriteString
    lea edx, password
    call ReadString

    ; Simulacion de creacion de cuenta sin guardar
    call Crlf
    mov edx, OFFSET username
    call WriteString
    call Crlf

    mov edx, OFFSET password
    call WriteString
    call Crlf

    jmp MainMenu                  ; Volver al menu principal despues de crear cuenta
CreateAccount ENDP

StartGame PROC
    ; Funcion que inicia el juego
    call Clrscr
    mov edx, OFFSET menuOption2
    call WriteString
    call Crlf
    jmp MainMenu
StartGame ENDP

ExitGame PROC
    ; Funcion que finaliza el programa
    call ExitProcess            ; Salir del programa
ExitGame ENDP

ReadUserInput PROC
    ; Funcion que lee la entrada del usuario y la almacena en userInput
    lea edx, userInput           ; Cargar la direccion del buffer
    mov ecx, 10                  ; Tamano maximo del buffer
    call ReadString              ; Leer la entrada del usuario
    ret
ReadUserInput ENDP

END MainMenu
;-------------------------------------
; Chess Game - Main Menu
;-------------------------------------
; Programa en ensamblador usando Irvine32
; Muestra el men� principal de un juego de ajedrez en la consola y maneja la entrada del usuario.
;-------------------------------------

INCLUDE Irvine32.inc  ; Librer�a de Irvine32

.data
    titleLabel  BYTE "CHESS GAME", 0        ; T�tulo del juego
    menuOption1 BYTE "1. Usuario (Iniciar sesion / Registrar)", 0
    menuOption2 BYTE "2. Iniciar Juego", 0
    menuOption3 BYTE "3. Salir del sistema", 0
    promptText  BYTE "Ingrese una opcion: ", 0  ; Texto del prompt
    newLine     BYTE 0Dh, 0Ah, 0            ; Car�cter de nueva l�nea
    userInput   BYTE 10 dup (?)              ; Buffer para almacenar la entrada del usuario

.code
main PROC
    ;-------------------------------------
    ; Inicia el programa y configura el men�
    ;-------------------------------------

    call Clrscr                 ; Limpiar pantalla

    ;-------------------------------------
    ; Mostrar el t�tulo centrado
    ;-------------------------------------
    mov edx, OFFSET titleLabel   ; Cargar la direcci�n del t�tulo
    call CenterText              ; Centrar el t�tulo en la consola
    call Crlf                    ; Nueva l�nea

    ;-------------------------------------
    ; Mostrar las opciones del men�
    ;-------------------------------------
    mov edx, OFFSET menuOption1   ; Opci�n 1: Usuario
    call WriteString
    call Crlf                    ; Salto de l�nea

    mov edx, OFFSET menuOption2   ; Opci�n 2: Iniciar Juego
    call WriteString
    call Crlf                    ; Salto de l�nea

    mov edx, OFFSET menuOption3   ; Opci�n 3: Salir del sistema
    call WriteString
    call Crlf                    ; Salto de l�nea

    ;-------------------------------------
    ; Solicitar la entrada del usuario
    ;-------------------------------------
    mov edx, OFFSET promptText    ; Mensaje de solicitud
    call WriteString
    call ReadUserInput           ; Leer la entrada del usuario

    ;-------------------------------------
    ; Procesar la opci�n del usuario
    ;-------------------------------------
    mov al, userInput[0]         ; Leer el primer car�cter de la entrada
    cmp al, '1'                  ; Comparar con '1'
    je Option1                   ; Si es igual, saltar a Option1

    cmp al, '2'                  ; Comparar con '2'
    je Option2                   ; Si es igual, saltar a Option2

    cmp al, '3'                  ; Comparar con '3'
    je Option3                   ; Si es igual, saltar a Option3

    ; Si la opci�n no es v�lida, volver a mostrar el men�
    call Clrscr                 ; Limpiar pantalla
    jmp main                    ; Volver al inicio del men�

    ;-------------------------------------
    ; Opciones del men�
    ;-------------------------------------
Option1:
    ; Aqu� ir�a la l�gica para la opci�n 1: Usuario
    ; Por ejemplo: Llamar a un procedimiento para iniciar sesi�n o registrar
    mov edx, OFFSET menuOption1
    call WriteString
    call Crlf
    jmp main                    ; Volver al men� principal

Option2:
    ; Aqu� ir�a la l�gica para la opci�n 2: Iniciar Juego
    ; Por ejemplo: Llamar a un procedimiento para iniciar el juego
    mov edx, OFFSET menuOption2
    call WriteString
    call Crlf
    jmp main                    ; Volver al men� principal

Option3:
    ; Aqu� ir�a la l�gica para la opci�n 3: Salir del sistema
    ; Por ejemplo: Finalizar el programa
    mov edx, OFFSET menuOption3
    call WriteString
    call Crlf
    call ExitProcess            ; Salir del programa

main ENDP

;-------------------------------------
; CenterText
;-------------------------------------
; Centra el texto cargado en EDX en la consola.
; Asume que la consola tiene 80 columnas.
;-------------------------------------
CenterText PROC
    pusha                         ; Guardar los registros

    mov ecx, 80                   ; N�mero total de columnas de la consola
    mov ebx, edx                  ; Direcci�n de la cadena en EDX
    call StrLength                ; Llama a la funci�n de Irvine para obtener la longitud
    mov eax, ecx
    sub eax, ebx                  ; Resta la longitud de la cadena al total
    shr eax, 1                    ; Divide entre 2 para centrar

    call Gotoxy                   ; Mueve el cursor a la posici�n centrada
    popa                          ; Restaurar los registros

    ret
CenterText ENDP

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

END main
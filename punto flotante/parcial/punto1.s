.data 
    DIR_CONTROL: .word32 0x10000 ;direccion de CONTROL 
    DIR_DATA: .word32 0x10008    ;direccion de DATA
    msj_success: .asciiz "Ingresaste un numero del 1 al 6: " 
    msj_alert: .asciiz "NO se ingreso un numero del 1 al 6: "
    nl: .asciiz "/n"
.code 
ld $t6,DIR_CONTROL($0)
ld $t7,DIR_DATA($0)
daddi $t0,$0,8              ; codigo para leer un numero
daddi $t9,$0,4              ; codigo para imprimir 
daddi $a1,$0,1              ; codigo para imprimir un numero 
daddi $t8,$0,msj_success    ; dir de msj success 
daddi $t4,$0,msj_alert      ; dir de msj alert  
daddi $t1,$0,1              ;inicio 
daddi $t2,$0,6              ;fin 
sd $t0, 0($t6)              ;guardo codigo en control            
sd $t5, 0($t7)              ;guardo en data el numero ingresado en t5

loop:      beq $t5,$t1,Imprimir  ;si el numero ingresado es igual t1, salto a imprimir
           daddi $t1,$t1,1       ;sumo uno al acumulador
           bne $t1,$t2,loop      ;si el acumulador NO llego a 6, saltar a loop 
           beq $t1,$t2,alerta    ;si el acumulador llego a 6, pasar a la alerta 

Imprimir: sd $t8, 0($t7)         ;
          sd $t9, 0($t6)         ;
          sd $t5, 0($t7)        
          sd $a1, 0($t6)
          j fin

alerta: sd $t4, 0($t7)          ;muestro mensaje
        sd $t9, 0($t6)          ;ingreso codigo para imprimir string
        sd $0, 0($t7)           ;imprimo el cero 
        sd $a1, 0($t6)          ;ingreso codigo para imprimir numero
        j fin

fin: halt
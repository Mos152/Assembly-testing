;Escriba un programa que solicite el ingreso por teclado de una clave (sucesión de cuatro caracteres) utilizando
;la subrutina char de ingreso de un carácter. Luego, debe comparar la secuencia ingresada con una cadena almacenada 
;en la variable clave. 
;Si las dos cadenas son iguales entre si, la subrutina llamada respuesta mostrará el texto 
;“Bienvenido”en la salida estándar  del simulador (ventana  Terminal). 
;En cambio, si las cadenas  no son iguales,  
;la subrutina deberámostrar “ERROR” y solicitar nuevamente el ingreso de la clave

.data 
clave: .asciiz "abcd"
final1: .word 0
user: .asciiz "...."
final2: .word 0 
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
msj_success: .asciiz "la clave es CORRECTA" 
msj_error: .asciiz "la clave es INCORRECTA"
.code
ld $t6,DIR_CONTROL($0)
ld $t7,DIR_DATA($0)
daddi $a2,$0,9   ;codigo
daddi $a3,$0,0   ;desplazamiento
daddi $t1,$0,user       ;dezplazamiento cadena 1
daddi $t2,$0,clave      
daddi $t5,$0,4          ;contador         

rep: sd $a2,0($t6)
     lbu $t9,0($t7)
     sb $t9,user($a3)
     daddi $a3,$a3,1
     daddi $t5,$t5,-1
     bnez $t5,rep 

     daddi $t5,$0,4          ;contador         

loop:   lbu $t3,0($t1)    ;tomo primer caracter cadena 1
        lbu $t4,0($t2)
        beqz $t3, bad_ending
        beqz $t4, bad_ending
        beq $t3,$t4,contador
        j bad_ending

seguir: daddi $t1,$t1,1
        daddi $t2,$t2,1
        j loop 

contador: daddi $t5,$t5,-1      
          beqz $t5,good_ending      ;si el contador llego a cero,la clave es correcta 
          j seguir       

bad_ending: daddi $a0,$0,msj_error
            sd $a0,0($t7)
            daddi $a1,$0,4
            sd $a1,0($t6)
            j fin 
good_ending: daddi $a0,$0,msj_success
            sd $a0,0($t7)
            daddi $a1,$0,4
            sd $a1,0($t6)
            j fin


fin: halt 






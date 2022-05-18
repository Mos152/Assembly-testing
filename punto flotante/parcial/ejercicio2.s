.data 
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
msj_error: .asciiz "solamente se debe ingresar un digito"
msj_success: .asciiz "excelente" 
.code 
ld $t6,DIR_CONTROL($0)
ld $t7,DIR_DATA($0)
daddi $t0,$zero,8   ;codigo leer digito 
daddi $t2,$zero,10  ;limite


ingreso: sd $t0,0($t6)
         sb $t1,0($t7)
         slti $t3,$t1,10       ;t3 es 1 si el digito ingresado es menor a 10   
         bnez $t3, imprimir     ;si t3 NO es igual a cero, paso a imprimir 
         beqz $t3, incorrecto   ;si t3 es igual a cero, paso a mostrar un error 

incorrecto: daddi $t4,$0,msj_error 
            sd $t4,0($t7)
            daddi $t5,$zero,4 
            sd $t5,0($t6)
            j fin
     
imprimir: daddi $t4,$0,msj_success
          sd $t4,0($t7)
          daddi $t5,$zero,4 
          sd $t5,0($t6)
          j fin 
fin: halt



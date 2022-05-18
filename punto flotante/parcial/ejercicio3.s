.data 
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
clave: .asciiz "rgyt"
      
intento: .asciiz "...."
msj_success: .asciiz "la clave es CORRECTA" 
msj_error: .asciiz "la clave es INCORRECTA"
.code 
ld $t6,DIR_CONTROL($0)
ld $t7,DIR_DATA($0)
daddi $t0,$0,9              ;codigo       
daddi $t1,$0,0              ;desplazamiento 
daddi $t2,$0,4              ;cantidad de letras

loop: sd $t0,0($t6)         ;cargo codigo 
      lbu $t3,0($t7)        ;guardo codigo 
      sb $t3,intento($t1)   ;guardo en string 
      daddi $t1,$t1,1       ;aumento desplazamiento 
      daddi $t2,$t2,-1      ;resto contador 
      bnez $t2,loop 

mostrar: daddi $t5,$0,intento
         sd $t5,0($t7)
         daddi $t0,$0,4
         sd $t0,0($t6)
         daddi $t8,$0,clave 
         sd $t8,0($t7)
         sd $t0,0($t6)

comparar: ddivu $a0,$t5,$t8
          beqz $a0,success 
          bnez $a0,error 

success: daddi $t8,$0,msj_success
         daddi $t0,$0,4
         sd $t8,0($t7)    
         sd $t0,0($t6)
         j fin 

error: daddi $t8,$0,msj_error
       daddi $t0,$0,4
       sd $t8,0($t7)    
       sd $t0,0($t6)
       j fin  

fin: halt 

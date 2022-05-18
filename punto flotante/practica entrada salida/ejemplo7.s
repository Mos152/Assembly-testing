;mostrar en pantalla "hola" 10 veces 
.data 
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
str: .asciiz "hola"

.code 
ld $t2,DIR_CONTROL($0)
ld $t3,DIR_DATA($0) 
; t0 = direccion de str 
daddi $t0,$0,str 
sd $t0,0($t3) 
;codigo para imprimir str 
daddi $t1,$0,4
daddi $t4,$0,10 

loop: sd $t1,0($t2)
      daddi $t4,$t4,-1 
      bnez $t4, loop 

halt 

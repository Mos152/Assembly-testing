;mostrar en pantalla "Hola <i>" (i = 10,9, ...,1)

.data 
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
str: .asciiz "hola"
nl: .asciiz "/n"
.code 
ld $t2,DIR_CONTROL($0)
ld $t3,DIR_DATA($0)
daddi $t0,$0,str 
daddi $t6,$0,nl 
;codigo de imprimir 
daddi $t1,$0,4      ;codigo para imprimir string
daddi $t5,$0,1      ;codigo para imprimir numero 
daddi $t4,$0,10     ;cantidad de "hola" 
loop: sd $t0,0($t3) ; D = "Hola" - guardo en data el valor "hola"
      sd $t1,0($t2) ; C = 4 - ingreso el valor 4 para imprimir el string 
      sd $t4,0($t3) ; D = i - agrego el numero de loop en data   
      sd $t5,0($t2) ; C = 1 - ingreso el valor 2 para imprimir un numero 
      sd $t6,0($t3) ; D = "/n" -  
      sd $t1,0($t2) ; C = 4
      daddi $t4, $t4, -1
      bnez $t4, loop
      halt  
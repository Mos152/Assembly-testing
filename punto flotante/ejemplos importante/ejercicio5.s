.data

DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
msj_flotante: .asciiz "ingrese numero: "
msj_exp: .asciiz "ingrese exponente: "

.code 

ld $t6,DIR_CONTROL($0)
ld $t7,DIR_DATA($0)
;mostramos mensajes 
daddi $a0,$0,msj_flotante
daddi $a1,$0,msj_exp
daddi $a2,$0,4  ;imprimir string
sd $a0,0($t7)   
sd $a2,0($t6)       
daddi $a2,$0,8  ;leer numero 
sd $a2,0($t6)   
l.d f1,0($t7)   ;guardo flotante en f1  
daddi $a2,$0,4  
sd $a1,0($t7)   
sd $a2,0($t6)   
daddi $a2,$0,8  
sd $a2,0($t6)   
ld $a3,0($t7)   ;guardo exp en a3 

loop: beqz $a3, resultado 
      mul.d f3,f1,f1
      add.d f2,f2,f3 
      daddi $a3,$a3,-1 
      j loop  


resultado: halt

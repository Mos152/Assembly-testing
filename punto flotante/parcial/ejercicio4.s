.data 
str1: .asciiz "holaaa"
str2: .asciiz "holaaa"
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008 
.code 
daddi $t1,$0,str1       ;dezplazamiento cadena 1  
daddi $t2,$0,str2       ;dezplazamiento cadena 2 
dadd $v0,$0,$0          ;seteo resultado en cero 
daddi $a2,$0,1          ;codigo para imprimir numero
ld $a0,DIR_CONTROL($0)
ld $a1,DIR_DATA($0)

loop: lbu $t3,0($t1)    ;tomo primer caracter cadena 1
      lbu $t4,0($t2)    ;tomo primer caracter cadena 2
      bne $t3,$t4,final 
      


      ;beqz $t3, final   ;si se termina la cadena, termino
      ;beqz $t4, final   ;si se termina la cadena, termino 
      ;bne $t3,$t4,final ;si las letras no son iguales, termino 
      ;daddi $t1,$t1,1   ;paso a la siguiente letra   
      ;daddi $t2,$t2,1   ;paso a la siguiente letra 
      ;j loop 


      ;final: sd $0,0($a1)
      ; sd $a2,0($a0)
      ; j fin

fin: halt

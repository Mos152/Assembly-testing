.data 

M: .word 2
presencia: .word 0
tabla: .word 23,54,65,5,72,4
longitud: .word 6 

.code

;variables locales

ld $t0,longitud($zero)          ;longitud de la tabla
ld $t1,M($zero)                 ;numero a comparar

;parametros 

ld $a0,presencia($zero)

dadd $a1,$0,$0               ;desplazamiento 
dadd $a2,$0,$0               ;flag de numeros mayores
dadd $a3,$0,$0               ;contador 

;subrutina 

loop: ld $v0, tabla($a1)
      slt $a2,$t1,$v0
      beq $a2,$a0,contar
      daddi $a1,$a1,1
      beq $a1,$t0,fin  
      j loop

contar: daddi $a3,$a3,1
        daddi $a1,$a1,1
        beq $a1,$t0,fin         
        dadd $a2,$0,$0
        j loop


fin: halt
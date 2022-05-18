.data 
valor1: .word 10 
result: .double 0 
.text 

dadd $a0,$0,$0          ;registro para guardar resultados
ld $t1, valor1($0)      ;tomo el valor inicial

loop: daddi $t2,$t1,-1     ;tomo el valor inicial y le resto uno
      beqz $t2, fin        ;si llegamos al valor mas chico del factorial, termina el programa
      j factorial          ;empiezo el calculo

factorial:  ld $a1,result($0)
            dmul $a0,$t1,$t2    ;multiplico los valores
            dadd $a1,$a1,$a0
            sd $a1,result($0)   ;guardo el resultado
            daddi $t1,$t1,-1    ;paso a la siguiente operacion
            j loop              ;salto a loop 
fin: halt

;nesecito la pila para guardar valores grandes, ya que los
;registro no permiten guardar resultados de mas de 8 bits 
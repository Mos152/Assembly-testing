.data
valor:   .word 10
result:  .word 0
.text
daddi $sp, $zero, 0x400     ;Inicializa puntero al tope de la pila
ld $a0, valor($zero)        ;guardo el valor a calcular
jal factorial               ;salto a calcular el factorial, guardando la direccion de retorno 
sd $v0, result($zero)       ;uso el registro v0 para guardar el resultado
halt                        ;termina el programa

factorial:  daddi $sp, $sp, -16     ;push, tomo dos bytes de la pila para guardar info 
            sd $ra, 0($sp)          ;guardamos la direccion de retorno en la pila en el primer byte
            sd $s0, 8($sp)          ;guardamos lo que hay en s0 en la pila 
            beqz $a0, fin_rec       ;si el valor ingresado es zero, salto al final
            dadd $s0, $0, $a0       ;guardamos el valor ingresado en s0
            daddi $a0, $a0, -1      ;restamos uno al valor
            jal factorial           ;repetimos, salto a la subrutina factorial 
            dmul $v0, $v0, $s0      ;multiplicamos un valor por el valor mas chico del factorial
            j fin                   ;salta al fin
fin_rec:    daddi $v0, $0, 1        ;si el valor es zero, el resultado del factorial va hacer 1 
fin:        ld $s0, 8($sp)          ;cargo el valor final del factorial
            ld $ra, 0($sp)          ;cargo la direccion de retorno 
            daddi $sp, $sp, 16      ;subo dos bytes de la pila para obtener la ultima direccion de retorno 
            jr $ra                  ;salto a la direccion de retorno 
.data
valor1: .word 16
valor2: .word 4
result: .word 0
.text
ld $a0, valor1($zero)               ;pasamos los valores por parametro a la subrutina
ld $a1, valor2($zero)
jal a_la_potencia                   ;salta a la direccion rotulada 
sd $v0, result($zero)halt
a_la_potencia: daddi $v0, $zero, 1  ;pasamos a la variable de la subrutina ,el resultado de la suma entre $zero y 1 
         lazo: slt $t1, $a1, $zero  ;se fija si el valor que le pasamos a la subrutina es menor que $zero 
                                    ;dejando la variable global t1 en cero o uno
               bnez $t1, terminar   ;se fija el valor de t1, si no es igual a cero salta a la direccion rotulada 
               daddi $a1, $a1, -1   ;le resta 1 al valor obtenido 
               dmul $v0, $v0, $a0   ;multiplica v0 y a0 dejando el resultado en v0
               j lazo
     terminar: jr $ra
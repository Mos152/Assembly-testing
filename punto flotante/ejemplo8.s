;Escriba una subrutina que reciba como parámetros las direcciones del comienzo de dos cadenas terminadas en cero 
;y retorne la posición en la que las dos cadenas difieren. 
;En caso de que las dos cadenas sean idénticas, debe retornar -1.

.data
cadena1: .asciiz "hola" 
cadena2: .asciiz "hola" 
result: .word 0 
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
.code
daddi $a0, $0, cadena1          ;desplazamiento de la primera cadena
daddi $a1, $0, cadena2          ;desplazamiento de la segunda cadena
jal compara                     ;empieza a comparar las letras
sd $v0, result($zero)           ;variable con el resultado
halt

compara: dadd $v0, $0, $0       ;seteo resultado en cero
loop:    lbu $t0, 0($a0)        ;tomo elemento de la cadena 1
         lbu $t1, 0($a1)         ;tomo elemento de la cadena 2 
         beqz $t0, fin_a0       ;si se termina la cadena, saltamos a la subrutina
         beqz $t1, final        ;si se termina la cadena, saltamos a la subrutina
         bne $t0, $t1, final    ;si los elementos elegidos de la cadena NO son iguales, saltamos a la subrutina
         daddi $v0, $v0, 1      ;si los elementos elegidos de la cadena SI son iguales, le sumo un 1 al contador
         daddi $a0, $a0, 1      ;paso al siguiente elemento de la CADENA 1
         daddi $a1, $a1, 1      ;paso al siguiente elemento de la CADENA 2
         j loop                 ;vuelvo a empezar 
fin_a0:  bnez $t1, final        ;si t1 NO es igual a 0, pasar al final 
         daddi $v0, $0, -1      ;si t1 es igual a cero, significa que se llego al final de la cadena sin coincidencias, v0 es igual a -1
final:   jr $r                  ;salta a la direccion contenida en el registro r
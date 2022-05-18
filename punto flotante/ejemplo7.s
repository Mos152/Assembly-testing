;Escriba una subrutina que reciba como parámetros un número positivo M de 64 bits, 
;la dirección del comienzo de una tabla  que  contenga  valores  numéricos  de  64  bits  sin  signo  
;y  la  cantidad  de  valores  almacenados  en  dicha  tabla.
;La subrutina debe retornar la cantidad de valores mayores que M contenidos en la tabla

.data 

M: .word 20
tabla: .word 1,43,2,7,4,26,16

.code 

daddi $a0,$0,0          ;desplazamiento que le pasamos a la subrutina 
ld $a1, M               ;le pasamos el numero a comparar 
;jal comparar            ;subrutina de comparacion 

;comparar: ld $v0,$a0




fin: halt 









;Escribir una subrutina que reciba como argumento una tabla de números terminada en 0.
;La subrutina debe contar la cantidad de números que son impares en la tabla, 
;esta condición se debe verificar usando una subrutina es_impar. 
;La subrutina es_impar debe devolver 1 si el número es impar y 0 si no lo es.

.data 

numeros: .word 1,2,6,20,33,18
final: .word 0

.code 
daddi $a0,$a0,2                 ;registro para buscar pares
daddi $a1,$a1,0                 ;registro para guardar resultado de diviciones
daddi $t0,$0,0                  ;desplazamiento 


BUSCAR: lbu $t1,numeros($t0)    ;tomo valor
        beqz $t1,fin            ;si se termina la tabla, vamos al final del programa 
        ddivu $a1,$t1,$a0       ;divido el elemento de la tabla en 2, dejando el resultado en a1
        daddi $t0,$t0,1         ;paso al siguiente elemento 
        j BUSCAR

fin: halt 

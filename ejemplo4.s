        ;a)Ejecutaren simulador con Forwarding habilitado. ¿Qué tarea realiza?¿Cuál es el resultado y dónde queda indicado?
;b)Re-Ejecutar el programa con la opción Configure/Enable Branch Target Buffer habilitada. Explicar la ventaja de usar este método y cómo trabaja.
;c)Confeccionaruna tabla que compare número de ciclos, CPI, RAWs y Branch Taken Stalls para los dos casos anteriores.         
        
        
        .data
tabla:  .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11
num:    .word 7
long:   .word 10
        .code 
        ld r1, long(r0)         ;guardo en r1 el valor de la longitud de la tabla
        ld r2, num(r0)          ;guardo en r2 el valor de num en r2
        dadd r3, r0, r0         ;guardo 0 en r3, lo usamos para desplazarse en la tabla 
        dadd r10, r0, r0        ;guardo 0 en r10
loop:   ld r4, tabla(r3)        ;guardo en r4, el valor de la posicion 0 de la tabla
        beq r4, r2,  listo      ;si r4 es igual a r2, salto a "listo"
        daddi r1, r1, -1        ;le resto 1 a r1 ( 10 - 1 )
        daddi r3, r3, 8         ;le sumo 8 a r3 para pasar al siguiente elemento de la tabla
        bnez r1, loop           ;si r1 no es cero, ir a loop ( if long != o entonces loop) 
        j   fin                 ;salta a fin
listo:  daddi r10, r0, 1        
fin:    halt


;a)el programa se ocupa de buscar el numero 7 en la tabla, cuando lo encuentra guarda un 1 en r10
;indicando que se encontro el numero deseado
;b) 
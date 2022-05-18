.data 

M: .word 2
presencia: .word 0
tabla: .word 23,54,65,5,72,4
longitud: .word 6 

.code 

ld r1,longitud(r0)          ;longitud de la tabla
ld r2,M(r0)                 ;numero a comparar
ld r7,presencia(r0)
dadd r3,r0,r0               ;desplazamiento 
dadd r4,r0,r0               ;flag de numeros mayores
dadd r5,r0,r0               ;contador 


loop: ld r6, tabla(r3)      ;tomo valor de la lista
      NOP
      slt r4,r2,r6          ;si el valor es mayor que M, r4 va ser igual a 1 
      beq r4,r7,contar      ;si r4 es igual a 1, paso a contar 
      daddi r3,r3,1         ;pasamos al siguiente elemento    
      beq r3,r1,fin         ;si llegue al final de la tabla, termino el programa 
      j loop 

contar: daddi r5,r5,1       ;le sumo 1 al contador
        daddi r3,r3,1       ;paso al siguiente elemento de la tabla 
        beq r3,r1,fin       ;si llegue al final de la tabla, termino el programa 
        dadd r4,r0,r0       ;vuelvo a setear en cero al flag 
        j loop
    
fin: halt 

        .data
                
    A:  .word 1
    B:  .word 3
        .code
        ld r2, B(r0)     ;agrego valor de B en r2
        ld r1, A(r0)     ;agrego valor de A en r1
loop:   daddi r2, r2, -1 ;suma r2 y -1 y lo guarda en r2
        dsll r1, r1, 1   ;muevo a la izquierda 1 vez el registro r1 y el resultado lo guardo en r1 
        bnez r2, loop    ;si r2 no es igual a cero, salta a la etiqueta loop
        halt
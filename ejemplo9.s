;dado un vector de 5 numeros v
;calcular el maximo valor del vector y guardarlo en una variable c
;asumir que v tiene los elementos 4,10,512,8,16 para probar el programa    


.data 
v: .word 4,10,512,8,16
c: .word 0

.code
daddi r2,r0,0 ;maximo inicial
daddi r3,r0,5 ;elementos del vector
daddi r5,r0,0 ;desplazamiento 

loop:   ld r1, v(r5)
        slt r4,r1,r2 ;si r1 es menor que le maximo , entonces r4 = 1
        bnez seguir 
        daddi r2,r1,0
min:    daddi r5,r5,8
        daddi r3,r3,-1
        bnez r3,loop 

sd r2, c(r0)

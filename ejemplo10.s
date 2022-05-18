;Modificar el programa para que almacene en un arreglo en memoria de datos los contenidos parciales del registro r1
;¿Qué significado tienen los elementos de la tabla que se genera?


.data

A: .word 1
B: .word 3
arreglo: .word 0 

.code
daddi r5,r0,0 ;desplazamiento


ld r1, A(r5)
ld r2, B(r5)

loop: dsll r1, r1, 1
      sd r1, arreglo(r5)
      daddi r5, r0 ,8
      daddi r2, r2, -1
      bnez r2, loop 

halt
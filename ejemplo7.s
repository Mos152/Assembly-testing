; definir un vector de 5 numeros v
; calcular la suma de los numeros del vector, utilizando saltos
; guardar el resultado en una variable c
; asumir que v tiene los elementos 4, -10 , 512 , 8, 16 para probar el programa 

.data 

v: .word 4, -10 , 512 , 8, 16
c: .word 0

.code

daddi r2,r0,0 ;resultado
daddi r3,r0,5 ;# elementos del vector
      
daddi r5,r0,0 ;desplazamiento 
loop: ld r1, v(r5)
      dadd r2,r2,r1
      daddi r5,r5,8
      daddi r3,r3,-1 ; decremento el contador a 1 
      bnez r3, loop ;cuando r3 no sea cero, salto al loop



sd r2,c(r0) 

halt 
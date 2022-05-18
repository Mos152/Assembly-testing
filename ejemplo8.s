;definir un vector de 5 numeros v
;calcular la suma de los numeros del vector, utilizando saltos
;utilizar un registro como puntero (no desplazamiento) para acceder a los elementos
;del vector
;guardar el resultado en una variable c
;asumir que v tiene los elementos 4, -10, 512, 8, 16 para probar el programa 
;(manera alternativa para recorrer el vector)
.data 
v: .word 4,-10,512,8,16
c: .word 0 

.code
daddi r2,r0,0 ;resultado
daddi r3,r0,5 ;elementos del vector 

daddi r5, r0 ,v ;cargo la direccion de v en r5 

loop: ld r1 , 0(r5) ;accedo a la direccion de v
      dadd r2,r2,r1 
      daddi r5,r5,8
      daddi r3,r3,-1
      bnez r3,loop
sd r2, c(r0)
halt   

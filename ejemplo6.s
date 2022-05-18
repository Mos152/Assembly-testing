;definir un vector de 3 numeros v
;calcular la suma de los numeros del vector, sin utilizar saltos
;guardar el resultado en una variable c
;asumir que v tiene los elementos 2,4,9 para probar el programa
.data 
v: .word 2, 8, 16
c: .word 0
.code 

daddi r2,r0,0       ;resultado 

daddi r5,r0,0       ;inicializamos r5 en cero
ld r1, v(r5)        ;usamos r5 como desplazamiento 
dadd r2 ,r2 ,r1    ;r2=r2+r1 = 0+2 

daddi r5 , r5 ,8    ;sumamos 8 para pasar al siguiente elemento del vector 
ld r1, v(r5)  
dadd r2 ,r2 ,r1 

daddi r5 , r5 ,8     
ld r1, v(r5)  
dadd r2 ,r2 ,r1 

sd r2, C(r0) ;el resultado guardado en R2 lo muevo a C  

halt 

.
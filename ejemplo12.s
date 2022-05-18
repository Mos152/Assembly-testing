;Escribir un programa que lea tres números enteros A, B y C de la memoria de datos 
;y determine cuántos de ellos son iguales entre sí (0, 2 o 3).
;El resultado debe quedar almacenado en la dirección de memoria D

.data 

A: .word 2 
B: .word 2
C: .word 2
D: .word 0
.code 

daddi r4,r0,0 ;resultado 
daddi r5,r0,0 ;desplazamiento 
daddi r6,r0,0 ;resultado del AND

ld r1,A(r5) ;cargo A

;pruebo a y b si son iguales

daddi r5,r5,8
ld r2,A(r5) ;cargo B
c.eq.d f1 ,f2 ;  A = B??????
bc1t verificarB

;si a y b NO son iguales, pruebo A con c

daddi r5,r5,8 
l.d f3,A(r5) ;cargo C
c.eq.d f3,f1 ;---> A = C??????
bc1t resultadoII

;si a y c no son iguales, pruebo B con c

c.eq.d f3,f2 ;---> B = C??????
bc1t resultadoII

;si ninguno se igualan, saltamos al resultado final

j resultadoIII


;subrutinas para igualdades 

verificarB: c.eq.d f3,f2 ;---> B = C??????
            bc1t resultadoI
            j resultadoII



;si A y B son iguales, salto a comparar con C

verificarC: daddi r5,r5,8
            l.d f3,A(r5)
            c.eq.d f3,f2
            bc1t resultadoI

;si todos los numeros son iguales, seteo el resultado


;subrutinas de los resultados finales 

resultadoI: daddi r4, r4, 3
            daddi r5,r5,8
            sd r4,A(r4)
            j fin 
resultadoII: daddi r4, r4, 2
             daddi r5,r5,8
             sd r4,A(r4)
             j fin

resultadoIII: daddi r4, r4,0
              daddi r5,r5,8
              sd r4,A(r4)
               j fin 

fin: halt
 





.data 

a: .word 4 
b: .word 1
c: .word 2
res: .word 0

.code 

;configuracion 

daddi r4,r0,0 ;resultado total 

;pruebo a y b si son iguales 

ld r1,a(r0) ;cargo A 
ld r2,b(r0) ;cargo B
beq r1,r2,verificarB

;si a y b NO son iguales,pruebo a con c

ld r3,c(r0) ;cargo C 
beq r1,r3, resultadoII 

;si a y c NO son iguales, pruebo B con c

beq r2,r3, resultadoII

;si ninguno se iguala, saltamos al resultado final 

j resultadoIII

;subrutinas para igualdades 

verificarB: beq r3,r2,resultadoI
            j resultadoII

;si A y B son iguales, salto a comparar con c

verificarC: ld r3,c(r0)
            beq r3,r2,resultadoI
            j resultadoII

;subrutinas de los resultados finales 

resultadoI: daddi r4, r4, 3
            sd r4 , res(r0)
            j fin 

resultadoII: daddi r4, r4, 2
             sd r4 , res(r0)
             j fin

resultadoIII: daddi r4, r4,0
              sd r4 , res(r0)
               j fin 


fin: halt

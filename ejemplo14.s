.data 

TABLA: .word 12,22,86,55,33
X: .word 10 
CANT: .word 0 
RES: .word 0 

.code 

daddi r5,r0,0                    ;desplazamiento
daddi r7,r0,0                    ;uso ese registro para llenar la tabla RES
ld r2 , X(r0)                    ;cargo dato a comparar 

loop:    ld r1, TABLA(r5)        ;cargo primer elemento de la tabla 
         slt r7,r1,r2            ;IF X > TABLA(r0) entonces r6 = "1"  
         sd r7, RES(r5)          ;guardo numero binario en la tabla RES
         daddi r5,r5,8           ;paso a los siguientes elementos 
         


halt 
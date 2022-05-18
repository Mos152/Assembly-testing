.data
TABLA: .word 1,2,3,4,5,6,7,8
.code 
daddi $r10,$r0,10 
daddi $r20,$r0,0
loop: dadd $r20,$r20,$r10 
      bnez $r10,loop 
      daddi $r10,$r10,-1
      halt 

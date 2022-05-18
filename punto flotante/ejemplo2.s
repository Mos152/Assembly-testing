;calcular la suma de los valores del vector ,multiplicados por 0.5 
;si el resultado es mayor a 10 , multiplicarlo por 2 
;guardarlo en RES 

.data 

vec: .word 1,4,2,6 
val05: .double 0.5 
val10: .double 10
val2: .double 2 
res: .double 0

.code 

#suma vector 

daddi r1,r0,0           ;desplazamiento
daddi r2,r0,4           ;elemento del vector 
l.d f1, res(r0)         ;guardo la direccion del resultado    
l.d f2, val05(r0)       ;0.5 

loop: ld r3,vec(r1)     ;cargo elemento 
      mtc1 r3,f3        ;cargo los bits de r3 en f3 
      cvt.d.l f3,f3     ;convierte los bits de f3 de fijo a flotante y lo guarda en f3 
      mul.d f3,f3,f2    ;multiplica f3 y f2 guardandolo en f3 
      add.d f1,f1,f3    ;suma f1 y f3 guardandolo en f1 
      daddi r1,r1,8     ;me desplazo 8 direcciones 
      daddi r2,r2,-1    ;le resto un elemento a la tabla 
      bnez r2, loop     ;si no dio cero, vuelvo al loop 

l.d f4,val10(r0)
c.lt.d f1,f4 
bc1t fin 
l.d f5,val2(r0)
mul.d f1,f1,f5 
fin: s.d f1,res(r0) 
halt 
;Escribir  un  programa  que  calcule  la  superficie  de  un  triángulo  rectángulo  de  base  5,85  cm  y  altura  13,47  cm

.data

base: .double 5.85
altura: .double 13.47
divicion: .double 2 
res: .double 0 

.code 

l.d f1,base(r0)
l.d f2,altura(r0)
l.d f3,divicion(r0)
NOP
mul.d f4,f1,f2 
div.d f5,f4,f3
halt
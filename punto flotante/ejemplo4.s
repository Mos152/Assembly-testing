;Escriba un programa que dado el peso y la estatura de una persona calcule su IMC y lo guarde en la dirección etiquetada IMC.

.data
peso: .double 75.7 
estatura: .double 1.73 
estado: .word 0
infrapeso: .double 18.5 
normal: .double 25
sobrepeso: .double 30 
obeso: .double 30 
valores: .word 1,2,3,4
valorfinal: .word 0
.code 
l.d f1,estatura(r0)
l.d f3,peso(r0)
l.d f5,infrapeso(r0)
l.d f6,normal(r0)
l.d f7,sobrepeso(r0) 
l.d f8,obeso(r0) 
daddi r1,r0,0       ; desplazamiento  
NOP
mul.d f1,f1,f1      ; estatura al cuadrado
div.d f4,f3,f1      ; resultado del IMC 
c.lt.d f4,f5        ; IMC < infrapeso
bc1t guardarValor1
c.lt.d f4,f6        ; IMC < normal 
bc1t guardarValor2  
c.lt.d f4,sobrepeso ; IMC < sobrepeso 
bc1t guardarValor3 
c.le.d obeso,f4     ; IMC >= obeso 
bc1t guardarValor4 


guardarValor1: 





fin: halt    
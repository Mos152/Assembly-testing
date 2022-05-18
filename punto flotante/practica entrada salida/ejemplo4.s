;calcular suma de flotantes, mostrar en pant 
.data 
DIR_CONTROL: .word 0x10000 
DIR_DATA: .word 0x10008
A:  .double 1.5
B:  .double 0.5
.code 
ld $t2, DIR_CONTROL($0)
ld $t3, DIR_DATA($0)
l.d f0,A($0)
l.d f1,B($0)
add.d f2,f0,f1 
s.d f2,0($t3)
; 3 -> codigo de imprimir flot 
daddi $t6, $0,3 
sd $t6, 0($t2)
halt 
;calcular suma de negativos, mostrar en pantalla 
.data 
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
A: .word -25 
B: .word -50 

.code 
ld $t2,DIR_CONTROL($0)
ld $t3,DIR_DATA($0)
ld $t0,A($0)
ld $t1,B($0)
dadd $t5,$t0,$t1
sd $t5,0($t3)
; 2 -> codigo de imprimir negativos
daddi $t6,$0,2
sd $t6,0($t2)
halt 




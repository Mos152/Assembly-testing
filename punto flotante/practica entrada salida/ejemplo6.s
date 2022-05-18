;mostrar en pantalla el string "hola" 
.data 
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
str: .asciiz "hola"
.code 
ld $t2,DIR_CONTROL($0)
ld $t3,DIR_DATA($0)
; t0 = dir de str
daddi $t0,$0,str
sd $t0,0($t3)
;4 -> codigo de imprimir str 
daddi $t1,$0,4 
sd $t1,0($t2)
halt 
;ejemplo imprimir un entero sin signo 

.data 
DIR_CONTROL: .word 0x10000 
DIR_DATA: .word 0x10008
num: .word 5 
.code 
ld $t2,DIR_CONTROL($0)      ;cargo direccion CONTROL
ld $t3,DIR_DATA($0)         ;cargo direccion DATA
ld $t1, num($0)             ;cargo el num
sd $t1,0($t3)               ;guardo el numero en la direccion de DATA
                            ;una vez este DATA cargado, ya podemos ingresar el codigo en CONTROL 
daddi $t1,$0, 1             ;codigo para imprimir un entero sin signo  
sd $t1,0($t2)               ;ingresamos el codigo en CONTROL y imprimo  
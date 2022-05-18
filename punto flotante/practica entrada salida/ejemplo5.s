.data 
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
vec: .word -25,10,-12,15,50,3
.code 
ld $t5,DIR_CONTROL($0)
ld $t6,DIR_DATA($0)
; 2 -> codigo imprimir negativos 
daddi $t4,$0,2  ;codigo  
daddi $t1,$0,6  ;cantidad de elementos
daddi $t2,$0,0  ;desplazamiento del vector 
loop: ld $t0, vec($t2)
    ;guardar valor en DATA 
    sd $t0,0($t6)
    daddi $t2,$t2,8         ;le sumo 8 para pasar al siguiente valor del vector 
    daddi $t1,$t1, -1
    bnez $t1, loop
halt    

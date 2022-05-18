.data 
    DIR_CONTROL: .word32 0x10000 ;direccion de CONTROL 
    DIR_DATA: .word32 0x10008    ;direccion de DATA

.code 
ld $t6,DIR_CONTROL($0)
ld $t7,DIR_DATA($0)
daddi $t0,$0,8              ; codigo para leer un numero

ingreso: sd $t0,0($t6)      ; 
         sd $t1,0($t7)      ;       


muestra: 








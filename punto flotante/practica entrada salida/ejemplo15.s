;pintar el pixel (24,10) de violeta 

.data 
    coorX: .byte 24              ;coordenada X de un punto 
    coorY: .byte 10              ;coordenada Y de un punto 
    color: .byte 255,0,255,0     ;rojo + azul => violeta 
    DIR_CONTROL: .word32 0x10000 ;direccion de CONTROL 
    DIR_DATA: .word32 0x10008    ;direccion de DATA 
.code 
    lwu $s6,DIR_CONTROL($0)      ;$s6 = dir de CONTROL  
    lwu $s7,DIR_DATA($0)         ;$S7 = dir de DATA
    lbu $s0,coorX($0)            ;$s0 = coordenada X
    sb $s0, 5($s7)               ;DATA+5 = coordenada X 
    lbu $s1,coorY($s0)           ;$s1 = coordenada Y 
    sb $s1 ,4($s7)               ;DATA+4 = coordenada Y
    lwu $s2,color($0)            ;$s2 = color 
    sw $s2,0($s7)                ;DATA = color 
    daddi $s3,$0,5               ;$t0 = 5 -> salida grafica
    sd $s3, 0($s6)               ;CONTROL = 5 -> salida grafica 
halt 
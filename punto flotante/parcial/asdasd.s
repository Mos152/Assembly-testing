.data 
    coorX: .byte 0              ;coordenada X de un punto 
    coorY: .byte 0              ;coordenada Y de un punto 
    color: .byte 0,0,0,0     ;rojo + azul => violeta 
    DIR_CONTROL: .word32 0x10000 ;direccion de CONTROL 
    DIR_DATA: .word32 0x10008    ;direccion de DATA 
.code 

daddi $t1,$0,50                 ;contador Y
daddi $t2,$0,0                  ;contador x

lwu $s6,DIR_CONTROL($0)      ;$s6 = dir de CONTROL  
lwu $s7,DIR_DATA($0)         ;$S7 = dir de DATA
                
loopY:  
        loopX:  lbu $s1,coorY($0)           ;$s1 = coordenada Y 
                sb $s1 ,4($s7)               ;DATA+4 = coordenada Y
                lbu $s0,coorX($0)            ;$s0 = coordenada X
                sb $s0, 5($s7)               ;DATA+5 = coordenada X 
                lwu $s2,color($0)            ;$s2 = color 
                sw $s2,0($s7)                ;DATA = color 
                daddi $s3,$0,5               ;$t0 = 5 -> salida grafica
                sd $s3, 0($s6)               ;CONTROL = 5 -> salida grafica 
                daddi $s0,$s0,1
                sd $s0, coorX($0)
                bne $s0,$t1,loopX
        daddi $s1,$s1,1
        sd $s1, coorY($0)        
        bne $s1,$t1,loopY
halt
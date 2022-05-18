.data
;Mi DNI: 42153'004'
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
vector: .word 1,2,3,4,5,6
msj_incorrecto: .asciiz "EL TIRO NO ES VALIDO \n"

.code
jal TIRAR_DADO

HALT

TIRAR_DADO: ld $t6,DIR_CONTROL($0)
            ld $t7,DIR_DATA($0)

            daddi $t1,$0,6      ;contador 

            daddi $t2,$0,0      ;desplazamiento 

            daddi $t0,$0,8      ;codigo para leer numero 

            sd $t0,0($t6)       ;agrego codigo a CONTROL

            loop:   ld $t8,vector($t2)      ;cargo en t8 el primer numero del vector 
                    ld $t9,0($t7)           ;cargo en DATA un numero por teclado 
                    beq $t8,$t9,correcto    ;si el numero del vector es igual al ingresado, paso al correcto 
                    daddi $t2,$t2,8         ;paso al siguiente numero 
                    daddi $t1,$t1,-1        ;bajo el contador 
                    BNEZ $t1,loop           ;si t1 no es igual a cero, empiezo de nuevo 

            distinto: daddi $t3,$0,msj_incorrecto   ;cargo la direccion del mensaje en t3
                      sd $t3,0($t7)                 ;cargo el mensaje en data 
                      daddi $t4,$0,4                ;cargo codigo para imprimir un string 
                      sd $t4,0($t6)                 ;cargo en control el codigo 

                      sd $0,0($t7)                  ;guardo cero en data
                      daddi $t4,$0,1
                      sd $t4,0($t6)                 ;imprimo codigo 
                      j fin
                

            correcto:  dadd $t3,$0,$t9              
                       sd $t3,0($t7)
                       daddi $t4,$0,1
                       sd $t4,0($t6)
                       j fin
        


            fin:  JR r31
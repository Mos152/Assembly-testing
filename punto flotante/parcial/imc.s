.data

DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
msj_peso: .asciiz "ingrese su peso: "
msj_altura: .asciiz "ingrese su altura: "
IMC: .word 0
infrapeso: .double 18.5
pesonormal: .double 25.0
sobrepeso: .double 30
ESTADO: .word 0


.code

ld $t6,DIR_CONTROL($0)
ld $t7,DIR_DATA($0)

;cargamos los datos de peso en registros de punto flotante
 

;mensaje para ingresar peso
daddi $t1,$0,msj_peso
daddi $t2,$0,4
sd $t1,0($t7)
sd $t2,0($t6)
;ingresamos el peso
daddi $t0,$0,8      ;$t0 = código para leer un número
sd $t0,0($t6)       ;cargamos $t0 en DIR_CONTROL
l.d f1,0($t7)       ;f1 = nro ingresado por teclado

;mensaje para ingresar altura
daddi $t1,$0,msj_altura
daddi $t2,$0,4
sd $t1,0($t7)
sd $t2,0($t6)
;ingresamos la altura
daddi $t0,$0,8      ;$t0 = código para leer un número
sd $t0,0($t6)       ;cargamos $t0 en DIR_CONTROL
l.d f2,0($t7)       ;f2 = nro ingresado por teclado

jal calculaIMC
jal setEstado
HALT

calculaIMC: l.d f5,infrapeso($0)
            l.d f6,pesonormal($0)
            l.d f7,sobrepeso($0)

            mul.d f3,f2,f2          ;altura^2
            div.d f4,f1,f3          ;peso/altura^2
            s.d f4,IMC($0)          ;IMC = peso/altura^2
            jr $ra

setEstado:  c.lt.d f4,f5            ;fp=1 si f4 es menor que f5
            bc1t setInfrapeso   ;salta a setInfrapeso si fp!=0
            c.lt.d f4,f6
            bc1t setPesonormal
            c.lt.d f4,f7
            bc1t setSobrepeso
            c.le.d f7,f4
            bc1t setObesidad
fin:        jr $ra


setInfrapeso:   daddi $t3,$0,1
                sd $t3,ESTADO($0)
                j fin

setPesonormal:   daddi $t3,$0,2
                 sd $t3,ESTADO($0)
                 j fin

setSobrepeso:   daddi $t3,$0,3
                sd $t3,ESTADO($0)
                j fin

setObesidad:   daddi $t3,$0,4
               sd $t3,ESTADO($0)
               j fin
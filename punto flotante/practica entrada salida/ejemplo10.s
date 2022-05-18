;leer numeros hasta el cero, imprimir suma 
.data 
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
.code 
ld $t6,DIR_CONTROL($0)
ld $t7,DIR_DATA($0)
daddi $t0,$0,8          ;codigo leer num 
daddi $t2,$0,0          ;inicializo la suma en cero 
loop: sd $t0, 0($t6)    ;guardo el codigo para leer un numero
      ld $t1, 0($t7)    ;guardo el valor en DATA     
      beqz $t1, fin     ;si el numero ingresado es un cero, salto a imprimir (fin)
      dadd $t2,$t2,$t1  ;sumo resultado en t2 
      j loop            ;saltar a  loop 
fin:  sd $t2,0($t7)     ;guardo el codigo en control 
; imprimo         
      daddi $t5,$0,1
      sd $t5, 0($t6)
      halt 
;El siguiente programa produce la salida de un mensaje predefinido en la ventana Terminal del simulador WinMIPS64.
;Teniendo en cuenta las condiciones de control del puerto de E/S (en el resumen anterior),
;modifique el programa de modo que el mensaje a mostrar sea ingresado por teclado en lugar de ser un mensaje fijo.
.data
texto: .asciiz "Hola, Mundo!" ; El mensaje a mostrar
user: .asciiz ".........."            ; mensaje a ingresar 

CONTROL: .word32 0x10000
DATA: .word32 0x10008
.text

ld $t6,CONTROL($0)
ld $t7,DATA($0)
daddi $t0,$zero,9          ;codigo leer un caracter
daddi $t2,$zero,0          ;desplazamiento
daddi $t3,$zero,10         ;cantidad de letras

loop: sd $t0,0($t6)        ;cargo codigo 
      lbu $t1,0($t7)       ;leer caracter 
      sb $t1,user($t2)      ;guardo caracter en el string
      daddi $t2,$t2,1      ;aumento el desplazamiento
      daddi $t3,$t3,-1     ;resto al contador 
      bnez $t3,loop        ;si el contador no llego a cero, repetir 

imprimir: daddi $t4,$0,user 
          sd $t4,0($t7)
          daddi $t5,$0,4
          sd $t5,0($t6)
          halt 

halt
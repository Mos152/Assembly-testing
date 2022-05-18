;Escriba la subrutina ES_VOCAL, que determina si un carácter es vocal o no, ya sea mayúscula o minúscula.
;La rutina debe recibir el carácter  y debe retornar  el valor 1 si el carácter es una vocal, o 0 en caso contrario
;escribir  la  subrutina  CONTAR_VOC,  que  recibe  una  cadena terminada en cero , y devuelve la cantidad de vocales que tiene esa cadena

.data
letra:   .ascii 'O'
vocales: .asciiz 'AEIOUaeiou'
result:  .word 0
.code 
lbu $a0, letra($0)                      ;copia en a0 lo que hay en letra 
jal es_vocal                            ;salta a la subrutina, dejando la direccion de retorno en r31 
sd $v0, result($zero)                   ;resultado guardado en v0 
dadd $ra,$0,$0                          ;elimino la direccion de retorno para volverla a setear 
daddi $t0,$0,0                          ;seteo el desplazamiento en cero
daddi $a2, $0, $0                       ;contador de vocales 
jal CONTAR_VOC                          ;cuento vocales 
halt 
es_vocal:   dadd $v0, $0, $0            ;seteo cero en v0
            daddi $t0, $0, 0            ;seteo cero en t0 
loop:       lbu $t1, vocales($t0)       ;guardo el primer elemento de las vocales en t1
            beqz $t1, fin_vocal         ;si t1 es igual a cero, salta a fin_vocal 
            beq $a0, $t1, si_es_voc     ;si la letra de las vocales es igual a la variables 'letra' , paso a si_es_voc
            daddi $t0, $t0, 1           ;sino, paso a la siguiente letra de las vocales 
            j loop                      ;salto a loop 
si_es_voc:  daddi $v0, $0, 1            ;si es vocal, sumo uno al contador 
fin_vocal:  jr $ra                      ;salta a la direccion de retorno guardada 


CONTAR_VOC: lbu $t1, vocales(t0)        ;tomo elemento 
            
            
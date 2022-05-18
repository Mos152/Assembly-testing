.data
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
cod_a: .ascii "A"
msj_igual: .asciiz "Ingresaste una A" 
msj_dist: .asciiz "NO Ingresaste una A"
.code 
ld $t6, DIR_CONTROL($0)
ld $t7, DIR_DATA($0)
daddi $t0,$0,9              ;leer caracter
sd $t0,0($t6)
lbu $t1,0($t7)
lbu $t2, cod_a($0)
bne $t1, $t2,dist 
daddi $t3,$0,msj_igual 
j most  

dist: daddi $t3,$0, msj_dist
most: sd $t3,0($t7)
      daddi $t4,$0,4
      sd $t4,0($t6)
      halt 
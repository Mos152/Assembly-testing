.data 
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
vec: .word 0
.code 
ld $t6,DIR_CONTROL($0)
ld $t7,DIR_DATA($0)
daddi $t0,$0,8              ;codigo leer numero 
daddi $t2,$0,0              ;acumulador 
daddi $t4,$0,0              ;cantidad de espacios en el vector 

loop: sd $t0, 0($t6)        ;ingreso codigo 
      ld $t1, 0($t7)        ;leo numero 
      sd $t1, vec($t2)      ;lo agrego al vector    
      
      daddi $t2, $t2 ,8     ;tomo espacio para el siguiente elemento 
      daddi $t4, $t4, 1     ;indico que se sumo uno al vector 
halt 
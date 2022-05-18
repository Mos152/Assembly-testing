;leer dos numeros por teclado,imprimir suma 

.data 
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
.code
ld $t6,DIR_CO   NTROL($0)
LD $t7,DIR_DATA($0)
daddi $t0,$0,8 ; codigo para leer un numero  
; leer 2 numeros 
sd $t0, 0($t6)
sd $t1, 0($t7)  ;leo num1
sd $t0, 0($t6)  
sd $t2, 0($t7)  ;leo num2
;sumo valores 
dadd $t3,$t1,$t2 

;guardo en data 
sd $t3,0($t7)
;imprimo 
daddi $t5,$0,1 ;imprimir numero 
sd $t5,0($t6)
halt 


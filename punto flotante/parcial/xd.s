.data 
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
msj_error: .asciiz "solamente se debe ingresar un digito"
msj_success: .asciiz "excelente" 
.code 
ld $t6,DIR_CONTROL($0)
ld $t7,DIR_DATA($0)
daddi $t0,$zero,8              ;codigo leer digito 
daddi $t3,$zero,0   
daddi $t4,$zero,-10  
ingreso: sd $t0,0($t6)
         sb $t1,0($t7)   
         dadd $t3,$t1,$t4      ;resto registros y guardo resultado 
         daddi $t0,$0,1         
         sd $t3,0($t7)         ;cargo en data 
         sd $t0,0($t6)         ;cargo control 

halt
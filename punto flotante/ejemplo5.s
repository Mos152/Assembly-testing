.data 
    result: .word 0
.code 
daddi $a0,$0,10 ;uso las variables "a" para pasar parametros a una subrutina 
daddi $a1,$0,20 
jal sumar 
sd $v0, result ($zero)
halt 

sumar: dadd $v0,$a0,$a1 ; usamos las variables "v" para obtener los parametros que le pasamos 
       jr $ra
;leer flotantes hasta el 0, imprimir suma 

.data 
DIR_CONTROL: .word 0x10000
DIR_DATA: .word 0x10008
cero: .double 0 
.code 
ld $t6,DIR_CONTROL($0)
ld $t7,DIR_DATA($0)
daddi $t0,$0,8          ;leer numero 
l.d f0,cero($0)         ;inicializo las variables en cero 
l.d f2,cero($0)         ;inicializo las variables en cero

loop: sd $t0,0($t6)     ;guardo en control el codigo
      l.d f1,0($t7)     ;guardo en data el numero ingresado  
      c.eq.d f2,f1      ;si el numero ingresado es igual a cero, el flag de punto flotante va ser igual a 1 
      bc1t fin          ;si el flag de punto flotante es 1, paso a imprimir 
      add.d f0,f0,f1    ;sumo el numero ingresado con f0, ahora f0 es mi acumulador
      j loop            ;salto a loop 
fin:  sd f0,0($t7)      ;imprimir 
      ;imprimo 
      daddi $t5,$0,3 
      sd $t5, 0($t6)
      halt   

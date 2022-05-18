    .data
A:  .word 1 
B:  .word 2 
    
.code
ld r1, A(r0)
ld r2, B(r0)
sd r2, A(r0)
sd r1, B(r0)

halt

  

punto 2)

la instruccion sd r2,A (r0) esta causando atascos ya que se busca guardar en r2 un valor cuando r2 todavia no ah sido cargado.
se recibe el stall RAW (read after write)
con la configuracion Enable forwarding , cuando queremos cargar un valor en r2, nos ahorramos un ciclo, ya que r2 va a estar disponible en el ciclo de rightback. entonces cuando se quiera acceder 
memoria con sd, ya va a estar disponible el valor del registro R2 ,entonces no se produce el atasco del RAW,r0
CON ESTA CONFIGURACION AHORA NUESTRO PROGRAMA TARDA MENOS CICLOS YA QUE SE HABILITA EL ACCESO A MEMORIA UN CICLO ANTES

AMARILLO: indica el fetch , te toma la instruccion .
AZUL: se indica la codificacion de la instruccion, 
ROJO: se indica la ejecucion de la instruccion
VERDE: se indica la carga en memoria de la instruccion 
MORADO: se indica el rightback, se busca escribir en el registro 

punto 3)
el atasco branch taken se produce cuando se quiere ejecutar una instruccion pero no puede por que la anterior instruccion esta teniendo un atasco o no esta cambiando de ciclo.
por ejemplo puede pasar que una instruccion no salga del fetch ya que la instruccion anterior todavia no puede ejecutarse.

con activate forwardine = 3 atascos RAW, 2 branch taken, 21 ciclos, 12 instrucciones , 1750 cpi (ciclos por instruccion)

sin activate forwardine = 7 atascos RAW, 2 branch taken, 25 ciclos, 12 instrucciones, 2083 cpi  (ciclos por instruccion)
el primer atasco tipo raw es de la instruccion dsll r1, r1, 1,
ya que se busca acceder al registro r1 cuando la instruccion ld todavia sigue en el cause.
luego hay dos atascos en la linea bnez r2, loop ya que busca acceder a r2 cuando la linea anterior sigue en el cause.
estos atascos se repiten unas 3 veces 
tambien se produce 2 branch taken, en donde se llama al fetch de la instruccion pero esta es interrumpida por otra instruccion 
este atasco sucede en la linea halt, ya que la linea bnez ejecuta un loop justo cuando se esta llamando al fetch de la instruccion, entonces esta se interrumpe 
cuando tenemos el forwardin desactivado, este atasco se produce durante dos ciclos por cada loop que se realiza.
cuando tenemos el forwardin activado, los atascos de raw ya no aparecen y por lo tanto el fetch de la instruccion llega a interrumpirse un ciclo antes.
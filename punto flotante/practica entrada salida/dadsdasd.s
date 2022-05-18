.data 
    DIR_CONTROL: .word32 0x10000 ;direccion de CONTROL 
    DIR_DATA: .word32 0x10008    ;direccion de DATA
    msj_success: .asciiz "Ingresaste un numero del 1 al 6: " 
    msj_alert: .asciiz "NO se ingreso un numero del 1 al 6: "
.code 
    ld $t6,DIR_CONTROL($0)
    ld $t7,DIR_DATA($0)          
    daddi $t8,$0,msj_success    ; dir de msj success
    sd $t8, 0($t7)
    daddi $t9,$0,4              ; codigo para imprimir
    sd $t9, 0($t6)
halt

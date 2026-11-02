# Demo para el video: Hello World y cambios en los registros.
# Salida: Hello World! / 5 + 7 = 12

.data
mensaje:   .asciiz "Hello World!\n"
resultado: .asciiz "5 + 7 = "
salto:     .asciiz "\n"

.text
.globl main
main:
    li   $t0, 5             # Primer paso: $t0 = 5.
    li   $t1, 7             # Segundo paso: $t1 = 7.
    add  $t2, $t0, $t1      # Tercer paso: $t2 = 12.

    li   $v0, 4             # Servicio 4: imprimir una cadena.
    la   $a0, mensaje       # $a0 recibe la DIRECCION del mensaje.
    syscall                # Imprime Hello World!

    la   $a0, resultado
    syscall                # $v0 sigue en 4: imprime 5 + 7 = .

    li   $v0, 1             # Servicio 1: imprimir un entero.
    move $a0, $t2           # $a0 recibe el VALOR 12.
    syscall                # Imprime 12.

    li   $v0, 4
    la   $a0, salto
    syscall                # Imprime un salto de linea.

    li   $v0, 10            # Servicio 10: terminar el programa.
    syscall

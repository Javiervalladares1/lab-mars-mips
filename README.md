# Laboratorio MARS: Hello World y registros MIPS

Demostración de MARS ejecutando un programa MIPS que imprime **Hello World!**,
calcula **5 + 7 = 12** y permite observar los cambios en los registros paso a paso.

## Video de entrega

**[Ver el video en YouTube — 2 minutos](https://youtu.be/jTo-EF52_UY)**

En el video se muestra MARS funcionando en la computadora, el ensamblado y la
ejecución del programa, y una explicación breve de los registros.

## Consigna

Grabar un video de dos minutos que muestre MARS ejecutándose en la computadora,
la ejecución del Hello World del tutorial o de un programa propio, y una
explicación breve de los cambios en los registros. La entrega debe ser un
video de YouTube configurado como **No listado**.

## Contenido

| Archivo | Descripción |
| --- | --- |
| [`src/hello_mars.asm`](src/hello_mars.asm) | Programa MIPS comentado utilizado en la demostración. |
| [`scripts/ejecutar.sh`](scripts/ejecutar.sh) | Ejecución por terminal y consulta de los registros finales. |
| [`evidencias/ejecucion.txt`](evidencias/ejecucion.txt) | Salida obtenida al ejecutar el programa en MARS. |
| [`evidencias/registros_paso_a_paso.txt`](evidencias/registros_paso_a_paso.txt) | Valores observados después de las primeras tres instrucciones. |

## Ejecutar en MARS

1. Comprueba que tienes Java instalado:

   ```sh
   java -version
   ```

2. Descarga **Mars4_5.jar** desde el [release oficial indicado en la tarea](https://github.com/dpetersanderson/MARS/releases/tag/v.4.5.1).
   Crea una carpeta `tools` en este repositorio y guarda allí el archivo.
   El tag del release es `v.4.5.1`; el IDE se identifica como **MARS 4.5**.
3. Desde la raíz del repositorio, abre el IDE:

   ```sh
   java -jar tools/Mars4_5.jar
   ```

4. Selecciona **File → Open** y abre `src/hello_mars.asm`.
5. Selecciona **Run → Assemble** (F3).
6. Usa **Run → Step** (F7) para avanzar una instrucción básica o **Run → Go** (F5)
   para completar la ejecución. **Run → Reset** (F12) permite comenzar de nuevo.
7. Consulta la salida en **Run I/O** y los registros en el panel derecho.

Para ver 5, 7 y 12 en decimal, desmarca **Settings → Values displayed in hexadecimal**.
En macOS, si el editor aparece colapsado al abrir el IDE, cambia ligeramente
el tamaño de la ventana antes de ensamblar.

### Ejecutar por terminal

En macOS o Linux, con el JAR guardado en `tools`:

```sh
./scripts/ejecutar.sh
```

También puedes indicar otra ubicación del JAR:

```sh
MARS_JAR="/ruta/a/Mars4_5.jar" ./scripts/ejecutar.sh
```

## Salida esperada

```text
Hello World!
5 + 7 = 12
```

## Explicación de los registros

| Registro | Uso en el programa |
| --- | --- |
| `$t0` | Recibe el primer operando: **5**. |
| `$t1` | Recibe el segundo operando: **7**. |
| `$t2` | Guarda el resultado de `add $t2, $t0, $t1`: **12**. |
| `$v0` | Selecciona el servicio de `syscall`: **4** imprime cadenas, **1** imprime enteros y **10** termina el programa. |
| `$a0` | Contiene la dirección de una cadena al imprimir texto, o el número **12** al imprimir el resultado. |
| `PC` | Indica la dirección de la siguiente instrucción básica que se ejecutará. |

Las primeras tres pulsaciones de **Step** cargan 5 en `$t0`, cargan 7 en `$t1`
y guardan 12 en `$t2`, respectivamente. Cada instrucción básica ocupa cuatro
bytes; una pseudoinstrucción puede expandirse en varias instrucciones básicas.
En este ejemplo, `la` se ejecuta en dos pasos.

## Referencias

- [Repositorio oficial de MARS](https://github.com/dpetersanderson/MARS).
- [Tutorial de MARS — USC](https://bytes.usc.edu/files/ee109/documents/MARS_Tutorial.pdf).
- [Documentación de syscalls de MARS](https://dpetersanderson.github.io/Help/SyscallHelp.html).

## **Partes del computaro Hack**

1. La CPU que ejecuta las instrucciones del programa (registros A y D, ALU-Parte del computador que hace los cálculos).

2. La memoria ROM donde está el programa.

3. La memoria RAM donde se guardan los datos.

4. El teclado y la pantalla (Dispositivos de entrada y salida).

## **El modelo de programación de la CPU/FETCH-DECODE-EXECUTE** 

¿Cómo funnciona?

FETCH: La CPU lee la instrucción desde la memoria y el PC indica donde se encuentra esa instrucción en la memoria ROM.

DECODE: La CPU interpreta la instrucción y entiende qué operación debe realizar y qué datos y recursos necesita.

EXECUTE:  La CPU realiza la operación indicada.

## **Diferencia entre memoria RAM y registros**

La diferencia es que los registros son más rápidos y guardan información momentánea, mientras que la RAM es más grande y guarda información por más tiempo.

## *¿Cómo leo el teclado y lo muestro en pantalla?**

El teclado se lee en la dirección de memoria RAM[24576] y la pantalla se controla con la dirección RAM[16384]

## **¿Cómo implementar un bucle?**

Con etiquetas o salto: Esto hace que el programa se repita infinitamente 

(LOOP)

@LOOP

0;JMP

## **¿Cómo implemento una condición?**

 Usando comparación y un salto condicional.

   JGT: Valor mayor que 0

   JEQ: Valor igual que 0

   JGE: Valor mayout o igual a 0

   JLT: Valor menos que 0

   JNE: Valor distinto de 0

   JLE: Valor menor o igual a 0

   JMP: Salta siempre.

## **¿Qué es la ALU y qué operaciones realiza?**

ALU = Unidad arimético-lógica, realiza operaciones como suma y resta, operaciones lógicas y comparaciones.


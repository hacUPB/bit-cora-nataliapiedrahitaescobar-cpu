# Actividad 1
Se realizaron los ejercicios de Fetch-Decode-Execute

[Link a Youtube](www.youtube.com)

- uno
- dos
- tres

**Negrita**
![alt text](../Imágenes/Imagen1.webp)


 Yay! c:

## Actividad 2 
 
**¿Qué sucede?**
El programa suma los valores 1 y 2 para obtener el resultado 3 y este valor se guarda en la posición número 16 de la memoria RAM.

**¿Qué valor se guarda en la dirección de memoria 16 y por qué?**
El valor que se guarda en la dirección de memoria 16 es el 3 porque el programa toma primero el valor 1 y luego le suma el valor 2, dando como resultado el 3 que se termina guardando en la dirección de memoria 16.

**¿Qué instrucciones se ejecutan en cada ciclo Fetch-Decode-Execute?**
1. @1
   - Fetch: El procesador busca la instrucción @1.
   - Decode:  Se carga el valor 1 en el registro A.
   - Execute: A = 1
2. D = A
   - Fetch: El procesador busca la instrucción D = A
   - Decode: Se copia A en D.
   - Execute: D = 1
3. @2
   - Fetch: El procesador busca la instrucción @2.
   - Decode: Se carga el valor 2 en el registro A.
   - Execute: A = 2.
4. D = D + A
   - Fetch: El procesador busca D + A.
   - Decode: El computador suma D + A (1 + 2).
   - Execute: D = 3.
5. @16
   - Fetch: El procesador busca la instrucción @ 16.
   - Decode: Se carga el valor de 16 en el registro A.
   - Execute A = 16.
6. M = D
   - Fetch:  El procesador busca M = D.
   - Decode: Se guarda D en la memoria.
   - Execute: RAM[16] = 3.
7. @END
   - Fetch: El procesador busca @END.
   - Decode: El computador entiende que es una dirección de salto.
   - Execute: A = END.
  
**¿Qué cambios observas en el contenido de la memoria y los registros?**
El registro A cambia según cada instrucción: A = 1,2,16,END.
El registro D primero toma el 1 y luego guarda el resultado de la suma: D = 0,1,3.
La memoria RAM solo cambia una posición de la memoria: RAM[16] = 3.

## Actividad 2.1

![alt text](imagen.png)



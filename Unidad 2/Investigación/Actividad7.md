## **Parte 1: Recuperación de conocimiento**

1. **¿Cómo se representa y manipula un puntero en el lenguaje ensamblador HACK?**
En el lenguaje ensamblador de HACK no existen los punteros como en C++, pero se pueden simular guardando una dirección de memoria dentro de otra posición de memoria. O sea que, un puntero en HACK es una variable que guarda un número que representa la dirección de la RAM.
**EJEMPLO:**
Si quiero que una variable p apunte a la variable a, lo que se hace es guardar la dirección donde está a dentro de p.

**p = &a**
p = &a significa que el puntero guarda la dirección de a en C++
En HACK, el proceso se hace así:
@direcciondea
D=A (Guarda en el registro D el número de la dirección)
@direcciondep
M=D (Guarda el número dentro de la variable p)
**EJEMPLO:**
Si a está en RAM[16] y p está en RAM[28], se estaría guardando el número 16 dentro de la posición 28.

**p = 20**
p = 20 significa que se va a la dirección que guarde el puntero y se cambia el valor que hay ahí.
@20
D=A
@direcciondep
A=M (A toma la dirección que se guardó en p)
M=D (En esa dirección se guarda el 20)

2. **¿Cómo implementarías el acceso a un elemento de un arreglo, como arr[j], en lenguaje ensamblador?**
En HACK un arreglo es es un conjunto de posiciones consecutivas en la memoria.
arr[0] Está en la RAM[16]
arr[1] Está en la RAM[17]
arr[2] Está en la RAM[18] y así sucesivamente.

Para hacer arr[j] se debe sumar: @direccionbase + el número que indica la posición de un elemento dentro de un arreglo (j)

**direccionbase:** Es la posición donde comienza el arreglo en memoria (RAM[16])
**j:** Indica cuántas posiciones se debe avanzar desde la dirección base.

**HACK**
Acceso a arr[j]
@16 
D=A (D: Es la dirección base)
@27
D=D+M (D = Base + j)
A=D (A toma la dirección de la suma)
D=M (D = valor de arr[j])
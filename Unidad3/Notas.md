### **Mapa de Memoria**

1. **Segmento de memoria:**
Es donde se guardan las instrucciones y funciones del código.
Segmento protegido como solo lectura, no se puede ecribir en la zona de memoria protegida.
2. **Data:**
Variables globales y estáticas.
3. **Heap:** 
Va todo lo que va reservado manualmente en el código, algo creado con new o mallock.
Si se puede modificar.
4. **Stack:**
Van las variables locales, parámetros de funciones y direcciiones de retorno.
Si se puede modificar.

**MAIN:** 
Es donde están guardadas las instrucciones ejecutables de un programa.

**Punteros:**
Guarda la dirección de memoria donde está un valor, pero no guarda el valor directamente.
&x = dar la dirección de x en la memoria.
Un puntero es una variable que almacena la dirección de memoria de otra variable, permitiendo acceder o modificar su contenido de forma indirecta.

**Depurar:**
Es ejecutar un programa paso a paso para ver qué está pasando en la memoria, dónde ocurre el error y qué línea lo provoca.

**Breakpoint:**
Detener el programa en una parte determinada antes de ejecutar una línea.
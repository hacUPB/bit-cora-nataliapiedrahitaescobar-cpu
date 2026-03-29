### **¿Qué espero ver en la memoria?**
Creo que va a mostrar el preceso interno del espacio de memoria donde se encuentra ofApp, o sea, cuando se crea la partícula, ver sus movimientos, posición, velocidad y la forma en la que explotan. O sea, ver cómo se guardan esos procesos en la memoria y cómo funcionan.

**Ejecuta el código y muestra una captura de pantalla del objeto en la memoria. ¿Qué puedes observar? ¿Qué información te proporciona el depurador? ¿Qué puedes concluir?**

Depuración cuando se crean varias partículas al incio:
![alt text](image.png)
![alt text](image-1.png)

 Depuración cuando se crea una sola partícula al inicio:
 ![alt text](image-2.png)

Al depurar el código, se puede ver el objeto ofApp en la memoria a través de las variables this y su atributo particles.

El depurador también muestra el tamaño del vector de la partícula cuando es lanzada, la dirección en la memoria y la posición en el mouse.

En una de las capturas, cuando solo se creó una sola partícula, el tamaño del vector es muy pequeño (0), mientras que en la captura donde se crearon varias partículas a la vez, el tamaño aparece demasiado grande lo cual es un error. El error sucede porque se están borrando elementos del vector mientras se está utilizando, lo que hace que el programa siga leyendo posiciones que ya no existen y la memoria se desordena.

### **CircularExplosion en la memoria**

![alt text](image-3.png)
![alt text](image-4.png)

**¿Qué puedes observar en la memoria? ¿Qué información te proporciona el depurador? ¿Qué puedes concluir?**

1. En la memoria se puede observar que en el vector Particles hay 28 partículas y que cada una está guardada en un puntero. Todas las partículas apuntan al CirculasExplosion y cada una de ellas se encuentra en una dirección diferente de la memoria.

2. El depurador ayuda a mostrar cuántas partículas hay, sus direcciones en memoria y el tipo real del objeto que hay cuando sucede el CircularExplosion.

3. Se puede concluir que aunque el vector guarde las particulas como punteros, en realidad son objetos como el CircularExplosion. O sea que,aunque el programa guarda los objetos de distintos tipos como si fueran iguales, en realidad son diferenrtes y el programa sabe cuál es cuál.

### **Métodos Virtuales**

**CircularExplosion _vfptr:**
![alt text](image-5.png)

**¿Qué puedo observar?**

Puedo observar que _vtable contiene las direcciones de memoria que representan a las funciones del objeto como update, draw, etc.
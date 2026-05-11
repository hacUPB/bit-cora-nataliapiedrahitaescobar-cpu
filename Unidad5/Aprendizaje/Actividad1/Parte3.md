**1.Memoria y herencia: cuando creas un objeto Rectangulo, este tiene Base, Altura y también Nombre. ¿Cómo te imaginas que se organizan esos tres datos en la memoria del computador para formar un solo objeto?**

Cuando se crear un objeto como el rectángulo o el círculo, creo que en la memoria los guarda como un solo bloque que contiene todos los datos en el Heap.Dentro del bloque es donde están los atributos propios de las clases rectángulo y círculo como su base y altura. Como el atributo Nombre se hereda de la clase figura, la herencia hace que todos estos datos se integren en un mismo objeto.

**2.El mecanismo del polimorfismo: pensemos de nuevo en la llamada fig.Dibujar(). El compilador solo sabe que fig es una Figura. ¿Cómo decide el programa, mientras se está ejecutando, si debe llamar al Dibujar del Circulo o al del Rectangulo? Lanza algunas ideas o hipótesis.**

 El programa sabe porque cuenta con un foreach que se encarga de recorrer por orden cada elemento que hay en la lista misFiguras y las asigna al Fig. Aunque Fig hace parte de Figura, el programa logra reconocer en la ejecución si la figura que se llama es un círculo o un rectángulo y ejecuta el modo Dibujar() correctamente gracias al polimorfismo.

**3.La barrera del encapsulamiento: ¿Cómo crees que el compilador logra que no puedas acceder a un miembro private desde fuera de la clase? ¿Es algo que se revisa cuando escribes el código, o es una protección que existe mientras el programa se ejecuta? ¿Por qué piensas eso?**

Creo que el acceso a los miembros private lo controla el compilador cuando está leyendo el código, porque si se intenta usar o llamar a un miembro private desde afuera, aparece un error y no se puede ejecutar el programa. Esto lo hace para proteger los datos y que no se puedan cambiar desde cualquier parte.

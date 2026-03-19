**1.Memoria y herencia: cuando creas un objeto Rectangulo, este tiene Base, Altura y también Nombre. ¿Cómo te imaginas que se organizan esos tres datos en la memoria del computador para formar un solo objeto?**

Cuando se crear un objeto como el rectángulo o el círculo, creo que en la memoria los guarda como un solo bloque que contiene todos los datos en el Heap.Dentro del bloque es donde están los atributos propios de las clases rectángulo y círuclo como su base y altura. Como el atributo Nombre se hereda de la clase figura, la herencia hace que todos estos datos se integren en un mismo objeto.

**2.El mecanismo del polimorfismo: pensemos de nuevo en la llamada fig.Dibujar(). El compilador solo sabe que fig es una Figura. ¿Cómo decide el programa, mientras se está ejecutando, si debe llamar al Dibujar del Circulo o al del Rectangulo? Lanza algunas ideas o hipótesis.**
 El programa sabe 

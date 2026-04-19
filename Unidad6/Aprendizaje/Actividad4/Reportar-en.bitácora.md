### **1. Explica con tus propias palabras el propósito del patrón State. ¿Cuándo es útil aplicarlo?**

El patrón State sirve para que un objeto (En este caso las partículas) pueda cambiar su comportamiento según el estado en el que se encuentra, sin tener que utilizar muchos if o switch.

### **2.  Dibuja un diagrama de estados simple para la clase Particle. Muestra los diferentes estados (Normal, Attract, Repel, Stop) como nodos y las transiciones entre ellos como flechas etiquetadas con el evento que las causa (p. ej., la tecla presionada: ‘n’, ‘a’, ‘r’, ‘s’).**

![alt text](image-1.png)


### **3. Describe las ventajas de usar el patrón State en Particle en lugar de tener un miembro std::string estadoActual y usar un gran if/else if/else o switch dentro de Particle::update() para cambiar el comportamiento.**

Es mejor utilizar el patrón State que un if grande porque hace que el código sea más fácil de utilizar o cambiar.

Con State, cada comportamiento de las partículas está en una clase diferente, el código es más ordenado y es más fácil comprender qué hace y cómo actúa cada estado.

En cambio, si se utilizan muchos if el código se vuelve más difícil de entender y editar y es más fácil cometer errores.

**4. ¿Qué responsabilidad tienen los métodos onEnter y onExit en el patrón State? Proporciona un ejemplo de por qué podrían ser útiles (incluso si no se usan mucho en todos los estados de este caso de estudio). Por ejemplo, ¿Qué podrías hacer en onEnter para AttractState o en onExit para StopState?**

Los métodos onEnter y onExit sirven para manejar lo que pasa cuando un objeto entra a un estado o sale de él.
- onEnter: Prepara el nuevo estado de la partícula.
- onExit: Limpia el estado anterior en el que se encontraba la partícula.

Son útiles porque gracias a ellos se pueden hacer ajustes sin mezclar todo en el update.

Por ejemplo:
- En  el onEnter de AttractState se puede cambiar el color de la partícula para mostrar que está siendo atraída o aumentar la velocidad inicial.
- En el onExit de StopState se podría reiniciar la velocidad  o quitar algún efecto visual de que la partícula está detenida.

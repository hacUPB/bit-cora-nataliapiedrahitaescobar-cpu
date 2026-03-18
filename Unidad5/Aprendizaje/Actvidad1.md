### **1.¿Qué es el encapsulamiento para ti? Describe una situación en la que te haya sido útil o donde hayas visto su importancia.**

El encapsulamiento es el nivel de protección de las características y comportamientos de un objeto.

Un objeto se puede encapsular de 3 formas diferentes: Public, private y protected.

- Public: Es cuando se puede acceder al objeto desde cualquier parte del programa.

- Private: Solo se puede acceder al objeto si se está dentro de la misma clase que lo contiene.

- Protected: Se puede accerder al objeto solo dentro de la clase a la que pertenece y a las que heredan de esta. No es accesible desde cualquier parte externa.

###  **Situación**
Creo que se puede ver en los videojuegos, especialmente cuando se trata de la vida de un personaje.
La vida del personaje debería ser un atributo private para que no pueda ser cambiado o modificado directamente, O sea que, para hacerle daño al personaje se debrían usar métodos que puedan cambiar la variable de forma controlada.

### **2. ¿Qué es la herencia? ¿Por qué un programador decidiría usarla? Da un ejemplo simple.**
La herencia es la que permite crear nuevas clases a partir de clases ya existentes, reutilizando su código y métodos.

Un programador usa la herencia para organizar mejor el código de programación y para tener la oportunidad de crear nuevas clases reutilizando un código ya existente.

**EJEMPLO**
Digamos que hay una clase llamada Animal, que tiene como características nombre y edad. Después creo otra clase que se llame Perro y hago que esta herede de la clase Animal, esto hace que la clase Perro no tenga que repetir las características como nombre y edad que ya están en la clase Animal porque ya las heredó y al mismo tiempo también se pueden agregar otras características nuevas a la clase Perro como su raza y color de pelaje, etc.

### **3. ¿Qué es el polimorfismo? Describe con tus palabras qué significa que un código sea “polimórfico”.**


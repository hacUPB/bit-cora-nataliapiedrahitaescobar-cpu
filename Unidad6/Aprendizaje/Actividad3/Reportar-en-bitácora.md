### **1. Explica con tus propias palabras el propósito del patrón Factory Method (o Simple Factory, en este caso). ¿Qué problema principal aborda en la creación de objetos?**

El factory method es donde se crean los objetos ya con sus características configuradas sin tener que crearlos con new durante todo el código. 

El problema que resuelve es el de evitar repetir código y que otras clases tengan que saber cómo se crean los objetos, lo que hace que el programa sea más fácil de modificar.

### **2. ¿Qué ventajas aporta el uso de ParticleFactory en ofApp::setup en comparación con instanciar y configurar las partículas directamente allí?**

Usar ParticleFactory hace que el código sea más ordenado, porque cada clase solo hace el trabajo que le corresponde. ofApp se encarga de manejar las partículas, mientras que la fábrica se encarga de crearlas y configurarlas.

Sirve porque si en el futuro se quiere agregar un nuevo tipo de partícula, solo se debe cambiar la fábrica y no todo el código.

### **3. Imagina que quieres añadir un nuevo tipo de partícula llamada "black_hole" que tiene tamaño grande, color negro y velocidad muy lenta. Describe los pasos que necesitarías seguir para implementar esto utilizando la ParticleFactory existente. ¿Tendrías que modificar ofApp::setup? ¿Por qué sí o por qué no?**

Para poder agregar la partícula "black_hole" dn dl código se debe ir a la clase ParticleFactory y dentro del método createParticle se agrega una nueva condición donde se asigna el tamaño, color y el tipo de velocidad que se piden para crear la partícula "black_hole" y luego en ofApp::setup se agregaría su uso cuando se quiera utilizar.

### **4. El método createParticle en el ejemplo es estático. ¿Qué implicaciones (ventajas/desventajas) tiene esto comparado con tener una instancia de ParticleFactory y un método de instancia createParticle()?.**

Qué el método createParticle sea estático significa que puede ser utilizado sin crear un objeto de ParticleFactory. 

**VENTAJAS**

- Es más simple de usar, porque no se necita crear una instancia de la fábrica.
- El código es mas corto y directo.
- El método sigue funcionando bien cuando la fábrica no necesite guardar información

**DESVENTAJAS**

- El método es menos flexible porque su comportamiento no se puede cambiar facilmente.
- No se pueden guardar datos dentro de la fábrica como configuraciones diferentes.
- Es más difícil de extender si en el futuro se quieren diferentes tipos de fábricas.
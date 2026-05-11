### **¿Cómo y por qué de la implementación de cada una de las extensiones solicitadas al caso de estudio?**

En el código se agregaron dos tipos de Partículas y una explosión utilizando como base las clases que ya estaban implementadas en el código.

Primero hice las partículas FallingParticle y ZigZagParticle utilzando como base la clase Particle que ya se encontraba en el código y para poderlas hacer diferentes cambié el update(). 
En el FallingParticle, la partícula cae para abajo como si estuviera afectada por la gravedad y el ZigZagParticle hace que la partícula se mueva de lado a lado como simulando un zigzag.

También agregué en el código un nuevo tipo de explosión, SpiralExplosion, que tiene como base la clase ExplosionParticle. En la explosión las partículas se mueven en forma de espiral.

### **¿Cómo y por qué de la implementación de los conceptos de encapsulamiento, herencia y polimorfismo en tu código?**

El encapsulamiento se utilizó en el código para defenir los atributos (posición, velocidad, color y tiempo de vida), usando protected y private. Esto evita que otras partes del código modifiquen esos valores directamente y permite que se puedan controlar através de los métodos de update() y draw().

La herencia se utilizó cuando se crearon las clases FallingParticle, ZigZagParticle que heredan de Particle y SpiralExplosion que hereda de ExplosionParticle.

El polimorfismo se utilizó al usar el particle*, que es donde se guardan los diferentes tipos de partículas. Aunque todas son tratadas como Particle, cada una ejecuta un draw() y update() diferentes.





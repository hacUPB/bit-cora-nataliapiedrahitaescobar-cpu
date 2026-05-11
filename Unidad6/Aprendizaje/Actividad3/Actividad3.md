### **Identificar el Factory**

 **1. ¿Qué clase actúa como la factory en este ejemplo?**

La clase que actúa como Factory en este caso es el ParticleFactory que es el encargado de crear las subclases de los diferentes tipos de partículas

**2.¿Cuál es el “método factory” específico? ¿Es un método de instancia o estático?**

El método factory es el createParticle, el cual es un método estático de la clase ParticleFactory. Se considera un factory method porque encapsula la creación de objetos Particle y decide como configurarlos según el tipo recibido. Al ser estático, es necesario intanciar la clase, o sea que su uso centraliza la lógica de la creación de partículas en un solo lugar.


**Método Factory**

```
class ParticleFactory {
public:
	static Particle * createParticle(const std::string & type);
};
```

Esta parte del código es la encargada de crear los objetos y decide cómo crealos según el type.

```
Particle * ParticleFactory::createParticle(const std::string & type) {
	Particle * particle = new Particle();
	if (type == "star") {
		particle->size = ofRandom(2.0f, 4.0f);
		particle->color = ofColor(255, 0, 0);
	} else if (type == "shooting_star") {
		particle->size = ofRandom(3.0f, 6.0f);
		particle->color = ofColor(0, 255, 0);
		particle->velocity *= 3.0f;
	} else if (type == "planet") {
		particle->size = ofRandom(5.0f, 8.0f);
		particle->color = ofColor(0, 0, 255);
	}
	return particle;
}
```

**3. ¿Qué tipo de objeto devuelve este método fábrica?**

Devuelve un puntero tipo Particle que internamente estpa divido en tipo star, shooting star o planet, los cuales son todos tipo a Particle como base pero con diferentes características.

### **Proceso de Creación**

**Observa el método ParticleFactory::createParticle. ¿Cómo decide qué tipo de partícula específica crear y configurar?**

Para saber cómo se decide qué tipo de partícula crear se basa en el type, si el tipo de partícula es una estralla (Star) lo que hace el método es darle a esa partícula el tamaño y el color que ya están implementados en el código y eso mismo hace con los tipos de partículas shooting star y planet.

**¿Qué información necesita el método fábrica para realizar su trabajo?**

Solo necesita el método type (string) con el cual decide qué características asignar a la partícula y  cómo configurarla.

**¿Qué devuelve si se le pasa un tipo desconocido?*

Si se pasa un tipo desconocido lo que hace el type es que manda una partícula por defecto sin ninguna configuración en especial.

```
Particle * particle = new Particle();
return particle;
```

**¿Cómo podrías mejorar esto?**

El problema del tipo de partícula desconocido se puede arreglar validando el tipo de partícula y devolviendo un null al final del código para que no se mande ninguna partícula.

### **Uso de Factory**

**Localiza ofApp::setup. ¿Cómo se utiliza la ParticleFactory para poblar el vector particles?**

 En el método ofApp::setup, la clase ParticleFactory se utiliza para crear las partículas. En lugar de crear las partículas directamente, se llama al método createParticle con un tipo específico de partícula como star, shooting_star o planet.

 Después de que cada partícula es creada se guarda en el vector Particles y estas se agregan como un observador por medio del addObserver, así,  ofApp no necesita saber cómo se crean las partículas por dentro, porque la fábrica se encarga de eso.

 ### **Compara esto con la alternativa: ¿Cómo se vería ofApp::setup si no usara la fábrica y tuviera que crear y configurar cada tipo de partícula (star, shooting_star, planet) directamente usando new Particle() y luego ajustando sus propiedades (size, color, velocity)?**

 Si no se usara la fábrica, el método ofApp::setup tendría que crear cada partícula manualmente con new Particle() y luego tendría que asignarles sus propiedades como el tamaño, color y velocidad de cada partícula que esté creando. Esto haría que el código fuera más largo, mientras que con el factory, toda la lógica del código se encuentra en una sola parte, lo que hace que sea más fácil de modificar.
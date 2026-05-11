### **Identifica los componentes**

**1. ¿Cuál es la clase Context? ¿Qué miembro utiliza para mantener el estado actual?**

El context en el código es la clase Particle porque es el objeto que tiene diferentes comportamientos y cambia su forma de actuar según el estado.

El miembro que se utiliza para mantener el estado actual es el State * State; porque en esta variable es donde se guardan los estados (NormalState, AttractState, etc) y es el que le dice a la partícula cómo comportarse.

**2. ¿Cuál es la interfaz State? ¿Qué métodos importantes define?**

La interfaz State es la clase base que hereda los diferentes estados de las partículas.
Esta clase define los métodos que todos los estados deben tener:

- update(Particle*): Define qué hace la partícula en este estado (Cómo se mueve).
- onEnter(Particle*): Se ejecuta cuando la partícula entra en el estado.
- onExit(Particle*): Se ejecuta cuando la partícula sale del estado.

**3. Enumera las clases ConcreteState. ¿Qué comportamiento específico encapsula cada una?**

Cada una de las clases define un comportamiento diferente que hará cada partícula.

Las clases ConcreteState son:
- NormalState: La particula se mueve de forma normal, como el que se ve al principio al ejecutar el programa.
- AttractState: Las particulas se mueven a un lugar específico que marque el mouse.
- RepelState: La partícula se aleja del mouse.
- StopState: La partícula va frenando poco a poco hasta que se detiene en una parte de la ventana.

### **Delegación del comportamiento**

**1. Observa el método Particle::update(). ¿Cómo delega la lógica de actualización al estado actual?**

El método Particle::update, la partícula no decide que hacer po si sola. En cambio le pide al estado actual que haga la actualización. O sea, que la partícula solo llama al estado y el estado decide cómo se mueve.

**2. Compara el código dentro de NormalState::update(), AttractState::update(), RepelState::update() y StopState::update(). ¿Cómo encapsula cada clase un comportamiento diferente?**

Cada clase tiene su propio método update(), y ahí es donde se define cómo se comporta cada partícula. Cada una de las clases guarda un comportamiento diferente según el estado en el que esté (NormalState, AttractState, RepelState y StopState).

### **Transiciones de estado**

**1. Cómo cambia una Particle de un estado a otro? ¿Qué método es responsable de gestionar la transición?**

Una partícula cambia de estado usando el método setState, que es el que se encarga de reemplazar el estado en el que se encuentra la partícula por uno nuevo. El método también maneja lo que sucede cuando se sale del estado y se entra a otro.

**2. ¿Qué sucede dentro de Particle::setState()? ¿Por qué son importantes los métodos onEnter y onExit de la interfaz State (aunque no todos los estados concretos los usen extensivamente en este ejemplo)? ¿Qué gestionan onEnter y onExit en NormalState?**

En el setState es donde se cambia el estado actual por uno nuevo, ejecutando primero onExit en el estado anterior y onEnter del nuevo. Estos métodos son importantes porque permiten hacer la transición entre estados. 

En NormalState, onEnter se usa para asignar una velocidad aleatoria a la partícula.

**3. ¿Qué evento externo (mediado por el patrón Observer, que ya analizaste) desencadena la llamada a setState en una Particle?** 

El evento externo sucede cuando se presiona una tecla (a,r,s o n), que hace que ofApp envíe un mensaje a las partículas usando el patrón Observer. Cuando una partícula recibe el mensaje, llama al setState para cambiar su estado.






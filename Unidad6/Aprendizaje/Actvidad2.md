### **1. Identificar roles:**

- **¿Qué clase actúa como la interfaz Observer? ¿Qué método define?**
La clase que áctua como interfaz Observer es la clase virtual Observer que define los métodos Observer y onNotify.

- **¿Qué clase actúa como Subject? ¿Qué métodos proporciona para gestionar observadores y notificar?**
La clase que actúa como subject es ofApp que es el que se encarga de informar los cambios de estado de las partículas al programa gracias a los métodos heredados del la clase virtual Subject que son addObserver, removeObserver y notify.

- **¿Qué clase es el ConcreteSubject en esta aplicación? ¿Por qué?**

El ConcreteSubject también es ofApp porque al heredar los métodos de la clase Subject, tiene la capacidad de decidir a quién de los observadores le mande los mensajes teniendo en cuenta si hacen parte de la lista o no y se algún observador se agrega a la lista.

- **¿Qué clase(s) actúan como ConcreteObserver? ¿Por qué?**

Serían todas las clases que hereden del Observer, o sea, la clase Particle porque es el que recibe y responder las notificaciones mandadas por el ConcreteSubject.

### **2. El flujo de notificaciones:**

- **Localiza el método keyPressed en ofApp.cpp. ¿Qué sucede cuando se presiona la tecla ‘a’? ¿Qué método se llama?** 

Al presionar la tecla "A" el método keyPressed llama al método notify("atract") que hace que las partículas cirlulas se acumulen todas en un solo porto marcado por mouse.

- **Ve al método notify en la clase Subject. ¿Qué hace este método?**

El método notify recorre todos los observadores les envía o avisa sobre el evento que deben realizar.

- **Localiza el método que implementa la interfaz Observer en la clase Particle (onNotify). ¿Qué hace este método cuando recibe el evento “attract”?**



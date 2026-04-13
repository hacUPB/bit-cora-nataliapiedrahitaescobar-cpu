### **1. Identificar roles:**

- **¿Qué clase actúa como la interfaz Observer? ¿Qué método define?**
La clase que áctua como interfaz Observer es la clase virtual Observer que define los métodos Observer y onNotify.

- **¿Qué clase actúa como Subject? ¿Qué métodos proporciona para gestionar observadores y notificar?**
La clase que actúa como subject es ofApp que es el que se encarga de informar los cambios de estado de las partículas al programa gracias a los métodos heredados del la clase virtual Subject que son addObserver, removeObserver y notify.


### **Te voy a pedir un resumen en tus propias palabras de lo que acabas de leer. En tu resumen debes tratar de conectar GLFW, opengl32.lib, GLAD, GLM y los drivers de la GPU. ¿Qué rol cumple cada uno? ¿Cómo se relacionan entre sí?**

El OpenGL de Windows son varias herramientas que trabajan juntas para que se puedan dibujar gráficos como el triángulo.

La primera herramienta que se utiliza es el openGL32.lib que es el archivo que se encarga que se inicie el OpenGL y se creen los datos básicos necesarios para hacer el dibujo. 

Luego está el GLFW que es el que ayuda a crear las ventana, manejar eventos y detectar inputs. En este caso, se utiliza para gestionar el contexto del OpenGl que es donde todo se va a dibujar y crear la ventana.

Después se usa el GLAD, que es el que carga las funciones modernas del OpenGL para que sean disponibles en el código. Es como el puente entre el programa y la tarjeta gráfica.

Los drivers de la GPU 
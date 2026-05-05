
### **¿Qué pasa, ¿Qué observas? ¿Qué crees que está pasando?  si se cambian los valores de bufferWidth y bufferHeigth?**
Al cambiar los valores del bufferwidth y el bufferheight se modifica la ventana del área donde se encuentra el triángulo. 

Si el ancho y el largo del área se dividen, el triángulo se ve más reducido en la parte de la pantalla, pero si se multiplican, el dibujo del triángulo se ve más grande,  estirado o cortado en la ventana.

- Multiplicado por 2
![alt text](image-6.png)
![alt text](image-7.png)

- Multiplicado por 4
![alt text](image-4.png)
![alt text](image-5.png)

- Dividido por 2
![alt text](image-1.png)

- Dividido por 4
![alt text](image-2.png)


### **Mapa Mental**
![alt text](image-8.png)

### **¿Qué pasaría si cambio el valor del color en glClearColor()?**

Cuando se cambia el color de fondo en cada frame usando números aleatorios, color de la ventana cambia constantemente como si la ventana tuviera un lag al cargar correctamente los colores.

Esto muestra que el framebuffer se limpia en cada iteración del loop con el nuevo color definido. También me di cuenta que los colores deben estar entre un valor de 0.0 y 0.1 para que OpenGL los interprete correctamente.

![alt text](image-10.png)
![alt text](image-11.png)
![alt text](image-12.png)
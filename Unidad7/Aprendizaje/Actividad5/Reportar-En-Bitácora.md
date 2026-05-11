### **2. Incluye una captura de pantalla del triángulo interactivo funcionando en tu máquina.**

![alt text](image.png)
![alt text](image-1.png)

### **3. Explica el proceso de normalización de las coordenadas del mouse y cómo se relaciona con el sistema de coordenadas de OpenGL.**

Las coordenadas del mouse se dan en pixeles cuando las recibe la biblioteca GLFW. Esto causa un problema, porque OpenGL no trabaja con pixeles directamente sino con coordenadas, así que, los valores que llegaron en pixeles deben ser convertidos a coordenadas con valores entre 0 y 1, lo cual se hizo en el código de la siguiente manera:
 
 ```
float x = (float)xpos / (float)SCR_WIDTH;
float y = (float)ypos / (float)SCR_HEIGHT;
 ```

 Este proceso sirve para normalizar las coordenadas y que el movimiento del mouse pueda funcionar sin importar el tamaño de la ventana.

 ### **4. Explica el proceso de normalización a coordenadas de dispositivo (NDC) y cómo se relaciona con el sistema de coordenadas de OpenGL.**

 Al normalizar las coordenadas del mouse a valores entre 0 y 1, se deben ahora convertir en NDC (Normalized Device Coordinates) que es el sistema que usa OpenGL para poder dibujar en pantalla.

OpenGL trabaja con coordenadas que se encuentran entre -1 y 1  tanto en el eje x como en el eje y, y el centro de la pantalla tiene el valor de 0. 
Para poder realizar la conversión se hizo en el código la siguiente operación:

```
glUniform2f(offsetLocation, x * 2 - 1, 1 - y * 2);
```

Gracias a esta conversión donde se cambia el rango de los valores normalizados es que el triángulo puede moverse dentro de la ventana siguiendo la posición del mouse.

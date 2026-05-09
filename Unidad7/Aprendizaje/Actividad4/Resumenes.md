### **¿Cómo dibujar un triángulo en OpenGL?**

Para dibujar un triángulo en OpenGL se necesita primero crear una ventana y un contexto usando la biblioteca GLFW. Después se cargan las funciones modernas que utiliza OpenGL con el GLAD y se definen las posiciones de los vértices del triángulo.

Los datos de las coordenadas de los vértices se madan a la GPU usando el VBO y también se usa el VAO para guardar la configuración de cómo OpenGL debe interpretar esos datos.

Se crean los shaders: Un vertex shader que procesa la posición de los vértices y un fragment shader para definir el color del triángulo.

Para finalizar se llama a glDrawArrays() en OpenGL para que este pueda dibujar el triángulo en pantalla.

### ¿Cómo se utiliza un shader en OpenGL?**

Para poder utilizar un shader en OpenGL se escribir el código del vertex shader y el fragment shader usando el lenguaje GLSL. 

Después, los shaders se unen en un shader program que es el objeto que utiliza OpenGL para renderizar. Cuando el programa ya esté listo, se activa utilizando glUseProgram(), que hace que a partir de ese momento se utilice el mismo shader para dibujar hasta que se active otro diferente.
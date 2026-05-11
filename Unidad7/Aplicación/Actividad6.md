### **1. Describe brevemente los cambios que realizaste en el código C++ (dónde obtienes el tiempo, cómo y dónde actualizas el uniform).**

1. Se agregó un uniform float time en el fragment shader para poder enviar el tiempo al shader.

2. En el loop se utilizó la función glfwGetTime() que se encarga de transformar el tiempo en segundos desde que se inicia el programa.

3. La función glfwGetTime() se envía al uniform del shader usando la función glUniform1f(timeLocation, timeValue); para que el triángulo pueda cambiar de color todo el tiempo cuando se ejecuta el programa.

### **2. Pega el código modificado de tu fragment shader.**

```
//Fragment Shader
const char* fragmentShaderSrc = R"glsl(
#version 460 core

out vec4 FragColor;

uniform float time;

void main()
{
     float red = (sin(time) + 1.0) / 2.0;

    float green = (sin(time + 2.0) + 1.0) / 2.0;

    float blue = (sin(time + 4.0) + 1.0) / 2.0;

    FragColor = vec4(red, green, blue, 1.0);
}
)glsl";
```
```
//Fragment Shader
unsigned int fs = glCreateShader(GL_FRAGMENT_SHADER);

glShaderSource(fs, 1, &fragmentShaderSrc, nullptr);
glCompileShader(fs);

glGetShaderiv(fs, GL_COMPILE_STATUS, &succes);

if (!succes) {
	glGetShaderInfoLog(fs, 512, nullptr, log);
	std::cerr << "ERROR FRAGMENT SHADER: \n" << log << "\n";
}
```

```
//Enviar tiempo al shader
glUniform1f(timeLocation, timeValue);
```

### **3. Explica cómo usaste la función de tiempo (sin, cos, u otra) para lograr el efecto de cambio de color cíclico. ¿Qué rango de valores produce tu cálculo y cómo afecta eso al color final?**

Para hacer los cambios de color del rojo, verde y azul se utilizó la función seno (sin()) junto con el tiempo en el fragmen shader.

La idea es que el sin genere coordenadas entre el -1 y 1, valores que luego son normalizados, en los ejes "x" y "y", lo que hace que cambie la tonalidad de los colores en el triángulo.

### **4. EVIDENCIAS DEL CÓDIGO**

**Enlace:** https://youtu.be/RAmVGegF6qU 

(El video también está incluído en la carpeta de aplicación por si no se ve en Youtube).

### **5. Reflexión: ¿Qué otros efectos visuales simples podrías lograr usando el tiempo como uniform?**

Un efecto simple que se me ocurre que se puede hacer usando el tiempo como uniform sería el de mover el triángulo de un lado a otro utilizando sin(), o cambiar el tamaño del triángulo constantemente.



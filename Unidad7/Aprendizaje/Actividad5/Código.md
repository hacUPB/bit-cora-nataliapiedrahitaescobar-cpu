### **1. Modifica el código del triángulo para que sea interactivo.**


```
//Bibliotecas incluídas
#include <iostream> //Permite imprimir mensajes en consola
#include <glad/glad.h> //Carga las funciones modernas de OpenGL 
#include <GLFW/glfw3.h> //Crea ventanas y maneja teclado, mouse y eventos


// Callback: ajusta el viewport cuando cambie el tamaño de la ventana
//Ayuda a saber a OpenGL que parte de la ventana se usa para dibujar.
void framebuffer_size_callback(GLFWwindow* window, int width, int height) {
	glViewport(0, 0, width, height); //Define el área visible.
}

// Procesa entrada simple: cierra con ESC
void processInput(GLFWwindow* window) {
	if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
		glfwSetWindowShouldClose(window, true);
}

// Tamaño de las ventanas
const unsigned int SCR_WIDTH = 400;
const unsigned int SCR_HEIGHT = 400;

// Fuentes de los shaders
//Posición desde el atributo 0
//gl_position coloca el vértice directamente en pantalla
const char* vertexShaderSrc = R"glsl(
#version 460 core

layout(location = 0) in vec3 aPos;

uniform vec2 offset;

void main()
{
    vec3 newPos = aPos;

    newPos.x += offset.x;
    newPos.y += offset.y;

    gl_Position = vec4(newPos, 1.0);
}
)glsl";

const char* fragmentShaderSrc = R"glsl(
#version 460 core

out vec4 FragColor;

uniform vec4 ourColor;

void main()
{
    FragColor = ourColor;
}
)glsl";

// IDs globales
//VAO: Guarda configuración de atributos
//VBO: Guarda datos de vértices
unsigned int VAO, VBO;
unsigned int shaderProg;


// Compila y linkea un programa de shaders, retorna su ID
unsigned int buildShaderProgram(const char* vertexShaderCode) {
	int success;
	char log[512];

	unsigned int vs = glCreateShader(GL_VERTEX_SHADER);
	glShaderSource(vs, 1, &vertexShaderCode, nullptr);
	glCompileShader(vs);
	glGetShaderiv(vs, GL_COMPILE_STATUS, &success);
	if (!success) {
		glGetShaderInfoLog(vs, 512, nullptr, log);
		std::cerr << "ERROR VERTEX SHADER:\n" << log << "\n";
	}

	unsigned int fs = glCreateShader(GL_FRAGMENT_SHADER);
	glShaderSource(fs, 1, &fragmentShaderSrc, nullptr);
	glCompileShader(fs);
	glGetShaderiv(fs, GL_COMPILE_STATUS, &success);
	if (!success) {
		glGetShaderInfoLog(fs, 512, nullptr, log);
		std::cerr << "ERROR FRAGMENT SHADER:\n" << log << "\n";
	}

	unsigned int prog = glCreateProgram();
	glAttachShader(prog, vs);
	glAttachShader(prog, fs);
	glLinkProgram(prog);
	glGetProgramiv(prog, GL_LINK_STATUS, &success);
	if (!success) {
		glGetProgramInfoLog(prog, 512, nullptr, log);
		std::cerr << "ERROR LINKING PROGRAM:\n" << log << "\n";
	}

	glDeleteShader(vs);
	glDeleteShader(fs);
	return prog;
}

// Crea un VAO/VBO con los datos de un triángulo
void setupTriangle() {
	float vertices[] = {
	-0.2f, -0.2f, 0.0f,
	 0.2f, -0.2f, 0.0f,
	 0.0f,  0.2f, 0.0f
	};

	glGenVertexArrays(1, &VAO);
	glGenBuffers(1, &VBO);

	glBindVertexArray(VAO);
	glBindBuffer(GL_ARRAY_BUFFER, VBO);
	glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
	glVertexAttribPointer(
		0,
		3,
		GL_FLOAT,
		GL_FALSE,
		3 * sizeof(float),
		(void*)0
	);
	glEnableVertexAttribArray(0);
	glBindVertexArray(0);
}


int main()
{
	// 1 Inicializa la biblioteca GLFW para crear la ventana y manejar eventos como el teclado, el mouse o cambios de tamaño
	if (!glfwInit()) { 
		std::cerr << "Fallo al inicializar GLFW\n";
		return -1;
	}
	//GLFW debe inicializarse antes de usar cualquier función
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 6);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

	// 2 Crear ventana, el contexto que se utiliza para dibujar con OpenGl
	GLFWwindow* mainWindow = glfwCreateWindow(SCR_WIDTH, SCR_HEIGHT, "Ventana", nullptr, nullptr);
	if (!mainWindow) {
		std::cerr << "Error creando ventana1\n";
		glfwTerminate();
		return -1;
	}

	// 3 Lee el tamaño del framebuffer
	int bufferWidth, bufferHeight;
	glfwGetFramebufferSize(mainWindow, &bufferWidth, &bufferHeight);
	
	// 4 Callbacks 
	glfwSetFramebufferSizeCallback(mainWindow, framebuffer_size_callback);


	// 5 Cargar GLAD y recursos en contexto de window1, hace que GLFW d
	glfwMakeContextCurrent(mainWindow);

	if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)) { //GLAD es la biblioteca que se encarga de cargar las funciones del OpenGL y hacer que funcionen en el programa 
		std::cerr << "Fallo al cargar GLAD (contexto1)\n";
		return -1;
	}

	// 6 Habilita el V-Sync, tasa de refresco
	glfwSwapInterval(1);

	// 7 Compila y linkea shaders, sin los Shaders OpenGL no sabe dibujar
	shaderProg = buildShaderProgram(vertexShaderSrc);
	glUseProgram(shaderProg);

	int offsetLocation = glGetUniformLocation(shaderProg, "offset");

	int colorLocation = glGetUniformLocation(shaderProg, "ourColor");

	// 8 Genera el contenido a mostrar
	setupTriangle(); //Define cómo se verá el triángulo en pantalla

	// 9 Configura el viewport
	glViewport(0, 0, bufferWidth, bufferHeight);


	// 10 Loop principal
	while (!glfwWindowShouldClose(mainWindow)) //Es donde se procesan los eventos, se actualiza la lógica del programa y se dibuja la escena.
	{
		// 11 Manejo de eventos
		glfwPollEvents();

	
		// 12 Procesa la entrada
		processInput(mainWindow);

		// 13 Configura el color de fondo y limpia el framebuffer
		glClearColor(0.2f,0.3f,0.3f, 1.0f);
		glClear(GL_COLOR_BUFFER_BIT);
		
		//Activar el shader
		glUseProgram(shaderProg);

		//Obtener posición del mouse
		double xpos, ypos;
		glfwGetCursorPos(mainWindow, &xpos, &ypos);

		//Normalizar x
		float x = (float)xpos / (float)SCR_WIDTH;

		x < 0 ? x = 0 : x;
		x > 1 ? x = 1 : x;

		//Normalizar y
		float y = (float)ypos / (float)SCR_HEIGHT;


		y < 0 ? y = 0 : y;
		y > 1 ? y = 1 : y;

		//Cambiar color
		glUniform4f(colorLocation, x, y, 0.0f, 1.0f);

		//Cambiar Posicón
		glUniform2f(offsetLocation, x * 2 - 1, 1 - y * 2);

		//Dibujar
		glBindVertexArray(VAO);
		glDrawArrays(GL_TRIANGLES, 0, 3);

		//Mostrar en pantalla
		glfwSwapBuffers(mainWindow);
	}

	// 17 Limpieza
	glfwMakeContextCurrent(mainWindow);
	glDeleteVertexArrays(1, &VAO);
	glDeleteBuffers(1, &VBO);
	glDeleteProgram(shaderProg);
	
	glfwDestroyWindow(mainWindow);
	glfwTerminate();
	return 0;
}
```











		






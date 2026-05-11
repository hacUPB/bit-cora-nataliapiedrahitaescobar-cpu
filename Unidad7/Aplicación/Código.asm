//Biblotecas incluídas
#include <iostream>
#include <cmath>

#include <glad/glad.h>
#include <GLFW/glfw3.h>

//Callback: Ajusta el viewport cuando cambie el tamaño de la ventana
void framebuffer_size_callback(GLFWwindow* window, int width, int height) {
	glViewport(0, 0, width, height);
}

//Procesa entrada simple: cierra con ESC
void processInput(GLFWwindow* window) {
	if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
		glfwSetWindowShouldClose(window, true);
}

//Tamaño de la ventana
const unsigned int SCR_WIDTH = 400;
const unsigned int SCR_HEIGHT = 400;

//Vertex shader
const char* vertexShaderSrc = R"glsl(
#version 460 core

layout(location = 0) in vec3 aPos;

void main()
{
 gl_Position = vec4(aPos, 1.0);
}
)glsl";

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

//IDs globales
unsigned int VAO, VBO;
unsigned int shaderProg;

//Compila y linkea shaders
unsigned int buildShaderProgram(const char* vertexShaderCode) {

	int succes;
	char log[512];

	//Vertex Shader
	unsigned int vs = glCreateShader(GL_VERTEX_SHADER);

	glShaderSource(vs, 1, &vertexShaderCode, nullptr);
	glCompileShader(vs);

	glGetShaderiv(vs, GL_COMPILE_STATUS, &succes);
	if (!succes) {
		glGetShaderInfoLog(vs, 512, nullptr, log);
		std::cerr << "ERROR VERTEX SHADER: \n" << log << "\n";
	}

	//Fragment Shader
	unsigned int fs = glCreateShader(GL_FRAGMENT_SHADER);

	glShaderSource(fs, 1, &fragmentShaderSrc, nullptr);
	glCompileShader(fs);

	glGetShaderiv(fs, GL_COMPILE_STATUS, &succes);

	if (!succes) {
		glGetShaderInfoLog(fs, 512, nullptr, log);
		std::cerr << "ERROR FRAGMENT SHADER: \n" << log << "\n";
	}

	//Programa
	unsigned int prog = glCreateProgram();

	glAttachShader(prog, vs);
	glAttachShader(prog, fs);

	glLinkProgram(prog);

	glGetProgramiv(prog, GL_LINK_STATUS, &succes);

	if (!succes) {
		glGetProgramInfoLog(prog, 512, nullptr, log);
		std::cerr << "ERROR LINKING PROGRAM:\n" << log << "\n";
	}

	glDeleteShader(vs);
	glDeleteShader(fs);

	return prog;
}

//Configura el triángulo
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

	glBufferData(GL_ARRAY_BUFFER,
		sizeof(vertices),
		vertices,
		GL_STATIC_DRAW);

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
	//Inicializar GLFW
	if (!glfwInit()) {
		std::cerr << "Fallo al inicializar GLFW\n";
		return -1;
	}

	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 6);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

	//Crear ventana
	GLFWwindow* mainWindow = glfwCreateWindow(
		SCR_WIDTH,
		SCR_HEIGHT,
		"Actividad 06",
		nullptr,
		nullptr
	);

	if (!mainWindow) {
		std::cerr << "Error creando ventana\n";
		glfwTerminate();
		return -1;
	}

	//Contexto actual
	glfwMakeContextCurrent(mainWindow);

	//Callback resize
	glfwSetFramebufferSizeCallback(
		mainWindow,
		framebuffer_size_callback
	);

	//Cargar GLAD
	if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)) {
		std::cerr << "Fallo al cargar GLAD\n";
		return -1;
	}

	//Vsync
	glfwSwapInterval(1);

	//Crear shader
	shaderProg = buildShaderProgram(vertexShaderSrc);

	//Obtener ubicación del uniform
	int timeLocation =
		glGetUniformLocation(shaderProg, "time");

	//Crear triángulo
	setupTriangle();

	//Viewport
	glViewport(0, 0, SCR_WIDTH, SCR_HEIGHT);

	
	//Loop principal
	while (!glfwWindowShouldClose(mainWindow))
	{
		//Eventos
		glfwPollEvents();

		//Entrada
		processInput(mainWindow);

		//Limpiar pantalla
		glClearColor(0.2f, 0.3f, 0.3f, 1.0f);

		glClear(GL_COLOR_BUFFER_BIT);

		//Activar shader
		glUseProgram(shaderProg);

		//Obtener tiempo
		float timeValue = glfwGetTime();

		//Enviar tiempo al shader
		glUniform1f(timeLocation, timeValue);

		//Dibujar triángulo
		glBindVertexArray(VAO);
		glDrawArrays(GL_TRIANGLES, 0, 3);


		//Mostrar resultado
		glfwSwapBuffers(mainWindow);
	}

	//Limpieza
	glDeleteVertexArrays(1, &VAO);

	glDeleteBuffers(1, &VBO);

	glDeleteProgram(shaderProg);

	glfwDestroyWindow(mainWindow);

	glfwTerminate();

	return 0;
}
		
		


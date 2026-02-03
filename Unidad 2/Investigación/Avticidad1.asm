//scribe un programa que dibuje un punto negro en la esquina superior izquierda de la pantalla.

//Programa ensamblador
@16384 //Se carga la dirección de memoria 16384 en el registro A (SCREEN)
M=1 // Muestra el pixel en pantalla

//Programa C#
int[] memoria = new int[20000]; 
memoria[16384] = 1; //Se localiza la memoria y se coloca el valor de 1 en ella.
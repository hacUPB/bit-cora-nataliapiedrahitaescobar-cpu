//Modifica el programa de la actividad anterior de tal manera que puedas mover la línea horizontal de derecha a izquierda usando las teclas d e i respectivamente.

//Intento 1 lenguaje emsamblador
@20496
M=-1
@24576
0;JMP
@105
RAM[20496]
M=0
0;JMP
@100
RAM[20496]
M=1

//Intento corregido
(INICIO)
@24576
D=M //Se lee el teclado

//Tecla d=100
@100
D=D-A //Se resta el valor de 100 
@MOVER_D
D;JEQ //Si D-100=0, la línea se mueve a la derecha

//Tecla i=105
@24576
D=M //Se lee nuevamente el teclado
@105
D=D-A //Se le resta 105
@MOVER_I
D;JEQ //Si D-105=0, la línea se mueve a la izquierda

@INICIO
0;JMP //Si no se cumplen ninguna de las dos opciones se regresa al inicio

(MOVER_D)
@20496
M=0
@20496
D=A+1 //Se calcula la nueva posición (derecha)
@20497
M=-1 //Se dibuja la línea a la derecha
@INICIO
0;JMP

(MOVER_I)
@20496
M=0
@20495
M=-1 //Se dibuja la línea a la izquierda
@INICIO
0;JMP

//Programa c#
int[] memoria = new int[32768]; //Es toda la memoria RAM 
int posicion = 20496; //La dirección donde se ubicará la línea

While(true)
{
    if(Console.KeyAvailable) //Se pregunta si hay una tecla presionada
    {
          var teclaPresionada = Console.ReadKey(true).Keychar;
          int valorTecla = (int)teclaPresionada;

          if(valorTecla == 100) //Si la tecla presionada es d
          {
            memoria[posicion] = 0;
            posicion = posicion + 1;
            memoria[posicion] = -1;
          }
          else if(valorTecla == 105) //Si la tecla presionada es i
          {
             memoria[posicion] = 0;
             posicion = posicion - 1;
             memoria[posicion] = -1;
          }
          
          Console.WriteLine("Tecla:" + teclaPresionada "| Nueva posicion:" + posicion);
    }
}



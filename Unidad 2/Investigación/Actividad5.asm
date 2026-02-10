//Convierte estos programas a ensamblador

int a = 10;
int* p;
p = &a;
*p = 20

//Guardar el valor de 10
@10
D=A 
@x
M=D
//Crear el puntero
@x
D=A 
@p
M=D
//Apuntar a donde apunta el puntero
@10
A=M
//El valor de x cambia usando el puntero
@10
D=A 
M=D

int a = 10;
int b = 5;
int *p;
p = &a;
b = p*

//Guardar el valor a
@10
D=A 
@a //Posición RAM
M=D 
//Guardar el valor de b
@5
D=A 
@b //Posición RAM
M=D 
//Crear puntero
@a 
D=A 
@p //Posición RAM
M=D 
//Desreferenciar el puntero
@p 
A=M
D=M
@b 
M=D 



int arr[] = {11,233,23,77,112,61,67,98,900,810};
int sum = 0;
for (int j = 0; j < 10; j++) 
    {    
	sum = sum + arr[j];
	}

//Implementa el programa anterior en lenguaje ensamblador aplicando el concepto de punteros.

//Guardar los valores 
@11
D=A
@16
M=D

@233
D=A
@17
M=D

@23
D=A
@18
M=D

@77
D=A
@19
M=D

@112
D=A
@20
M=D

@61
D=A
@21
M=D

@67
D=A
@22
M=D

@98
D=A
@23
M=D

@900
D=A
@24
M=D

@810
D=A
@25
M=D
//sum = 0
@26
M=0
//j = 0
@27
M=0
//p = 16
@16
D=A 
@28
M=D 
//Creación de LOOP
(LOOP)

//If j == 10 (END)
@27
D=M 
@10
D=D-A 
@END
D;JEQ
//D = *p
@28
A=M
D=M
// sum = sum + D
@26
D=D+M
M=D 
//p++
@28
M=M+1
//j++
@27
M=M+1
@LOOP
0;JMP
//END
(END)
@END
0;JMP

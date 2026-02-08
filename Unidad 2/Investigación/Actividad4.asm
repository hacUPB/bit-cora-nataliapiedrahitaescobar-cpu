//Ejercicio en clase 
//Adds 1+...+100. int i=1; int sum=0; (Programa en While)
 while(i <=100)
	 {
	 sum += i;
	 i++; 
	 }

// Adds1+...+100. (Ensamblador-Versión While)
@i // i refers to some memory location. 
M=1 // i=1 
@sum // sum refers to some memory location. 
M=0 // sum=0 
(LOOP) 
@i D=M // D=i 
@100 
D=D-A // D=i-100 
@END 
D;JGT // If(i-100)>0 goto END 
@i 
D=M // D=i 
@sum 
M=D+M // sum=sum+i 
@i 
M=M+1 // i=i+1 
@LOOP 
0;JMP // Goto LOOP 
(END) 
@END 
0;JMP // Infinite loop

//Convertir un ciclo While a un ciclo for
//Adds 1+...+100. (Programa en For)
int sum=0;
for(int i = 1; i <=100; i++)
{   
	sum+= i;
}

//Adds1+...+100 (Ensamblador-Versión For)
@i
M=1
@sum
M=0
(LOOP)
@i
D=M 
@100
D=D-A 
@END
D;JGT
@i
D=M 
@sum 
M=D+M 
@i
M=M+1
@LOOP
0;JMP
(END)
@END
0;JMP
//Son el mismo código
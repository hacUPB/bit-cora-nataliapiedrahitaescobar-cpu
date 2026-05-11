//Dibuje una línea horizontal negra de 16 pixeles de largo en la esquina superior izquierda de la pantalla.

//Programa ensamblador
@16384 //Dirección que controla los pixeles en pantalla
M=-1 //Se pintan los primeros 16 pixeles

//Programa c#
int[] memoria = new int [20000];

memoria[16384] = 1; //Se enciende el primer pixel
memoria[16385] = -1 //Se encienden los 16 pixeles.
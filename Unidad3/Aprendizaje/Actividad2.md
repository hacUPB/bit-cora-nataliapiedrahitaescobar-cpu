## **¿Qué sucede en paso por valor? (Predicción)** 
```
void modificarPorValor(int n) {    
	cout << "Dentro de modificarPorValor, valor inicial: " << n << endl;    
	n += 5;    
	cout << "Dentro de modificarPorValor, valor modificado: " << n << endl;
	}
```
n = a = 10
1. Se crea una copia del valor inicial de n y a este se le suma 5, lo cual da 15.
2. La variable 15 se guarda en otra memoria diferente porque es una copia y la variable inicial 10 queda igual al final (n=10).

```
void modificarPorReferencia(int &n) {    
	cout << "Dentro de modificarPorReferencia, valor inicial: " << n << endl;    
	n += 5;    
	cout << "Dentro de modificarPorReferencia, valor modificado: " << n << endl;
	}
```
n = b = 10
1. la función recibe la variable inicial n=10.
2. Se hacen los cambios a esta se le suma 5 n+5=15.
3. La variable incial es modificada y al final queda con el valor de 15 n=15.

```
void modificarPorPuntero(int* n) {
	cout << "Dentro de modificarPorPuntero, valor inicial: " << *n << endl;
	*n += 5;
	cout << "Dentro de modificarPorPuntero, valor modificado: " << *n << endl;
}
```
n = c = 10
1. Se recibe la variable inicial n=10.
2. Se crea un puntero * para poder acceder a la información de la variable inicial.
3. Se hace la suma de n+15.
4. El resultado final es n=15 porque se realizó la suma en el lugar donde se guardaba la información de la variable incial.
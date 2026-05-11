código
```
#include <iostream>
using namespace std;
class Punto {
		public:   int x;    
							int y;
    // Constructor    
    Punto(int _x, int _y) : x(_x), y(_y) {        
		    cout << "Constructor: Punto(" << x << ", " << y << ") creado." << endl;    
		    }
    // Destructor    
    ~Punto() {        
		    cout << "Destructor: Punto(" << x << ", " << y << ") destruido." << endl;    
		    }
    // Método para imprimir valores    
    void imprimir() {        
		    cout << "Punto(" << x << ", " << y << ")" << endl;    
		    }
		};
int main() {    
		// Coloca un breakpoint en la siguiente línea    
		Punto p(10, 20);
    // Muestra el contenido del objeto    
    p.imprimir();
    // Utiliza el depurador para inspeccionar 'p', observa la dirección de memoria y el valor de x e y.    
    return 0;
    }
```
**Valores en la memoria**
- En hexadecimal: 0a es 10 en decimal y 14 en hexadecimal es 20 en decimal.
- Se observa que los bytes de menor peso se almacena primero en la memoria.

**¿Cuál es la diferencia entre un constructor y un destructor en C++?**
- Un constructor es una función que se invoca cuando se crea un objeto. Su propósito principal es inicializar los datos del objeto creado.

- Un destructor se utiliza cuando un objeto sale deja de usarse en el programa y su principal objetivo es realizar la limpieza de la memoria necesaria para que no aparezcan futuros erros en el programa.

**¿Cuál es la diferencia entre un objeto y una clase en C++?**
La diferencia es que la clase es como una plantilla o molde que define el diseño de un objeto, es como la estructura que define los datos y comportamientos que los objetos creados a partir de ella van a tener, mientras que, un objeto es como un "miembro" o una "copia" que existe en la memoria en el momento de la ejecución del programa, con datos específicos asignados a sus atributos.

**¿Qué diferencia notas entre el objeto Punto en C++ y C#?**
En c++, la declaración de un punto crea un objeto de la clase punto en la memoria Stack. Esto hace que el objeto se almacene en el sistema, y luego será eliminado automáticamanete cuando salga de este.

En c# Se crea un objeto en el Heap y la variable es solo una referencia que apunta a la dirección de memoria del objeto.

**¿Qué es p en C++ y qué es p en C#?**
En c++ p es un objeto. Al ser creado en el Stack, se le asigna la memoria directamente para el objeto p.
En c# p es una referencia del objeto. No se almacena el objeto en sí, sino que tiene una dirección de memoria en el Heap donde se encuentra el objeto real.

**¿En qué parte de memoria se almacena p en C++ y en C#?**
En c++ el objeto se almacena en la memoria Stack que es donde sucede la creación y destrucción de objetos según la función donde se creó.
En c# la referencia dle objeto se almacena en el Stack pero el objeto real se almacena en el Heap. La referencia es el puntero que indica la dirección del objeto en el Heap.

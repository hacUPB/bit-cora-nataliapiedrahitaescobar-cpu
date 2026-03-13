Código
```
#include <iostream>
#include <string>
using namespace std;
class Punto {
		public:   string name;    
							int x;    
							int y;
    // Constructor    
    Punto(string _name, int _x, int _y) : name(_name),x(_x), y(_y) {        
		    cout << "Constructor: Punto "<< name <<" (" << x << ", " << y << ") creado." << endl;    
		    }
    // Destructor    
    ~Punto() {        
		    cout << "Destructor: Punto " << name << "(" << x << ", " << y << ") destruido." << endl;    
		    }
    // Método para imprimir valores    
    void imprimir() {        
		    cout << "Punto "<< name << "(" << x << ", " << y << ")" << endl;    
		    }
		};
		void cambiarNombre(Punto p, string nuevoNombre) {  
				p.name = nuevoNombre;
				}
int main() {    // Objeto original    
		Punto original("original",70, 80);    
		original.imprimir();    
		cambiarNombre(original, "cambiado");    
		original.imprimir();    
		return 0;
		}
```

**¿Qué ocurre después de llamar a la función cambiarNombre? ¿Por qué aparece el mensaje Destructor: Punto cambiado(70, 80) destruido.?**
Después de llamar a la función cambiarNombre, el objeto original no cambia de nombre porque lo que se envía a la función no es el objeto original sino una copia.
Dentro de la función se cambia el nombre, pero ese cambio solo afecta a la copia, no al objeto original que se encuentra en el main.

El mensaje Destructor: Punto cambiado (70,80) destruido aparece porque cuando la función termina, esa copia que se creó se elimina automáticamente.

**¿Por qué original sigue existiendo luego de llamar cambiarNombre?**
original sigue existiendo luego de llamar cambiarNombre porque no se modificó directamente sino que lo que envió para modificar fue una copia del objeto. La copia solo se utiliza dentro de la función.

**¿En qué parte del mapa de memoria se encuentra original y en qué parte se encuentra p? ¿Son el mismo objeto?**
El objeto original se encuentra en la memoria Stack porque fue creado directamente dentro de la función del main. (Variable local)
El parámetro p que se encuentra en la función cambiarNombre también se encuentra en la memoria Stack pero es una copia del objeto original, creada solo cuando se llame la función.

Código con modificación en main y cambiarNombre
```
#include <iostream>
#include <string>
using namespace std;

class Punto {
public:
    string name;
    int x;
    int y;

    // Constructor
    Punto(string _name, int _x, int _y) : name(_name), x(_x), y(_y) {
        cout << "Constructor: Punto " << name << " (" << x << ", " << y << ") creado." << endl;
    }

    // Destructor
    ~Punto() {
        cout << "Destructor: Punto " << name << "(" << x << ", " << y << ") destruido." << endl;
    }

    // Método para imprimir valores
    void imprimir() {
        cout << "Punto " << name << "(" << x << ", " << y << ")" << endl;
    }
};

// Función que recibe un puntero
void cambiarNombre(Punto* p, string nuevoNombre) {
    p->name = nuevoNombre;
}

int main() {
    // Objeto original en el Stack
    Punto original("original", 70, 80);
    original.imprimir();

    // Se pasa la dirección de memoria del objeto
    cambiarNombre(&original, "cambiado");

    original.imprimir();

    return 0;
}
```

**¿Qué ocurre ahora? ¿Por qué?**
El nombre original si cambia después de llamar la función porque ya no se está enviando una copia del objeto, sino su dirección de memoria con un puntero, lo que hace que la función modifique directamente el mismo objeto que está en el main.

**En este caso ¿Cuál es la diferencia entre pasar un objeto por valor, por referencia y por puntero?**
La diferencia se encuentra en si crea o no una copia del objeto y si se puede modificar el original.

- **Por valor:** 
Se crea una copia del objeto pero los cambios que se hagan dentro de la función solo van a cambiar a la copia y no al objeto original.

- **Por referencia:**
No se crea la copia sino que la función utiliza directamente el objeto original, lo que genera que cualquier cambio afecte al objeto original.

- **Por Puntero:**
No se crea una copia, sino que se envía la dirección de memoria del objeto y la función lo que hace es modificar usando esa dirección, por lo que los cambios también afectan al objeto original.
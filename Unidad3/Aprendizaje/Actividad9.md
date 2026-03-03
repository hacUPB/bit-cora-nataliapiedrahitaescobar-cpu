código
```
#include <iostream>
using namespace std;
class Contador {
		public:   int valor;    
							static int total;
    // Constructor    
    Contador(int v = 0) : valor(v) {        
		    total++;        
		    cout << "Contador creado. total de Contadores = " << total << endl;    
		    }
    // Destructor    
    ~Contador() {        
		    cout << "Contador destruido. valor = " << valor << endl;    
		    }
    // Método para incrementar el contador de instancia    
    void incrementar() {        
		    valor++;    
		    }
		};
// Definición e inicialización del miembro estático
int Contador::total = 0;
int main() {    
		// Crea varios objetos en el stack    
		Contador c1(5);    
		Contador c2(10);
    // Inspecciona con el depurador las direcciones de c1 y c2.    
    // Observa que 'total' es compartido entre todos los objetos.
    c1.incrementar();    
    c2.incrementar();
    cout << "c1.valor = " << c1.valor << endl;    cout << "c2.valor = " << c2.valor << endl;    
    cout << "Contador::total = " << Contador::total << endl;
    // Puedes también crear un objeto dinámico para comparar:    
    Contador* c3 = new Contador(15);    
    c3->incrementar();    
    cout << "c3->valor = " << c3->valor << endl;
    // Coloca breakpoints en la creación de cada objeto y en las llamadas a 'incrementar()'    
    // Observa cómo el miembro estático 'total' se comparte y no se almacena en el stack de cada objeto.
    delete c3;    
    return 0;
    }
```

**¿En dónde está almacenado el miembro valor y el miembro total de la clase Contador?**
El miembro valor está almacenado en cada miembro que se crea, c1, c2 y c3 tienen cada uno un valor propio cuando se crean. Si el objeto está en el Stack como c1, c2 y c3 entonces su valor también está en el stack. Si el objeto está en el Heap como c3 entonces el valor también estaría en el heap con ese objeto. 

El miembro total no pertenece a un objeto específico porque es static. Solo existe uno para toda la clase y es compartido por todos los objetos. Este se almacena en los datos globales o estáticos pero no en el stack ni dentro de los objetos. (Memoria estática del programa)

**¿Qué puedes concluir de los miembros estáticos y de instancia de una clase en C++? ¿Cómo se gestionan en memoria? ¿Qué ventajas y desventajas tienen? ¿Cuándo es útil utilizarlos?**
Los miembros de instancia como valor existen en cada objeto que se crea. Cada objeto cuenta con su propia copia y se guardan donde esté el objeto (Stack o Heap) lo que hace que cada objeto pueda tener valores diferentes.

La ventaja de los miembros de instancia es que son útiles cuando cada objeto por separado necesita tener su estado individual.

Los miembros estáticos (total), no pertenecen a un objeto en específico, sino que pertenecen a la clase. Solo existe una sola copia para todos los objetos del programa y se guarda en la memoria de datos estáticos.

La ventaja de los miembros estáticos es que permiten llevar información general de la clase a los objetos. Su desventaja es que, como todos los objetos lo compartes, un solo cambio afecta a todos.

**En el programa, en qué segmento de memoria se están almacenando c1, c2, c3 y Contador::total?**
- c1 y c2 se encuentran en la memoria Stack porque ambos objetos fueron creados dentro de la función Main. (Variables locales)
- Contador::Total se encuentra en la memoria de los datos estáticos/globales porque es un static y solo hay una copia del contador en todo el programa.
- c3 es un puntero que se considera como una variable local en el main, por lo que se encuentra en el stack
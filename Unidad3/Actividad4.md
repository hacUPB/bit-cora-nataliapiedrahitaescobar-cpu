
#include <iostream>
#include <cstdlib>
using namespace std;

int main() {    
		// Variable local (stack)    
		int a = 10;    
		int b = 20;
    /**********************************************************        
    EXPERIMENTO 1    
    ***********************************************************/
    void* ptr = reinterpret_cast<void*>(&main);    
    cout << "Voy a modificar la memoria en la dirección: " << ptr << endl;    
    *reinterpret_cast<int*>(ptr) = 0;
    /********************************************************/
    return 0;
    }


+--------------------------------+
|TEXT:                           |
|int main                        |
+--------------------------------+
|DATA:                           |
|No hay                          |
+--------------------------------+
|HEAP:                           |
|No hay                          |
+--------------------------------+
|STACK:                          |
|a = 10                          |
|b = 20                          |
|void* ptr                       |
|*reinterpret_cast<int*>(ptr) = 0|
|return 0                        |
+--------------------------------+
 ![alt text](image.png)

  **¿Qué pasa?**
  El error aparece porque el puntero void*ptr quiere modificar el segmento de código TEXT, que es donde se almacenan las intrucciones del programa. Como esta zona de memoria es solo de lectura, el sistema operativo impide que se haga alguna modificación y por eso se genera el error.
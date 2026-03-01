### *EXPERIMENTO 1**

#include <iostream>
#include <cstdlib>
using namespace std;

```
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
```


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
|return 0                        |
+--------------------------------+

 ![alt text](image.png)

  **¿Qué pasa?**
  El error aparece porque el puntero void*ptr quiere modificar el segmento de código TEXT, que es donde se almacenan las intrucciones del programa. Como esta zona de memoria es solo de lectura, el sistema operativo impide que se haga alguna modificación y por eso se genera el error.

  ### **EXPERIMENTO 2**

```
   #include <iostream>
#include <cstdlib>
using namespace std;
// Constante global
const char* const mensaje_ro = "Hola, memoria de solo lectura";

int main() {    
		// Variable local (stack)    
		int a = 10;    
		int b = 20;

    /**********************************************************        
    EXPERIMENTO 2    
    ***********************************************************/
    char* ptr = (char*)&mensaje_ro;    
    cout << "Voy a modificar la memoria en la dirección: " << ptr << endl;    
    *ptr = 0;
    /********************************************************/
    return 0;
    }
```

+--------------------------------+
|TEXT:                           |
|int main                        |
|"Hola, memoria  de solo lectura"|
+--------------------------------+
|DATA:                           |
|mensaje_ro                      |
+--------------------------------+
|HEAP:                           |
|No hay                          |
+--------------------------------+
|STACK:                          |
|a = 10                          |
|b = 20                          |
|ptr                             |
|return 0                        |
+--------------------------------+


![alt text](image-1.png)

### **¿Qué ocurre**
Aparece un error en la línea 17 (*ptr = 0) porque el puntero *ptr apunta a la variable global mensaje_ro que está ubicada en el DATA y al intentar modificar su contenido el programa genera un error porque se trata de la memoria que está solo en modo lectura.

### **EXPERIMENTO 3**

```
#include <iostream>
#include <cstdlib>
using namespace std;
// Variables globales
int global_inicializada = 42;
int global_no_inicializada;

int main() {    // Variable local (stack)    
		int a = 10;    
		int b = 20;
    /**********************************************************        
    EXPERIMENTO 3    
    ***********************************************************/
    cout << "global_inicializada: " << global_inicializada << endl;    
    cout << "global_no_inicializada: " << global_no_inicializada << endl;

    global_inicializada = 69;    
    global_no_inicializada = 666;
    cout << "global_inicializada: " << global_inicializada << endl;    
    cout << "global_no_inicializada: " << global_no_inicializada << endl;
    /********************************************************/
    return 0;
    }
```

+--------------------------------+
|TEXT:                           |
|int main                        |
+--------------------------------+
|DATA:                           |
|global_inicializada             |
|global_no_inicializada          |
+--------------------------------+
|HEAP:                           |
|No hay                          |
+--------------------------------+
|STACK:                          |
|a = 10                          |
|b = 20                          |
|return 0                        |
+--------------------------------+

![alt text](image-2.png)
Datos iniciales de las variables global_inicializada y global_no_inicializada:
![alt text](image-3.png)
Datod finales de las variables global_inicializada y global_no_inicializada:
![alt text](image-4.png)

### **¿Qué ocurre?**
En este experimento no aparece un error y el programa funciona correctamente porque las variables global_inicializada y global_no_inicializada hacen parte de la memoria DATA que puede ser modificada y también permiten la operación de lectura. Por eso en el código las variables pasan de ser 42 a 69 y 0 a 666 sin ningún tipo de error.

### **EXPERIMENTO 4**

```
#include <iostream>
#include <cstdlib>
using namespace std;
// Función de ejemplo que muestra la dirección de su variable local estática
void funcionConStatic() {    
		static int var_estatica = 100;    
		cout << "Dirección de var_estatica (static): " << &var_estatica << endl;
}

int main() {    // Variable local (stack)    
		int a = 10;    
		int b = 20;
    /**********************************************************        
    EXPERIMENTO 4    
    ***********************************************************/
    var_estatica = 42;
    cout << "var_estatica: " << var_estatica << endl;
    /********************************************************/    
    return 0;
    }
```
### **¿Qué ocurre y por qué?**


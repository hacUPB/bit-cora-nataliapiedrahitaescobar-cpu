1. Abstracción: Mirar el programa y dividirlo en clases y objetos.
2. Mirar si los objetos son públicos, privados o protegido
¿Qué es el encapsulamiento?---Seguridad en el acceso de datos en un objeto. Se inicializa con el constructor. Se debe hacer con métodos de la misma clase.
Cómo acceder a objetos en un encapsulamiento:
get: Obtener el objeto y set: Editar el objeto.

Objeto: Conjunto de datos que están en la RAM, que pueden ser editados por los métodos que hacen parte de la clase.
Tiene sus propios valores para los atributos y puede usar los métodos de la clase.
Clase:Perro, Objeto:MiPerro.

Herencia: La clase tiene los mismos atributos y métodos de una clase padre.
ejm: Aldeanos, magos, guerreros---Todos hacen parte de clase aldeanos.

¿Qué es el polimorfismo?
Establece relaciones entre objetos de distintas clases.

Atributos: Es una variable que guarda información sobre un objeto.
La clase Perro tiene como atributos:
- Nombre
- Edad
- Color
- Raza

Son datos que describen el objeto.

Métodos: Función que define lo que un objeto puede hacer, sus acciones o comportamientos.
La clase perro tiene como métodos:
- Ladrar()
- Correr()
- Comer()

En el ejercicio 1, Nombre es public para permitir que otras clases puedan leer o modificar el valor de forma controlada por medio de get, set.

ForEach: Es un ciclo que recorre todos los elementos de una colección uno por uno. Sirve cuando se quieren recorrer elementos.

ofApp.h = Donde va la lista de funciones y variables, se declaran qué cosas va a tener y hacer la app.

ofApp.cpp = Es donde se escribe el comportamiento de la aplicación en OpenFrameworks, donde todo funciona y se dice qué hace el código.
- Es donde se escribe la lógica real del programa.
- Controla lo que pasa en pantalla.
- Hacer las interacciones (Teclaso, mouse, etc).
### **1. Encapsulamiento:**
**- Señala una línea de código que sea un ejemplo claro de encapsulamiento y explica por qué lo es.**

```
private string nombre;
public string Nombre
{
    get { return nombre; }
    protected set { nombre = value; }
}
```

Es un ejemplo de encapsulamiento porque la variable nombre está declarada como private, lo que significa que no se puede acceder directamente a esta desde afuera de la clase.
Para acceder a ella se utiliza la propiedad Nombre que tiene un get para leer su valor y un set protegido para poderlo editar. Así se puede controlar quien accede y modifica la variable.

**- ¿Por qué crees que el campo nombre es private pero la propiedad Nombre es public? ¿Qué problema se evita con esto?**

Creo que nombre es private para que no se pueda acceder ni modificar de forma directa partes del programa.

### **Herencia:**
**¿Cómo se evidencia la herencia en la clase Circulo?**

La clase círculo hereda de la clase figura y se evidencia en el código utilizando ":" que explica que una clase deriva de otra

```
public class Circulo : Figura
```

Esta parte del código quiere decir que el círculo puede usar los atributos y métodos que están definifidos en la clase figura.

**Un objeto de tipo Circulo, además de Radio, ¿Qué otros datos almacena en su interior gracias a la herencia?**

Almacena además del Radio, el nombre que hereda de la clase figura, lo que permite que el código pueda identificar como a una figura la clase círculo y tanbién hereda el método Dibujar().

### **Polimorfismo:**
**Observa el bucle foreach. La variable fig es de tipo Figura, pero a veces contiene un Circulo y otras un Rectangulo. Cuando se llama a fig.Dibujar(), el programa ejecuta la versión correcta. En tu opinión, ¿Cómo crees que funciona esto “por debajo”? No necesitas saber la respuesta correcta, solo quiero que intentes razonar cómo podría ser.**

El foreach se encarga de recorrer todas las figuras de la lista para dibujarlas, aunque fig es de tipo figura, puede ser un círculo o un rectángulo. Creo que el programa detecta "por debajo" qué tipo de objeto es realmente (círculo o rectángulo) y ejecuta el método de dibujar() correcto gracias al polimorfismo.
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

La clase círculo hereda de la clase figura y se evidencia en el código utilizando ":"

```
public class Circulo : Figura
```
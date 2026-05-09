### **¿Cuáles son los tres pasos claves del pipeline de OpenGL? Explica en tus propias palabras cuál es el objetivo de cada paso.**

**1. Vertex Shader:** Es donde se procesan los vértices de los objetos. Aquí es donde se calcula donde debe aparecer cada vértice en pantalla y donde se pueden modificar los atributos de los colores y texturas.

**2. Rasterización:** Toma las figuras formadas por los vértices, que en el ejemplo del video muestra que son triángulos y los convierte en pixeles que pueden dibujarse en pantalla, teniendo en cuenta la distancia en la que se encuentra el objeto usando coordenadas en el eje z.

**3. Fragment Shader:** Es donde se define el color final que tendrá cada pixel teniendo en cuenta la iluminación, sombras, texturas y colores que se necesitan para lograr que el objeto se vea real en el renderizado.

### **2. La gran novedad que introduce OpenGL moderno es el pipeline programable. ¿Qué significa esto? ¿Qué diferencia hay entre el pipeline fijo y el programable? ¿Qué ventajas le ves a esto? y si el pipeline es programable, ¿Qué tengo que programar?**

La novedad que tiene el pipeline programable de OpenGL es que es programable, o sea que el programador tiene la oportunidad de editar un gráfico usando shaders. Esto no se podía hacer en el pipeline fijo porque ya tenía variables fijas como la iluminación o los colores y no se podían cambiar.

La ventaja del pipeline programable puede hacer gráficos más avanzados y realistas, además de tener mayor control sobre cómo se dibuja todo.

### **3. Si fueras a describir el proceso de rasterización ¿Qué dirías?**

La rasterización es un proceso donde se toman las figuras formadas con los vértices y las convierte en fragmentos de pixeles que se van a ver en pantalla. Aquí es donde se calcula qué parte de la pantalla va a ocupar la figura para después darle color con los shaders.

### **4.¿Qué son los fragmentos? ¿Es lo mismo un fragmento que un pixel? ¿Por qué?**

Los fragmentos son como una especie de área de la pantalla que se seleccionan para ser pintados de ciertoa colores, pero no son un pixel, porque, los pixeles son las partes del fragmento que son seleccionadas para verse en el framebuffer.

**Fragmento:** Dato temporal que todavía está siendo procesado.

**Pixel:** Resultado final que aparece en pantalla.

### **5. Explica qué problema resuelve el Z-buffer y ¿Qué es el depth test?**

El Z-buffer es el encargado de mostrar que objetos van por delante o atrás de otros según la perspectiva en la que se encuentre la cámara.

El depth test es una prueba de OpenGL donde cada vez que llega un nuevo fragmento, OpenGL compara la profunidad de ese fragmento con la profundidad estándar que ya está guardada en el Z-buffer para saber si el fragmento se dibuja o se descarta. 

### **6. ¿Por qué se presenta el problema de la aliasing? ¿Qué es el anti-aliasing?**

El problema de aliasing se presenta porque los pixeles de las pantallas son cuadrados, lo que afecta a OpenGL cuando intenta dibujar diagonales o bordes curvos porque, con los pixeles cuadrados, los bordes podrían verse dentados en vez de suaves.

El anti-aliasing es una técnica que intenta suavizar los bordes de los pixeles cuadrados para que la imagen se vea más natural.

### **7. ¿Qué relación hay entre la iluminación y el fragment shader? Siempre es necesario tener en cuenta la iluminación en un fragment shader? o puedo hacer un fragment shader sin iluminación? Explica que implicaciones tiene esto.**

El fragment shader es el encargado de pintar lo que aparece en pantalla y la relación con la iluminación es que, la iluminación es una de las cosas que el  shader puede tener en cuenta al momento de decidir cómo se verá el objeto.

Un fragment shader si puede utilizarse sin iluminación pero el resultado se vería más plano y menos realista, ya que la iluminación ayuda a dar una sensación de volumen a los objetos.

### **8. ¿Qué implica para la GPU que una aplicación tenga múltiples fuentes de iluminación?**

Al tener varias fuentes de iluminación, la GPU debe hacer más cálculos (cos) para decidir cómo la iluminación afecta al objeto dependiendo en dónde esté ubicado.

Con la mayor cantidad de luces que haya en una escena, más trabajo debe hacer la GPU para saber donde colocar brillos, sombras y colores.


### **¿Qué espero ver en la memoria?**
Creo que va a mostrar el preceso interno del espacio de memoria donde se encuentra ofApp, o sea, cuando se crea la partícula, ver sus movimientos, posición, velocidad y la forma en la que explotan.

**Código**
```
class ofApp : public ofBaseApp {
		public:    
				void setup();    
				void update();    
				void draw();    
				void mousePressed(int x, int y, int button);    
				void keyPressed(int key);
		    std::vector<Particle*> particles;    
		    ~ofApp();
		private:    
				void createRisingParticle();
};
```



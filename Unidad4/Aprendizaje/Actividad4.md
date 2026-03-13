### **CÓDIGO MAIN.CPP**
```
#include "ofMain.h"
#include "ofApp.h"

//========================================================================
int main( ){

	//Use ofGLFWWindowSettings for more options like multi-monitor fullscreen
	ofGLWindowSettings settings;
	settings.setSize(1024, 768);
	settings.windowMode = OF_WINDOW; //can also be OF_FULLSCREEN

	auto window = ofCreateWindow(settings);

	ofRunApp(window, std::make_shared<ofApp>());
	ofRunMainLoop();

}
```

### **CÓDIGO OFAPP.CPP**
```
#include "ofApp.h"
//--------------------------------------------------------------
void ofApp::setup() {
	ofBackground(0);
}
//--------------------------------------------------------------
void ofApp::update() {
	backgroundHue += 0.2;
	if (backgroundHue > 255) {
		backgroundHue = 0;
	}

	if (ofGetMousePressed()) {
		float x = ofGetMouseX();
		float y = ofGetMouseY();

		float radius = ofRandom(5, 20);

		ofColor color;
		color.setHsb(ofRandom(255), 200, 255);

		float opacity = 200;

		strokes.enqueue(x, y, radius, color, opacity);
	}
	// TODO: agregar un nuevo trazo si el mouse está presionado.
	// Usa strokes.enqueue(x, y, radius, color, opacity);
}
//--------------------------------------------------------------
void ofApp::draw() {
	// Fondo con gradiente dinámico
	ofColor color1, color2;
	color1.setHsb(backgroundHue, 150, 240);
	color2.setHsb(fmod(backgroundHue + 128, 255), 150, 240);
	ofBackgroundGradient(color1, color2, OF_GRADIENT_LINEAR);

	Node * actual = strokes.front;
	while (actual != nullptr) {
		ofSetColor(actual->color, actual->opacity);
		ofDrawCircle(actual->x, actual->y, actual->radius);

		actual = actual->next;
	}
	// TODO: dibujar los trazos almacenados en la cola.
	// Recorre los nodos desde strokes.front hasta nullptr y usa ofDrawCircle().
}
//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
	if (key == 'c') {
		// TODO: limpiar la cola de trazos.
		strokes.clear();
	}
	if (key == 'a') {
		// TODO: alternar entre 50 y 100 trazos.
		if (strokes.maxSize == 50) {
			strokes.maxSize = 100;
		} else {
			strokes.maxSize = 50;
		}
			
	} else if (key == 's') {
		// TODO: guardar el frame actual.
		ofSaveScreen("image.png");
	}
}
```

### **OFAPP.H**
```
#include "ofApp.h"
//--------------------------------------------------------------
void ofApp::setup() {
	ofBackground(0);
}
//--------------------------------------------------------------
void ofApp::update() {
	backgroundHue += 0.2;
	if (backgroundHue > 255) {
		backgroundHue = 0;
	}

	if (ofGetMousePressed()) {
		float x = ofGetMouseX();
		float y = ofGetMouseY();

		float radius = ofRandom(5, 20);

		ofColor color;
		color.setHsb(ofRandom(255), 200, 255);

		float opacity = 200;

		strokes.enqueue(x, y, radius, color, opacity);
	}
	// TODO: agregar un nuevo trazo si el mouse está presionado.
	// Usa strokes.enqueue(x, y, radius, color, opacity);
}
//--------------------------------------------------------------
void ofApp::draw() {
	// Fondo con gradiente dinámico
	ofColor color1, color2;
	color1.setHsb(backgroundHue, 150, 240);
	color2.setHsb(fmod(backgroundHue + 128, 255), 150, 240);
	ofBackgroundGradient(color1, color2, OF_GRADIENT_LINEAR);

	Node * actual = strokes.front;
	while (actual != nullptr) {
		ofSetColor(actual->color, actual->opacity);
		ofDrawCircle(actual->x, actual->y, actual->radius);

		actual = actual->next;
	}
	// TODO: dibujar los trazos almacenados en la cola.
	// Recorre los nodos desde strokes.front hasta nullptr y usa ofDrawCircle().
}
//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
	if (key == 'c') {
		// TODO: limpiar la cola de trazos.
		strokes.clear();
	}
	if (key == 'a') {
		// TODO: alternar entre 50 y 100 trazos.
		if (strokes.maxSize == 50) {
			strokes.maxSize = 100;
		} else {
			strokes.maxSize = 50;
		}
			
	} else if (key == 's') {
		// TODO: guardar el frame actual.
		ofSaveScreen("image.png");
	}
}
```
### **Video Evidencia**

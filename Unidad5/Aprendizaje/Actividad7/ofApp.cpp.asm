#include "ofApp.h"
// --------------------------------------------------------------
void ofApp::setup() {
	ofSetFrameRate(60);
	ofBackground(0);
}
// --------------------------------------------------------------
void ofApp::update() {
	float dt = ofGetLastFrameTime();
	// Actualiza todas las partículas
	for (int i = 0; i < particles.size(); i++) {
		particles[i]->update(dt);
	}
	// Procesa las partículas (iteración en reversa para facilitar eliminación)
	for (int i = particles.size() - 1; i >= 0; i--) {
		// Si la partícula debe explotar, generamos nuevas explosiones
		if (particles[i]->shouldExplode()) {
			int explosionType = (int)ofRandom(4);
			// 0: Circular, 1: Random, 2: Star
			int numParticles = (int)ofRandom(20, 30);
			for (int j = 0; j < numParticles; j++) {
				if (explosionType == 0) {
					particles.push_back(new CircularExplosion(particles[i]->getPosition(), particles[i]->getColor()));
				}
				else if (explosionType == 1) {
					particles.push_back(new RandomExplosion(particles[i]->getPosition(), particles[i]->getColor()));
				}
				else if (explosionType == 2) {
					particles.push_back(new StarExplosion(particles[i]->getPosition(), particles[i]->getColor()));
				}
				else if (explosionType == 3) {
					particles.push_back(new SpiralExplosion(particles[i]->getPosition(), particles[i]->getColor()));
 				}
			}
				
				
				
					
				
			delete particles[i];
			particles.erase(particles.begin() + i);
		} else if (particles[i]->isDead()) {
			delete particles[i];
			particles.erase(particles.begin() + i);
		}
	}
}
// --------------------------------------------------------------
void ofApp::draw() {
	for (int i = 0; i < particles.size(); i++) {
		particles[i]->draw();
	}
}
// --------------------------------------------------------------
void ofApp::createRisingParticle() {
	// Genera una RisingParticle cerca del centro inferior (con variación horizontal)
	float minX = ofGetWidth() * 0.35;
	float maxX = ofGetWidth() * 0.65;
	float spawnX = ofRandom(minX, maxX);
	glm::vec2 pos(spawnX, ofGetHeight());
	// La partícula apunta hacia un objetivo en la parte superior central
	glm::vec2 target(ofGetWidth() / 2 + ofRandom(-300, 300), ofGetHeight() * 0.10 + ofRandom(-30, 30));
	glm::vec2 direction = glm::normalize(target - pos);
	// Velocidad ajustada para recorrer una mayor distancia
	glm::vec2 vel = direction * ofRandom(250, 350);
	ofColor col;
	col.setHsb(ofRandom(255), 220, 255);
	float lifetime = ofRandom(1.5, 3.5);
	// Tiempo de vida antes de explotar
	int type = (int)ofRandom(3);
		if (type == 0) {
		particles.push_back(new RisingParticle(pos, vel, col, lifetime));
		}
		else if (type == 1) {
			particles.push_back(new PulsingParticle(pos, vel, col, lifetime));
		}
		else if (type == 2) {
			particles.push_back(new ZigZagParticle(pos, vel, col, lifetime));
		}


}
//---------------------------------------------------------------

// --------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {
	createRisingParticle();
}
// --------------------------------------------------------------
void ofApp::keyPressed(int key) {
	if (key == ' ') {
		for (int i = 0; i < 1000; i++) {
			createRisingParticle();
		}
	}
	if (key == 's') {
		ofSaveScreen("screenshot_" + ofToString(ofGetFrameNum()) + ".png");
	}
}
// --------------------------------------------------------------
ofApp::~ofApp() {
	for (int i = 0; i < particles.size(); i++) {
		delete particles[i];
	}
	particles.clear();
}

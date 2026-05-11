//Código de la clase SpiralExplosion en ofApp.h:
class SpiralExplosion : public ExplosionParticle {
public:
	SpiralExplosion(const glm::vec2 pos, const ofColor & col)
		: ExplosionParticle(pos, glm::vec2(0, 0), col, 1.5f, ofRandom(10, 15)) {

		float angle = ofRandom(0, TWO_PI);
		float speed = ofRandom(50, 150);

		//Movimiento en espiral
		velocity = glm::vec2(cos(angle), sin(angle)) * speed;
	}

	void update(float dt) override {
		age += dt;

		//Movimiento base
		position += velocity * dt;

		//Giro en espiral
		float rotation = age * 5;
		velocity.x = cos(rotation) * 100;
		velocity.y = sin(rotation) * 100;

		float alpha = ofMap(age, 0, lifetime, 255, 0, true);
		color.a = alpha;
	}

	void draw() override {
		ofSetColor(color);
		ofDrawCircle(position, size);
	}
};

//SpiralExplosion en Update del ofApp.cpp:
	for (int i = particles.size() - 1; i >= 0; i--) {
		// Si la partícula debe explotar, generamos nuevas explosiones
		if (particles[i]->shouldExplode()) {
			int explosionType = (int)ofRandom(6);
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
				else if (explosionType == 3){
					particles.push_back(new FallingParticle(particles[i]->getPosition(), glm::vec2(0, 0), particles[i]->getColor(), 2.0));
				}
				else if (explosionType == 4) {
					particles.push_back(new ZigZagParticle(particles[i]->getPosition(), glm::vec2(0, 0), particles[i]->getColor(), 2.0));
				}
				else if (explosionType == 5) {
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
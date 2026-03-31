//Código de la clase ZigZagParticle en ofApp.h:
class ZigZagParticle : public Particle {
protected:
	glm::vec2 position;
	glm::vec2 velocity;
	ofColor color;
	float lifetime;
	// tiempo máximo antes de explotar
	float age;
	bool exploded;

	public:
	ZigZagParticle(const glm::vec2& pos, const glm::vec2& vel, const ofColor& col, float life)
			: position(pos)
			, velocity(vel)
			, color(col)
			, lifetime(life)
			, age(0) {}

	void update(float dt) override {
		age += dt;

	//Movimiento en ZigZag
		position.x += sin(ofGetElapsedTimef() * 10) * 100 * dt;
		position.y += 100 * dt;
	}

	void draw() override {
		ofSetColor(color);
		ofDrawCircle(position, 3);
	}

	bool isDead() const override {
		return age > lifetime;
	}

	glm::vec2 getPosition() const override {
		return position;
	}

	ofColor getColor() const override {
		return color;
	}
};

//ZigZagParticle en Update del ofApp.cpp:
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
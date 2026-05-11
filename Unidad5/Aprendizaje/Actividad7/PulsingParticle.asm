//ofApp.h
class PulsingParticle : public Particle {
protected:
	glm::vec2 position;
	glm::vec2 velocity;
	ofColor color;
	float lifetime;
	float age;

public:
	PulsingParticle(const glm::vec2 & pos, const glm::vec2 & vel, const ofColor & col, float life)
		: position(pos)
		, velocity(vel)
		, color(col)
		, lifetime(life)
		, age(0) { }

	void update(float dt) override {
		position += velocity * dt;
		age += dt;
	}

	void draw() override {
		float size = 5 + sin(age * 10) * 3; // tamaño cambia
		ofSetColor(color);
		ofDrawCircle(position, size);
	}

	bool isDead() const override {
		return false;
	}

	bool shouldExplode() const override {
		return age >= lifetime;
	}

	glm::vec2 getPosition() const override { return position; }
	ofColor getColor() const override { return color; }
};
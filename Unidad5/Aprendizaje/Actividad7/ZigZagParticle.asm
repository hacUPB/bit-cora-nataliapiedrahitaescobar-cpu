//ofApp.h
class ZigZagParticle : public Particle {
protected:
	glm::vec2 position;
	glm::vec2 velocity;
	ofColor color;
	float lifetime;
	float age;

public:
	ZigZagParticle(const glm::vec2 & pos, const glm::vec2 & vel, const ofColor & col, float life)
		: position(pos)
		, velocity(vel)
		, color(col)
		, lifetime(life)
		, age(0) { }

	void update(float dt) override {
		age += dt;

		// Movimiento base (sube)
		position += velocity * dt;

		// ZigZag FUERTE (horizontal)
		position.x += sin(age * 10) * 100 * dt;
	}

	void draw() override {
		ofSetColor(color);
		ofDrawCircle(position, 6);
	}

	bool isDead() const override {
		return false;
	}

	bool shouldExplode() const override {
		return age >= lifetime;
	}

	glm::vec2 getPosition() const override { return position; }
	ofColor getColor() const override { return color; }
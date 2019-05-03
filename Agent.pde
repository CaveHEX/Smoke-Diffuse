class Agent {

  PVector pos, startPos;
  float heading = random(TWO_PI);
  float startHeading = heading;
  float step = random(1.0, 2.5);
  float stepNext = step;

  color col;

  Agent() {
    this.pos = new PVector(random(width), random(height));
    this.build();
  }

  Agent(PVector pos, float heading) {
    this.pos = pos.copy();
    this.startPos = pos.copy();
    this.heading = heading;
    this.startHeading = heading;

    if ( pos.x > width / 2 ) {
      if ( pos.y > height / 2 ) {
        col = color(255);
      } else {
        col = color(0, 255, 0);
      }
    } else {
      if ( pos.y > height / 2 ) {
        col = color(255, 0, 0);
      } else {
        col = color(255, 0, 255);
      }
    }
  }

  Agent(PVector pos, float heading, color col) {
    this.pos = pos.copy();
    this.startPos = pos.copy();
    this.heading = heading;
    this.startHeading = heading;
    this.col = col;
  }

  void build() {
  }

  void update() {
    callSensors(this);
    pos.add(new PVector(cos(heading), sin(heading)).mult(stepNext));


    if ( this.outOfBound() ) {
      pos = startPos.copy();
      heading = startHeading;
    }
  }

  void render() {
    // -4- Deposit
    stroke(col);
    vertex(pos.x, pos.y);
  }

  boolean outOfBound() {
    return (
      pos.x < 0 ||
      pos.x > width ||
      pos.y < 0 ||
      pos.y > height
      );
  }
}

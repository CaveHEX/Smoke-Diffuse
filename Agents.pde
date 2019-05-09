class Agents {

  ArrayList<Agent> agents;

  Agents() {
    this.build();
  }

  void build() {
    agents = new ArrayList<Agent>();

    int steps = 50000;
    float step = TWO_PI / steps;
    float rad = 300;
    float amp = PI/8;

    for ( float i = 0; i <= steps; ++i ) {
      float a = step * i;
      agents.add(new Agent(
        new PVector(cos(a), sin(a)).mult(rad).add(center).add(PVector.random2D().mult(20)), 
        a + PI/2 + PI/8 + random(-amp, amp),
        //pal.col((sin(a)+1)*0.5)
        color(255)
        ));
    }
  }

  void update() {
    for ( Agent a : agents ) {
      a.update();
    }
  }

  void render() {
    beginShape(POINTS);
    stroke(255);
    strokeWeight(1.0);
    for ( Agent a : agents ) {
      a.render();
    }
    endShape();
  }

  void run() {
    this.update();
    this.render();
  }
}

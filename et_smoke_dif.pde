import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

PostFX fx;
Palette pal;

PVector center;
Agents agents;

void setup() {
  size(1280, 720, P3D);
  frameRate(60);
  smooth(8);
  background(0);

  center = new PVector(width/2, height/2);
  fx = new PostFX(this);
  pal = new Palette("palette_boreal");

  agents = new Agents();

  background(0);
}

void draw() {
  agents.run();

  float ratio = 0.5;
  float intensity = 10;

  // -5- diffuse
  fx.render()
    .blur(
    round(map(ratio, 0, 1, 0, intensity)), 
    map(ratio, 1, 0, 0, intensity)
    )
    .compose();

  // -6- Decay
  noStroke();
  fill(0, 15);
  rect(0, 0, width, height);

  record();
}

void keyPressed() {
  if ( key == 's' ) {
    screenshot();
  }

  if ( key == 'r' ) {
    recording = true;
  }
}

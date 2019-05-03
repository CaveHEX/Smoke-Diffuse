float turnAngle = PI/8;

void callSensors(Agent a) {
  // -1- Sense
  
  ruleC(a);
}

int sense(Agent a, float len, float angle) {
  // 0 : Dark
  // 1 : Dim
  // 2 : Bright

  float ang = angle + a.heading;

  PVector target = new PVector(
    cos(ang)*len, 
    sin(ang)*len
    ).add(a.pos);

  //float b = red(panTrail.get(floor(target.x), floor(target.y)));
  color c = get(floor(target.x), floor(target.y));
  float b = max(red(c), max(green(c), blue(c)));

  if ( b > (255/3 * 2) ) {
    return 2;
  } else if ( b > (255/3) ) {
    return 1;
  } else {
    return 0;
  }
}

boolean one_or_two(int v) {
  return (v == 1 || v == 2);
}

void ruleA(Agent a ) {
  int[] res = new int[3];

  float angleSplit = PI/8;
  float len = 50;

  res[0] = sense(a, len, -angleSplit);
  res[1] = sense(a, len, 0);
  res[2] = sense(a, len, angleSplit);

  //println(res[0], res[1], res[2]);

  a.stepNext = a.step;

  //if ( res[0] == 0 && one_or_two(res[1]) && res[2] == 0 ) {
  //  // No Change
  //  return;
  //}

  if ( one_or_two(res[0]) && res[1] == 0 && one_or_two(res[2]) ) {
    // Turn randomly
    a.heading += random(1) > 0.5 ? turnAngle : -turnAngle;
    return;
  }

  if ( res[0] == 2 && res[1] == 1 && res[2] == 0 ) {
    // Turn Left
    a.heading += -turnAngle;
    return;
  }

  if ( res[0] == 0 && res[1] == 1 && res[2] == 2 ) {
    // Turn Right
    a.heading += turnAngle;
    return;
  }

  //a.stepNext = a.step * 1.5;
  a.heading += 0.02; // 0.005
}

void ruleB(Agent a) {
  int[] res = new int[2];

  float angleSplit = PI/8;
  float len = 50;

  res[0] = sense(a, len, -angleSplit);
  res[1] = sense(a, len, angleSplit);

  a.stepNext = a.step;

  if ( one_or_two(res[0]) && one_or_two(res[1]) ) {
    // Turn randomly
    a.heading += (random(1) > 0.5 ? turnAngle : -turnAngle) * 0.3;
    return;
  }

  if ( res[0] == 2 && res[1] == 0 ) {
    // Turn Left
    a.heading += -turnAngle;
    return;
  }

  if ( res[0] == 0 && res[1] == 2 ) {
    // Turn Right
    a.heading += turnAngle;
    return;
  }

  //a.stepNext = a.step * 1.5;
  a.heading += 0.005; // 0.005
}

void ruleC(Agent a ) {
  int[] res = new int[3];

  float angleSplit = PI/8;
  float len = 50;

  res[0] = sense(a, len, -angleSplit);
  res[1] = sense(a, len, 0);
  res[2] = sense(a, len, angleSplit);

  //println(res[0], res[1], res[2]);

  a.stepNext = a.step;

  //if ( res[0] == 0 && one_or_two(res[1]) && res[2] == 0 ) {
  //  // No Change
  //  return;
  //}

  if ( one_or_two(res[0]) && res[1] == 0 && one_or_two(res[2]) ) {
    // Turn randomly
    a.heading += random(1) > 0.5 ? turnAngle : -turnAngle;
    return;
  }

  if ( one_or_two(res[0]) && res[2] == 0 ) {
    // Turn Left
    a.heading += -turnAngle;
    return;
  }

  if ( res[0] == 0 && one_or_two(res[2]) ) {
    // Turn Right
    a.heading += turnAngle;
    return;
  }

  //a.stepNext = a.step * 1.5;
  a.heading += 0.005; // 0.005
}

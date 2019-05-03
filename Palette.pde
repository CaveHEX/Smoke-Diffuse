class ColorEx {

  float amp = 255;    // Amplitude (ref 0) [0, 255];
  float offset = 0.0; // offset [0.0;TWO_PI]
  float ex = 1.0;     // ]-inf;+inf[ - [-10.0;+10.0] recommended

  ColorEx() {
  }

  ColorEx(float amp, float offset, float ex) {
    this.amp = amp;
    this.offset = offset;
    this.ex = ex;
  }

  float v(float v) {
    return map(cos(offset + v * ex), -1, 1, 0, amp);
  }

  ColorEx copy() {
    return new ColorEx(amp, offset, ex);
  }
}

class Palette {

  ColorEx r = new ColorEx();
  ColorEx g = new ColorEx();
  ColorEx b = new ColorEx();

  String extension = ".plt";
  String repertory = "data/palette/";

  Palette() {
  }

  Palette(String name) {
    this.loadPalette(name);
  }

  color col(float v) {    // v [0.0;1.0]
    return color(r.v(v), g.v(v), b.v(v));
  }

  void savePalette(String fileName) {
    String[] data = new String[9];
    data[0] = str(r.amp);
    data[1] = str(r.offset);
    data[2] = str(r.ex);

    data[3] = str(g.amp);
    data[4] = str(g.offset);
    data[5] = str(g.ex);

    data[6] = str(b.amp);
    data[7] = str(b.offset);
    data[8] = str(b.ex);

    String path = "data/palette/" + fileName + ".plt";

    saveStrings(path, data);
  }

  void loadPalette(String fileName) {
    String[] data = loadStrings("data/palette/" + fileName + ".plt");
    r.amp    = float(data[0]);
    r.offset = float(data[1]);
    r.ex     = float(data[2]);

    g.amp    = float(data[3]);
    g.offset = float(data[4]);
    g.ex     = float(data[5]);

    b.amp    = float(data[6]);
    b.offset = float(data[7]);
    b.ex     = float(data[8]);
  }

  String formatPath(String fileName) {
    return repertory + fileName + extension;
  }

  void generateRandom() {
    r.amp     = random(150, 255);
    r.offset  = random(TWO_PI * 2);
    r.ex      = random(0.01, 10.0);

    g.amp     = random(150, 255);
    g.offset  = random(TWO_PI * 2);
    g.ex      = random(0.01, 10.0);

    b.amp     = random(150, 255);
    b.offset  = random(TWO_PI * 2);
    b.ex      = random(0.01, 10.0);
  }

  void blackAndWhite() {
    r.amp     = 255;
    r.offset  = 0;
    r.ex      = 3.5;

    g = r.copy();
    b = r.copy();
  }
}

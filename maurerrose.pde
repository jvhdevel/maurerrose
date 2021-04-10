// https://en.wikipedia.org/wiki/Maurer_rose
int n = 4;
int d = 97;
int size = 200;
int n_points = 360;

Scrollbar scroll_n;
Scrollbar scroll_d;

void setup() {
  scroll_n = new Scrollbar(10, 30, 1, 10, "n", n, 100);
  scroll_n.is_int = true;
  scroll_d = new Scrollbar(10, 70, 1, 100, "d", d, 400);
  scroll_d.is_int = true;

  size(480, 680);
};

void draw() {
  background(0);

  scroll_n.update();
  scroll_n.display();
  scroll_d.update();
  scroll_d.display();

  // Set Origin to centre and flip y-axis
  scale(1, -1);
  translate(width / 2, -height / 2);

  // Draw Mesh
  noFill();
  stroke(100, 100, 100);
  strokeWeight(0.1);
  beginShape();
  for (float theta = 0; theta <= 360; theta += (360.0 / n_points)) {
    float k = theta * scroll_d.value * PI / 180;
    float r = size * sin(scroll_n.value * k);
    float x = r * cos(k);
    float y = r * sin(k);
    vertex(x, y);
  }
  endShape();

  // Draw Outline
  // noFill();
  // stroke(200, 200, 200);
  // strokeWeight(1);
  // beginShape();
  // for (float theta = 0; theta <= 360; theta += 0.1) {
  //   float k = theta * PI / 180;
  //   float r = size * sin(scroll_n.value * k);
  //   float x = r * cos(k);
  //   float y = r * sin(k);
  //   vertex(x, y);
  // }
  // endShape();
};

void setup() {
  size(8000, 10000);
  PImage img = loadImage("img.png");
  img.resize(width, height);
  noStroke();
 float cell = 30;
  float slice_left = random(0, width / 2);
  float slice_right = random(width / 2, width);  
  for (float x = 0; x < width; x += cell) {
    for (float y = 0; y < height; y += cell) {
      int c1 = color(img.get(int(slice_left), int(y)));
      int c2 = color(img.get(int(slice_right), int(y)));
      float a = map(x, 0, width, 0, 1);
      int c = lerpColor(c1, c2, a);
      fill(c);
      float s = map(brightness(c), 0, 255, cell, cell * 2);
      rect(x, y, s, s);
    }
  }
  save("stripes.png");
  exit();
}

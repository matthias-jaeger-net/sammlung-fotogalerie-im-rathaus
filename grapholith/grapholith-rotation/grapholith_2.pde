void setup() {
  size(8000, 8000);
  background(255);
  imageMode(CENTER);
  PImage img = loadImage("grapholith.png");
  img.resize(img.width * 4, img.height * 4);
  float radius = width * 0.2;
  PGraphics bufferd = createGraphics(img.width, img.height);
  bufferd.beginDraw();
  for (int x = 0; x < bufferd.width; x += 1) {
    for (int y = 0; y < bufferd.height; y += 1) {
      color c = img.get(x, y);
      float b = brightness(c);
      if (b < 200.0) {
        bufferd.stroke(c);
        bufferd.point(x, y);
      }
    }
  }
  bufferd.endDraw();
  
  for (int i = 0; i < 10; i++) {
    PVector v = PVector.random2D();
    v.mult(random(radius * 0.5));
    v.add(new PVector(width * 0.5, height * 0.5));
    float n = noise(v.x * 0.03412, v.y * 0.1232);
    pushMatrix();
    translate(v.x, v.y);
    rotate(n * TAU);
    image(bufferd, 0, 0);    
    popMatrix();
  }
  
  float segments = 120.0;
  float rotMax = TAU;
  float shift = width * 0.2;   
  for (float angle = 0.0; angle < rotMax; angle += rotMax / segments) {
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    float n = noise(x * 0.01412, y * 0.01232);
    pushMatrix();
    translate(width * 0.5, height * 0.5);
    translate(x, y);
    if (random(0.0, 1.0) > 0.5) { 
      rotate(angle);
    } else {
      rotate(angle * n);
    }
    if (random(0.0, 1.0) > 0.999) { 
      rotate(random(TAU));
    }
    if (random(0.0, 1.0) > 0.5) { 
      image(bufferd, n * shift, 0);
    } else {
      image(bufferd, 0, 0);
    }
    popMatrix();
  }
  save("grapholit-rotation.png");
  exit();
}

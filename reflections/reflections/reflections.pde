PGraphics reverseImg(PImage buffer) {
  PGraphics gfx = createGraphics(buffer.width, buffer.height);
  gfx.beginDraw();
  gfx.loadPixels();
  for (int i = 0; i < gfx.width; i += 1) {
    for (int j = 0; j < gfx.height; j += 1) {
      int c = gfx.get(i, j);
      int x = gfx.width - 1 - i;
      gfx.set(x, j, c);
    }
  }
  gfx.updatePixels();
  gfx.endDraw();
  return gfx;
}

PGraphics sym(PImage buf) {
  PGraphics gfx = createGraphics(buf.width, buf.height);
  PImage img1 = buf.get(0, 0, buf.width / 2, buf.height);
  gfx.image(img1, 0, 0);
  gfx.image(reverseImg(img1), buf.width / 2, 0);
  return gfx;
}

void setup() {
  size(800, 800);

  PImage img = loadImage("IMG_6315.JPG");
  img.resize(width, height);

  // image(img, 0, 0, width, height);
  PGraphics rev = reverseImg(img);
  image(rev, 0, 0, width, height);


  /*
  for (int layer = 0; layer < 40; layer += 1) {
   int w = 150;
   int x = floor(random(width-w));
   int y = floor(random(height-w));
   PImage i = this.get(x, y, w, w);
   image(sym(i), x, y);
   }
   
   save("sym.jpg");
   */
}

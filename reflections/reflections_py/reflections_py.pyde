"""
Reverse image
"""
def reverse_image(img):
    gfx = createGraphics(img.width, img.height)
    gfx.beginDraw()
    buffer = img.get()
    for i in range(0, gfx.width):
     for j in range(0, gfx.height):
        x = gfx.width - 1 - i
        c = img.get(i, j)
        gfx.stroke(c)
        gfx.point(x, j)
    gfx.endDraw()
    return gfx


def sym(buf):
    gfx = createGraphics(buf.width, buf.height)
    img1 = buf.get(0, 0, buf.width / 2, buf.height)
    gfx.beginDraw()
    gfx.image(img1, 0, 0)
    gfx.image(reverse_image(img1), buf.width / 2, 0)
    gfx.endDraw()
    return gfx


def setup():
    size(2400, 2400)
    background(255)
    img = loadImage('IMG_6315.JPG')
    img.resize(width, height)
    image(img, 0, 0, width, height)
    
    w = 500
    for layer in range(0, 40):
        x = floor(random(w, width - w))
        y = floor(random(w, height - w))
        i = img.get(x, y, w, w)
        s = sym(i)
        image(s, x, y)
        
    save('sym.jpg')
    exit()
        
        

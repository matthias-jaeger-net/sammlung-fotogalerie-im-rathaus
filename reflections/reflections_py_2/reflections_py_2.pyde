def reverse_image(img):
    canvas = createGraphics(img.width, img.height)
    canvas.beginDraw()
    for i in range(0, canvas.width):
     for j in range(0, canvas.height):
        x = canvas.width - 1 - i
        c = img.get(i, j)
        canvas.stroke(c)
        canvas.point(x, j)
    canvas.endDraw()
    return canvas

def sym(buf):
    gfx = createGraphics(buf.width, buf.height)
    left_half = buf.get(0, 0, buf.width / 2, buf.height)
    right_half = reverse_image(left_half)
    half = buf.width / 2
    gfx.beginDraw()
    gfx.image(left_half, 0, 0)
    gfx.image(right_half, half, 0)
    gfx.endDraw()
    return gfx


def setup():    
    file_name = "sym"
    extension = "png"
    hash = str(random(1))
    out = "out/{h}.{e}".format(h = hash, e = extension)

    buff = createGraphics(2000, 2000)
    buff.beginDraw()
    # 2x: 5472, 7296
    # 1x: 2736, 3648
    foto = loadImage("IMG_20210312_100700.jpg")
    copy_foto = foto.get()
    copy_foto.resize(width, height) 
       
    buff.image(copy_foto, 0, 0)
    
    for layer in range(0, 1):
        x = int(random(0, foto.width))
        y = int(random(0, foto.height))
        w = int(random(500, 1000))
        h = int(random(500, 1000))
        r = foto.get(x, y, w, h)    
        buff.image(sym(r), random(width), random(height))
    buff.endDraw()
    buff.save(out)
    exit()
        

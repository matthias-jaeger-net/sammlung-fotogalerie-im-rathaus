def setup():
    size(2736, 3648)
    
"""
def reverse_image(img):
    canvas = createGraphics(img.width, img.height)
    canvas.beginDraw()
    for i in range(0, canvas.width):
     for j in range(0, canvas.height):
        x = canvas.width - 1 - i
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
                    
    ##img = loadImage("IMG_20210312_100700.jpg")
    ## image(img, 0, 0, width, height)
    
    
    # for layer in range(0, 40):
        # w = 500
        # x = floor(random(w, width - w))
       # y = floor(random(w, height - w))
        # i = img.get(x, y, w, w)
        # s = sym(i)
        # image(s, x, y)
        
    #save('sym.jpg')
    # exit()
"""            

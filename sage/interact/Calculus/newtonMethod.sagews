︠6c6e5e08-b19a-4a03-90fd-ec4347a26564i︠
def newton_method(f, c, eps, maxiter=100):
    x = f.variables()[0]
    fprime = f.derivative(x)
    try:
        g = f._fast_float_(x)
        gprime = fprime._fast_float_(x)
    except AttributeError:
        g = f; gprime = fprime
    iterates = [c]
    for i in xrange(maxiter):
       fc = g(c)
       if abs(fc) < eps: return c, iterates
       c = c - fc/gprime(c)
       iterates.append(c)
    return c, iterates
    
var('x')    
html("<h1>Double Precision Root Finding Using Newton's Method</h1>")
@interact
def _(f = x^2 - 2, c = float(0.5), eps=(-3,(-16..-1)), interval=float(0.5)):
     eps = 10^(eps)
     print "eps = %s"%float(eps)
     z, iterates = newton_method(f, c, eps)
     print "root =", z
     print "f(c) = %r"%f(x=z)
     n = len(iterates)
     print "iterations =", n
     html(iterates)
     P = plot(f, (x,z-interval, z+interval), rgbcolor='blue')
     h = P.ymax(); j = P.ymin()
     L = sum(point((w,(n-1-float(i))/n*h), rgbcolor=(float(i)/n,0.2,0.3), pointsize=10) + \
             line([(w,h),(w,j)],rgbcolor='black',thickness=0.2) for i,w in enumerate(iterates))
     show(P + L, xmin=z-interval, xmax=z+interval)

︡b2221899-9700-4bbe-bc6f-618d3f1681d0︡{"stdout":"x\n"}︡{"html":"<h1>Double Precision Root Finding Using Newton's Method</h1>"}︡{"interact":{"style":"None","flicker":false,"layout":[[["f",12,null]],[["c",12,null]],[["eps",12,null]],[["interval",12,null]],[["",12,null]]],"id":"c82daa0f-c941-4da6-bc8f-655c585455f9","controls":[{"control_type":"input-box","default":"x^2 - 2","label":"f","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"f","type":null},{"control_type":"input-box","default":0.5,"label":"c","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"c","type":null},{"control_type":"slider","default":13,"var":"eps","width":null,"vals":["-16","-15","-14","-13","-12","-11","-10","-9","-8","-7","-6","-5","-4","-3","-2","-1"],"animate":true,"label":"eps","display_value":true},{"control_type":"input-box","default":0.5,"label":"interval","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"interval","type":null}]}}︡
︠08c479e5-df6b-427c-a556-ef2589bd8b04︠











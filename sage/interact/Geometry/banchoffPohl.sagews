︠01f1a30a-c202-45ee-b78d-12aec82647ef︠
from collections import defaultdict
var('t')
a = 0; b= 2*pi

def random_line3d(bound):
    '''Random line in R^3: first choose the guiding vector of the line,
    then choose a point in the plane p perpendicular to that vector.
    '''
    p = vector([(2*random() - 1) for _ in range(3)])
    v = p/norm(p)
    v2, v3 = matrix(v).right_kernel().basis()
    if det(matrix([v, v2, v3]))<0:
        v2, v3 = v3, v2
    v2 = v2/norm(v2)
    v3 = v3 - (v3*v2)*v2
    v3 = v3/norm(v3)
    return v, (2*random()*bound - bound, v2), (2*random()*bound - bound, v3)

def winding_number(x, y, x0, y0):
    x -= x0
    y -= y0
    r2 = x^2 + y^2
    xp = x.derivative(t)
    yp = y.derivative(t)
    integrando(t) = (x*yp -y*xp)/r2
    i,e = numerical_integral(integrando, a, b)
    return round(i/(2*pi))

def linking_number(curve, line):
    v, (a2, v2), (a3, v3) = line
    M = matrix([v, v2, v3])
#    curve2d = (curve*M.inverse())[1:] #This is VERY slow, for some reason!
    curve2d = sum(c*v for c,v in zip(curve,M.inverse()))[1:]
    x, y = curve2d
    return winding_number(x, y, a2,a3)

def color_ln(number):
    if number:
        return (0,1-1/(1+number),0)
    else:
        return (1,0,0)

def banchoff_pohl(curve, L, M):
    ln_d = defaultdict(int)
    pp = parametric_plot3d(curve, (t,0,2*pi), thickness=2)
    for k in range(L):
        a_line = random_line3d(M)
        ln = abs(linking_number(curve, a_line))
        v, (l1, v1), (l2, v2) = a_line
        pp += parametric_plot3d(l1*v1+l2*v2+t*v,(t,-2,2), 
                                color=color_ln(ln))
        ln_d[ln] += 1
    return ln_d, pp

def print_stats(d):
    print 'Number of lines with linking number k:'
    print ', '.join('%d:%d'%(k,v) for k,v in d.iteritems())

@interact
def bp_interact( u1 = text_control('x, y, z coordinates of a closed space curve in [0,2*pi]'),
                 curvax = input_box(cos(t), label='x(t)' ),
                 curvay = input_box(sin(t), label='y(t)' ),
                 curvaz = input_box(0, label='y(t)' ),
                 u2 = text_control('The curve should be contained in a ball of radius M'),
                 M  = 1,
                 u3 = text_control('Use L lines chosen randomly'),
                 L  = 10):
    ln_d, p = banchoff_pohl(vector((curvax, curvay, curvaz)), L, M)
    p.show(aspect_ratio=1, xmin=-2, xmax=2, ymin=-2,ymax=2)
    bp_area_aprox = (sum(k^2*v for k,v in ln_d.iteritems())/L)*2*pi*M^2
    print 'Bahnchoff-Pohl area of the curve(aprox): %f'%bp_area_aprox
    print_stats(ln_d)
︡7531707d-dae2-454d-8bbc-50b9bc454add︡{"stdout":"t\n"}︡{"interact":{"style":"None","flicker":false,"layout":[[["u1",12,null]],[["curvax",12,null]],[["curvay",12,null]],[["curvaz",12,null]],[["u2",12,null]],[["M",12,null]],[["u3",12,null]],[["L",12,null]],[["",12,null]]],"id":"f8aaccf8-e64c-44a1-ad1e-96a7ce1ac027","controls":[{"default":"x, y, z coordinates of a closed space curve in [0,2*pi]","var":"u1","classes":null,"control_type":"text","label":"u1"},{"control_type":"input-box","default":"cos(t)","label":"x(t)","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"curvax","type":null},{"control_type":"input-box","default":"sin(t)","label":"y(t)","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"curvay","type":null},{"control_type":"input-box","default":0,"label":"y(t)","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"curvaz","type":null},{"default":"The curve should be contained in a ball of radius M","var":"u2","classes":null,"control_type":"text","label":"u2"},{"control_type":"input-box","default":1,"label":"M","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"M","type":null},{"default":"Use L lines chosen randomly","var":"u3","classes":null,"control_type":"text","label":"u3"},{"control_type":"input-box","default":10,"label":"L","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"L","type":null}]}}︡
︠34eccf1b-a921-48ba-9a11-3b1752189e63︠










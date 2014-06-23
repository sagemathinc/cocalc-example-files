︠6ecfbad9-80b5-45e1-ba47-c622dc278890︠
from collections import defaultdict

var('t x y')
pin = pi.n()

def longitud(curva, t0, t1):
    dxdt = derivative(curva[0], t)
    dydt = derivative(curva[1], t)
    integrando(t) = sqrt(dxdt^2 + dydt^2)
    i,_ = numerical_integral(integrando, t0, t1)
    return  i

def random_line(cota):
    theta = random()*pin
    k = 2*cota*random() - cota
    return sin(theta)*x + cos(theta)*y + k

def crofton_exact(curva, t0, t1, L, M):
    forget()
    assume(t>t0)
    assume(t<t1)
    pp = parametric_plot(curva, (t, t0, t1), color='red')
    cortesd = defaultdict(int)
    for k in range(L):
        rl = random_line(M)
        ss = solve(rl(x=curva[0], y=curva[1]), t)
        cortes = 0
        for s in ss:
            tt = s.rhs()
            x0,y0 = curva[0](t=tt), curva[1](t=tt)
            if x0 in RR and y0 in RR:
                pp += point2d((x0,y0), pointsize = 30)
                cortes += 1
        if cortes:
            pp += implicit_plot(rl, (x,-M,M), (y,-M,M), color='green')
        else:
            pp += implicit_plot(rl, (x,-M,M), (y,-M,M), color='blue')
        cortesd[cortes] += 1
    return cortesd, pp
    
def random_line_n(cota):
    theta = random()*pin
    k = 2*cota*random() - cota
    return sin(theta), cos(theta), k

def interseccion_sr(punto1, punto2, recta):
    'Devuelve el punto de interseccion de una recta y un segmento, o None si no se cortan'
    x1, y1 = punto1
    x2, y2 = punto2
    a, b, c   = recta
    num = (-c - a*x1 - b*y1)
    den = (a*(x2 - x1) + b*(y2 - y1))
    if (0 < num < den) or (den < num < 0):
        t_i = num/den
        return ((1-t_i)*x1 + t_i*x2, (1-t_i)*y1 + t_i*y2)
    else:
        return None

def interseccion_cr(curva, t0, t1, recta, partes=50):
    '''Devuelve el numero de puntos de interseccion de una curva y una recta'''
    x,y = curva
    paso = (t1 - t0)/partes
    puntos = [(x(t=tr), y(t=tr)) for tr in srange(t0, t1 + paso, paso)]
    intersecciones = (interseccion_sr(puntos[j], puntos[j+1], recta)
                      for j in xrange(partes-1))
    return [p for p in intersecciones if p ]
    
def crofton_aprox(curva, t0, t1, L, M):
    cortesd = defaultdict(int)
    pp = parametric_plot(curva, (t, t0, t1), color='red')
    for k in range(L):
        a,b,c = random_line_n(M)
        rl = a*x + b*y + c
        cortes = interseccion_cr(curva, t0, t1, (a,b,c))
        if cortes:
            pp += sum(point2d(p, pointsize = 30) for p in cortes)
            pp += implicit_plot(rl, (x,-M,M), (y,-M,M), color='green')
        else:
            pp += implicit_plot(rl, (x,-M,M), (y,-M,M), color='blue')
        cortesd[len(cortes)] += 1
    return cortesd, pp

def print_stats(d):
    print 'Number of lines with k intersection points:'
    print ', '.join('%d:%d'%(k,v) for k,v in d.iteritems())
    
@interact
def crofton_interact(u1 = text_control('x and y coordinates of curve'),
                     curvax = input_box(t^2, label='x(t)' ),
                     curvay = input_box(2*t-1, label='y(t)' ),
                     u2 = text_control('Interval of definition'),
                     t0 = 0, t1 = 1,
                     u3 = text_control('Draw L lines randomly cos(t)x + sin(t)y + K, |K|&lt;M, 0 <= t < 2pi'),
                     M  = 2,
                     L  = 5,
                     u4    = text_control('Use function "solve" from maxima for exact computations?'),
                     exact = checkbox(False),
                     u5    = text_control('Otherwise, a curve is approximated by how many segments?'),
                     steps = slider(4, 40, 4, 8)):

    if exact:
        cortesd, p = crofton_exact((curvax, curvay), t0, t1, L, M)
    else:
        cortesd, p = crofton_aprox((curvax, curvay), t0, t1, L, M)
    p.show(aspect_ratio=1, xmin=-2, xmax=2, ymin=-2,ymax=2)
    print 'A curve of lenght %f'%longitud((curvax, curvay), t0, t1)
    print_stats(cortesd)
    cortes_tot = sum(k*v for k,v in cortesd.iteritems())
    print 'Approx length using Crofton\'s formula: %f'%((cortes_tot/L)*(pi*M))
︡ada5e2a6-80f1-4ecd-b0b7-fe2437a45e17︡{"stdout":"(t, x, y)\n"}︡{"interact":{"style":"None","flicker":false,"layout":[[["u1",12,null]],[["curvax",12,null]],[["curvay",12,null]],[["u2",12,null]],[["t0",12,null]],[["t1",12,null]],[["u3",12,null]],[["M",12,null]],[["L",12,null]],[["u4",12,null]],[["exact",12,null]],[["u5",12,null]],[["steps",12,null]],[["",12,null]]],"id":"66d3fbed-6f54-4fdb-b2c0-0f21619f0d5b","controls":[{"default":"x and y coordinates of curve","var":"u1","classes":null,"control_type":"text","label":"u1"},{"control_type":"input-box","default":"t^2","label":"x(t)","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"curvax","type":null},{"control_type":"input-box","default":"2*t - 1","label":"y(t)","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"curvay","type":null},{"default":"Interval of definition","var":"u2","classes":null,"control_type":"text","label":"u2"},{"control_type":"input-box","default":0,"label":"t0","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"t0","type":null},{"control_type":"input-box","default":1,"label":"t1","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"t1","type":null},{"default":"Draw L lines randomly cos(t)x + sin(t)y + K, |K|&lt;M, 0 <= t < 2pi","var":"u3","classes":null,"control_type":"text","label":"u3"},{"control_type":"input-box","default":2,"label":"M","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"M","type":null},{"control_type":"input-box","default":5,"label":"L","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"L","type":null},{"default":"Use function \"solve\" from maxima for exact computations?","var":"u4","classes":null,"control_type":"text","label":"u4"},{"default":false,"var":"exact","readonly":false,"control_type":"checkbox","label":"exact"},{"default":"Otherwise, a curve is approximated by how many segments?","var":"u5","classes":null,"control_type":"text","label":"u5"},{"control_type":"slider","default":1,"var":"steps","width":null,"vals":["4","8","12","16","20","24","28","32","36","40"],"animate":true,"label":"steps","display_value":true}]}}︡
︠4b47e161-990d-4415-8cbd-f8576a713fb7︠










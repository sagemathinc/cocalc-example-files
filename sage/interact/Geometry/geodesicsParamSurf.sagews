︠2205c73e-6a37-4919-bfbc-19d68b965a13︠
from scipy.integrate import odeint

u, v, t, du, dv = var('u v t du dv')

def fading_line3d(points, rgbcolor1, rgbcolor2, *args, **kwds):
    L = len(points)
    vcolor1 = vector(RDF, rgbcolor1)
    vcolor2 = vector(RDF, rgbcolor2)
    return sum(line3d(points[j:j+2], 
                      rgbcolor = tuple( ((L-j)/L)*vcolor1 + (j/L)*vcolor2 ), 
                      *args, **kwds) 
               for j in srange(L-1))

steps = 100

@interact
def _(x = input_box(3*sin(u)*cos(v), 'x'),
      y = input_box(sin(u)*sin(v), 'y'),
      z = input_box(2*cos(u), 'z'),
      int_u = input_grid(1, 2, default = [[0,pi]], label = 'u -interval'), 
      int_v = input_grid(1, 2, default = [[-pi,pi]], label = 'v -interval'),
      init_point = input_grid(1, 2, default = [[-pi/4,pi/8]], label = 'coordinates of \ninitial point'),
      init_vector = input_grid(1, 2, default = [[1,0]], label = 'coordinates of \ninitial vector'),
      int_s = slider(0, 10, 1/10, 
                           default = pi/2, 
                           label = 'geodesic interval'),
      sliding_color = checkbox(True,'change color along the geodesic')):

    int_u = int_u[0]
    int_v = int_v[0]
    u_0, v_0 = init_point[0]
    V_u, V_v = init_vector[0]
    
    F = vector([x, y, z])

    S_plot = parametric_plot3d( F, 
                                (u, int_u[0], int_u[1]), 
                                (v, int_v[0], int_v[1]))
   
    dFu = F.diff(u)
    dFv = F.diff(v)
    
    Fu = fast_float(dFu, u, v)
    Fv = fast_float(dFv, u, v)
    
    ufunc = function('ufunc', t)
    vfunc = function('vfunc', t)
    
    dFtt = F(u=ufunc, v=vfunc).diff(t, t)
    
    ec1 = dFtt.dot_product(dFu(u=ufunc, v=vfunc))
    ec2 = dFtt.dot_product(dFv(u=ufunc, v=vfunc))
    
    dv, ddv, du, ddu = var('dv, ddv, du, ddu')
    
    diffec1 = ec1.subs_expr(diff(ufunc, t) == du, 
                            diff(ufunc, t, t) == ddu,     
                            diff(vfunc, t) == dv, 
                            diff(vfunc, t, t) == ddv, 
                            ufunc == u, vfunc == v)
    diffec2 = ec2.subs_expr(diff(ufunc, t) == du, 
                            diff(ufunc, t, t) == ddu,     
                            diff(vfunc, t) == dv, 
                            diff(vfunc, t, t) == ddv, 
                            ufunc == u, vfunc == v)
    sols = solve([diffec1 == 0 , diffec2 == 0], ddu, ddv)
    
    ddu_rhs = (sols[0][0]).rhs().full_simplify()
    ddv_rhs = (sols[0][1]).rhs().full_simplify()
        
    ddu_ff = fast_float(ddu_rhs, du, dv, u, v)
    ddv_ff = fast_float(ddv_rhs, du, dv, u, v)
    
    def func(y,t):
        v = list(y)
        return [ddu_ff(*v), ddv_ff(*v), v[0], v[1]]
        
    Point = [u_0, v_0]
    velocity = [V_u, V_v]
    Point = map(float, Point)
    velocity = map(float, velocity)
    
    geo2D_aux = odeint(func,
                       y0 = [velocity[0], velocity[1], Point[0], Point[1]],
                       t = srange(0, int_s, 0.01))
    
    geo3D = [F(u=l,v=r) for [j, k, l, r] in geo2D_aux]
    
    if sliding_color:
        g_plot = fading_line3d(geo3D, rgbcolor1 = (1, 0, 0), rgbcolor2 = (0, 1, 0), thickness=4)
    else:
        g_plot = line3d(geo3D, rgbcolor=(0, 1, 0), thickness=4)
    
    P = F(u=Point[0], v=Point[1])
    P_plot = point3d((P[0], P[1], P[2]), rgbcolor = (0, 0, 0), pointsize = 30)
    V = velocity[0] * Fu(u = Point[0], v = Point[1]) + \
        velocity[1] * Fv(u= Point[0], v = Point[1])
    V_plot = arrow3d(P, P + V, color = 'black')
    
    show(g_plot + S_plot + V_plot + P_plot,aspect_ratio = [1, 1, 1])
︡3ba9880e-f955-4131-aa1e-1ad135223629︡{"interact":{"style":"None","flicker":false,"layout":[[["x",12,null]],[["y",12,null]],[["z",12,null]],[["int_u",12,null]],[["int_v",12,null]],[["init_point",12,null]],[["init_vector",12,null]],[["int_s",12,null]],[["sliding_color",12,null]],[["",12,null]]],"id":"5222ce55-81ba-418c-a52f-2fa85d11e59e","controls":[{"control_type":"input-box","default":"3*cos(v)*sin(u)","label":"x","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"x","type":null},{"control_type":"input-box","default":"sin(u)*sin(v)","label":"y","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"y","type":null},{"control_type":"input-box","default":"2*cos(u)","label":"z","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"z","type":null},{"control_type":"input-grid","ncols":2,"default":[["0","pi"]],"label":"u -interval","nrows":1,"width":5,"var":"int_u"},{"control_type":"input-grid","ncols":2,"default":[["-pi","pi"]],"label":"v -interval","nrows":1,"width":5,"var":"int_v"},{"control_type":"input-grid","ncols":2,"default":[["-1/4*pi","1/8*pi"]],"label":"coordinates of \ninitial point","nrows":1,"width":5,"var":"init_point"},{"control_type":"input-grid","ncols":2,"default":[["1","0"]],"label":"coordinates of \ninitial vector","nrows":1,"width":5,"var":"init_vector"},{"control_type":"slider","default":16,"var":"int_s","width":null,"vals":["0","1/10","1/5","3/10","2/5","1/2","3/5","7/10","4/5","9/10","1","11/10","6/5","13/10","7/5","3/2","8/5","17/10","9/5","19/10","2","21/10","11/5","23/10","12/5","5/2","13/5","27/10","14/5","29/10","3","31/10","16/5","33/10","17/5","7/2","18/5","37/10","19/5","39/10","4","41/10","21/5","43/10","22/5","9/2","23/5","47/10","24/5","49/10","5","51/10","26/5","53/10","27/5","11/2","28/5","57/10","29/5","59/10","6","61/10","31/5","63/10","32/5","13/2","33/5","67/10","34/5","69/10","7","71/10","36/5","73/10","37/5","15/2","38/5","77/10","39/5","79/10","8","81/10","41/5","83/10","42/5","17/2","43/5","87/10","44/5","89/10","9","91/10","46/5","93/10","47/5","19/2","48/5","97/10","49/5","99/10","10"],"animate":true,"label":"geodesic interval","display_value":true},{"default":true,"var":"sliding_color","readonly":false,"control_type":"checkbox","label":"change color along the geodesic"}]}}︡
︠24abf912-7f5d-4cf1-a37c-d0819a6b9bd4︠










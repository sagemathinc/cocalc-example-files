︠8c9fd9d3-354f-40bc-a97b-05982b5e691b︠
##  Display and compute the area of the lateral surface between two surfaces
##  corresponding to the (scalar) line integral
##  John Travis
##  Spring 2011
##

var('x,y,t,s')
@interact(layout=dict(top=[['f','u'],['g','v']], 
left=[['a'],['b'],['in_3d'],['smoother']],
bottom=[['xx','yy']]))
def _(f=input_box(default=6-4*x^2-y^2*2/5,label='Top = $f(x,y) = $',width=30),
        g=input_box(default=-2+sin(x)+sin(y),label='Bottom = $g(x,y) = $',width=30),
        u=input_box(default=cos(t),label='   $ x = u(t) = $',width=20),
        v=input_box(default=2*sin(t),label='   $ y = v(t) = $',width=20),
        a=input_box(default=0,label='$a = $',width=10),
        b=input_box(default=3*pi/2,label='$b = $',width=10),
        xx = range_slider(-5, 5, 1, default=(-1,1), label='x view'),
        yy = range_slider(-5, 5, 1, default=(-2,2), label='y view'),
        in_3d = checkbox(default=true,label='3D'),
        smoother=checkbox(default=false),
        auto_update=true):
        
    ds = sqrt(derivative(u,t)^2+derivative(v,t)^2)
    
#   Set up the integrand to compute the line integral, making all attempts
#   to simplify the result so that it looks as nice as possible.    
    A = (f(x=u,y=v)-g(x=u,y=v))*ds.simplify_trig().simplify()
    
#   It is not expected that Sage can actually perform the line integral calculation.
#   So, the result displayed may not be a numerical value as expected.
#   Creating a good but harder example that "works" is desirable.
#   If you want Sage to try, uncomment the lines below.

#    line_integral = integrate(A,t,a,b)
#    html(r'<align=center size=+1>Lateral Surface Area = $ %s $ </font>'%latex(line_integral))

    line_integral_approx = numerical_integral(A,a,b)[0]

    html(r'<font align=center size=+1>Lateral Surface $ \approx $ %s</font>'%str(line_integral_approx))

#   Plot the top function z = f(x,y) that is being integrated.
    G = plot3d(f,(x,xx[0],xx[1]),(y,yy[0],yy[1]),opacity=0.2)
    G += plot3d(g,(x,xx[0],xx[1]),(y,yy[0],yy[1]),opacity=0.2)

#   Add space curves on the surfaces "above" the domain curve (u(t),v(t)) 
    G += parametric_plot3d([u,v,g(x=u,y=v)],(t,a,b),thickness=2,color='red')
    G += parametric_plot3d([u,v,f(x=u,y=v)],(t,a,b),thickness=2,color='red')
    k=0
    if smoother:
        delw = 0.025
        lat_thick = 3
    else:
        delw = 0.10
        lat_thick = 10
    for w in (a,a+delw,..,b):
        G += parametric_plot3d([u(t=w),v(t=w),s*f(x=u(t=w),y=v(t=w))+(1-s)*g(x=u(t=w),y=v(t=w))],(s,0,1),thickness=lat_thick,color='yellow',opacity=0.9)
        
    if in_3d:
        show(G,stereo='redcyan',spin=true)
    else:
        show(G,perspective_depth=true,spin=true)
︡c40ac8d6-b599-483f-9e43-bcc6061d7ee9︡{"stdout":"(x, y, t, s)\n"}︡{"interact":{"style":"None","flicker":false,"layout":[[["f",6,null],["u",6,null]],[["g",6,null],["v",6,null]],[["a",6,null],["",6,null]],[["b",12,null]],[["in_3d",12,null]],[["smoother",12,null]],[["xx",6,null],["yy",6,null]],[["auto_update",12,null]]],"id":"7b5b7298-7835-4622-8ad3-083f964ca598","controls":[{"control_type":"input-box","default":"-4*x^2 - 2/5*y^2 + 6","label":"Top = $f(x,y) = $","nrows":1,"width":30,"readonly":false,"submit_button":null,"var":"f","type":null},{"control_type":"input-box","default":"sin(x) + sin(y) - 2","label":"Bottom = $g(x,y) = $","nrows":1,"width":30,"readonly":false,"submit_button":null,"var":"g","type":null},{"control_type":"input-box","default":"cos(t)","label":"   $ x = u(t) = $","nrows":1,"width":20,"readonly":false,"submit_button":null,"var":"u","type":null},{"control_type":"input-box","default":"2*sin(t)","label":"   $ y = v(t) = $","nrows":1,"width":20,"readonly":false,"submit_button":null,"var":"v","type":null},{"control_type":"input-box","default":0,"label":"$a = $","nrows":1,"width":10,"readonly":false,"submit_button":null,"var":"a","type":null},{"control_type":"input-box","default":"3/2*pi","label":"$b = $","nrows":1,"width":10,"readonly":false,"submit_button":null,"var":"b","type":null},{"control_type":"range-slider","default":[4,6],"var":"xx","width":null,"vals":["-5","-4","-3","-2","-1","0","1","2","3","4","5"],"animate":true,"label":"x view","display_value":true},{"control_type":"range-slider","default":[3,7],"var":"yy","width":null,"vals":["-5","-4","-3","-2","-1","0","1","2","3","4","5"],"animate":true,"label":"y view","display_value":true},{"default":true,"var":"in_3d","readonly":false,"control_type":"checkbox","label":"3D"},{"default":false,"var":"smoother","readonly":false,"control_type":"checkbox","label":"smoother"},{"default":true,"var":"auto_update","readonly":false,"control_type":"checkbox","label":"auto_update"}]}}︡
︠ee7580f9-9d0a-4f78-8869-8d25aec3a3d8︠










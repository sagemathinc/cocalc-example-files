︠aaee7686-5f5f-4338-a50f-c8435797f202︠
##  An interactive way to demonstrate limits of multivariate functions of the form z = f(x,y)
##
##  John Travis
##  Mississippi College
##  
##  Spring 2011
##

#  Starting point for radius values before collapsing in as R approaches 0.
#  Functions ought to be "reasonable" within a circular domain of radius R surrounding 
#  the desired (x_0,y_0).
var('x,y,z')
Rmin=1/10
Rmax=2
@interact(layout=dict(top=[['f'],['x0'],['y0']], 
bottom=[['in_3d','curves','R','graphjmol']]))
def _(f=input_box((x^2-y^2)/(x^2+y^2),width=30,label='$f(x)$'),
        R=slider(Rmin,Rmax,1/10,Rmax,label=',   $R$'),
        x0=input_box(0,width=10,label='$x_0$'),
        y0=input_box(0,width=10,label='$y_0$'),
        curves=checkbox(default=false,label='Show curves'),
        in_3d=checkbox(default=false,label='3D'),
        graphjmol=checkbox(default=true,label='Interactive graph')):
    if graphjmol:
        view_method = 'jmol'
    else:
        view_method = 'tachyon'

#   converting f to cylindrical coordinates.  
    g(r,t) = f(x=r*cos(t)+x0,y=r*sin(t)+y0)

#   Sage graphing transformation used to see the original surface.
    cylinder = (r*cos(t)+x0,r*sin(t)+y0,z)
    surface = plot3d(g,(t,0,2*pi),(r,1/100,Rmax),transformation=cylinder,opacity=0.2)
    
#   Regraph the surface for smaller and smaller radii controlled by the slider.
    collapsing_surface = plot3d(g,(t,0,2*pi),(r,1/100,R),transformation=cylinder,rgbcolor=(0,1,0))
    
    G = surface+collapsing_surface
    html('Enter $(x_0 ,y_0 )$ above and see what happens as $ R \\rightarrow 0 $.')
    html('The surface has a limit as $(x,y) \\rightarrow $ ('+str(x0)+','+str(y0)+') if the green region collapses to a point.')

#   If checked, add a couple of curves on the surface corresponding to limit as x->x0 for y=x^(3/5),
#   and as y->y0 for x=y^(3/5).  Should make this more robust but perhaps using 
#   these relatively obtuse curves could eliminate problems.

    if curves:
        curve_x = parametric_plot3d([x0-t,y0-t^(3/5),f(x=x0-t,y=y0-t^(3/5))],(t,Rmin,Rmax),color='red',thickness=10)
        curve_y = parametric_plot3d([x0+t^(3/5),y0+t,f(x=x0+t^(3/5),y=y0+t)],(t,Rmin,Rmax),color='red',thickness=10)
        R2 = Rmin/4
        G += arrow((x0-Rmin,y0-Rmin^(3/5),f(x=x0-Rmin,y=y0-Rmin^(3/5))),(x0-R2,y0-R2^(3/5),f(x=x0-R2,y=y0-R2^(3/5))),size=30 )
        G += arrow((x0+Rmin^(3/5),y0+Rmin,f(x=x0+Rmin^(3/5),y=y0+Rmin)),(x0+R2^(3/5),y0+R2,f(x=x0+R2^(3/5),y=y0+R2)),size=30 )  

        limit_x = limit(f(x=x0-t,y=y0-t^(3/5)),t=0)
        limit_y = limit(f(x=x0+t^(3/5),y=y0+t),t=0)
        text_x = text3d(limit_x,(x0,y0,limit_x))
        text_y = text3d(limit_y,(x0,y0,limit_y))
        G += curve_x+curve_y+text_x+text_y 
 
    
        html('The red curves represent a couple of trajectories on the surface.  If they do not meet, then')
        html('there is also no limit.  (If computer hangs up, likely the computer can not do these limits.)')
        html('\n<center><font color="red">$\lim_{(x,?)\\rightarrow(x_0,y_0)} f(x,y) =%s$</font>'%str(limit_x)+'  and <font color="red">$\lim_{(?,y)\\rightarrow(x_0,y_0)} f(x,y) =%s$</font></center>'%str(limit_y))
        
    if in_3d:
        show(G,stereo="redcyan",viewer=view_method)
    else:
        show(G,perspective_depth=true,viewer=view_method)
︡1e362601-55c5-425f-9656-1a69ba350718︡{"stdout":"(x, y, z)\n"}︡{"interact":{"style":"None","flicker":false,"layout":[[["f",12,null]],[["x0",12,null]],[["y0",12,null]],[["in_3d",3,null],["curves",3,null],["R",3,null],["graphjmol",3,null]],[["",12,null]]],"id":"3d84ff5b-5d00-402f-989d-fc42ddd4556e","controls":[{"control_type":"input-box","default":"(x^2 - y^2)/(x^2 + y^2)","label":"$f(x)$","nrows":1,"width":30,"readonly":false,"submit_button":null,"var":"f","type":null},{"control_type":"slider","default":19,"var":"R","width":null,"vals":["1/10","1/5","3/10","2/5","1/2","3/5","7/10","4/5","9/10","1","11/10","6/5","13/10","7/5","3/2","8/5","17/10","9/5","19/10","2"],"animate":true,"label":",   $R$","display_value":true},{"control_type":"input-box","default":0,"label":"$x_0$","nrows":1,"width":10,"readonly":false,"submit_button":null,"var":"x0","type":null},{"control_type":"input-box","default":0,"label":"$y_0$","nrows":1,"width":10,"readonly":false,"submit_button":null,"var":"y0","type":null},{"default":false,"var":"curves","readonly":false,"control_type":"checkbox","label":"Show curves"},{"default":false,"var":"in_3d","readonly":false,"control_type":"checkbox","label":"3D"},{"default":true,"var":"graphjmol","readonly":false,"control_type":"checkbox","label":"Interactive graph"}]}}︡
︠61161ce9-6085-49b1-9991-ea355c494211︠










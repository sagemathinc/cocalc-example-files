︠3424c33c-d6b9-4835-ad5b-727704e3ec2f︠
##  Graphing surfaces over non-rectangular domains 
##  John Travis
##  Spring 2011
##
##
##  An updated version of this worksheet may be available at http://sagenb.mc.edu
##
##  Interact allows the user to input up to two inequality constraints on the
##  domain when dealing with functional surfaces
##
##  User inputs:
##    f = "top" surface with z = f(x,y)
##    g = "bottom" surface with z = g(x,y)
##    condition1 = a single boundary constraint.  It should not include && or | to join two conditions.
##    condition2 = another boundary constraint.  If there is only one constraint, just enter something true
##        or even just an x (or y) in the entry blank.
##
## 

var('x,y')

#  f is the top surface
#  g is the bottom surface
global f,g

#  condition1 and condition2 are the inequality constraints.  It would be nice
#  to have any number of conditions connected by $$ or | 
global condition1,condition2

@interact
def _(f=input_box(default=(1/3)*x^2 + (1/4)*y^2 + 5,label='$f(x)=$'),
        g=input_box(default=-1*x+0*y,label='$g(x)=$'),
        condition1=input_box(default= x^2+y^2<8,label='$Constraint_1=$'),
        condition2=input_box(default=y<sin(3*x),label='$Constraint_2=$'),
        show_3d=('Stereographic',false), show_vol=('Shade volume',true), 
        dospin = ('Spin?',true), 
        clr = color_selector('#faff00', label='Volume Color', widget='colorpicker', hide_box=True), 
        xx = range_slider(-5, 5, 1, default=(-3,3), label='X Range'),
        yy = range_slider(-5, 5, 1, default=(-3,3), label='Y Range'),
        auto_update=false):
    
    #  This is the top function actually graphed by using NaN outside domain
    def F(x,y):
        if condition1(x=x,y=y):
            if condition2(x=x,y=y):
                return f(x=x,y=y)
            else:
                return -NaN
        else:
            return -NaN

    # This is the bottom function actually graphed by using NaN outside domain
    def G(x,y):
        if condition1(x=x,y=y):
            if condition2(x=x,y=y):
                return g(x=x,y=y)
            else:
                return -NaN
        else:
            return -NaN
        
    P = Graphics()      
      
#  The graph of the top and bottom surfaces
    P_list = []
    P_list.append(plot3d(F,(x,xx[0],xx[1]),(y,yy[0],yy[1]),color='blue',opacity=0.9))
    P_list.append(plot3d(G,(x,xx[0],xx[1]),(y,yy[0],yy[1]),color='gray',opacity=0.9))
    
#  Interpolate "layers" between the top and bottom if desired

    if show_vol:
        ratios = range(10)

        def H(x,y,r):
            return (1-r)*F(x=x,y=y)+r*G(x=x,y=y)
        P_list.extend([
        plot3d(lambda x,y: H(x,y,ratios[1]/10),(x,xx[0],xx[1]),(y,yy[0],yy[1]),opacity=0.2,color=clr),
        plot3d(lambda x,y: H(x,y,ratios[2]/10),(x,xx[0],xx[1]),(y,yy[0],yy[1]),opacity=0.2,color=clr),
        plot3d(lambda x,y: H(x,y,ratios[3]/10),(x,xx[0],xx[1]),(y,yy[0],yy[1]),opacity=0.2,color=clr),
        plot3d(lambda x,y: H(x,y,ratios[4]/10),(x,xx[0],xx[1]),(y,yy[0],yy[1]),opacity=0.2,color=clr),
        plot3d(lambda x,y: H(x,y,ratios[5]/10),(x,xx[0],xx[1]),(y,yy[0],yy[1]),opacity=0.2,color=clr),
        plot3d(lambda x,y: H(x,y,ratios[6]/10),(x,xx[0],xx[1]),(y,yy[0],yy[1]),opacity=0.2,color=clr),
        plot3d(lambda x,y: H(x,y,ratios[7]/10),(x,xx[0],xx[1]),(y,yy[0],yy[1]),opacity=0.2,color=clr),
        plot3d(lambda x,y: H(x,y,ratios[8]/10),(x,xx[0],xx[1]),(y,yy[0],yy[1]),opacity=0.2,color=clr),
        plot3d(lambda x,y: H(x,y,ratios[9]/10),(x,xx[0],xx[1]),(y,yy[0],yy[1]),opacity=0.2,color=clr)
        ])
#            P = plot3d(lambda x,y: H(x,y,ratio/10),(x,xx[0],xx[1]),(y,yy[0],yy[1]),opacity=0.1)
             
           
#  Now, accumulate all of the graphs into one grouped graph.        
    P = sum(P_list[i] for i in range(len(P_list)))


    if show_3d:
        show(P,frame=true,axes=false,xmin=xx[0],xmax=xx[1],ymin=yy[0],ymax=yy[1],stereo='redcyan',figsize=(6,9),viewer='jmol',spin=dospin)
    else:
        show(P,frame=true,axes=false,xmin=xx[0],xmax=xx[1],ymin=yy[0],ymax=yy[1],figsize=(6,9),viewer='jmol',spin=dospin)
︡ea3c2611-c0c5-4d2c-a0f8-f82035e923ac︡{"stdout":"(x, y)\n"}︡{"interact":{"style":"None","flicker":false,"layout":[[["f",12,null]],[["g",12,null]],[["condition1",12,null]],[["condition2",12,null]],[["show_3d",12,null]],[["show_vol",12,null]],[["dospin",12,null]],[["clr",12,null]],[["xx",12,null]],[["yy",12,null]],[["auto_update",12,null]],[["",12,null]]],"id":"3b36ebf3-0d12-46ed-a850-a4a04dab8675","controls":[{"control_type":"input-box","default":"1/3*x^2 + 1/4*y^2 + 5","label":"$f(x)=$","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"f","type":null},{"control_type":"input-box","default":"-x","label":"$g(x)=$","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"g","type":null},{"control_type":"input-box","default":"x^2 + y^2 < 8","label":"$Constraint_1=$","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"condition1","type":null},{"control_type":"input-box","default":"y < sin(3*x)","label":"$Constraint_2=$","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"condition2","type":null},{"default":false,"var":"show_3d","readonly":false,"control_type":"checkbox","label":"Stereographic"},{"default":true,"var":"show_vol","readonly":false,"control_type":"checkbox","label":"Shade volume"},{"default":true,"var":"dospin","readonly":false,"control_type":"checkbox","label":"Spin?"},{"widget":"colorpicker","control_type":"color-selector","hide_box":true,"Color":"<class 'sage.plot.colors.Color'>","label":"Volume Color","default":"#faff00","readonly":false,"var":"clr"},{"control_type":"range-slider","default":[2,8],"var":"xx","width":null,"vals":["-5","-4","-3","-2","-1","0","1","2","3","4","5"],"animate":true,"label":"X Range","display_value":true},{"control_type":"range-slider","default":[2,8],"var":"yy","width":null,"vals":["-5","-4","-3","-2","-1","0","1","2","3","4","5"],"animate":true,"label":"Y Range","display_value":true},{"default":false,"var":"auto_update","readonly":false,"control_type":"checkbox","label":"auto_update"}]}}︡
︠19f7a531-fada-4697-a333-4d24fd820cd5︠










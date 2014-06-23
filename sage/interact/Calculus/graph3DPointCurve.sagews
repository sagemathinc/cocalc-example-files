︠cc4a656a-e1e5-45a2-a517-f92cb7049786︠
x,y, t, u, v =var('x y t u v')
INI_func='x^2-2*x+y^2-2*y'
INI_box='-1,3.2,-1,3.2'
INI_points='(1,1,\'green\'),(3/2,3/2),(0,1),(1,0),(0,0,\'black\'),(3,0,\'black\'),(0,3,\'black\')'
INI_curves='(t,0,0,3,\'red\'),(0,t,0,3,\'green\'),(t,3-t,0,3)'
@interact
def _(func=input_box(INI_func,label="f(x,y)=",type=str),\
  bounds=input_box(INI_box,label="xmin,xmax,ymin,ymax",type=str),\
  st_points=input_box(INI_points,\
  label="points <br><small><small>(comma separated pairs, optionally with color)</small></small>", type=str),\
  bnd_curves=input_box(INI_curves,label="curves on boundary<br> <small><small><i>(x(t),y(t),tmin,tmax,'opt_color')</i></small></small>", type=str),\
 show_planes=("Show zero planes", False),  show_axes=("Show axes", True),  
 show_table=("Show table", True)):
 f=sage_eval('lambda x,y: ' + func)
 html(r'Function $ f(x,y)=%s$ '%latex(f(x,y)))
 xmin,xmax,ymin,ymax=sage_eval('('+bounds+')')
 A=plot3d(f(x,y),(x,xmin,xmax),(y,ymin,ymax),opacity=0.5)
 if not(bool(st_points=='')):
     st_p=sage_eval('('+st_points+',)')
     html(r'<table border=1>')
     for current in range(len(st_p)):
         point_color='red'
         if bool(len(st_p[current])==3):
              point_color=st_p[current][2]
         x0=st_p[current][0]
         y0=st_p[current][1]
         z0=f(x0,y0)
         if show_table:
              html(r'<tr><td>$\quad f(%s,%s)\quad $</td><td>$\quad %s$</td>\
              </tr>'%(latex(x0),latex(y0),z0.n()))
         A=A+point3d((x0,y0,z0),size=9,rgbcolor=point_color)           
     html(r'</table>')
 if not(bool(bnd_curves=='')):
     bnd_cc=sage_eval('('+bnd_curves+',)',locals={'t':t})
     for current in range(len(bnd_cc)):
         bnd_c=bnd_cc[current]+('black',) 
         A=A+parametric_plot3d((bnd_c[0],bnd_c[1],f(bnd_c[0],bnd_c[1])),\
             (t,bnd_c[2],bnd_c[3]),thickness=3,rgbcolor=bnd_c[4])
 if show_planes:
     A=A+plot3d(0,(x,xmin,xmax),(y,ymin,ymax),opacity=0.3,rgbcolor='gray')
     zmax=A.bounding_box()[1][2]
     zmin=A.bounding_box()[0][2]
     A=A+parametric_plot3d((u,0,v),(u,xmin,xmax),(v,zmin,zmax),opacity=0.3,rgbcolor='gray')
     A=A+parametric_plot3d((0,u,v),(u,ymin,ymax),(v,zmin,zmax),opacity=0.3,rgbcolor='gray')
 if show_axes:
     zmax=A.bounding_box()[1][2]
     zmin=A.bounding_box()[0][2]
     A=A+line3d([(xmin,0,0), (xmax,0,0)], arrow_head=True,rgbcolor='black') 
     A=A+line3d([(0,ymin,0), (0,ymax,0)], arrow_head=True,rgbcolor='black') 
     A=A+line3d([(0,0,zmin), (0,0,zmax)], arrow_head=True,rgbcolor='black') 
 show(A)
︡6a0600aa-efb0-487c-b55f-b49c84b54894︡{"interact":{"style":"None","flicker":false,"layout":[[["func",12,null]],[["bounds",12,null]],[["st_points",12,null]],[["bnd_curves",12,null]],[["show_planes",12,null]],[["show_axes",12,null]],[["show_table",12,null]],[["",12,null]]],"id":"4f004d39-a549-402c-95f7-726694bacc90","controls":[{"control_type":"input-box","default":"x^2-2*x+y^2-2*y","label":"f(x,y)=","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"func","type":"<type 'str'>"},{"control_type":"input-box","default":"-1,3.2,-1,3.2","label":"xmin,xmax,ymin,ymax","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"bounds","type":"<type 'str'>"},{"control_type":"input-box","default":"(1,1,'green'),(3/2,3/2),(0,1),(1,0),(0,0,'black'),(3,0,'black'),(0,3,'black')","label":"points <br><small><small>(comma separated pairs, optionally with color)</small></small>","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"st_points","type":"<type 'str'>"},{"control_type":"input-box","default":"(t,0,0,3,'red'),(0,t,0,3,'green'),(t,3-t,0,3)","label":"curves on boundary<br> <small><small><i>(x(t),y(t),tmin,tmax,'opt_color')</i></small></small>","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"bnd_curves","type":"<type 'str'>"},{"default":false,"var":"show_planes","readonly":false,"control_type":"checkbox","label":"Show zero planes"},{"default":true,"var":"show_axes","readonly":false,"control_type":"checkbox","label":"Show axes"},{"default":true,"var":"show_table","readonly":false,"control_type":"checkbox","label":"Show table"}]}}︡
︠73c2fa2b-b8a2-4a90-8b48-96e81df98cb5︠










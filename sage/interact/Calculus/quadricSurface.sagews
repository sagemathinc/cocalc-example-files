︠f806ebcc-3f0b-4991-9edb-af1adaba0564︠
var('x,y,z')
quadrics = {'Ellipsoid':x^2+y^2+z^2-1,'Elliptic paraboloid':x^2+y^2-z,'Hyperbolic paraboloid':x^2-y^2-z, '1-Sheeted Hyperboloid':x^2+y^2-z^2-1,'2-Sheeted Hyperboloid':x^2-y^2-z^2-1, 'Cone':x^2+y^2-z^2}
@interact
def quads(q = selector(quadrics.keys()), a = slider(0,5,1/2,default = 1)):
    f = quadrics[q].subs({x:x*a^(1/2)})
    if a==0 or q=='Cone': html('<center>$'+latex(f)+' \ $'+ '(degenerate)</center>')
    else: html('<center>$'+latex(f)+'$ </center>')
    p = implicit_plot3d(f,(x,-2,2),(y,-2,2),(z,-2,2), plot_points = 75)
    show(p)
︡f933b6fd-660a-49ba-8d1a-5f28d52dbcd9︡{"stdout":"(x, y, z)\n"}︡{"interact":{"style":"None","flicker":false,"layout":[[["q",12,null]],[["a",12,null]],[["",12,null]]],"id":"640d1f44-36e2-4e95-9b08-0a4b5615c822","controls":[{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["Ellipsoid","2-Sheeted Hyperboloid","Hyperbolic paraboloid","Cone","1-Sheeted Hyperboloid","Elliptic paraboloid"],"label":"q","nrows":null,"width":null,"var":"q"},{"control_type":"slider","default":2,"var":"a","width":null,"vals":["0","1/2","1","3/2","2","5/2","3","7/2","4","9/2","5"],"animate":true,"label":"a","display_value":true}]}}︡
︠40f89a79-e4db-4079-8f59-cf5b360be6a6︠










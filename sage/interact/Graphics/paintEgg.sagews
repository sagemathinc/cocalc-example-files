︠8b4453a8-e2a6-443e-95d6-a0906e01e189︠
var('s,t')
g(s) = ((0.57496*sqrt(121 - 16.0*s^2))/sqrt(10.+ s))
def P(color, rng):
    return parametric_plot3d((cos(t)*g(s), sin(t)*g(s), s), (s,rng[0],rng[1]), (t,0,2*pi), plot_points = [150,150], rgbcolor=color, frame = False, opacity = 1)
colorlist = ['red','blue','red','blue']

@interact
def _(band_number = selector(range(1,5)), current_color = Color('red'), auto_update=False):
    html('<h1 align=center>Egg Painter</h1>')
    colorlist[band_number-1] = current_color
    egg = sum([P(colorlist[i],[-2.75+5.5*(i/4),-2.75+5.5*(i+1)/4]) for i in range(4)])
    show(egg)
︡e0be7776-dca7-4d2a-aafa-b8c6848acc74︡{"stdout":"(s, t)\n"}︡{"interact":{"style":"None","flicker":false,"layout":[[["band_number",12,null]],[["current_color",12,null]],[["auto_update",12,null]],[["",12,null]]],"id":"3118d83e-4a19-4f66-8463-a9ecd111fff0","controls":[{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["1","2","3","4"],"label":"band_number","nrows":null,"width":null,"var":"band_number"},{"widget":null,"control_type":"color-selector","hide_box":false,"Color":"<class 'sage.plot.colors.Color'>","label":"current_color","default":"#ff0000","readonly":false,"var":"current_color"},{"default":false,"var":"auto_update","readonly":false,"control_type":"checkbox","label":"auto_update"}]}}︡
︠642ea26f-d386-4ea8-9d72-8bd73d4afabe︠










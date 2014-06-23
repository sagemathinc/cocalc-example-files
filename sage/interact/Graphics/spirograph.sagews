︠8ff8ea7d-e390-4cb1-9011-d8f99a23f610i︠
#---------------------------#
# Javier Pérez Lázaro       #
# Logroño (Spain)           #
# javier.perezl@unirioja.es #
#---------------------------#

#introduction

html('<h1><center>Spirograph</center></h1>')
text1='Spirograph is a tool for drawing hypotrochoids and epitrochoids.'
text2='Assume that a A is a point attached to a circle. A can be attached to the boundary of the circle or to any exterior or interior place. If the circle rolls around the outside of a fixed circle, the curve traced by the point A is called an epitrochoid. In case the circle rolls around the inside of a fixed circle, the curve is an hypotrochoid.'
text3='If the quotient between the radii of the circles is a rational number, then the curves are periodic.'

#the code

@interact
def fun(
tex1=text_control(text1), tex2=text_control(text2), tex3=text_control(text3),
h=('Select:',list(['epitrochoid','hypotrochoid'])),
tex4=text_control('Radius of the circle. Should be a rational number with shape p/q.'),
b=input_box(default=7/30,label='radius'),
tex5=text_control("Rate between the distance of the point to the circle's center and the radius."),
rate=input_box(default=1),
u=selector(['Plot the curve. Slider of % below enabled.',
'Build an animation of the plot with the number of frames specified below.'],label='Choose:'),
per=slider(0,100,1,default=100,label='graph %'),
frames=100,
cir_bool=checkbox(True, "Show circles?"),
auto_update=false):
    draw=True
    if h=='hypotrochoid' and (b>=1 or b<=0):
        print "In a hypotrochoid, radius must be between 0 and 1."
        draw=False
    if h=='epitrochoid' and b<=0:
        print "In a epitrochoid, radius must be positive"
        draw=False
    if draw==True:
        if h=='hypotrochoid': b=-b 
        var('t')
        cx=(1+b)*cos(t*b/(1+b))
        cy=(1+b)*sin(t*b/(1+b))
        px=cx-b*rate*cos(t)
        py=cy-b*rate*sin(t)
        axeM=1+max([0,b+abs(b)*rate])
        if u=='Plot the curve. Slider of % below enabled.':
            tMax=pi*denominator(b/(b+1))*per/50
            L=parametric_plot((px,py),(t,0,max([0.001,tMax])),plot_points=10*rate*tMax)
            if cir_bool: 
                p=point((px(t=tMax),py(t=tMax)),pointsize=30,color='blue')
                c=point((cx(t=tMax),cy(t=tMax)),pointsize=30,color='red')
                cir=circle((cx(t=tMax),cy(t=tMax)),b,color='red')
                lin=line([(cx(t=tMax),cy(t=tMax)),(px(t=tMax),py(t=tMax))])
                L+=circle((0,0),1)+cir+lin+p+c    
            show(L,aspect_ratio=1,xmin=-axeM,xmax=axeM,ymin=-axeM,ymax=axeM)
        if u=='Build an animation of the plot with the number of frames specified below.':
            tMax=2*pi*denominator(b/(b+1))
            step=tMax/(frames-1)
            curva=Graphics()
            v=[]
            for a in srange(step,tMax,step):
                curva+=parametric_plot((px,py),(t,a-step,a))
                L=curva
                if cir_bool:
                    cx_a=cx(t=a)
                    cy_a=cy(t=a)
                    px_a=cx_a-b*rate*cos(a)
                    py_a=cy_a-b*rate*sin(a)
                    p=point((px_a,py_a),pointsize=30,color='blue')
                    c=point((cx_a,cy_a),pointsize=30,color='red')
                    cir=circle((cx_a,cy_a),b,color='red')
                    lin=line([(cx_a,cy_a),(px_a,py_a)])
                    L+=circle((0,0),1)+cir+lin+c+p         
                v.append(L)
            animate(v,xmin=-axeM,xmax=axeM,ymin=-axeM,ymax=axeM,aspect_ratio=1).show()
︡6fa193b6-79ef-4356-abb3-2f825ea6ba61︡{"html":"<h1><center>Spirograph</center></h1>"}︡{"interact":{"style":"None","flicker":false,"layout":[[["tex1",12,null]],[["tex2",12,null]],[["tex3",12,null]],[["h",12,null]],[["tex4",12,null]],[["b",12,null]],[["tex5",12,null]],[["rate",12,null]],[["u",12,null]],[["per",12,null]],[["frames",12,null]],[["cir_bool",12,null]],[["auto_update",12,null]],[["",12,null]]],"id":"418bbcd2-a285-4c6f-8400-1da1331a148d","controls":[{"default":"Spirograph is a tool for drawing hypotrochoids and epitrochoids.","var":"tex1","classes":null,"control_type":"text","label":"tex1"},{"default":"Assume that a A is a point attached to a circle. A can be attached to the boundary of the circle or to any exterior or interior place. If the circle rolls around the outside of a fixed circle, the curve traced by the point A is called an epitrochoid. In case the circle rolls around the inside of a fixed circle, the curve is an hypotrochoid.","var":"tex2","classes":null,"control_type":"text","label":"tex2"},{"default":"If the quotient between the radii of the circles is a rational number, then the curves are periodic.","var":"tex3","classes":null,"control_type":"text","label":"tex3"},{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["epitrochoid","hypotrochoid"],"label":"Select:","nrows":null,"width":null,"var":"h"},{"default":"Radius of the circle. Should be a rational number with shape p/q.","var":"tex4","classes":null,"control_type":"text","label":"tex4"},{"control_type":"input-box","default":"7/30","label":"radius","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"b","type":null},{"default":"Rate between the distance of the point to the circle's center and the radius.","var":"tex5","classes":null,"control_type":"text","label":"tex5"},{"control_type":"input-box","default":1,"label":"rate","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"rate","type":null},{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["Plot the curve. Slider of % below enabled.","Build an animation of the plot with the number of frames specified below."],"label":"Choose:","nrows":null,"width":null,"var":"u"},{"control_type":"slider","default":100,"var":"per","width":null,"vals":["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"],"animate":true,"label":"graph %","display_value":true},{"control_type":"input-box","default":100,"label":"frames","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"frames","type":null},{"default":true,"var":"cir_bool","readonly":false,"control_type":"checkbox","label":"Show circles?"},{"default":false,"var":"auto_update","readonly":false,"control_type":"checkbox","label":"auto_update"}]}}︡
︠ae67bd56-b326-420a-be1c-b6f4f0d63487︠










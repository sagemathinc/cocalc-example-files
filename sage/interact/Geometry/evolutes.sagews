︠729af806-0262-4301-9a54-9a277f7c68cd︠
var('t');
def norma(v):
    return sqrt(sum(x^2 for x in v))    
paso_angulo=5

@interact
def _( gamma1=input_box(default=sin(t)), gamma2=input_box(default=1.3*cos(t)),
    draw_normal_lines=True, 
    rango_angulos=range_slider(0,360,paso_angulo,(0,90),label='Draw lines for these angles'), 
    draw_osculating_circle=True, 
    t0=input_box(default=pi/3,label='parameter value for the osculating circle'), 
    auto_update=False ):
        
    gamma=(gamma1,gamma2)
    gammap=(gamma[0].derivative(),gamma[1].derivative())
    np=norma(gammap)
    gammapp=(gammap[0].derivative(),gammap[1].derivative())
    npp=norma(gammapp)

    normal=(gammap[1]/np, -gammap[0]/np)    
    curvatura=(gammap[1]*gammapp[0]-gammap[0]*gammapp[1])/norma(gammap)^3
    radio=1/curvatura
        
    centros=(gamma[0]+radio*normal[0],gamma[1]+radio*normal[1])
            
    curva=parametric_plot(gamma,(t,0,2*pi))
    evoluta=parametric_plot(centros,(t,0,2*pi), color='red')
    grafica=curva+evoluta

    if draw_normal_lines:
        f=2*pi/360
        lineas=sum(line2d( [ (gamma[0](t=i*f), gamma[1](t=i*f)), 
                             (centros[0](t=i*f), centros[1](t=i*f)) ], 
                           thickness=1,rgbcolor=(1,0.8,0.8)) 
                   for i in range(rango_angulos[0], rango_angulos[1]+paso_angulo, paso_angulo))
        grafica+=lineas
    
    if draw_osculating_circle and 0<t0<2*pi:
        punto=point((gamma[0](t=t0), gamma[1](t=t0)), rgbcolor=hue(0),pointsize=30)
        circulo=circle( (centros[0](t=t0), centros[1](t=t0)), radio(t=t0) )  
        grafica+=punto+circulo

    show(grafica,aspect_ratio=1,xmin=-2,xmax=2,ymin=-2,ymax=2)
︡87573a92-97a2-4c12-817c-be09f940f48c︡{"stdout":"t\n"}︡{"interact":{"style":"None","flicker":false,"layout":[[["gamma1",12,null]],[["gamma2",12,null]],[["draw_normal_lines",12,null]],[["rango_angulos",12,null]],[["draw_osculating_circle",12,null]],[["t0",12,null]],[["auto_update",12,null]],[["",12,null]]],"id":"ac3bb46f-8b06-45d6-bc33-54e660aedc56","controls":[{"control_type":"input-box","default":"sin(t)","label":"gamma1","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"gamma1","type":null},{"control_type":"input-box","default":"1.30000000000000*cos(t)","label":"gamma2","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"gamma2","type":null},{"default":true,"var":"draw_normal_lines","readonly":false,"control_type":"checkbox","label":"draw_normal_lines"},{"control_type":"range-slider","default":[0,18],"var":"rango_angulos","width":null,"vals":["0","5","10","15","20","25","30","35","40","45","50","55","60","65","70","75","80","85","90","95","100","105","110","115","120","125","130","135","140","145","150","155","160","165","170","175","180","185","190","195","200","205","210","215","220","225","230","235","240","245","250","255","260","265","270","275","280","285","290","295","300","305","310","315","320","325","330","335","340","345","350","355","360"],"animate":true,"label":"Draw lines for these angles","display_value":true},{"default":true,"var":"draw_osculating_circle","readonly":false,"control_type":"checkbox","label":"draw_osculating_circle"},{"control_type":"input-box","default":"1/3*pi","label":"parameter value for the osculating circle","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"t0","type":null},{"default":false,"var":"auto_update","readonly":false,"control_type":"checkbox","label":"auto_update"}]}}︡
︠a9a371b9-2e5f-475f-b28a-54f3d4812c80︠










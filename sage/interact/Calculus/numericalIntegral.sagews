︠2709cb2b-d18b-44dc-b0e6-f695ffec5820︠
# by Nick Alexander (based on the work of Marshall Hampton)

var('x')
@interact
def midpoint(f = input_box(default = sin(x^2) + 2, type = SR),
    interval=range_slider(0, 10, 1, default=(0, 4), label="Interval"),
    number_of_subdivisions = slider(1, 20, 1, default=4, label="Number of boxes"),
    endpoint_rule = selector(['Midpoint', 'Left', 'Right', 'Upper', 'Lower'], nrows=1, label="Endpoint rule")):

    a, b = map(QQ, interval)
    t = sage.calculus.calculus.var('t')
    func = fast_callable(f(x=t), RDF, vars=[t])
    dx = ZZ(b-a)/ZZ(number_of_subdivisions)
   
    xs = []
    ys = []
    for q in range(number_of_subdivisions):
        if endpoint_rule == 'Left':
            xs.append(q*dx + a)
        elif endpoint_rule == 'Midpoint':
            xs.append(q*dx + a + dx/2)
        elif endpoint_rule == 'Right':
            xs.append(q*dx + a + dx)
        elif endpoint_rule == 'Upper':
            x = sage.numerical.optimize.find_local_maximum(func, q*dx + a, q*dx + dx + a)[1]
            xs.append(x)
        elif endpoint_rule == 'Lower':
            x = sage.numerical.optimize.find_local_minimum(func, q*dx + a, q*dx + dx + a)[1]
            xs.append(x)
    ys = [ func(x) for x in xs ]
         
    rects = Graphics()
    for q in range(number_of_subdivisions):
        xm = q*dx + dx/2 + a
        x = xs[q]
        y = ys[q]
        rects += line([[xm-dx/2,0],[xm-dx/2,y],[xm+dx/2,y],[xm+dx/2,0]], rgbcolor = (1,0,0))
        rects += point((x, y), rgbcolor = (1,0,0))
    min_y = min(0, sage.numerical.optimize.find_local_minimum(func,a,b)[0])
    max_y = max(0, sage.numerical.optimize.find_local_maximum(func,a,b)[0])

    # html('<h3>Numerical integrals with the midpoint rule</h3>')
    show(plot(func,a,b) + rects, xmin = a, xmax = b, ymin = min_y, ymax = max_y)
    
    def cap(x):
        # print only a few digits of precision
        if x < 1e-4:
            return 0
        return RealField(20)(x)
    sum_html = "%s \cdot \\left[ %s \\right]" % (dx, ' + '.join([ "f(%s)" % cap(i) for i in xs ]))
    num_html = "%s \cdot \\left[ %s \\right]" % (dx, ' + '.join([ str(cap(i)) for i in ys ]))
    
    numerical_answer = integral_numerical(func,a,b,max_points = 200)[0]
    estimated_answer = dx * sum([ ys[q] for q in range(number_of_subdivisions)])

    html(r'''
    <div class="math">
    \begin{align*}
      \int_{a}^{b} {f(x) \, dx} & = %s \\\
      \sum_{i=1}^{%s} {f(x_i) \, \Delta x}
      & = %s \\\
      & = %s \\\
      & = %s .
    \end{align*}
    </div>
    ''' % (numerical_answer, number_of_subdivisions, sum_html, num_html, estimated_answer))
︡857bfce8-46f1-4e94-92c7-8bd394a20802︡{"stdout":"x\n"}︡{"interact":{"style":"None","flicker":false,"layout":[[["f",12,null]],[["interval",12,null]],[["number_of_subdivisions",12,null]],[["endpoint_rule",12,null]],[["",12,null]]],"id":"a1426232-27d8-4729-86cc-ac5c673a11aa","controls":[{"control_type":"input-box","default":"sin(x^2) + 2","label":"f","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"f","type":"Symbolic Ring"},{"control_type":"range-slider","default":[0,4],"var":"interval","width":null,"vals":["0","1","2","3","4","5","6","7","8","9","10"],"animate":true,"label":"Interval","display_value":true},{"control_type":"slider","default":3,"var":"number_of_subdivisions","width":null,"vals":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"],"animate":true,"label":"Number of boxes","display_value":true},{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["Midpoint","Left","Right","Upper","Lower"],"label":"Endpoint rule","nrows":1,"width":null,"var":"endpoint_rule"}]}}︡
︠23d5dd3a-9094-4966-8bd3-7fa4e149d7cd︠










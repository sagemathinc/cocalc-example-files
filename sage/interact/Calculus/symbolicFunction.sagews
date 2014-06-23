︠bf07e914-c585-4e76-a124-d524cf76484c︠
x = var('x')
@interact
def _(f=sin(x), g=cos(x), xrange=input_box((0,1)), yrange='auto', a=1,
      action=selector(['f', 'df/dx', 'int f', 'num f', 'den f', '1/f', 'finv',
                       'f+a', 'f-a', 'f*a', 'f/a', 'f^a', 'f(x+a)', 'f(x*a)',
                       'f+g', 'f-g', 'f*g', 'f/g', 'f(g)'],
             width=15, nrows=5, label="h = "),
      do_plot = ("Draw Plots", True)):
    try:
        f = SR(f); g = SR(g); a = SR(a)
    except TypeError, msg:
        print msg[-200:]
        print "Unable to make sense of f,g, or a as symbolic expressions."
        return
    if not (isinstance(xrange, tuple) and len(xrange) == 2):
          xrange = (0,1)
    h = 0; lbl = ''
    if action == 'f':
        h = f
        lbl = 'f'
    elif action == 'df/dx':
        h = f.derivative(x)
        lbl = '\\frac{df}{dx}'
    elif action == 'int f':
        h = f.integrate(x)
        lbl = '\\int f dx'
    elif action == 'num f':
        h = f.numerator()
        lbl = '\\text{numer(f)}'
    elif action == 'den f':
        h = f.denominator()
        lbl = '\\text{denom(f)}'
    elif action == '1/f':
        h = 1/f
        lbl = '\\frac{1}{f}'
    elif action == 'finv':
        h = solve(f == var('y'), x)[0].rhs()
        lbl = 'f^{-1}(y)'
    elif action == 'f+a':
        h = f+a
        lbl = 'f + a'
    elif action == 'f-a':
        h = f-a
        lbl = 'f - a'
    elif action == 'f*a':
        h = f*a
        lbl = 'f \\times a'
    elif action == 'f/a':
        h = f/a
        lbl = '\\frac{f}{a}'
    elif action == 'f^a':
        h = f^a
        lbl = 'f^a'
    elif action == 'f^a':
        h = f^a
        lbl = 'f^a'
    elif action == 'f(x+a)':
        h = f(x+a)
        lbl = 'f(x+a)'
    elif action == 'f(x*a)':
        h = f(x*a)
        lbl = 'f(xa)'
    elif action == 'f+g':
        h = f+g
        lbl = 'f + g'
    elif action == 'f-g':
        h = f-g
        lbl = 'f - g'
    elif action == 'f*g':
        h = f*g
        lbl = 'f \\times g'
    elif action == 'f/g':
        h = f/g
        lbl = '\\frac{f}{g}'
    elif action == 'f(g)':
        h = f(g)
        lbl = 'f(g)'
    html('<center><font color="red">$f = %s$</font></center>'%latex(f))
    html('<center><font color="green">$g = %s$</font></center>'%latex(g))
    html('<center><font color="blue"><b>$h = %s = %s$</b></font></center>'%(lbl, latex(h)))
    if do_plot:
        P = plot(f, xrange, color='red', thickness=2) +  \
            plot(g, xrange, color='green', thickness=2) + \
            plot(h, xrange, color='blue', thickness=2)
        if yrange == 'auto':
            show(P, xmin=xrange[0], xmax=xrange[1])
        else:
            yrange = sage_eval(yrange)
            show(P, xmin=xrange[0], xmax=xrange[1], ymin=yrange[0], ymax=yrange[1])
︡f03d3abd-3474-4188-91fa-e84b45d6c1a7︡{"interact":{"style":"None","flicker":false,"layout":[[["f",12,null]],[["g",12,null]],[["xrange",12,null]],[["yrange",12,null]],[["a",12,null]],[["action",12,null]],[["do_plot",12,null]],[["",12,null]]],"id":"be75648d-7fd7-4e54-93a4-ec1da9dc8573","controls":[{"control_type":"input-box","default":"sin(x)","label":"f","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"f","type":null},{"control_type":"input-box","default":"cos(x)","label":"g","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"g","type":null},{"control_type":"input-box","default":"(0, 1)","label":"xrange","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"xrange","type":null},{"control_type":"input-box","default":"auto","label":"yrange","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"yrange","type":"<type 'str'>"},{"control_type":"input-box","default":1,"label":"a","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"a","type":null},{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["f","df/dx","int f","num f","den f","1/f","finv","f+a","f-a","f*a","f/a","f^a","f(x+a)","f(x*a)","f+g","f-g","f*g","f/g","f(g)"],"label":"h = ","nrows":5,"width":15,"var":"action"},{"default":true,"var":"do_plot","readonly":false,"control_type":"checkbox","label":"Draw Plots"}]}}︡
︠3b1e4c98-654f-4ce4-b75b-a3c728ad49b0︠










︠c7dee65e-2759-4eb2-8927-50ebe1210c23︠
def ImpEulerMethod(xstart, ystart, xfinish, nsteps, f):
    sol = [ystart]
    xvals = [xstart]
    h = N((xfinish-xstart)/nsteps)
    for step in range(nsteps):
        k1 = f(xvals[-1],sol[-1])
        k2 = f(xvals[-1] + h,sol[-1] + k1*h)
        sol.append(sol[-1] + h*(k1+k2)/2)
        xvals.append(xvals[-1] + h)
    return zip(xvals,sol)
def RK4Method(xstart, ystart, xfinish, nsteps, f):
    sol = [ystart]
    xvals = [xstart]
    h = N((xfinish-xstart)/nsteps)
    for step in range(nsteps):
        k1 = f(xvals[-1],sol[-1])
        k2 = f(xvals[-1] + h/2,sol[-1] + k1*h/2)
        k3 = f(xvals[-1] + h/2,sol[-1] + k2*h/2)
        k4 = f(xvals[-1] + h,sol[-1] + k3*h)
        sol.append(sol[-1] + h*(k1+2*k2+2*k3+k4)/6)
        xvals.append(xvals[-1] + h)
    return zip(xvals,sol)
def tab_list(y, headers = None):
    '''
    Converts a list into an html table with borders.
    '''
    s = '<table border = 1>'
    if headers:
        for q in headers:
            s = s + '<th>' + str(q) + '</th>'
    for x in y:
        s = s + '<tr>'
        for q in x:
            s = s + '<td>' + str(q) + '</td>'
        s = s + '</tr>'
    s = s + '</table>'
    return s
var('x, y')
@interact
def euler_method(q = range_slider(0,10,.1,(0,6),'x range'), y_exact_in = input_box('-cos(x)+2.0', type = str, label = 'Exact solution = '), y_prime_in = input_box('sin(x)', type = str, label = "y' = "), startval = input_box(1.0, label = 'Starting value for y: '), nsteps = slider([2^m for m in range(0,10)], default = 10, label = 'Number of steps: '), show_steps = slider([2^m for m in range(0,10)], default = 8, label = 'Number of steps shown in table: ')):
    start = q[0]
    stop = q[1]
    y_exact = lambda x: eval(y_exact_in)
    y_prime = lambda x,y: eval(y_prime_in)
    stepsize = float((stop-start)/nsteps)
    steps_shown = min(nsteps,show_steps)
    sol2 = ImpEulerMethod(start, startval, stop, nsteps, y_prime)
    sol3 = RK4Method(start, startval, stop, nsteps, y_prime)
    sol = [startval]
    xvals = [start]
    for step in range(nsteps):
        sol.append(sol[-1] + stepsize*y_prime(xvals[-1],sol[-1]))
        xvals.append(xvals[-1] + stepsize)
    sol_max = max(sol + [sage.numerical.optimize.find_local_maximum(y_exact,start,stop)[0]])
    sol_min = min(sol + [sage.numerical.optimize.find_local_minimum(y_exact,start,stop)[0]])
    slopes = plot_slope_field(y_prime(x=x,y=y), (start,stop), (sol_min, sol_max))
    exact_plot = plot(y_exact(x),start,stop,rgbcolor=(1,0,0))
    euler_plot = line([[xvals[index],sol[index]] for index in range(len(sol))])
    rk4_plot = line(sol3, rgbcolor = (0,0,.125))
    imp_plot = line(sol2, rgbcolor = (1,0,1))
    show(slopes +exact_plot + euler_plot + imp_plot+ rk4_plot,xmin=start,xmax = stop, ymax = sol_max, ymin = sol_min)
    if nsteps < steps_shown:
        table_range = range(len(sol))
    else:
        table_range = range(0,floor(steps_shown/2)) + range(len(sol)-floor(steps_shown/2),len(sol))
    html(tab_list([[i,xvals[i],sol[i],sol2[i][1],sol3[i][1],y_exact(xvals[i])] for i in table_range], headers = ['step','x','<font color="#0000FF">Euler</font>','<font color="#FF00FF">Imp. Euler</font>', '<font color="#0000bb">RK4</font>','<font color="#FF0000">Exact</font>']))
︡53702f88-75f6-4c0f-8cdf-8046e8324856︡{"stdout":"(x, y)\n"}︡{"interact":{"style":"None","flicker":false,"layout":[[["q",12,null]],[["y_exact_in",12,null]],[["y_prime_in",12,null]],[["startval",12,null]],[["nsteps",12,null]],[["show_steps",12,null]],[["",12,null]]],"id":"9c90b1e7-58b1-4676-8d7c-41d2c53b7339","controls":[{"control_type":"range-slider","default":[0,60],"var":"q","width":null,"vals":["0.000000000000000","0.100000000000000","0.200000000000000","0.300000000000000","0.400000000000000","0.500000000000000","0.600000000000000","0.700000000000000","0.800000000000000","0.900000000000000","1.00000000000000","1.10000000000000","1.20000000000000","1.30000000000000","1.40000000000000","1.50000000000000","1.60000000000000","1.70000000000000","1.80000000000000","1.90000000000000","2.00000000000000","2.10000000000000","2.20000000000000","2.30000000000000","2.40000000000000","2.50000000000000","2.60000000000000","2.70000000000000","2.80000000000000","2.90000000000000","3.00000000000000","3.10000000000000","3.20000000000000","3.30000000000000","3.40000000000000","3.50000000000000","3.60000000000000","3.70000000000000","3.80000000000000","3.90000000000000","4.00000000000000","4.10000000000000","4.20000000000000","4.30000000000000","4.40000000000000","4.50000000000000","4.60000000000000","4.70000000000000","4.80000000000000","4.90000000000000","5.00000000000000","5.10000000000000","5.20000000000000","5.30000000000000","5.40000000000000","5.50000000000000","5.60000000000000","5.70000000000000","5.80000000000000","5.90000000000000","5.99999999999999","6.09999999999999","6.19999999999999","6.29999999999999","6.39999999999999","6.49999999999999","6.59999999999999","6.69999999999999","6.79999999999999","6.89999999999999","6.99999999999999","7.09999999999999","7.19999999999999","7.29999999999999","7.39999999999999","7.49999999999999","7.59999999999999","7.69999999999999","7.79999999999999","7.89999999999999","7.99999999999999","8.09999999999999","8.19999999999999","8.29999999999999","8.39999999999999","8.49999999999999","8.59999999999999","8.69999999999999","8.79999999999998","8.89999999999998","8.99999999999998","9.09999999999998","9.19999999999998","9.29999999999998","9.39999999999998","9.49999999999998","9.59999999999998","9.69999999999998","9.79999999999998","9.89999999999998","10.0000000000000"],"animate":true,"label":"x range","display_value":true},{"control_type":"input-box","default":"-cos(x)+2.0","label":"Exact solution = ","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"y_exact_in","type":"<type 'str'>"},{"control_type":"input-box","default":"sin(x)","label":"y' = ","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"y_prime_in","type":"<type 'str'>"},{"control_type":"input-box","default":"1.00000000000000","label":"Starting value for y: ","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"startval","type":null},{"control_type":"slider","default":3,"var":"nsteps","width":null,"vals":["1","2","4","8","16","32","64","128","256","512"],"animate":true,"label":"Number of steps: ","display_value":true},{"control_type":"slider","default":3,"var":"show_steps","width":null,"vals":["1","2","4","8","16","32","64","128","256","512"],"animate":true,"label":"Number of steps shown in table: ","display_value":true}]}}︡
︠c1176c75-63a2-4dfa-b0fd-64c6638c40b6︠










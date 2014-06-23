︠e3897f01-cde7-43b8-b99b-717d3bee244e︠
def cobweb(a_function, start, mask = 0, iterations = 20, xmin = 0, xmax = 1):
    '''
    Returns a graphics object of a plot of the function and a cobweb trajectory starting from the value start.

    INPUT:
        a_function: a function of one variable
        start: the starting value of the iteration
        mask: (optional) the number of initial iterates to ignore
        iterations: (optional) the number of iterations to draw, following the masked iterations
        xmin: (optional) the lower end of the plotted interval
        xmax: (optional) the upper end of the plotted interval
    
    EXAMPLES:
        sage: f = lambda x: 3.9*x*(1-x)
        sage: show(cobweb(f,.01,iterations=200), xmin = 0, xmax = 1, ymin=0)
    
    '''
    basic_plot = plot(a_function, xmin = xmin, xmax = xmax)
    id_plot = plot(lambda x: x, xmin = xmin, xmax = xmax)
    iter_list = []
    current = start
    for i in range(mask):
        current = a_function(current)
    for i in range(iterations):
        iter_list.append([current,a_function(current)])
        current = a_function(current)
        iter_list.append([current,current])
    cobweb = line(iter_list, rgbcolor = (1,0,0))
    return basic_plot + id_plot + cobweb
var('x')
@interact
def cobwebber(f_text = input_box(default = "3.8*x*(1-x)",label = "function", type=str), start_val = slider(0,1,.01,.5,label = 'start value'), its = slider([2^i for i in range(0,12)],default = 16, label="iterations")):
    def f(x):
        return eval(f_text)
    show(cobweb(f, start_val, iterations = its))
︡a2fc8368-39a5-48e2-8d95-2d68ffab3137︡{"stdout":"x\n"}︡{"interact":{"style":"None","flicker":false,"layout":[[["f_text",12,null]],[["start_val",12,null]],[["its",12,null]],[["",12,null]]],"id":"45bd2633-5c49-4a11-b1b6-70a0999f5174","controls":[{"control_type":"input-box","default":"3.8*x*(1-x)","label":"function","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"f_text","type":"<type 'str'>"},{"control_type":"slider","default":50,"var":"start_val","width":null,"vals":["0.000000000000000","0.0100000000000000","0.0200000000000000","0.0300000000000000","0.0400000000000000","0.0500000000000000","0.0600000000000000","0.0700000000000000","0.0800000000000000","0.0900000000000000","0.100000000000000","0.110000000000000","0.120000000000000","0.130000000000000","0.140000000000000","0.150000000000000","0.160000000000000","0.170000000000000","0.180000000000000","0.190000000000000","0.200000000000000","0.210000000000000","0.220000000000000","0.230000000000000","0.240000000000000","0.250000000000000","0.260000000000000","0.270000000000000","0.280000000000000","0.290000000000000","0.300000000000000","0.310000000000000","0.320000000000000","0.330000000000000","0.340000000000000","0.350000000000000","0.360000000000000","0.370000000000000","0.380000000000000","0.390000000000000","0.400000000000000","0.410000000000000","0.420000000000000","0.430000000000000","0.440000000000000","0.450000000000000","0.460000000000000","0.470000000000000","0.480000000000000","0.490000000000000","0.500000000000000","0.510000000000000","0.520000000000000","0.530000000000000","0.540000000000000","0.550000000000000","0.560000000000000","0.570000000000000","0.580000000000000","0.590000000000000","0.600000000000000","0.610000000000000","0.620000000000000","0.630000000000000","0.640000000000000","0.650000000000000","0.660000000000000","0.670000000000000","0.680000000000000","0.690000000000000","0.700000000000000","0.710000000000000","0.720000000000000","0.730000000000000","0.740000000000000","0.750000000000000","0.760000000000000","0.770000000000000","0.780000000000000","0.790000000000000","0.800000000000000","0.810000000000000","0.820000000000001","0.830000000000001","0.840000000000001","0.850000000000001","0.860000000000001","0.870000000000001","0.880000000000001","0.890000000000001","0.900000000000001","0.910000000000001","0.920000000000001","0.930000000000001","0.940000000000001","0.950000000000001","0.960000000000001","0.970000000000001","0.980000000000001","0.990000000000001","1.00000000000000"],"animate":true,"label":"start value","display_value":true},{"control_type":"slider","default":4,"var":"its","width":null,"vals":["1","2","4","8","16","32","64","128","256","512","1024","2048"],"animate":true,"label":"iterations","display_value":true}]}}︡
︠d24975bc-97ac-4971-a7ef-90799f491c07︠










︠acc4bd1c-70ab-4f4d-a875-b683d99a6ab9i︠
npi = RDF(pi)
from math import cos,sin
def rot(t):
    return matrix([[cos(t),sin(t)],[-sin(t),cos(t)]])

def pursuit(n,x0,y0,lamb,steps = 100, threshold = .01):
    paths = [[[x0,y0]]]
    for i in range(1,n):
        rx,ry = list(rot(2*npi*i/n)*vector([x0,y0]))
        paths.append([[rx,ry]])
    oldpath = [x[-1] for x in paths]
    for q in range(steps):
        diffs = [[oldpath[(j+1)%n][0]-oldpath[j][0],oldpath[(j+1)%n][1]-oldpath[j][1]] for j in range(n)]
        npath = [[oldpath[j][0]+lamb*diffs[j][0],oldpath[j][1]+lamb*diffs[j][1]] for j in range(n)]
        for j in range(n):
            paths[j].append(npath[j])
        oldpath = npath
    return paths
html('<h3>Curves of Pursuit</h3>')
@interact
def curves_of_pursuit(n = slider([2..20],default = 5, label="# of points"),steps = slider([floor(1.4^i) for i in range(2,18)],default = 10, label="# of steps"), stepsize = slider(srange(.01,1,.01),default = .2, label="stepsize"), colorize = selector(['BW','Line color', 'Filled'],default = 'BW')):
    outpaths = pursuit(n,0,1,stepsize, steps = steps)
    mcolor = (0,0,0)
    outer = line([q[0] for q in outpaths]+[outpaths[0][0]], rgbcolor = mcolor)
    polys = Graphics()
    if colorize=='Line color':
        colors = [hue(j/steps,1,1) for j in range(len(outpaths[0]))]
    elif colorize == 'BW':
        colors = [(0,0,0) for j in range(len(outpaths[0]))]
    else:
        colors = [hue(j/steps,1,1) for j in range(len(outpaths[0]))]
        polys = sum([polygon([outpaths[(i+1)%n][j+1],outpaths[(i+1)%n][j], outpaths[i][j+1]], rgbcolor = colors[j]) for i in range(n) for j in range(len(outpaths[0])-1)])
        #polys = polys[0]
        colors = [(0,0,0) for j in range(len(outpaths[0]))]
    nested = sum([line([q[j] for q in outpaths]+[outpaths[0][j]], rgbcolor = colors[j]) for j in range(len(outpaths[0]))])
    lpaths = [line(x, rgbcolor = mcolor) for x in outpaths]
    show(sum(lpaths)+nested+polys, axes = False, figsize = [5,5], xmin = -1, xmax = 1, ymin = -1, ymax =1)
︡5eeeeacb-123a-4a2e-a23d-8ca02cea2c92︡{"html":"<h3>Curves of Pursuit</h3>"}︡{"interact":{"style":"None","flicker":false,"layout":[[["n",12,null]],[["steps",12,null]],[["stepsize",12,null]],[["colorize",12,null]],[["",12,null]]],"id":"eb9e7639-1c4b-4781-822d-afa011573a45","controls":[{"control_type":"slider","default":3,"var":"n","width":null,"vals":["2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"],"animate":true,"label":"# of points","display_value":true},{"control_type":"slider","default":5,"var":"steps","width":null,"vals":["1","2","3","5","7","10","14","20","28","40","56","79","111","155","217","304"],"animate":true,"label":"# of steps","display_value":true},{"control_type":"slider","default":19,"var":"stepsize","width":null,"vals":["0.0100000000000000","0.0200000000000000","0.0300000000000000","0.0400000000000000","0.0500000000000000","0.0600000000000000","0.0700000000000000","0.0800000000000000","0.0900000000000000","0.100000000000000","0.110000000000000","0.120000000000000","0.130000000000000","0.140000000000000","0.150000000000000","0.160000000000000","0.170000000000000","0.180000000000000","0.190000000000000","0.200000000000000","0.210000000000000","0.220000000000000","0.230000000000000","0.240000000000000","0.250000000000000","0.260000000000000","0.270000000000000","0.280000000000000","0.290000000000000","0.300000000000000","0.310000000000000","0.320000000000000","0.330000000000000","0.340000000000000","0.350000000000000","0.360000000000000","0.370000000000000","0.380000000000000","0.390000000000000","0.400000000000000","0.410000000000000","0.420000000000000","0.430000000000000","0.440000000000000","0.450000000000000","0.460000000000000","0.470000000000000","0.480000000000000","0.490000000000000","0.500000000000000","0.510000000000000","0.520000000000000","0.530000000000000","0.540000000000000","0.550000000000000","0.560000000000000","0.570000000000000","0.580000000000000","0.590000000000000","0.600000000000000","0.610000000000000","0.620000000000000","0.630000000000000","0.640000000000000","0.650000000000000","0.660000000000000","0.670000000000000","0.680000000000000","0.690000000000000","0.700000000000000","0.710000000000000","0.720000000000000","0.730000000000000","0.740000000000000","0.750000000000000","0.760000000000000","0.770000000000000","0.780000000000000","0.790000000000000","0.800000000000000","0.810000000000000","0.820000000000001","0.830000000000001","0.840000000000001","0.850000000000001","0.860000000000001","0.870000000000001","0.880000000000001","0.890000000000001","0.900000000000001","0.910000000000001","0.920000000000001","0.930000000000001","0.940000000000001","0.950000000000001","0.960000000000001","0.970000000000001","0.980000000000001","0.990000000000001"],"animate":true,"label":"stepsize","display_value":true},{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["BW","Line color","Filled"],"label":"colorize","nrows":null,"width":null,"var":"colorize"}]}}︡
︠6e94449f-b403-4213-9bce-2ae319c3e466︠










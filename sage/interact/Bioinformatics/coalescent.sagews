︠02a6d748-c6f5-4994-9457-bd6dfc762bee︠
def next_gen(x, selection=1.0):
    '''Creates the next generation from the previous; also returns parent-child indexing list'''
    next_x = []
    for ind in range(len(x)):
        if random() < (1 + selection)/len(x):
            rind = 0
        else:
            rind = int(round(random()*(len(x)-1)+1/2))
        next_x.append((x[rind],rind))
    next_x.sort()
    return [[x[0] for x in next_x],[x[1] for x in next_x]]
def coal_plot(some_data):
    '''Creates a graphics object from coalescent data'''
    gens = some_data[0]
    inds = some_data[1]
    gen_lines = line([[0,0]])
    pts = Graphics()
    ngens = len(gens)
    gen_size = len(gens[0])
    for x in range(gen_size):
        pts += point((x,ngens-1), hue = gens[0][x]/float(gen_size*1.1))
    p_frame = line([[-.5,-.5],[-.5,ngens-.5], [gen_size-.5,ngens-.5], [gen_size-.5,-.5], [-.5,-.5]])
    for g in range(1,ngens):
        for x in range(gen_size):
            old_x = inds[g-1][x]
            gen_lines += line([[x,ngens-g-1],[old_x,ngens-g]], hue = gens[g-1][old_x]/float(gen_size*1.1))
            pts += point((x,ngens-g-1), hue = gens[g][x]/float(gen_size*1.1))
    return pts+gen_lines+p_frame
d_field = RealField(10)
@interact
def coalescents(pop_size = slider(2,100,1,15,'Population size'), selection = slider(-1,1,.1,0, 'Selection for first taxon'), s = selector(['Again!'], label='Refresh', buttons=True)):
    print 'Population size: ' + str(pop_size)
    print 'Selection coefficient for first taxon: ' + str(d_field(selection))
    start = [i for i in range(pop_size)]
    gens = [start]
    inds = []
    while gens[-1][0] != gens[-1][-1]:
        g_index = len(gens) - 1
        n_gen = next_gen(gens[g_index], selection = selection)
        gens.append(n_gen[0])
        inds.append(n_gen[1])
        coal_data1 = [gens,inds]
    print 'Generations until coalescence: ' + str(len(gens))
    show(coal_plot(coal_data1), axes = False, figsize = [8,4.0*len(gens)/pop_size], ymax = len(gens)-1)
︡39b0e4a1-c94d-43a3-85c5-3379afca9cc8︡{"interact":{"style":"None","flicker":false,"layout":[[["pop_size",12,null]],[["selection",12,null]],[["s",12,null]],[["",12,null]]],"id":"de185ed6-7687-468a-94a1-e89fd8f49eff","controls":[{"control_type":"slider","default":13,"var":"pop_size","width":null,"vals":["2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"],"animate":true,"label":"Population size","display_value":true},{"control_type":"slider","default":10,"var":"selection","width":null,"vals":["-1.00000000000000","-0.900000000000000","-0.800000000000000","-0.700000000000000","-0.600000000000000","-0.500000000000000","-0.400000000000000","-0.300000000000000","-0.200000000000000","-0.100000000000000","-1.38777878078145e-16","0.0999999999999999","0.200000000000000","0.300000000000000","0.400000000000000","0.500000000000000","0.600000000000000","0.700000000000000","0.800000000000000","0.900000000000000","1.00000000000000"],"animate":true,"label":"Selection for first taxon","display_value":true},{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["Again!"],"label":"Refresh","nrows":null,"width":null,"var":"s"}]}}︡
︠a61e8a12-d777-4198-8370-e01f483d17b1︠










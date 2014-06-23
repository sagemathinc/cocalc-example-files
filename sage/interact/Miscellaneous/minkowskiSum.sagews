︠46930314-d11b-4b9b-9fb1-c0bdd941f9b7︠
def minkdemo(list1,list2):
    '''
    Returns the Minkowski sum of two lists.
    '''
    output = []
    for stuff1 in list1:
        for stuff2 in list2:
            temp = [stuff1[i] + stuff2[i] for i in range(len(stuff1))]
            output.append(temp)
    return output
@interact
def minksumvis(x1tri = slider(-1,1,1/10,0, label = 'Triangle point x coord.'), yb = slider(1,4,1/10,2, label = 'Blue point y coord.')):
    t_list = [[1,0],[x1tri,1],[0,0]]
    kite_list = [[3, 0], [1, 0], [0, 1], [1, yb]]
    triangle = polygon([[q[0]-6,q[1]] for q in t_list], alpha = .5, rgbcolor = (1,0,0))
    t_vert = point([x1tri-6,1], rgbcolor = (1,0,0))
    b_vert = point([kite_list[3][0]-4,yb], rgbcolor = (0,0,1))
    kite = polygon([[q[0]-4,q[1]] for q in kite_list], alpha = .5,rgbcolor = (0,0,1))
    p12 = minkdemo(t_list, kite_list)
    p12 = [[q[0],q[1]] for q in p12]
    p12poly = Polyhedron(p12)
    edge_lines = Graphics()
    verts = p12poly.vertices()
    for an_edge in p12poly.vertex_adjacencies():
        edge_lines += line([verts[an_edge[0]], verts[an_edge[1][0]]])
        edge_lines += line([verts[an_edge[0]], verts[an_edge[1][1]]])
    triangle_sum = Graphics()
    for vert in kite_list:
        temp_list = []
        for q in t_list:
            temp_list.append([q[i] + vert[i] for i in range(len(t_list[0]))])
        triangle_sum += polygon(temp_list, alpha = .5, rgbcolor = (1,0,0))
    kite_sum = Graphics()
    for vert in t_list:
        temp_list = []
        for q in kite_list:
            temp_list.append([q[i] + vert[i] for i in range(len(t_list[0]))])
        kite_sum += polygon(temp_list, alpha = .3,rgbcolor = (0,0,1))
    labels = text('+', (-4.3,.5), rgbcolor = (0,0,0))
    labels += text('=', (-.2,.5), rgbcolor = (0,0,0))
    show(labels + t_vert + b_vert+ triangle + kite + triangle_sum + kite_sum + edge_lines, axes=False, figsize = [11.0*.7, 4*.7], xmin = -6, ymin = 0, ymax = 4)
︡53991a7f-e74c-4157-b4f2-dbd22be97b1b︡{"interact":{"style":"None","flicker":false,"layout":[[["x1tri",12,null]],[["yb",12,null]],[["",12,null]]],"id":"3475095e-8786-44f2-9a00-2a878ada5e3b","controls":[{"control_type":"slider","default":10,"var":"x1tri","width":null,"vals":["-1","-9/10","-4/5","-7/10","-3/5","-1/2","-2/5","-3/10","-1/5","-1/10","0","1/10","1/5","3/10","2/5","1/2","3/5","7/10","4/5","9/10","1"],"animate":true,"label":"Triangle point x coord.","display_value":true},{"control_type":"slider","default":10,"var":"yb","width":null,"vals":["1","11/10","6/5","13/10","7/5","3/2","8/5","17/10","9/5","19/10","2","21/10","11/5","23/10","12/5","5/2","13/5","27/10","14/5","29/10","3","31/10","16/5","33/10","17/5","7/2","18/5","37/10","19/5","39/10","4"],"animate":true,"label":"Blue point y coord.","display_value":true}]}}︡
︠0aeb4d64-2f09-4392-a0d9-01b78f691df8︠
    










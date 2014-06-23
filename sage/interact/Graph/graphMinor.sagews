︠cd71f855-a327-4f3a-bb62-6153630fc431︠
def animate_contraction(g, e, frames = 12, **kwds):
    v1, v2 = e
    if not g.has_edge(v1,v2):
        raise ValueError, "Given edge not found on Graph"
    ls = []
    posd = g.get_pos()
    for j in range(frames):
        gp = Graph(g)
        posdp = dict(posd)
        p1 = posdp[v1]
        p2 = posdp[v2]
        posdp[v2] = [a*(frames-j)/frames + b*j/frames
                    for a,b in zip(p2,p1)]

        gp.set_pos(posdp)
        ls.append(plot(gp, **kwds))
    return ls

def animate_vertex_deletion(g, v, frames = 12, **kwds):
    kwds2 = dict(kwds)
    if 'vertex_colors' in kwds:
        cs = dict(kwds['vertex_colors'])
        for c, vs in kwds['vertex_colors'].items():
            if v in vs:
                vs2 = list(vs)
                vs2.remove(v)
                cs[c] = vs2
        kwds2['vertex_colors'] = cs
    else:
        kwds2 = dict(kwds)
    g2 = Graph(g)
    posd = dict(g.get_pos())
    del posd[v]
    g2.delete_vertex(v)
    g2.set_pos(posd)
    return [plot(g, **kwds),plot(g2, **kwds2)]*int(frames/2)
    
def animate_edge_deletion(g, e, frames = 12, **kwds):
    v1, v2 = e
    g2 = Graph(g)
    g2.delete_edge(e)
    return [plot(g, **kwds),plot(g2, **kwds)]*int(frames/2)
    
def animate_glide(g, pos1, pos2, frames = 12, **kwds):
    ls = []
    for j in range(frames):
        gp = Graph(g)
        pos = {}
        for v in gp.vertices():
            p1 = pos1[v]
            p2 = pos2[v]
            pos[v] = [b*j/frames + a*(frames-j)/frames
                        for a,b in zip(p1,p2)]    
        gp.set_pos(pos)
        ls.append(plot(gp, **kwds))
    return ls
    
def medio(p1, p2):
    return tuple((a+b)/2 for a,b in zip(p1, p2))

def new_color():
    return (0.1+0.8*random(), 0.1+0.8*random(), 0.1+0.8*random())
    
def animate_minor(g, m, frames = 12, pause = 50, step_time = 100):
    '''Crea una animación que muestra cómo un grafo tiene un menor m
    '''
    posd = dict(g.get_pos())
    posg = posd.values()
    posm = m.get_pos().values()
    xmax = max(max(x for x,y in posg), max(x for x,y in posm))
    ymax = max(max(y for x,y in posg), max(y for x,y in posm))
    xmin = min(min(x for x,y in posg), min(x for x,y in posm))
    ymin = min(min(y for x,y in posg), min(y for x,y in posm))
    dd = g.minor(m)
    
    #Set colors
    m_colors = dict((v,new_color()) for v in m.vertices())
    g_colors = dict((m_colors[k],vs) 
                        for k,vs in dd.items())

    extra_vs = (set(g.vertices()) - 
                set(v for vs in dd.values() 
                      for v in vs))
    g_colors[(0,0,0)] = list(extra_vs)

    #pics contains the frames of the animation 
    #no colors at the beggining   
    gg = Graph(g)
    pics = [plot(gg)]*frames

    #First: eliminate extra vertices
    for v in extra_vs:
        pics.extend(animate_vertex_deletion(gg, v, frames,
                            vertex_colors = g_colors))
        gg.delete_vertex(v)
        del posd[v]
        g_colors[(0,0,0)].remove(v)
    del g_colors[(0,0,0)]
    
    #Second: contract edges
    for color, vs in g_colors.items():
        while len(vs)>1:
            for j in xrange(1,len(vs)):
                if gg.has_edge(vs[0], vs[j]):
                    break
            pics.extend(animate_contraction(gg, (vs[0], vs[j]), frames,
                                vertex_colors = g_colors))
            for v in gg.neighbors(vs[j]):
                gg.add_edge(vs[0],v)
            gg.delete_vertex(vs[j])
            del posd[vs[j]]
            gg.set_pos(posd)
            posd = dict(gg.get_pos())
            del vs[j]

    #Relabel vertices of m so that they match with those of gg
    m = Graph(m)
    dd0 = dict((k, vs[0])  
                  for k,vs in dd.items() )
    m.relabel(dd0)
    

    #Third: glide to position in m
    pos_m = m.get_pos()
    pos_g = gg.get_pos()
    pics.extend(animate_glide(gg, pos_g, pos_m, frames,
                                vertex_colors = g_colors))
    gg.set_pos(pos_m)
            
    #Fourth: delete redundant edges
    for e in gg.edges(labels = False):
        if not m.has_edge(e):
            pics.extend(animate_edge_deletion(gg, e, frames,
                                vertex_colors = g_colors))
            gg.delete_edge(*e)

    #And wait for a moment
    pics.extend([plot(gg, vertex_colors = g_colors)]*frames)
    
    return animate(pics, xmin = xmin - 0.1, xmax = xmax + 0.1, 
                         ymin = ymin - 0.1, ymax = ymax + 0.1)

graph_list = {'CompleteGraph4':graphs.CompleteGraph(4),
              'CompleteGraph5':graphs.CompleteGraph(5),
              'CompleteGraph6':graphs.CompleteGraph(6),
              'BipartiteGraph3,3':graphs.CompleteBipartiteGraph(3,3),
              'BipartiteGraph4,3':graphs.CompleteBipartiteGraph(4,3),
              'PetersenGraph':graphs.PetersenGraph(),
              'CycleGraph4':graphs.CycleGraph(4),
              'CycleGraph5':graphs.CycleGraph(5),
              'BarbellGraph(3,2)':graphs.BarbellGraph(3,2)
              }
@interact
def _(u1 = text_control('Does this graph'),
      g  = selector(graph_list.keys(), buttons = True,default='CompleteGraph4'),
      u2 = text_control('have a minor isomorphic to this other graph:'),
      m  = selector(graph_list.keys(), buttons = True,default='CycleGraph4'),
      u3 = text_control('''? If it has, show it to me, 
      with an animation with the following parameters'''),
      frames = slider(1,15,1,4, label = 'Frames per second'),
      step_time = slider(1/10,2,1/10,1, label = 'Seconds per step')):
    g = graph_list[g]
    m = graph_list[m]
    if g == m:
        html('<h3>Please select two different graphs</h3>')
        return
    try:
        a = animate_minor(g, m, frames = frames)
        a.show(delay=100*step_time/frames)
    except ValueError:
        html('''<h3>The first graph have <strong>NO</strong> minor isomorphic to the second</h3>''')
︡d0e90f10-357b-403d-905e-50805417ef63︡{"interact":{"style":"None","flicker":false,"layout":[[["u1",12,null]],[["g",12,null]],[["u2",12,null]],[["m",12,null]],[["u3",12,null]],[["frames",12,null]],[["step_time",12,null]],[["",12,null]]],"id":"4d49c43b-cf7c-42d2-aaf1-cf4023556d60","controls":[{"default":"Does this graph","var":"u1","classes":null,"control_type":"text","label":"u1"},{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":8,"lbls":["BipartiteGraph4,3","BarbellGraph(3,2)","CycleGraph4","CycleGraph5","BipartiteGraph3,3","PetersenGraph","CompleteGraph6","CompleteGraph5","CompleteGraph4"],"label":"g","nrows":null,"width":null,"var":"g"},{"default":"have a minor isomorphic to this other graph:","var":"u2","classes":null,"control_type":"text","label":"u2"},{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":2,"lbls":["BipartiteGraph4,3","BarbellGraph(3,2)","CycleGraph4","CycleGraph5","BipartiteGraph3,3","PetersenGraph","CompleteGraph6","CompleteGraph5","CompleteGraph4"],"label":"m","nrows":null,"width":null,"var":"m"},{"default":"? If it has, show it to me, \n      with an animation with the following parameters","var":"u3","classes":null,"control_type":"text","label":"u3"},{"control_type":"slider","default":3,"var":"frames","width":null,"vals":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"],"animate":true,"label":"Frames per second","display_value":true},{"control_type":"slider","default":9,"var":"step_time","width":null,"vals":["1/10","1/5","3/10","2/5","1/2","3/5","7/10","4/5","9/10","1","11/10","6/5","13/10","7/5","3/2","8/5","17/10","9/5","19/10","2"],"animate":true,"label":"Seconds per step","display_value":true}]}}︡
︠a9302546-9110-4746-aadc-98e0248fe7e5︠










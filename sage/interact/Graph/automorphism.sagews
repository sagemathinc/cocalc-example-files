︠5acaead9-0a3e-4a8b-862d-14315914e8ec︠
@interact
def _(graph=['CycleGraph', 'CubeGraph', 'RandomGNP'],
      n=selector([1..10],nrows=1), p=selector([10,20,..,100],nrows=1)):
    print graph
    if graph == 'CycleGraph':
       print "n = %s (number of vertices)"%n
       G = graphs.CycleGraph(n)
    elif graph == 'CubeGraph':
       if n > 8:
           print "n reduced to 8"
           n = 8
       print "n = %s (dimension)"%n
       G = graphs.CubeGraph(n)
    elif graph == 'RandomGNP':
       print "n = %s (number of vertices)"%n
       print "p = %s%% (edge probability)"%p
       G = graphs.RandomGNP(n, p/100.0)
    print G.automorphism_group()
    show(plot(G))
︡039401fb-9feb-48a2-8f3e-ce8756d6eb35︡{"interact":{"style":"None","flicker":false,"layout":[[["graph",12,null]],[["n",12,null]],[["p",12,null]],[["",12,null]]],"id":"f5e960c7-2de5-45e0-bcc7-a0032812515a","controls":[{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["CycleGraph","CubeGraph","RandomGNP"],"label":"graph","nrows":null,"width":null,"var":"graph"},{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["1","2","3","4","5","6","7","8","9","10"],"label":"n","nrows":1,"width":null,"var":"n"},{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["10","20","30","40","50","60","70","80","90","100"],"label":"p","nrows":1,"width":null,"var":"p"}]}}︡
︠a8e33cfd-49db-4006-9dbf-e9ec8522df55︠










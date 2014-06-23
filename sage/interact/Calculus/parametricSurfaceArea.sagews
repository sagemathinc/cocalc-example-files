︠cc771cca-48be-4502-afee-73b22267c975︠
var('u,v')
npi = RDF(pi)
@interact
def viewer(mesh = checkbox(default = False, label = 'Show u,v meshlines'), uc = slider(-2,2,1/10,0, label = '<span style="color:red">Constant u value</span>'), vc = slider(-2,2,1/10,0, label = '<span style="color:green">Constant v value</span>'), functions = input_box([u,v^2,u^2+v])):
    f1(u,v) = functions[0]
    f2(u,v) = functions[1]
    f3(u,v) = functions[2]
    surface_plot = parametric_plot3d([f1,f2,f3], (u,-2,2), (v,-2,2), mesh = mesh, opacity = .8)
    constant_u = line3d([[f1(uc,q), f2(uc,q), f3(uc,q)] for q in srange(-2,2,.01)], rgbcolor = (1,0,0), thickness = 3)
    constant_v = line3d([[f1(q,vc), f2(q,vc), f3(q,vc)] for q in srange(-2,2,.01)], rgbcolor = (0,1,0), thickness = 3)
    show(surface_plot + constant_u + constant_v, frame = False)
︡b4a915d7-dcbd-4570-b1ee-40cf9ac096b7︡{"stdout":"(u, v)\n"}︡{"interact":{"style":"None","flicker":false,"layout":[[["mesh",12,null]],[["uc",12,null]],[["vc",12,null]],[["functions",12,null]],[["",12,null]]],"id":"f0849464-1c1e-4d51-8724-3e337bf203fa","controls":[{"default":false,"var":"mesh","readonly":false,"control_type":"checkbox","label":"Show u,v meshlines"},{"control_type":"slider","default":20,"var":"uc","width":null,"vals":["-2","-19/10","-9/5","-17/10","-8/5","-3/2","-7/5","-13/10","-6/5","-11/10","-1","-9/10","-4/5","-7/10","-3/5","-1/2","-2/5","-3/10","-1/5","-1/10","0","1/10","1/5","3/10","2/5","1/2","3/5","7/10","4/5","9/10","1","11/10","6/5","13/10","7/5","3/2","8/5","17/10","9/5","19/10","2"],"animate":true,"label":"<span style=\"color:red\">Constant u value</span>","display_value":true},{"control_type":"slider","default":20,"var":"vc","width":null,"vals":["-2","-19/10","-9/5","-17/10","-8/5","-3/2","-7/5","-13/10","-6/5","-11/10","-1","-9/10","-4/5","-7/10","-3/5","-1/2","-2/5","-3/10","-1/5","-1/10","0","1/10","1/5","3/10","2/5","1/2","3/5","7/10","4/5","9/10","1","11/10","6/5","13/10","7/5","3/2","8/5","17/10","9/5","19/10","2"],"animate":true,"label":"<span style=\"color:green\">Constant v value</span>","display_value":true},{"control_type":"input-box","default":"[u, v^2, u^2 + v]","label":"functions","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"functions","type":null}]}}︡
︠c5fc08a9-fa39-4a62-90ca-cba340b6d02e︠










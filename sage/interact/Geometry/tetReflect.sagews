︠bd4d179e-8ab9-42e6-bcad-2664b78f2134︠
#Pairs of tetrahedra, one the reflection of the other in the internal face, are joined by union operations:
p1 = Polyhedron(vertices = [[1,1,1],[1,1,0],[0,1,1],[1,0,1]])
p2 = Polyhedron(vertices = [[1/3,1/3,1/3],[1,1,0],[0,1,1],[1,0,1]])
p12 = p1.convex_hull(p2)
p3 = Polyhedron(vertices = [[0,0,1],[0,0,0],[0,1,1],[1,0,1]])
p4 = Polyhedron(vertices = [[2/3,2/3,1/3],[0,0,0],[0,1,1],[1,0,1]])
p34 = p3.convex_hull(p4)
p5 = Polyhedron(vertices = [[1,0,0],[1,0,1],[0,0,0],[1,1,0]])
p6 = Polyhedron(vertices = [[1/3,2/3,2/3],[1,0,1],[0,0,0],[1,1,0]])
p56 = p5.convex_hull(p6)
p7 = Polyhedron(vertices = [[0,1,0],[0,0,0],[1,1,0],[0,1,1]])
p8 = Polyhedron(vertices = [[2/3,1/3,2/3],[0,0,0],[1,1,0],[0,1,1]])
p78 = p7.convex_hull(p8)
pti = p12.intersection(p34).intersection(p56).intersection(p78)
@interact
def tetra_plot(opac = slider(srange(0,1.0,.25), default = .25)):
    p12r = p12.render_wireframe()+p12.render_solid(opacity = opac)
    p34r = p34.render_wireframe()+p34.render_solid(rgbcolor = (0,0,1),opacity = opac)
    p56r = p56.render_wireframe()+p56.render_solid(rgbcolor = (0,1,0),opacity = opac)
    p78r = p78.render_wireframe()+p78.render_solid(rgbcolor = (0,1,1),opacity = opac)
    ptir = pti.render_wireframe()+pti.render_solid(rgbcolor = (1,0,1),opacity = .9)
    show(p12r+p34r+p56r+p78r+ptir, frame = False)
︡479d9fc1-bee8-428a-bcea-d742e8fae919︡{"interact":{"style":"None","flicker":false,"layout":[[["opac",12,null]],[["",12,null]]],"id":"965ff988-8781-4be2-a450-73c56d32c533","controls":[{"control_type":"slider","default":1,"var":"opac","width":null,"vals":["0.000000000000000","0.250000000000000","0.500000000000000","0.750000000000000"],"animate":true,"label":"opac","display_value":true}]}}︡
︠80384c19-3106-4880-9bf4-052071179409︠










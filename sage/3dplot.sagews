︠0ad4469a-c1be-4817-b741-586c1cf97d5ci︠
%md
A 3D plot, displayed via the three.js library. Adding the threejs parameter `show(…, threejs=True)` is no longer necessary.
︡4d2767aa-115e-406d-bd3e-726541237783︡{"html":"<p>A 3D plot, displayed via the three.js library. Adding the threejs parameter <code>show(…, threejs=True)</code> is no longer necessary.</p>\n"}︡
︠dcf933cd-c77f-4eed-87e4-a8cbb551e64a︠
var('x,y,z')
T = RDF(golden_ratio)
p = 2 - (cos(x + T*y) + cos(x - T*y) + cos(y + T*z) + cos(y - T*z) + cos(z - T*x) + cos(z + T*x))
r = 4.77
show(implicit_plot3d(p, (x, -r, r), (y, -r, r), (z, -r, r), plot_points=33))
︠f233119a-c619-4afc-8e2a-5e0934ce9799︠
g = icosahedron(color='green', mesh=2, opacity=.4)
g += sphere(size=.3,center=(0,0,1),color='red')
g += text3d("in the clouds...", (1/2,0,-1), fontsize=20, fontface="Courier")
show(g)
︠ed23db90-26c7-4149-a3ca-a58e20460532︠
g = text3d("3D Pillow ...", (2,-1/2,1/2), fontsize=40, fontface="Droid", color='blue')
for i in srange(-2*pi,2*pi,pi/3, include_endpoint=True):
    g += parametric_plot3d((2 * cos(x), sin(x * i), sin(x)*cos(i * x)), (x,0,2*pi),plot_points=200, color='purple')
show(g)










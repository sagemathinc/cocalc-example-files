︠0ad4469a-c1be-4817-b741-586c1cf97d5ci︠
%md
A 3D plot, displayed via the three.js library. Don't forget to add the parameter: `show(…, threejs=True)`.
︡53ee9267-f144-4707-8c68-9e43da155f96︡{"html":"<p>A 3D plot, displayed via the three.js library. Don&#8217;t forget to add the parameter: <code>show(…, threejs=True)</code>.</p>\n"}︡
︠dcf933cd-c77f-4eed-87e4-a8cbb551e64a︠
var('x,y,z')
T = RDF(golden_ratio)
p = 2 - (cos(x + T*y) + cos(x - T*y) + cos(y + T*z) + cos(y - T*z) + cos(z - T*x) + cos(z + T*x))
r = 4.77
show(implicit_plot3d(p, (x, -r, r), (y, -r, r), (z, -r, r), plot_points=33), threejs=True)
︡2fd08b40-6ad7-41ee-84a9-786f6c293264︡{"stdout":"(x, y, z)\n"}︡{"file":{"show":false,"uuid":"008bfa29-f4e6-423b-9e86-6c54251dda7c","filename":".50717400-70fe-431b-bd92-d8bd53515e82.obj"}}︡{"html":"<div id=50717400-70fe-431b-bd92-d8bd53515e82 style='border:1px solid black'>"}︡{"obj":"{\"mtl\": \"newmtl texture37\\nKa 0.2 0.2 0.5\\nKd 0.4 0.4 1.0\\nKs 0.0 0.0 0.0\\nillum 1\\nNs 1\\nd 1\\n\"}","javascript":{"coffeescript":true,"code":"d=$('#50717400-70fe-431b-bd92-d8bd53515e82'); d.data('three', new salvus_threejs.ThreeJSobj('/blobs/.50717400-70fe-431b-bd92-d8bd53515e82.obj?uuid=008bfa29-f4e6-423b-9e86-6c54251dda7c', d, obj.mtl))"},"once":true}︡
︠f233119a-c619-4afc-8e2a-5e0934ce9799︠

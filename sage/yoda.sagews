︠208397ea-d7fa-48ba-bc04-aca5b39fd194i︠
%md
# Render Yoda in interactive 3d using THREE.js

**Warning:** If your browser uses canvas instead of webgl, this will be painfully slow.  With webgl, it is very fast
after the model loads.
︡bd1e2a80-c63a-4521-beea-adc2fb6dc73a︡{"html":"<h1>Render Yoda in interactive 3d using THREE.js</h1>\n\n<p><strong>Warning:</strong> If your browser uses canvas instead of webgl, this will be painfully slow.  With webgl, it is very fast\nafter the model loads.</p>\n"}︡
︠73e5841f-fa48-4ae3-aa41-310668ffb884a︠
%auto
# Yoda! -- over 53,756 triangles.
from scipy import io
x = io.loadmat('yodapose.mat')
from sage.plot.plot3d.index_face_set import IndexFaceSet
V = x['V']; F3=x['F3']-1; F4=x['F4']-1
Y = IndexFaceSet(F3,V,color='green') + IndexFaceSet(F4,V,color='green')
Y = Y.rotateZ(-1); Y = Y.rotateX(-1)
show(Y, frame=False)
︡fd3e1f76-4517-4d87-94cf-0fb6c95ddfa7︡{"auto":true}︡{"html":"<div id=848dc08b-bb7b-4b77-a904-96c457ecdf67 style='border:1px solid grey'></div>"}︡{"obj":"{\"foreground\": null, \"camera_distance\": 28.513779200054678, \"height\": null, \"width\": null, \"renderer\": null, \"background\": null}","javascript":{"coffeescript":false,"code":"$('#848dc08b-bb7b-4b77-a904-96c457ecdf67').salvus_threejs(obj)"},"once":false}︡
︠5aaaee4f-595a-4775-99a3-d4dce36d5ae8︠
# 53756 vertices!
len(x['V'])
︡8a1b1984-df55-4347-b733-598c69faf463︡{"stdout":"53756\n"}︡
︠d6248cd2-8768-450d-a311-041d22fa372e︠










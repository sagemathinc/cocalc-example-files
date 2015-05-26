︠343b00d6-794d-4c04-93b7-953c8c09ee60i︠
%md
# Sphere $\mathbb{S}^2$

This worksheet illustrates the use of [SageManifolds v0.8](http://sagemanifolds.obspm.fr/) in SageMathCloud.

This is a simplified version of this [Sage notebook worksheet](http://sagemanifolds.obspm.fr/examples/html/SM_sphere_S2.html).
︡327aece6-20a4-45d8-9165-5088479202ba︡{"md":"# Sphere $\\mathbb{S}^2$\n\nThis worksheet illustrates the use of [SageManifolds v0.8](http://sagemanifolds.obspm.fr/) in SageMathCloud.\n\nThis is a simplified version of this [Sage notebook worksheet](http://sagemanifolds.obspm.fr/examples/html/SM_sphere_S2.html).\n"}︡
︠7457379e-3802-4432-8287-d0ddb3c3c1f9s︠
%typeset_mode True
︡8f0732b5-eff4-4220-b063-5291f9dc2acb︡
︠9938938f-77e3-45e0-8007-1a66be0e8283s︠
S2 = Manifold(2, 'S^2', latex_name=r'\mathbb{S}^2', start_index=1)
S2
︡5d3ea361-6d03-42ed-a793-b160482b3c5c︡{"tex":{"tex":"\\mathbb{S}^2","display":true}}︡
︠734f5cfe-75e9-4e97-a185-a7baf87a3241s︠
U = S2.open_subset('U') ; print U
︡892e2bd3-344a-43b6-b385-ee202cb13bc3︡{"stdout":"open subset 'U' of the 2-dimensional manifold 'S^2'\n"}︡
︠66bddda2-1922-468e-ae67-885f1a769aefs︠
V = S2.open_subset('V') ; print V
︡6ef82bcf-0d46-4e9f-9c6c-cbd3a2f60782︡{"stdout":"open subset 'V' of the 2-dimensional manifold 'S^2'\n"}︡
︠44f5a9c1-8362-4613-8782-aeb27e6894e2s︠
S2.declare_union(U, V)
︡3cd745bf-b3d1-447b-b39f-f6d822f2f251︡
︠e00a5434-909c-488d-8d4a-75514b1886f9is︠
%md
Stereographic coordinates from the North pole:
︡4844ff72-10d0-4348-8237-4826ca600870︡{"md":"Stereographic coordinates from the North pole:\n"}︡
︠edbf5ec9-c625-4373-8590-3abf21d5e4f0s︠
stereoN.<x,y> = U.chart() ; stereoN
︡18b58a29-acd0-4fd9-915e-a93bab005543︡{"tex":{"tex":"\\left(U,(x, y)\\right)","display":true}}︡
︠cab7a53d-d9d0-4792-be1a-8b481de833d3si︠
%md
Stereographic coordinates from the South pole:
︡3a0ed155-f7ab-484b-8b28-ad4d3266d0e4︡{"md":"Stereographic coordinates from the South pole:\n"}︡
︠fceda747-271d-4e75-b56b-6c8f51dcca3as︠
stereoS.<xp,yp> = V.chart(r"xp:x' yp:y'") ; stereoS
︡a34f1f23-89c0-47e0-87c7-fb9581c88613︡{"tex":{"tex":"\\left(V,({x'}, {y'})\\right)","display":true}}︡
︠8a3a12e7-cc64-497d-9539-5b6298d0a746s︠
stereoN_to_S = stereoN.transition_map(stereoS, (x/(x^2+y^2), y/(x^2+y^2)), intersection_name='W',
                                      restrictions1= x^2+y^2!=0, restrictions2= xp^2+xp^2!=0)
stereoN_to_S.display()
︡3072d528-0ce4-4e3f-abd9-7be006f04121︡{"tex":{"tex":"\\left\\{\\begin{array}{lcl} {x'} & = & \\frac{x}{x^{2} + y^{2}} \\\\ {y'} & = & \\frac{y}{x^{2} + y^{2}} \\end{array}\\right.","display":true}}︡
︠bf4a2c36-83ea-4d2a-ab8a-49782adcb308s︠
stereoS_to_N = stereoN_to_S.inverse()
stereoS_to_N.display()
︡92386c02-4dc9-4ea5-bdf6-06a3de3aafd7︡{"tex":{"tex":"\\left\\{\\begin{array}{lcl} x & = & \\frac{{x'}}{{x'}^{2} + {y'}^{2}} \\\\ y & = & \\frac{{y'}}{{x'}^{2} + {y'}^{2}} \\end{array}\\right.","display":true}}︡
︠e2a73231-32a6-42be-9327-068262738db3s︠
W = U.intersection(V)
stereoN_W = stereoN.restrict(W)
stereoS_W = stereoS.restrict(W)
︡12c8fbba-5637-46fa-9717-5225c9240e42︡
︠27ec6350-9cad-4db6-a332-08cb5cf706dasi︠
%md
The domain of spherical coordinates:
︡7b046235-055e-406e-bf11-e0bd9150a0ec︡{"md":"The domain of spherical coordinates:\n"}︡
︠1be37d3c-f165-4fc6-a4bc-e1463d66049as︠
A = W.open_subset('A', coord_def={stereoN_W: (y!=0, x<0)})
print A
︡31309e8b-851e-47bd-a46b-ae9eb6983790︡{"stdout":"open subset 'A' of the 2-dimensional manifold 'S^2'\n"}︡
︠d3374062-ae7c-42cf-99d7-7ee64731bd28s︠
stereoN_A = stereoN_W.restrict(A)
stereoN_A
︡760f1556-0685-4515-a8c2-3b84e0d24ed3︡{"tex":{"tex":"\\left(A,(x, y)\\right)","display":true}}︡
︠09c0e4b1-f946-4f74-bb9c-8d28135d3e7cs︠
spher.<th,ph> = A.chart(r'th:(0,pi):\theta ph:(0,2*pi):\phi')
spher
︡8a253716-9e51-488b-b252-26e29953ec07︡{"tex":{"tex":"\\left(A,({\\theta}, {\\phi})\\right)","display":true}}︡
︠ec4123a4-2df8-4048-ba22-5ca2a0f67631s︠
spher_to_stereoN = spher.transition_map(stereoN_A, (sin(th)*cos(ph)/(1-cos(th)),
                                                    sin(th)*sin(ph)/(1-cos(th))) )
spher_to_stereoN.display()
︡001eab8d-a350-48b7-b8f7-f10c0d2b9179︡{"tex":{"tex":"\\left\\{\\begin{array}{lcl} x & = & -\\frac{\\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)}{\\cos\\left({\\theta}\\right) - 1} \\\\ y & = & -\\frac{\\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)}{\\cos\\left({\\theta}\\right) - 1} \\end{array}\\right.","display":true}}︡
︠1bb6f5a1-3dc3-4c7f-90c3-7458a3cfe576s︠
spher_to_stereoN.set_inverse(2*atan(1/sqrt(x^2+y^2)), atan2(-y,-x)+pi)
︡70b33df9-27ab-450f-a403-928b0ca1f6a7︡{"stdout":"Check of the inverse coordinate transformation:"}︡{"stdout":"\n   th == "}︡{"stdout":"2*arctan(sqrt(-cos(th) + 1)/sqrt(cos(th) + 1))\n   ph == "}︡{"stdout":"pi + arctan2(sin(ph)*sin(th)/(cos(th) - 1), cos(ph)*sin(th)/(cos(th) - 1))\n   x == x\n   y == "}︡{"stdout":"y\n"}︡
︠fa69b7e8-592c-49ce-bf2e-4b96f41e20a9s︠
S2.atlas()
︡494ff860-eff1-4c04-afd3-d11b949ac82a︡{"tex":{"tex":"\\left[\\left(U,(x, y)\\right), \\left(V,({x'}, {y'})\\right), \\left(W,(x, y)\\right), \\left(W,({x'}, {y'})\\right), \\left(A,(x, y)\\right), \\left(A,({\\theta}, {\\phi})\\right)\\right]","display":true}}︡
︠08f31340-9234-4bc0-9148-7878d6644c3cs︠
N = V.point((0,0), chart=stereoS, name='N') ; print N
S = U.point((0,0), chart=stereoN, name='S') ; print S
︡960dae05-8251-445a-a439-d1765a254ebf︡{"stdout":"point 'N' on 2-dimensional manifold 'S^2'\n"}︡{"stdout":"point 'S' on 2-dimensional manifold 'S^2'\n"}︡
︠93f12152-9e18-4faf-b9b7-48dfa9b7b960s︠
R3 = Manifold(3, 'R^3', r'\mathbb{R}^3', start_index=1)
cart.<X,Y,Z> = R3.chart()
cart
︡c86762cc-a069-4e4a-9018-f52228548822︡{"tex":{"tex":"\\left(\\mathbb{R}^3,(X, Y, Z)\\right)","display":true}}︡
︠54128f24-5942-4ff2-ba3d-8e2a26c34575si︠
%md
The standard embedding of $\mathbb{S}^2$ into $\mathbb{R}^3$:
︡0917bc87-3c46-4acf-aaed-5774ce138817︡{"md":"The standard embedding of $\\mathbb{S}^2$ into $\\mathbb{R}^3$:\n"}︡
︠7b38ab3b-23dd-4989-a1ed-bf1f035128c3s︠
Phi = S2.diff_mapping(R3, {(stereoN, cart): [2*x/(1+x^2+y^2), 2*y/(1+x^2+y^2),
                                             (x^2+y^2-1)/(1+x^2+y^2)],
                           (stereoS, cart): [2*xp/(1+xp^2+yp^2), 2*yp/(1+xp^2+yp^2),
                                             (1-xp^2-yp^2)/(1+xp^2+yp^2)]},
                      name='Phi', latex_name=r'\Phi')
Phi.display()
︡57bb81c8-6e6b-4fb6-86e0-a2da6835851c︡{"tex":{"tex":"\\begin{array}{llcl} \\Phi:& \\mathbb{S}^2 & \\longrightarrow & \\mathbb{R}^3 \\\\ \\mbox{on}\\ U : & \\left(x, y\\right) & \\longmapsto & \\left(X, Y, Z\\right) = \\left(\\frac{2 \\, x}{x^{2} + y^{2} + 1}, \\frac{2 \\, y}{x^{2} + y^{2} + 1}, \\frac{x^{2} + y^{2} - 1}{x^{2} + y^{2} + 1}\\right) \\\\ \\mbox{on}\\ V : & \\left({x'}, {y'}\\right) & \\longmapsto & \\left(X, Y, Z\\right) = \\left(\\frac{2 \\, {x'}}{{x'}^{2} + {y'}^{2} + 1}, \\frac{2 \\, {y'}}{{x'}^{2} + {y'}^{2} + 1}, -\\frac{{x'}^{2} + {y'}^{2} - 1}{{x'}^{2} + {y'}^{2} + 1}\\right) \\end{array}","display":true}}︡
︠55305a58-616d-45d4-8aa5-0422841b470fs︠
Phi.expr(stereoN_A, cart)
︡0cc2169b-07d4-49fa-87bb-da6cdaa79b43︡{"tex":{"tex":"\\left(\\frac{2 \\, x}{x^{2} + y^{2} + 1}, \\frac{2 \\, y}{x^{2} + y^{2} + 1}, \\frac{x^{2} + y^{2} - 1}{x^{2} + y^{2} + 1}\\right)","display":true}}︡
︠060cd290-2848-4ca6-9a5e-34ee6ca031e8s︠
Phi.display(spher, cart)
︡a5b6f0ba-8f30-4ca7-88e7-a843459145fb︡{"tex":{"tex":"\\begin{array}{llcl} \\Phi:& \\mathbb{S}^2 & \\longrightarrow & \\mathbb{R}^3 \\\\ \\mbox{on}\\ A : & \\left({\\theta}, {\\phi}\\right) & \\longmapsto & \\left(X, Y, Z\\right) = \\left(\\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), \\cos\\left({\\theta}\\right)\\right) \\end{array}","display":true}}︡
︠6c25f986-79c9-4076-95eb-a043fd4f9a61si︠
%md
Grid of spherical coordinates:
︡832cba1e-ef1a-442d-b889-1e4d52d5d13d︡{"md":"Grid of spherical coordinates:\n"}︡
︠c65155a0-e3f0-4a6d-bd38-b688c61753ecs︠
graph_spher = spher.plot(chart=cart, mapping=Phi, nb_values=11, color='blue', label_axes=False)
show(graph_spher)
︡41b3e213-2015-4921-8aa7-1a0866c75a1d︡{"file":{"uuid":"5c2d1ad1-7f64-4e4a-9851-ac2ac3876d8c","filename":"5c2d1ad1-7f64-4e4a-9851-ac2ac3876d8c.sage3d"}}︡{"html":"<div align='center'></div>"}︡
︠26ada91e-92f8-44b2-a26c-860d10f2a75bsi︠
%md
Grids of stereographic coordinates:
︡aff4adc8-ae89-4aed-b03d-f351d2e77345︡{"md":"Grids of stereographic coordinates:\n"}︡
︠bf4fa3ed-84aa-41a0-a1fd-66d1368ca73bs︠
graph_stereoN = stereoN.plot(chart=cart, mapping=Phi, nb_values=25)
graph_stereoS = stereoS.plot(chart=cart, mapping=Phi, nb_values=25, color='green')
pointN = N.plot(chart=cart, mapping=Phi, color='red', label_offset=0.05)
pointS = S.plot(chart=cart, mapping=Phi, color='green', label_offset=0.05)
show(graph_stereoN + graph_stereoS + pointN + pointS)
︡b6199c24-c961-48c7-96ba-65a12677ba77︡{"file":{"uuid":"3c6e6ac8-a285-43c0-a044-02422b0896c5","filename":"3c6e6ac8-a285-43c0-a044-02422b0896c5.sage3d"}}︡{"html":"<div align='center'></div>"}︡
︠ea2413d6-d34e-47e1-845a-13eb26de3930s︠
ex = stereoN.frame()[1]
ex
︡dca51b35-53ca-48b2-ac4d-7eaf9d5d32d9︡{"tex":{"tex":"\\frac{\\partial}{\\partial x }","display":true}}︡
︠6f90e359-6332-451a-a404-25b886b3d6das︠
ex.display(stereoS_W.frame(), stereoS_W)
︡7d6da9fd-cc0d-4641-803e-9fc3855466d1︡{"tex":{"tex":"\\frac{\\partial}{\\partial x } = \\left( -{x'}^{2} + {y'}^{2} \\right) \\frac{\\partial}{\\partial {x'} } -2 \\, {x'} {y'} \\frac{\\partial}{\\partial {y'} }","display":true}}︡
︠0239117d-57c6-4540-9d03-d2afb6c41d25si︠
%md
Plot of the vector field $\frac{\partial}{\partial x}$ in terms of the stereographic chart from the South pole:
︡f378b55e-352b-4e45-9f93-5da159fd09b1︡{"md":"Plot of the vector field $\\frac{\\partial}{\\partial x}$ in terms of the stereographic chart from the South pole:\n"}︡
︠dc73bd99-8904-49ba-bbd9-33ca06759880s︠
graph_ex_stereoS = ex.plot(chart=stereoS, chart_domain=stereoS.restrict(W), max_value=4, scale=0.06, 
                           aspect_ratio=1, figsize=10)
graph_N_stereoS = N.plot(chart=stereoS, size=30, label_offset=0.2)
show(graph_ex_stereoS + graph_N_stereoS)
︡7f7824e5-0472-4ae1-b8c2-b8b03722890a︡{"once":false,"file":{"show":true,"uuid":"4abbdf7b-fffe-45f7-bbcb-18a43fde2daf","filename":"/projects/321def00-5f90-4be8-afb7-4d6ef7fd1e67/.sage/temp/compute4-us/21326/tmp_Thtl1k.svg"}}︡{"html":"<div align='center'></div>"}︡
︠992cca7a-661a-48a3-ac7e-323054343dcfsi︠
%md
Plot of the vector field $\frac{\partial}{\partial x}$ in terms of the Cartesian coordinates of $\mathbb{R}^3$, via the embedding $\Phi$:
︡024212bc-f690-4064-8b8a-93c3fe610a70︡{"md":"Plot of the vector field $\\frac{\\partial}{\\partial x}$ in terms of the Cartesian coordinates of $\\mathbb{R}^3$, via the embedding $\\Phi$:\n"}︡
︠802169ec-cc08-4d86-99be-664670d50693s︠
graph_ex = ex.plot(chart=cart, mapping=Phi, chart_domain=spher,
                   nb_values=11, scale=0.4, width=1)
show(graph_ex + graph_spher, aspect_ratio=1)
︡31987b49-828a-4434-acb7-8ff40d593d6f︡{"file":{"uuid":"0ce7fa52-7089-407b-9dc1-eb5f5d18d4c1","filename":"0ce7fa52-7089-407b-9dc1-eb5f5d18d4c1.sage3d"}}︡{"html":"<div align='center'></div>"}︡
︠24529d92-698b-4b04-a373-a563964827e7s︠
ey = stereoN.frame()[2]
ey
︡acd5a560-b609-46c2-9ade-52b1ea3f4502︡{"tex":{"tex":"\\frac{\\partial}{\\partial y }","display":true}}︡
︠91de11c6-f7cb-42ff-b480-073b42ea167esi︠
%md
Plot of the vector frame $\left(\frac{\partial}{\partial x}, \frac{\partial}{\partial y}\right)$ in terms of the stereographic chart from the South pole:
︡0d4983eb-b38b-48de-ae0d-360e6ecd98b6︡{"md":"Plot of the vector frame $\\left(\\frac{\\partial}{\\partial x}, \\frac{\\partial}{\\partial y}\\right)$ in terms of the stereographic chart from the South pole:\n"}︡
︠eaa932ae-e22c-460e-89fa-0c03d0b77e51s︠
graph_ey_stereoS = ey.plot(chart=stereoS, chart_domain=stereoS.restrict(W), max_value=4, scale=0.06, 
                           color='red', aspect_ratio=1, figsize=10)
show(graph_ex_stereoS + graph_ey_stereoS + graph_N_stereoS)
︡56df1930-f2cd-4526-b7b5-62f8656f1ef5︡{"once":false,"file":{"show":true,"uuid":"e25136e4-bd4f-4dbd-97f3-dc8c47711028","filename":"/projects/321def00-5f90-4be8-afb7-4d6ef7fd1e67/.sage/temp/compute4-us/21326/tmp_UYxjER.svg"}}︡{"html":"<div align='center'></div>"}︡
︠3b483143-72ee-4c79-8deb-92b1e51768f1s︠
graph_ey = ey.plot(chart=cart, mapping=Phi, chart_domain=spher,
                   nb_values=11, scale=0.4, width=1, color='red',
                   label_axes=False)
show(graph_ey + graph_spher, aspect_ratio=1)

︡3d3ec17b-8776-40b4-b825-965482802287︡{"file":{"uuid":"a6f20f32-2c1e-4c40-8d67-d05a440ad2cc","filename":"a6f20f32-2c1e-4c40-8d67-d05a440ad2cc.sage3d"}}︡{"html":"<div align='center'></div>"}︡
︠5a43d538-ac43-4a8e-9ec6-7ce7ce4c946ds︠
show(graph_ex + graph_ey + graph_spher, aspect_ratio=1)
︡d905afce-b190-42d3-8bea-40cca29cf252︡{"file":{"uuid":"b63b9b23-ec4e-48dd-a4cb-1789b89810ba","filename":"b63b9b23-ec4e-48dd-a4cb-1789b89810ba.sage3d"}}︡{"html":"<div align='center'></div>"}︡
︠0b3a40bc-b059-4f4d-bde4-8d64f75118f6si︠
%md
## Riemannian metric on $\mathbb{S}^2$
Let us define the metric $g$ on $\mathbb{S}^2$ as the pullback, via the embedding $\Phi$, of the Euclidean metric of $\mathbb{R}^3$:
︡ffc42d1c-4360-4f40-b7bc-ae26bbd6ff39︡{"md":"## Riemannian metric on $\\mathbb{S}^2$\nLet us define the metric $g$ on $\\mathbb{S}^2$ as the pullback, via the embedding $\\Phi$, of the Euclidean metric of $\\mathbb{R}^3$:\n"}︡
︠d267f8e8-c3ac-48d9-b1f7-bf27370c38e8s︠
h = R3.riemann_metric('h')
h[1,1], h[2,2], h[3, 3] = 1, 1, 1
h.display()
︡1664b8bb-19a4-4302-8f9b-22db9def6bb7︡{"tex":{"tex":"h = \\mathrm{d} X\\otimes \\mathrm{d} X+\\mathrm{d} Y\\otimes \\mathrm{d} Y+\\mathrm{d} Z\\otimes \\mathrm{d} Z","display":true}}︡
︠2b427713-65e2-45de-966e-8bac196c3c21s︠
g = S2.riemann_metric('g')
g.set( Phi.pullback(h) )
g.display()
︡64f864f5-2d2a-441c-a237-634b39b83c07︡{"tex":{"tex":"g = \\left( \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\mathrm{d} x\\otimes \\mathrm{d} x + \\left( \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\mathrm{d} y\\otimes \\mathrm{d} y","display":true}}︡
︠0c10ec63-f1c2-432f-a61e-76319ba168b5s︠
g.display(stereoS.frame())
︡94114390-3ef9-4b16-a30f-fb06539ab471︡{"tex":{"tex":"g = \\left( \\frac{4}{{x'}^{4} + {y'}^{4} + 2 \\, {\\left({x'}^{2} + 1\\right)} {y'}^{2} + 2 \\, {x'}^{2} + 1} \\right) \\mathrm{d} {x'}\\otimes \\mathrm{d} {x'} + \\left( \\frac{4}{{x'}^{4} + {y'}^{4} + 2 \\, {\\left({x'}^{2} + 1\\right)} {y'}^{2} + 2 \\, {x'}^{2} + 1} \\right) \\mathrm{d} {y'}\\otimes \\mathrm{d} {y'}","display":true}}︡
︠81d95883-2bab-48c1-baee-3968f7045966s︠
g.display(spher.frame(), chart=spher)
︡9a95481d-614d-4a7f-ac29-ab9578f9a4b6︡{"tex":{"tex":"g = \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}","display":true}}︡
︠ca4c372b-af24-4705-bb1f-c00aaf0b6d19si︠
%md
$\frac{\partial}{\partial x}$ is not a Killing vector field: the Lie derivative of $g$ along it does not vanish:
︡9d694e13-d3b8-4a1c-8d44-529976e7ef71︡{"md":"$\\frac{\\partial}{\\partial x}$ is not a Killing vector field: the Lie derivative of $g$ along it does not vanish:\n"}︡
︠11bffe6e-8fbd-468c-bd75-e2de7a75c9b4s︠
g.restrict(U).lie_der(ex).display()
︡ffe88910-0bb9-4c22-b4a4-9504f83a4440︡{"tex":{"tex":"\\left( -\\frac{16 \\, x}{x^{6} + y^{6} + 3 \\, {\\left(x^{2} + 1\\right)} y^{4} + 3 \\, x^{4} + 3 \\, {\\left(x^{4} + 2 \\, x^{2} + 1\\right)} y^{2} + 3 \\, x^{2} + 1} \\right) \\mathrm{d} x\\otimes \\mathrm{d} x + \\left( -\\frac{16 \\, x}{x^{6} + y^{6} + 3 \\, {\\left(x^{2} + 1\\right)} y^{4} + 3 \\, x^{4} + 3 \\, {\\left(x^{4} + 2 \\, x^{2} + 1\\right)} y^{2} + 3 \\, x^{2} + 1} \\right) \\mathrm{d} y\\otimes \\mathrm{d} y","display":true}}︡
︠27794b0e-bcd3-49c5-90ab-dde883b92cdesi︠
%md
while $\frac{\partial}{\partial\phi}$ is a Killing vector field:
︡8f564e24-28ff-4a3e-9f7c-2405e94be767︡{"md":"while $\\frac{\\partial}{\\partial\\phi}$ is a Killing vector field:\n"}︡
︠37f8ff0c-5aac-4c27-b35c-bc5e23cd1412s︠
ep = spher.frame()[2]
ep
︡b811037d-d115-4733-82f2-768df70a2974︡{"tex":{"tex":"\\frac{\\partial}{\\partial {\\phi} }","display":true}}︡
︠1b8cacba-79cf-40b5-9d63-dbed5f0f134cs︠
g.restrict(A).lie_der(ep).display()
︡111cf9eb-6917-4d43-a879-b957f7e84fb2︡{"tex":{"tex":"0","display":true}}︡
︠eb12ebf0-5cd4-47e4-ab34-4849e5ba643bsi︠
%md
The nonzero Christoffel symbols of $g$ w.r.t. stereographic coordinates and spherical ones (taking into account the symmetry on the last two indices):
︡aea8c7ac-b987-45dc-8d88-e58a60170187︡{"md":"The nonzero Christoffel symbols of $g$ w.r.t. stereographic coordinates and spherical ones (taking into account the symmetry on the last two indices):\n"}︡
︠0d531b31-fb0b-4e5e-b240-5e0b14eaae58s︠
g.christoffel_symbols_display(chart=stereoN)
︡f3ef8dd7-1006-4df7-bdf5-04073f11e863︡{"tex":{"tex":"\\begin{array}{lcl} \\Gamma_{ \\phantom{\\, x } \\, x \\, x }^{ \\, x \\phantom{\\, x } \\phantom{\\, x } } & = & -\\frac{2 \\, x}{x^{2} + y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, x } \\, x \\, y }^{ \\, x \\phantom{\\, x } \\phantom{\\, y } } & = & -\\frac{2 \\, y}{x^{2} + y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, x } \\, y \\, y }^{ \\, x \\phantom{\\, y } \\phantom{\\, y } } & = & \\frac{2 \\, x}{x^{2} + y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, y } \\, x \\, x }^{ \\, y \\phantom{\\, x } \\phantom{\\, x } } & = & \\frac{2 \\, y}{x^{2} + y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, y } \\, x \\, y }^{ \\, y \\phantom{\\, x } \\phantom{\\, y } } & = & -\\frac{2 \\, x}{x^{2} + y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, y } \\, y \\, y }^{ \\, y \\phantom{\\, y } \\phantom{\\, y } } & = & -\\frac{2 \\, y}{x^{2} + y^{2} + 1} \\end{array}","display":true}}︡
︠1055c576-efd0-45f1-bb74-8bc802c255dcs︠
g.christoffel_symbols_display(chart=spher)
︡41844d5d-b56d-4c42-912c-7c5db013fef0︡{"tex":{"tex":"\\begin{array}{lcl} \\Gamma_{ \\phantom{\\, {\\theta} } \\, {\\phi} \\, {\\phi} }^{ \\, {\\theta} \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } & = & -\\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right) \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, {\\theta} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } & = & \\frac{\\cos\\left({\\theta}\\right)}{\\sin\\left({\\theta}\\right)} \\end{array}","display":true}}︡
︠f3e2ad48-768e-4b07-80c6-859fb1f00135si︠
%md
The Riemann curvature tensor:
︡0fa37891-d770-40f9-9698-9e7d9236a527︡{"md":"The Riemann curvature tensor:\n"}︡
︠8c7d1c12-8b80-48a1-8cee-9187323b7eabs︠
Riem = g.riemann()
print Riem
Riem.display()
︡d0b3b749-d1b6-4ff0-bad1-a1a6f54fc9e9︡{"stdout":"tensor field 'Riem(g)' of type (1,3) on the 2-dimensional manifold 'S^2'\n"}︡{"tex":{"tex":"\\mathrm{Riem}\\left(g\\right) = \\left( \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\frac{\\partial}{\\partial x }\\otimes \\mathrm{d} y\\otimes \\mathrm{d} x\\otimes \\mathrm{d} y + \\left( -\\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\frac{\\partial}{\\partial x }\\otimes \\mathrm{d} y\\otimes \\mathrm{d} y\\otimes \\mathrm{d} x + \\left( -\\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\frac{\\partial}{\\partial y }\\otimes \\mathrm{d} x\\otimes \\mathrm{d} x\\otimes \\mathrm{d} y + \\left( \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\frac{\\partial}{\\partial y }\\otimes \\mathrm{d} x\\otimes \\mathrm{d} y\\otimes \\mathrm{d} x","display":true}}︡
︠669fffbb-30b0-48f4-9428-dfb1fc6bdd65s︠
Riem.display_comp()
︡198cff71-ee73-4d8d-a778-b7c1c6dfae0e︡{"tex":{"tex":"\\begin{array}{lcl} \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, x } \\, y \\, x \\, y }^{ \\, x \\phantom{\\, y } \\phantom{\\, x } \\phantom{\\, y } } & = & \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, x } \\, y \\, y \\, x }^{ \\, x \\phantom{\\, y } \\phantom{\\, y } \\phantom{\\, x } } & = & -\\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, y } \\, x \\, x \\, y }^{ \\, y \\phantom{\\, x } \\phantom{\\, x } \\phantom{\\, y } } & = & -\\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, y } \\, x \\, y \\, x }^{ \\, y \\phantom{\\, x } \\phantom{\\, y } \\phantom{\\, x } } & = & \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\end{array}","display":true}}︡
︠0c7bd196-8b95-44d2-98bb-d2603bf09349s︠
Riem.display_comp(spher.frame(), chart=spher)
︡610e0107-dc00-474a-ba87-3ac6e8e07428︡{"tex":{"tex":"\\begin{array}{lcl} \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\theta} } \\, {\\phi} \\, {\\theta} \\, {\\phi} }^{ \\, {\\theta} \\phantom{\\, {\\phi} } \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } & = & \\sin\\left({\\theta}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\theta} } \\, {\\phi} \\, {\\phi} \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } \\phantom{\\, {\\theta} } } & = & -\\sin\\left({\\theta}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\phi} } \\, {\\theta} \\, {\\theta} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } & = & \\frac{\\cos\\left({\\theta}\\right)^{2} - 1}{\\sin\\left({\\theta}\\right)^{2}} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\phi} } \\, {\\theta} \\, {\\phi} \\, {\\theta} }^{ \\, {\\phi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } \\phantom{\\, {\\theta} } } & = & 1 \\end{array}","display":true}}︡
︠a4cf9005-f1fe-45e6-8b95-9c529cd7ceeasi︠
%md
$(\mathbb{S}^2, g)$ is a Riemannian manifold of constant curvature:
︡3e60b712-ba23-4c20-a0ba-c7dbd325a001︡{"md":"$(\\mathbb{S}^2, g)$ is a Riemannian manifold of constant curvature:\n"}︡
︠7da0a7c2-ed43-424a-b7e0-f64f5f904b21s︠
R = g.ricci_scalar()
R.display()
︡432e8423-4402-4658-bfba-50761304c857︡{"tex":{"tex":"\\begin{array}{llcl} \\mathrm{r}\\left(g\\right):& \\mathbb{S}^2 & \\longrightarrow & \\mathbb{R} \\\\ \\mbox{on}\\ U : & \\left(x, y\\right) & \\longmapsto & 2 \\\\ \\mbox{on}\\ V : & \\left({x'}, {y'}\\right) & \\longmapsto & 2 \\\\ \\mbox{on}\\ A : & \\left({\\theta}, {\\phi}\\right) & \\longmapsto & 2 \\end{array}","display":true}}︡
︠904bbca0-41ed-4928-a21e-a1f4270cd247︠










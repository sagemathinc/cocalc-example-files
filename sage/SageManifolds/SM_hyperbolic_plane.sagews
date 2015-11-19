︠681edaa8-87f5-11e5-8cfb-42010af04d0bi︠
%md
# Hyperbolic plane $\mathbb{H}^2$
︡b01fc2ee-f8c6-48e6-96c0-9eab9fddd43d︡︡{"done":true,"md":"# Hyperbolic plane $\\mathbb{H}^2$"}
︠681edaa9-87f5-11e5-8cfb-42010af04d0bi︠
%md
*This worksheet illustrates some features of [SageManifolds](http://sagemanifolds.obspm.fr/) (v0.8) on computations regarding the hyperbolic plane.*
︡149776ae-14ed-4ab6-a9a1-05f1cef54e24︡︡{"done":true,"md":"*This worksheet illustrates some features of [SageManifolds](http://sagemanifolds.obspm.fr/) (v0.8) on computations regarding the hyperbolic plane.*"}
︠681edaaa-87f5-11e5-8cfb-42010af04d0bi︠
%md
First we set up the notebook to display mathematical objects using LaTeX formatting:
︡a9d11d60-a3db-44d5-a69f-b103522d03ce︡︡{"done":true,"md":"First we set up the notebook to display mathematical objects using LaTeX formatting:"}
︠681edaab-87f5-11e5-8cfb-42010af04d0bas︠
%auto
typeset_mode(True, display=False)
︡60e5bd2f-fa35-4e6c-ae44-465611441054︡{"auto":true}︡
︠681edaac-87f5-11e5-8cfb-42010af04d0bi︠
%md
We also define a viewer for 3D plots:
︡95bf1932-fb0e-40a3-b978-1886c741cf67︡︡{"done":true,"md":"We also define a viewer for 3D plots:"}
︠681edaad-87f5-11e5-8cfb-42010af04d0b︠
viewer3D = 'tachyon' # must be 'jmol', 'tachyon' or None (default)
︡bf5be9d4-9665-473b-a63a-837c9dfdde44︡︡{"done":true}
︠681edaae-87f5-11e5-8cfb-42010af04d0bi︠
%md
We declare $\mathbb{H}^2$ as a 2-dimensional differentiable manifold:
︡cc9ebc7a-e72f-4aaf-800e-ac57fc3eecaf︡︡{"done":true,"md":"We declare $\\mathbb{H}^2$ as a 2-dimensional differentiable manifold:"}
︠681edaaf-87f5-11e5-8cfb-42010af04d0b︠
H2 = Manifold(2, 'H2', latex_name=r'\mathbb{H}^2', start_index=1)
print H2
H2
︡9451d090-954f-48e8-9860-58bdd3143326︡︡{"stdout":"2-dimensional manifold 'H2'\n","done":false}︡{"html":"<div>$\\mathbb{H}^2$</div>","done":false}︡{"done":true}
︠681edab0-87f5-11e5-8cfb-42010af04d0bi︠
%md
We shall introduce charts on $\mathbb{H}^2$ that are related to various models of the hyperbolic plane as submanifolds of $\mathbb{R}^3$. Therefore, we start by declaring $\mathbb{R}^3$ as a 3-dimensional manifold equiped with a global chart: the chart of Cartesian coordinates $(X,Y,Z)$:
︡090e1900-e55b-411d-bd55-8c01145ae13a︡︡{"done":true,"md":"We shall introduce charts on $\\mathbb{H}^2$ that are related to various models of the hyperbolic plane as submanifolds of $\\mathbb{R}^3$. Therefore, we start by declaring $\\mathbb{R}^3$ as a 3-dimensional manifold equiped with a global chart: the chart of Cartesian coordinates $(X,Y,Z)$:"}
︠681edab1-87f5-11e5-8cfb-42010af04d0b︠
R3 = Manifold(3, 'R3', latex_name=r'\mathbb{R}^3', start_index=1)
X3.<X,Y,Z> = R3.chart()
X3
︡a85405dd-e4f1-4578-ab04-5042e707b471︡︡{"html":"<div>$\\left(\\mathbb{R}^3,(X, Y, Z)\\right)$</div>","done":false}︡{"done":true}
︠681edab2-87f5-11e5-8cfb-42010af04d0bi︠
%md
## Hyperboloid model

The first chart we introduce is related to the **hyperboloid model of $\mathbb{H}^2$**, namely to the representation of $\mathbb{H}^2$ as the upper sheet ($Z>0$) of the hyperboloid of two sheets defined in $\mathbb{R}^3$ by the equation $X^2 + Y^2 - Z^2 = -1$:
︡6425e030-476b-44ab-93bb-b1ed91aa01da︡︡{"done":true,"md":"## Hyperboloid model\n\nThe first chart we introduce is related to the **hyperboloid model of $\\mathbb{H}^2$**, namely to the representation of $\\mathbb{H}^2$ as the upper sheet ($Z>0$) of the hyperboloid of two sheets defined in $\\mathbb{R}^3$ by the equation $X^2 + Y^2 - Z^2 = -1$:"}
︠681edab3-87f5-11e5-8cfb-42010af04d0b︠
X_hyp.<X,Y> = H2.chart()
X_hyp
︡ee1f2249-ed31-486c-9c2c-0c294571cdc0︡︡{"html":"<div>$\\left(\\mathbb{H}^2,(X, Y)\\right)$</div>","done":false}︡{"done":true}
︠681edab4-87f5-11e5-8cfb-42010af04d0bi︠
%md
The corresponding embedding of $\mathbb{H}^2$ in $\mathbb{R}^3$ is
︡57d8e709-34eb-4c14-802c-ec8cfd17d81f︡︡{"done":true,"md":"The corresponding embedding of $\\mathbb{H}^2$ in $\\mathbb{R}^3$ is"}
︠681edab5-87f5-11e5-8cfb-42010af04d0b︠
Phi1 = H2.diff_mapping(R3, [X, Y, sqrt(1+X^2+Y^2)], name='Phi_1', latex_name=r'\Phi_1')
Phi1.display()
︡3107e388-d19a-42d7-b4b6-3fc15d6b179b︡︡{"html":"<div>$\\begin{array}{llcl} \\Phi_1:&amp; \\mathbb{H}^2 &amp; \\longrightarrow &amp; \\mathbb{R}^3 \\\\ &amp; \\left(X, Y\\right) &amp; \\longmapsto &amp; \\left(X, Y, Z\\right) = \\left(X, Y, \\sqrt{X^{2} + Y^{2} + 1}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠681edab6-87f5-11e5-8cfb-42010af04d0bi︠
%md
By plotting the chart $\left(\mathbb{H}^2,(X,Y)\right)$ in terms of the Cartesian coordinates of $\mathbb{R}^3$, we get a graphical view of $\Phi_1(\mathbb{H}^2)$:
︡8788ec42-5592-438c-b596-4e18ba4de053︡︡{"done":true,"md":"By plotting the chart $\\left(\\mathbb{H}^2,(X,Y)\\right)$ in terms of the Cartesian coordinates of $\\mathbb{R}^3$, we get a graphical view of $\\Phi_1(\\mathbb{H}^2)$:"}
︠681edab7-87f5-11e5-8cfb-42010af04d0b︠
show(X_hyp.plot(X3, mapping=Phi1, nb_values=15, color='blue'), aspect_ratio=1, 
     viewer=viewer3D, figsize=7)
︡00356ab5-14db-4707-858b-0a9f1f8d5cad︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"c619d103-0eb7-4fb1-8226-f1e41c5a94e4","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/10436/tmp_4foW0i.png"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠681edab8-87f5-11e5-8cfb-42010af04d0bi︠
%md
A second chart is obtained from the polar coordinates $(r,\varphi)$ associated with $(X,Y)$. Contrary to $(X,Y)$, the polar chart is not defined on the whole $\mathbb{H}^2$, but on the complement $U$ of the segment $\{Y=0, x\geq 0\}$: 
︡06a46f82-3d49-48b5-9e9c-a7b69c02017c︡︡{"done":true,"md":"A second chart is obtained from the polar coordinates $(r,\\varphi)$ associated with $(X,Y)$. Contrary to $(X,Y)$, the polar chart is not defined on the whole $\\mathbb{H}^2$, but on the complement $U$ of the segment $\\{Y=0, x\\geq 0\\}$:"}
︠681edab9-87f5-11e5-8cfb-42010af04d0b︠
U = H2.open_subset('U', coord_def={X_hyp: (Y!=0, X<0)})
print U
︡6f282969-7975-4a9f-90c7-7a9b5ead2959︡︡{"stdout":"open subset 'U' of the 2-dimensional manifold 'H2'\n","done":false}︡{"done":true}
︠681edaba-87f5-11e5-8cfb-42010af04d0bi︠
%md
Note that (y!=0, x<0) stands for $y\not=0$ OR $x<0$; the condition $y\not=0$ AND $x<0$ would have been written [y!=0, x<0] instead.
︡f65cfd1f-5aff-4e4e-badc-63bd342e384a︡︡{"done":true,"md":"Note that (y!=0, x<0) stands for $y\\not=0$ OR $x<0$; the condition $y\\not=0$ AND $x<0$ would have been written [y!=0, x<0] instead."}
︠681edabb-87f5-11e5-8cfb-42010af04d0b︠
X_pol.<r,ph> = U.chart(r'r:(0,+oo) ph:(0,2*pi):\varphi')
X_pol
︡74e1b71d-86de-4649-b190-adc612d97ef0︡︡{"html":"<div>$\\left(U,(r, {\\varphi})\\right)$</div>","done":false}︡{"done":true}
︠681edabc-87f5-11e5-8cfb-42010af04d0b︠
X_pol.coord_range()
︡cd271dfd-c739-4534-87b8-3f3731bfd07e︡︡{"html":"<div>$r :\\ \\left( 0 , +\\infty \\right) ;\\quad {\\varphi} :\\ \\left( 0 , 2 \\, \\pi \\right)$</div>","done":false}︡{"done":true}
︠681edabd-87f5-11e5-8cfb-42010af04d0bi︠
%md
We specify the transition map between the charts $\left(U,(r,\varphi)\right)$ and $\left(\mathbb{H}^2,(X,Y)\right)$ as $X=r\cos\varphi$, $Y=r\sin\varphi$:
︡b100d624-366b-47e0-a709-a1f282ad2b03︡︡{"done":true,"md":"We specify the transition map between the charts $\\left(U,(r,\\varphi)\\right)$ and $\\left(\\mathbb{H}^2,(X,Y)\\right)$ as $X=r\\cos\\varphi$, $Y=r\\sin\\varphi$:"}
︠681edabe-87f5-11e5-8cfb-42010af04d0b︠
pol_to_hyp = X_pol.transition_map(X_hyp, [r*cos(ph), r*sin(ph)])
pol_to_hyp
︡c0bf9e4b-c692-45b5-8e76-e4e9b85e4aa4︡︡{"html":"<div>$\\left(U,(r, {\\varphi})\\right) \\rightarrow \\left(U,(X, Y)\\right)$</div>","done":false}︡{"done":true}
︠681edabf-87f5-11e5-8cfb-42010af04d0b︠
pol_to_hyp.display()
︡b112522f-9d4c-4e03-a354-f7514cceb906︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} X &amp; = &amp; r \\cos\\left({\\varphi}\\right) \\\\ Y &amp; = &amp; r \\sin\\left({\\varphi}\\right) \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edac0-87f5-11e5-8cfb-42010af04d0b︠
pol_to_hyp.set_inverse(sqrt(X^2+Y^2), atan2(Y, X)) 
︡2ba5b1ae-e2f2-47a3-ba6d-ed5d0e4a538a︡︡{"stdout":"Check of the inverse coordinate transformation:","done":false}︡{"stdout":"\n   r == r\n   ph == ","done":false}︡{"stdout":"arctan2(r*sin(ph), r*cos(ph))\n   X == X\n   Y == ","done":false}︡{"stdout":"Y\n","done":false}︡{"done":true}
︠681edac1-87f5-11e5-8cfb-42010af04d0b︠
pol_to_hyp.inverse().display()
︡371bf4bc-592c-446f-a61b-522aa3a1130a︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} r &amp; = &amp; \\sqrt{X^{2} + Y^{2}} \\\\ {\\varphi} &amp; = &amp; \\arctan\\left(Y, X\\right) \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edac2-87f5-11e5-8cfb-42010af04d0bi︠
%md
The restriction of the embedding $\Phi_1$ to $U$ has then two coordinate expressions:
︡28ec1888-c793-4002-a798-73c0bc33076e︡︡{"done":true,"md":"The restriction of the embedding $\\Phi_1$ to $U$ has then two coordinate expressions:"}
︠681edac3-87f5-11e5-8cfb-42010af04d0b︠
Phi1.restrict(U).display()
︡7dd92266-e0ad-4765-8503-fc5347242dfa︡︡{"html":"<div>$\\begin{array}{llcl} \\Phi_1:&amp; U &amp; \\longrightarrow &amp; \\mathbb{R}^3 \\\\ &amp; \\left(X, Y\\right) &amp; \\longmapsto &amp; \\left(X, Y, Z\\right) = \\left(X, Y, \\sqrt{X^{2} + Y^{2} + 1}\\right) \\\\ &amp; \\left(r, {\\varphi}\\right) &amp; \\longmapsto &amp; \\left(X, Y, Z\\right) = \\left(r \\cos\\left({\\varphi}\\right), r \\sin\\left({\\varphi}\\right), \\sqrt{r^{2} + 1}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠681edac4-87f5-11e5-8cfb-42010af04d0b︠
graph_hyp = X_pol.plot(X3, mapping=Phi1.restrict(U), nb_values=15, ranges={r: (0,3)}, 
                       color='blue')
show(graph_hyp, aspect_ratio=1, viewer=viewer3D, figsize=7)
︡785d7405-08d0-45d7-a171-f7438a90188a︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"8c7ab810-e54d-4d9d-bad9-e362f100a558","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/10436/tmp_6n4m2A.png"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠681edac5-87f5-11e5-8cfb-42010af04d0b︠
Phi1._coord_expression
︡8a5f7c93-9d8e-4024-a04d-1245e106d795︡︡{"html":"<div>$\\left\\{\\left(\\left(\\mathbb{H}^2,(X, Y)\\right), \\left(\\mathbb{R}^3,(X, Y, Z)\\right)\\right) : \\left(X, Y, \\sqrt{X^{2} + Y^{2} + 1}\\right)\\right\\}$</div>","done":false}︡{"done":true}
︠681edac6-87f5-11e5-8cfb-42010af04d0bi︠
%md
## Metric and curvature

The metric on $\mathbb{H}^2$ is that induced by the Minkowksy metric on $\mathbb{R}^3$: 
$$ \eta = \mathrm{d}X\otimes\mathrm{d}X + \mathrm{d}Y\otimes\mathrm{d}Y
  - \mathrm{d}Z\otimes\mathrm{d}Z $$
︡8170547a-aa04-4a02-a874-c000ecc264e7︡︡{"done":true,"md":"## Metric and curvature\n\nThe metric on $\\mathbb{H}^2$ is that induced by the Minkowksy metric on $\\mathbb{R}^3$: \n$$ \\eta = \\mathrm{d}X\\otimes\\mathrm{d}X + \\mathrm{d}Y\\otimes\\mathrm{d}Y\n  - \\mathrm{d}Z\\otimes\\mathrm{d}Z $$"}
︠681edac7-87f5-11e5-8cfb-42010af04d0b︠
eta = R3.lorentz_metric('eta', latex_name=r'\eta')
eta[1,1] = 1 ; eta[2,2] = 1 ; eta[3,3] = -1
eta.display()
︡a7b30891-c915-4355-9381-4e0b8d11680b︡︡{"html":"<div>$\\eta = \\mathrm{d} X\\otimes \\mathrm{d} X+\\mathrm{d} Y\\otimes \\mathrm{d} Y-\\mathrm{d} Z\\otimes \\mathrm{d} Z$</div>","done":false}︡{"done":true}
︠681edac8-87f5-11e5-8cfb-42010af04d0b︠
g = H2.riemann_metric('g')
g.set( Phi1.pullback(eta) )
g.display() 
︡735cd93f-3520-4997-bd26-83028d51df1a︡︡{"html":"<div>$g = \\left( \\frac{Y^{2} + 1}{X^{2} + Y^{2} + 1} \\right) \\mathrm{d} X\\otimes \\mathrm{d} X + \\left( -\\frac{X Y}{X^{2} + Y^{2} + 1} \\right) \\mathrm{d} X\\otimes \\mathrm{d} Y + \\left( -\\frac{X Y}{X^{2} + Y^{2} + 1} \\right) \\mathrm{d} Y\\otimes \\mathrm{d} X + \\left( \\frac{X^{2} + 1}{X^{2} + Y^{2} + 1} \\right) \\mathrm{d} Y\\otimes \\mathrm{d} Y$</div>","done":false}︡{"done":true}
︠681edac9-87f5-11e5-8cfb-42010af04d0bi︠
%md
The expression of the metric tensor in terms of the polar coordinates is
︡cbc83d15-966b-4e83-ac96-bbc3e5ea84f9︡︡{"done":true,"md":"The expression of the metric tensor in terms of the polar coordinates is"}
︠681edaca-87f5-11e5-8cfb-42010af04d0b︠
g.display(X_pol.frame(), X_pol)
︡76d803a3-b10d-4565-9420-a19bfa3444a9︡︡{"html":"<div>$g = \\left( \\frac{1}{r^{2} + 1} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + r^{2} \\mathrm{d} {\\varphi}\\otimes \\mathrm{d} {\\varphi}$</div>","done":false}︡{"done":true}
︠681edacb-87f5-11e5-8cfb-42010af04d0bi︠
%md
The Riemann curvature tensor associated with $g$ is
︡d675865f-4ae5-492c-9fc2-292bce4cefe2︡︡{"done":true,"md":"The Riemann curvature tensor associated with $g$ is"}
︠681edacc-87f5-11e5-8cfb-42010af04d0b︠
Riem = g.riemann()
print Riem
︡63f2b7ca-2492-4ca9-8829-c6d49f88791d︡︡{"stdout":"tensor field 'Riem(g)' of type (1,3) on the 2-dimensional manifold 'H2'\n","done":false}︡{"done":true}
︠681edacd-87f5-11e5-8cfb-42010af04d0b︠
Riem.display(X_pol.frame(), X_pol)
︡30084efd-5268-4940-bf63-bfcadf9adf18︡︡{"html":"<div>$\\mathrm{Riem}\\left(g\\right) = -r^{2} \\frac{\\partial}{\\partial r }\\otimes \\mathrm{d} {\\varphi}\\otimes \\mathrm{d} r\\otimes \\mathrm{d} {\\varphi} + r^{2} \\frac{\\partial}{\\partial r }\\otimes \\mathrm{d} {\\varphi}\\otimes \\mathrm{d} {\\varphi}\\otimes \\mathrm{d} r + \\left( \\frac{1}{r^{2} + 1} \\right) \\frac{\\partial}{\\partial {\\varphi} }\\otimes \\mathrm{d} r\\otimes \\mathrm{d} r\\otimes \\mathrm{d} {\\varphi} + \\left( -\\frac{1}{r^{2} + 1} \\right) \\frac{\\partial}{\\partial {\\varphi} }\\otimes \\mathrm{d} r\\otimes \\mathrm{d} {\\varphi}\\otimes \\mathrm{d} r$</div>","done":false}︡{"done":true}
︠681edace-87f5-11e5-8cfb-42010af04d0bi︠
%md
The Ricci tensor and the Ricci scalar:
︡c5faa595-473b-43a0-88e4-fd440a3ffb35︡︡{"done":true,"md":"The Ricci tensor and the Ricci scalar:"}
︠681edacf-87f5-11e5-8cfb-42010af04d0b︠
Ric = g.ricci()
print Ric
︡2229081a-03c4-42d0-9378-0440ca14ec26︡︡{"stdout":"field of symmetric bilinear forms 'Ric(g)' on the 2-dimensional manifold 'H2'\n","done":false}︡{"done":true}
︠681edad0-87f5-11e5-8cfb-42010af04d0b︠
Ric.display(X_pol.frame(), X_pol)
︡7655557d-cda7-4a1f-a90f-8ce3e24eec7f︡︡{"html":"<div>$\\mathrm{Ric}\\left(g\\right) = \\left( -\\frac{1}{r^{2} + 1} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r -r^{2} \\mathrm{d} {\\varphi}\\otimes \\mathrm{d} {\\varphi}$</div>","done":false}︡{"done":true}
︠681edad1-87f5-11e5-8cfb-42010af04d0b︠
Rscal = g.ricci_scalar()
print Rscal
︡c327bd2e-11a6-4190-8909-51e763fbfefb︡︡{"stdout":"scalar field 'r(g)' on the 2-dimensional manifold 'H2'\n","done":false}︡{"done":true}
︠681edad2-87f5-11e5-8cfb-42010af04d0b︠
Rscal.display()
︡6ba4943d-0202-4ebf-b1c9-c5db047ce86d︡︡{"html":"<div>$\\begin{array}{llcl} \\mathrm{r}\\left(g\\right):&amp; \\mathbb{H}^2 &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(X, Y\\right) &amp; \\longmapsto &amp; -2 \\\\ \\mbox{on}\\ U : &amp; \\left(r, {\\varphi}\\right) &amp; \\longmapsto &amp; -2 \\end{array}$</div>","done":false}︡{"done":true}
︠681edad3-87f5-11e5-8cfb-42010af04d0bi︠
%md
Hence we recover the fact that $(\mathbb{H}^2,g)$ is a space of **constant negative curvature**.
︡c22eda44-46cb-4288-bc93-d43ecd405303︡︡{"done":true,"md":"Hence we recover the fact that $(\\mathbb{H}^2,g)$ is a space of **constant negative curvature**."}
︠681edad4-87f5-11e5-8cfb-42010af04d0bi︠
%md
In dimension 2, the Riemann curvature tensor is entirely determined by the Ricci scalar $R$ according to

$$R^i_{\ \, jlk} = \frac{R}{2} \left( \delta^i_{\ \, k} g_{jl} - \delta^i_{\ \, l} g_{jk} \right)$$

Let us check this formula here, under the form $R^i_{\ \, jlk} = -R g_{j[k} \delta^i_{\ \, l]}$:
︡2d6da6a4-833f-48de-86b3-164c82d1e6d1︡︡{"done":true,"md":"In dimension 2, the Riemann curvature tensor is entirely determined by the Ricci scalar $R$ according to\n\n$$R^i_{\\ \\, jlk} = \\frac{R}{2} \\left( \\delta^i_{\\ \\, k} g_{jl} - \\delta^i_{\\ \\, l} g_{jk} \\right)$$\n\nLet us check this formula here, under the form $R^i_{\\ \\, jlk} = -R g_{j[k} \\delta^i_{\\ \\, l]}$:"}
︠681edad5-87f5-11e5-8cfb-42010af04d0b︠
delta = H2.tangent_identity_field()
Riem == - Rscal*(g*delta).antisymmetrize(2,3)  # 2,3 = last positions of the type-(1,3) tensor g*delta 
︡833bf697-f9f8-4ce3-bb17-2a313c026111︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠681edad6-87f5-11e5-8cfb-42010af04d0bi︠
%md
Similarly the relation $\mathrm{Ric} = (R/2)\; g$ must hold:
︡193c6672-2e01-4ac2-aedf-6ecbc576011d︡︡{"done":true,"md":"Similarly the relation $\\mathrm{Ric} = (R/2)\\; g$ must hold:"}
︠681edad7-87f5-11e5-8cfb-42010af04d0b︠
Ric == (Rscal/2)*g
︡506ed520-cb1c-4775-8930-e0c87e702c72︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠681edad8-87f5-11e5-8cfb-42010af04d0bi︠
%md
## Poincaré disk model

The Poincaré disk model of $\mathbb{H}^2$ is obtained by stereographic projection from the point $S=(0,0,-1)$ of the hyperboloid model to the plane $Z=0$. The radial coordinate $R$ of the image of a point of polar coordinate $(r,\varphi)$ is
$$ R = \frac{r}{1+\sqrt{1+r^2}}.$$
Hence we define the Poincaré disk chart on $\mathbb{H}^2$ by
︡f48a8c61-6ded-4695-a98a-b2dc08bd8f19︡︡{"done":true,"md":"## Poincaré disk model\n\nThe Poincaré disk model of $\\mathbb{H}^2$ is obtained by stereographic projection from the point $S=(0,0,-1)$ of the hyperboloid model to the plane $Z=0$. The radial coordinate $R$ of the image of a point of polar coordinate $(r,\\varphi)$ is\n$$ R = \\frac{r}{1+\\sqrt{1+r^2}}.$$\nHence we define the Poincaré disk chart on $\\mathbb{H}^2$ by"}
︠681edad9-87f5-11e5-8cfb-42010af04d0b︠
X_Pdisk.<R,ph> = U.chart(r'R:(0,1) ph:(0,2*pi):\varphi')
X_Pdisk
︡26fc50ec-05be-4e5d-9e8b-c9f545f9c0eb︡︡{"html":"<div>$\\left(U,(R, {\\varphi})\\right)$</div>","done":false}︡{"done":true}
︠681edada-87f5-11e5-8cfb-42010af04d0b︠
X_Pdisk.coord_range()
︡56e6714b-048f-447a-8a20-a54626bbb2f9︡︡{"html":"<div>$R :\\ \\left( 0 , 1 \\right) ;\\quad {\\varphi} :\\ \\left( 0 , 2 \\, \\pi \\right)$</div>","done":false}︡{"done":true}
︠681edadb-87f5-11e5-8cfb-42010af04d0bi︠
%md
and relate it to the hyperboloid polar chart by
︡ac26fd1a-c53b-45b4-b68d-2bd1b634a08c︡︡{"done":true,"md":"and relate it to the hyperboloid polar chart by"}
︠681edadc-87f5-11e5-8cfb-42010af04d0b︠
pol_to_Pdisk = X_pol.transition_map(X_Pdisk, [r/(1+sqrt(1+r^2)), ph])
pol_to_Pdisk
︡a3fe370e-4fe9-4686-be4c-845a264fca94︡︡{"html":"<div>$\\left(U,(r, {\\varphi})\\right) \\rightarrow \\left(U,(R, {\\varphi})\\right)$</div>","done":false}︡{"done":true}
︠681edadd-87f5-11e5-8cfb-42010af04d0b︠
pol_to_Pdisk.display()
︡36587272-1891-47ed-b551-6f6e70bb8464︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} R &amp; = &amp; \\frac{r}{\\sqrt{r^{2} + 1} + 1} \\\\ {\\varphi} &amp; = &amp; {\\varphi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edade-87f5-11e5-8cfb-42010af04d0b︠
pol_to_Pdisk.set_inverse(2*R/(1-R^2), ph)
pol_to_Pdisk.inverse().display()
︡fd3483e6-b0a6-4e00-8927-40ebf08429b4︡︡{"stdout":"Check of the inverse coordinate transformation:\n   r == ","done":false}︡{"stdout":"r\n   ph == ph\n   R == ","done":false}︡{"stdout":"R\n   ph == ph\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} r &amp; = &amp; -\\frac{2 \\, R}{R^{2} - 1} \\\\ {\\varphi} &amp; = &amp; {\\varphi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edadf-87f5-11e5-8cfb-42010af04d0bi︠
%md
A view of the Poincaré disk chart via the embedding $\Phi_1$:
︡09b5d582-d63f-4f0e-b2a8-971fcad9c69a︡︡{"done":true,"md":"A view of the Poincaré disk chart via the embedding $\\Phi_1$:"}
︠681edae0-87f5-11e5-8cfb-42010af04d0b︠
show(X_Pdisk.plot(X3, mapping=Phi1.restrict(U), ranges={R: (0,0.9)}, color='blue',
                  nb_values=15), aspect_ratio=1, viewer=viewer3D, figsize=7)
︡8c8d943d-821b-4ccd-9aa1-3ca8907f3729︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"651bedd5-a674-489b-a5df-a7e8632a4f79","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/10436/tmp_LjFzDS.png"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠681edae1-87f5-11e5-8cfb-42010af04d0bi︠
%md
The expression of the metric tensor in terms of coordinates $(R,\varphi)$:
︡25deb13c-08e0-418c-861f-998b76661228︡︡{"done":true,"md":"The expression of the metric tensor in terms of coordinates $(R,\\varphi)$:"}
︠681edae2-87f5-11e5-8cfb-42010af04d0b︠
g.display(X_Pdisk.frame(), X_Pdisk)
︡6a09bafe-70f8-434f-b03e-3c6bee62fa20︡︡{"html":"<div>$g = \\left( \\frac{4}{R^{4} - 2 \\, R^{2} + 1} \\right) \\mathrm{d} R\\otimes \\mathrm{d} R + \\left( \\frac{4 \\, R^{2}}{R^{4} - 2 \\, R^{2} + 1} \\right) \\mathrm{d} {\\varphi}\\otimes \\mathrm{d} {\\varphi}$</div>","done":false}︡{"done":true}
︠681edae3-87f5-11e5-8cfb-42010af04d0bi︠
%md
We may factorize each metric component:
︡72c79a51-2e9b-4028-956a-a05f0a9473d2︡︡{"done":true,"md":"We may factorize each metric component:"}
︠681edae4-87f5-11e5-8cfb-42010af04d0b︠
for i in [1,2]:
    g[X_Pdisk.frame(), i, i, X_Pdisk].factor()
g.display(X_Pdisk.frame(), X_Pdisk)
︡283e73fb-e595-4734-8a55-b707d87c7fdc︡︡{"html":"<div>$\\frac{4}{{\\left(R + 1\\right)}^{2} {\\left(R - 1\\right)}^{2}}$</div>","done":false}︡{"html":"<div>$\\frac{4 \\, R^{2}}{{\\left(R + 1\\right)}^{2} {\\left(R - 1\\right)}^{2}}$</div>","done":false}︡{"html":"<div>$g = \\frac{4}{{\\left(R + 1\\right)}^{2} {\\left(R - 1\\right)}^{2}} \\mathrm{d} R\\otimes \\mathrm{d} R + \\frac{4 \\, R^{2}}{{\\left(R + 1\\right)}^{2} {\\left(R - 1\\right)}^{2}} \\mathrm{d} {\\varphi}\\otimes \\mathrm{d} {\\varphi}$</div>","done":false}︡{"done":true}
︠681edae5-87f5-11e5-8cfb-42010af04d0bi︠
%md
### Cartesian coordinates on the Poincaré disk

Let us introduce Cartesian coordinates $(u,v)$ on the Poincaré disk; since the latter has a unit radius, this amounts to define the following chart on $\mathbb{H}^2$:
︡e2ffd986-3fd8-4f9e-a89d-36d41bbb2231︡︡{"done":true,"md":"### Cartesian coordinates on the Poincaré disk\n\nLet us introduce Cartesian coordinates $(u,v)$ on the Poincaré disk; since the latter has a unit radius, this amounts to define the following chart on $\\mathbb{H}^2$:"}
︠681edae6-87f5-11e5-8cfb-42010af04d0b︠
X_Pdisk_cart.<u,v> = H2.chart('u:(-1,1) v:(-1,1)')
X_Pdisk_cart.add_restrictions(u^2+v^2 < 1)
X_Pdisk_cart
︡46bd4eef-eb0b-4cc9-9c3d-1bfeafc751a3︡︡{"html":"<div>$\\left(\\mathbb{H}^2,(u, v)\\right)$</div>","done":false}︡{"done":true}
︠681edae7-87f5-11e5-8cfb-42010af04d0bi︠
%md
On $U$, the Cartesian coordinates $(u,v)$ are related to the polar coordinates $(R,\varphi)$ by the standard formulas:
︡e56301be-daa4-43fc-babb-70503cbc0f48︡︡{"done":true,"md":"On $U$, the Cartesian coordinates $(u,v)$ are related to the polar coordinates $(R,\\varphi)$ by the standard formulas:"}
︠681edae8-87f5-11e5-8cfb-42010af04d0b︠
Pdisk_to_Pdisk_cart = X_Pdisk.transition_map(X_Pdisk_cart, [R*cos(ph), R*sin(ph)])
Pdisk_to_Pdisk_cart
︡82957c96-6ed2-48b1-ad1f-e68969e44370︡︡{"html":"<div>$\\left(U,(R, {\\varphi})\\right) \\rightarrow \\left(U,(u, v)\\right)$</div>","done":false}︡{"done":true}
︠681edae9-87f5-11e5-8cfb-42010af04d0b︠
Pdisk_to_Pdisk_cart.display()
︡3e51fbd8-8913-4429-b5ef-49415af61fa8︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} u &amp; = &amp; R \\cos\\left({\\varphi}\\right) \\\\ v &amp; = &amp; R \\sin\\left({\\varphi}\\right) \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edaea-87f5-11e5-8cfb-42010af04d0b︠
Pdisk_to_Pdisk_cart.set_inverse(sqrt(u^2+v^2), atan2(v, u)) 
Pdisk_to_Pdisk_cart.inverse().display()
︡9c8680a1-42a3-4c26-a9bb-b5dd52cfa0fc︡︡{"stdout":"Check of the inverse coordinate transformation:","done":false}︡{"stdout":"\n   R == R\n   ph == ","done":false}︡{"stdout":"arctan2(R*sin(ph), R*cos(ph))\n   u == u\n   v == ","done":false}︡{"stdout":"v\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} R &amp; = &amp; \\sqrt{u^{2} + v^{2}} \\\\ {\\varphi} &amp; = &amp; \\arctan\\left(v, u\\right) \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edaeb-87f5-11e5-8cfb-42010af04d0bi︠
%md
The embedding of $\mathbb{H}^2$ in $\mathbb{R}^3$ associated with the Poincaré disk model is naturally defined as
︡0653fa2e-cdb9-45cf-882e-5422886e054c︡︡{"done":true,"md":"The embedding of $\\mathbb{H}^2$ in $\\mathbb{R}^3$ associated with the Poincaré disk model is naturally defined as"}
︠681edaec-87f5-11e5-8cfb-42010af04d0b︠
Phi2 = H2.diff_mapping(R3, {(X_Pdisk_cart, X3): [u, v, 0]},
                       name='Phi_2', latex_name=r'\Phi_2')
Phi2.display()
︡94e63a32-696d-4345-bf23-81cb7669643b︡︡{"html":"<div>$\\begin{array}{llcl} \\Phi_2:&amp; \\mathbb{H}^2 &amp; \\longrightarrow &amp; \\mathbb{R}^3 \\\\ &amp; \\left(u, v\\right) &amp; \\longmapsto &amp; \\left(X, Y, Z\\right) = \\left(u, v, 0\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠681edaed-87f5-11e5-8cfb-42010af04d0bi︠
%md
Let us use it to draw the Poincaré disk in $\mathbb{R}^3$:
︡c9dcaa65-fc1e-44b5-a35b-cdfbd3d0432f︡︡{"done":true,"md":"Let us use it to draw the Poincaré disk in $\\mathbb{R}^3$:"}
︠681edaee-87f5-11e5-8cfb-42010af04d0b︠
graph_disk_uv = X_Pdisk_cart.plot(X3, mapping=Phi2, nb_values=15)
show(graph_disk_uv, viewer=viewer3D, figsize=7)
︡eda9a6c7-9c25-417e-b104-6eb84fa79a76︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"cd857f50-7c8c-4f20-911c-b51bd3cf4d7e","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/10436/tmp_fS5Buo.png"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠681edaef-87f5-11e5-8cfb-42010af04d0bi︠
%md
On $U$, the change of coordinates $(r,\varphi) \rightarrow (u,v)$ is obtained by combining the changes $(r,\varphi) \rightarrow (R,\varphi)$ and $(R,\varphi) \rightarrow (u,v)$:
︡d1661d2d-2b14-4a02-aeb9-45ef0ef620b8︡︡{"done":true,"md":"On $U$, the change of coordinates $(r,\\varphi) \\rightarrow (u,v)$ is obtained by combining the changes $(r,\\varphi) \\rightarrow (R,\\varphi)$ and $(R,\\varphi) \\rightarrow (u,v)$:"}
︠681edaf0-87f5-11e5-8cfb-42010af04d0b︠
pol_to_Pdisk_cart = Pdisk_to_Pdisk_cart * pol_to_Pdisk
pol_to_Pdisk_cart
︡6bf8bd1d-57a5-4888-ba6b-524f18a6e85e︡︡{"html":"<div>$\\left(U,(r, {\\varphi})\\right) \\rightarrow \\left(U,(u, v)\\right)$</div>","done":false}︡{"done":true}
︠681edaf1-87f5-11e5-8cfb-42010af04d0b︠
pol_to_Pdisk_cart.display()
︡69842cca-8a78-4e43-a875-d2f269130554︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} u &amp; = &amp; \\frac{r \\cos\\left({\\varphi}\\right)}{\\sqrt{r^{2} + 1} + 1} \\\\ v &amp; = &amp; \\frac{r \\sin\\left({\\varphi}\\right)}{\\sqrt{r^{2} + 1} + 1} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edaf2-87f5-11e5-8cfb-42010af04d0bi︠
%md
Still on $U$, the change of coordinates $(X,Y) \rightarrow (u,v)$ is obtained by combining the changes $(X,Y) \rightarrow (r,\varphi)$ with $(r,\varphi) \rightarrow (u,v)$:
︡2ab32c8b-984f-4a66-8215-7b28caf96d1c︡︡{"done":true,"md":"Still on $U$, the change of coordinates $(X,Y) \\rightarrow (u,v)$ is obtained by combining the changes $(X,Y) \\rightarrow (r,\\varphi)$ with $(r,\\varphi) \\rightarrow (u,v)$:"}
︠681edaf3-87f5-11e5-8cfb-42010af04d0b︠
hyp_to_Pdisk_cart_U = pol_to_Pdisk_cart * pol_to_hyp.inverse()
hyp_to_Pdisk_cart_U
︡f29c261b-ae77-49ac-bc35-1fc2a8a65347︡︡{"html":"<div>$\\left(U,(X, Y)\\right) \\rightarrow \\left(U,(u, v)\\right)$</div>","done":false}︡{"done":true}
︠681edaf4-87f5-11e5-8cfb-42010af04d0b︠
hyp_to_Pdisk_cart_U.display()
︡b2d60ce6-eb85-42f3-8b00-2c69c7156e7c︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} u &amp; = &amp; \\frac{X}{\\sqrt{X^{2} + Y^{2} + 1} + 1} \\\\ v &amp; = &amp; \\frac{Y}{\\sqrt{X^{2} + Y^{2} + 1} + 1} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edaf5-87f5-11e5-8cfb-42010af04d0bi︠
%md
We use the above expression to extend the change of coordinates $(X,Y) \rightarrow (u,v)$ from $U$ to the whole manifold $\mathbb{H}^2$:
︡d5adc0df-1d64-4dc3-ae7a-4884a270850b︡︡{"done":true,"md":"We use the above expression to extend the change of coordinates $(X,Y) \\rightarrow (u,v)$ from $U$ to the whole manifold $\\mathbb{H}^2$:"}
︠681edaf6-87f5-11e5-8cfb-42010af04d0b︠
hyp_to_Pdisk_cart = X_hyp.transition_map(X_Pdisk_cart, hyp_to_Pdisk_cart_U(X,Y))
hyp_to_Pdisk_cart
︡edd0bead-d815-4fe2-a590-3ac43c1630b1︡︡{"html":"<div>$\\left(\\mathbb{H}^2,(X, Y)\\right) \\rightarrow \\left(\\mathbb{H}^2,(u, v)\\right)$</div>","done":false}︡{"done":true}
︠681edaf7-87f5-11e5-8cfb-42010af04d0b︠
hyp_to_Pdisk_cart.display()
︡1cf093bd-d20b-430f-9380-0bb53bc2375a︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} u &amp; = &amp; \\frac{X}{\\sqrt{X^{2} + Y^{2} + 1} + 1} \\\\ v &amp; = &amp; \\frac{Y}{\\sqrt{X^{2} + Y^{2} + 1} + 1} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edaf8-87f5-11e5-8cfb-42010af04d0b︠
hyp_to_Pdisk_cart.set_inverse(2*u/(1-u^2-v^2), 2*v/(1-u^2-v^2))
hyp_to_Pdisk_cart.inverse().display()
︡c3b7d0d8-dc07-4127-a7fd-bf27c361a4a8︡︡{"stdout":"Check of the inverse coordinate transformation:","done":false}︡{"stdout":"\n   X == X\n   Y == ","done":false}︡{"stdout":"Y\n   u == ","done":false}︡{"stdout":"-2*u*abs(u^2 + v^2 - 1)/(u^4 + 2*u^2*v^2 + v^4 + (u^2 + v^2 - 1)*abs(u^2 + v^2 - 1) - 1)\n   v == ","done":false}︡{"stdout":"-2*v*abs(u^2 + v^2 - 1)/(u^4 + 2*u^2*v^2 + v^4 + (u^2 + v^2 - 1)*abs(u^2 + v^2 - 1) - 1)\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} X &amp; = &amp; -\\frac{2 \\, u}{u^{2} + v^{2} - 1} \\\\ Y &amp; = &amp; -\\frac{2 \\, v}{u^{2} + v^{2} - 1} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edaf9-87f5-11e5-8cfb-42010af04d0b︠
graph_Pdisk = X_pol.plot(X3, mapping=Phi2.restrict(U), ranges={r: (0, 20)}, nb_values=15, 
                         label_axes=False)
show(graph_hyp + graph_Pdisk, aspect_ratio=1, viewer=viewer3D, figsize=7)
︡9d9583ae-f6ae-4f9f-b68a-d06c044539ac︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"bc11f6de-3fd3-4d37-aa2f-bce41083cd79","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/10436/tmp_ljenmI.png"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠681edafa-87f5-11e5-8cfb-42010af04d0b︠
X_pol.plot(X_Pdisk_cart, ranges={r: (0, 20)}, nb_values=15)
︡f84451c6-805b-464d-802b-3b38ec2c596a︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"da0f34b1-afb4-40de-9068-88835e5f8d24","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/10436/tmp__LhFJm.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠681edafb-87f5-11e5-8cfb-42010af04d0bi︠
%md
### Metric tensor in Poincaré disk coordinates $(u,v)$
︡b769f77f-cbef-4d05-a0ee-30d3d94a8724︡︡{"done":true,"md":"### Metric tensor in Poincaré disk coordinates $(u,v)$"}
︠681edafc-87f5-11e5-8cfb-42010af04d0bi︠
%md
From now on, we are using the Poincaré disk chart $(\mathbb{H}^2,(u,v))$ as the default one on $\mathbb{H}^2$:
︡d83ea7b8-5536-4057-958e-0533aa1a8a4f︡︡{"done":true,"md":"From now on, we are using the Poincaré disk chart $(\\mathbb{H}^2,(u,v))$ as the default one on $\\mathbb{H}^2$:"}
︠681edafd-87f5-11e5-8cfb-42010af04d0b︠
H2.set_default_chart(X_Pdisk_cart)
H2.set_default_frame(X_Pdisk_cart.frame())
︡7c943e03-ae79-4258-a018-40381267e683︡︡{"done":true}
︠681edafe-87f5-11e5-8cfb-42010af04d0b︠
g.display(X_hyp.frame())
︡71f19b51-75d5-45ed-b4c5-dce93cc5fd0a︡︡{"html":"<div>$g = \\left( \\frac{u^{4} + v^{4} + 2 \\, {\\left(u^{2} + 1\\right)} v^{2} - 2 \\, u^{2} + 1}{u^{4} + v^{4} + 2 \\, {\\left(u^{2} + 1\\right)} v^{2} + 2 \\, u^{2} + 1} \\right) \\mathrm{d} X\\otimes \\mathrm{d} X + \\left( -\\frac{4 \\, u v}{u^{4} + v^{4} + 2 \\, {\\left(u^{2} + 1\\right)} v^{2} + 2 \\, u^{2} + 1} \\right) \\mathrm{d} X\\otimes \\mathrm{d} Y + \\left( -\\frac{4 \\, u v}{u^{4} + v^{4} + 2 \\, {\\left(u^{2} + 1\\right)} v^{2} + 2 \\, u^{2} + 1} \\right) \\mathrm{d} Y\\otimes \\mathrm{d} X + \\left( \\frac{u^{4} + v^{4} + 2 \\, {\\left(u^{2} - 1\\right)} v^{2} + 2 \\, u^{2} + 1}{u^{4} + v^{4} + 2 \\, {\\left(u^{2} + 1\\right)} v^{2} + 2 \\, u^{2} + 1} \\right) \\mathrm{d} Y\\otimes \\mathrm{d} Y$</div>","done":false}︡{"done":true}
︠681edaff-87f5-11e5-8cfb-42010af04d0b︠
g.display()
︡ed59145d-f35a-4eb6-9230-9b4af8b53d4f︡︡{"html":"<div>$g = \\left( \\frac{4}{u^{4} + v^{4} + 2 \\, {\\left(u^{2} - 1\\right)} v^{2} - 2 \\, u^{2} + 1} \\right) \\mathrm{d} u\\otimes \\mathrm{d} u + \\left( \\frac{4}{u^{4} + v^{4} + 2 \\, {\\left(u^{2} - 1\\right)} v^{2} - 2 \\, u^{2} + 1} \\right) \\mathrm{d} v\\otimes \\mathrm{d} v$</div>","done":false}︡{"done":true}
︠681edb00-87f5-11e5-8cfb-42010af04d0b︠
g[1,1].factor() ; g[2,2].factor()
g.display()
︡42ddd02c-9a02-49ce-82ab-61c2aeeb3f2a︡︡{"html":"<div>$\\frac{4}{{\\left(u^{2} + v^{2} - 1\\right)}^{2}}$</div>","done":false}︡{"html":"<div>$\\frac{4}{{\\left(u^{2} + v^{2} - 1\\right)}^{2}}$</div>","done":false}︡{"html":"<div>$g = \\frac{4}{{\\left(u^{2} + v^{2} - 1\\right)}^{2}} \\mathrm{d} u\\otimes \\mathrm{d} u + \\frac{4}{{\\left(u^{2} + v^{2} - 1\\right)}^{2}} \\mathrm{d} v\\otimes \\mathrm{d} v$</div>","done":false}︡{"done":true}
︠681edb01-87f5-11e5-8cfb-42010af04d0bi︠
%md
## Hemispherical model

The **hemispherical model of $\mathbb{H}^2$** is obtained by the inverse stereographic projection from the point $S = (0,0,-1)$ of the Poincaré disk to the unit sphere $X^2+Y^2+Z^2=1$. This induces a spherical coordinate chart on $U$:
︡139fd790-faf1-4d73-b67c-4b40222accf6︡︡{"done":true,"md":"## Hemispherical model\n\nThe **hemispherical model of $\\mathbb{H}^2$** is obtained by the inverse stereographic projection from the point $S = (0,0,-1)$ of the Poincaré disk to the unit sphere $X^2+Y^2+Z^2=1$. This induces a spherical coordinate chart on $U$:"}
︠681edb02-87f5-11e5-8cfb-42010af04d0b︠
X_spher.<th,ph> = U.chart(r'th:(0,pi/2):\theta ph:(0,2*pi):\varphi')
X_spher
︡d98a6dca-7cc5-451e-94b8-6ceeaafad11e︡︡{"html":"<div>$\\left(U,({\\theta}, {\\varphi})\\right)$</div>","done":false}︡{"done":true}
︠681edb03-87f5-11e5-8cfb-42010af04d0bi︠
%md
From the stereographic projection from $S$, we obtain that
\begin{equation}
\sin\theta = \frac{2R}{1+R^2}
\end{equation}
Hence the transition map:
︡3a790d93-197e-42da-8ff7-acf1b69acaa8︡︡{"done":true,"md":"From the stereographic projection from $S$, we obtain that\n\\begin{equation}\n\\sin\\theta = \\frac{2R}{1+R^2}\n\\end{equation}\nHence the transition map:"}
︠681edb04-87f5-11e5-8cfb-42010af04d0b︠
Pdisk_to_spher = X_Pdisk.transition_map(X_spher, [arcsin(2*R/(1+R^2)), ph])
Pdisk_to_spher
︡ac341907-367a-418d-aa96-d8367ff49882︡︡{"html":"<div>$\\left(U,(R, {\\varphi})\\right) \\rightarrow \\left(U,({\\theta}, {\\varphi})\\right)$</div>","done":false}︡{"done":true}
︠681edb05-87f5-11e5-8cfb-42010af04d0b︠
Pdisk_to_spher.display()
︡4b4c6ccd-70d0-4c79-959d-b0b34942f466︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} {\\theta} &amp; = &amp; \\arcsin\\left(\\frac{2 \\, R}{R^{2} + 1}\\right) \\\\ {\\varphi} &amp; = &amp; {\\varphi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edb06-87f5-11e5-8cfb-42010af04d0b︠
Pdisk_to_spher.set_inverse(sin(th)/(1+cos(th)), ph)
Pdisk_to_spher.inverse().display()
︡56e3ddc8-8599-48a3-b351-29c7b09c0785︡︡{"stdout":"Check of the inverse coordinate transformation:\n   R == ","done":false}︡{"stdout":"R\n   ph == ph\n   th == ","done":false}︡{"stdout":"th\n   ph == ph\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} R &amp; = &amp; \\frac{\\sin\\left({\\theta}\\right)}{\\cos\\left({\\theta}\\right) + 1} \\\\ {\\varphi} &amp; = &amp; {\\varphi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edb07-87f5-11e5-8cfb-42010af04d0bi︠
%md
In the spherical coordinates $(\theta,\varphi)$, the metric takes the following form:
︡46b88422-2121-472a-86db-3aa1ddf1d2d1︡︡{"done":true,"md":"In the spherical coordinates $(\\theta,\\varphi)$, the metric takes the following form:"}
︠681edb08-87f5-11e5-8cfb-42010af04d0b︠
g.display(X_spher.frame(), X_spher)
︡efcaaa83-3963-498e-a313-a18a0e9004c0︡︡{"html":"<div>$g = \\frac{1}{\\cos\\left({\\theta}\\right)^{2}} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + \\frac{\\sin\\left({\\theta}\\right)^{2}}{\\cos\\left({\\theta}\\right)^{2}} \\mathrm{d} {\\varphi}\\otimes \\mathrm{d} {\\varphi}$</div>","done":false}︡{"done":true}
︠681edb09-87f5-11e5-8cfb-42010af04d0bi︠
%md
The embedding of $\mathbb{H}^2$ in $\mathbb{R}^3$ associated with the hemispherical model is naturally:
︡0b0673b2-7c8f-4f9c-99ca-95abddfdac10︡︡{"done":true,"md":"The embedding of $\\mathbb{H}^2$ in $\\mathbb{R}^3$ associated with the hemispherical model is naturally:"}
︠681edb0a-87f5-11e5-8cfb-42010af04d0b︠
Phi3 = H2.diff_mapping(R3, {(X_spher, X3): [sin(th)*cos(ph), sin(th)*sin(ph), cos(th)]},
                       name='Phi_3', latex_name=r'\Phi_3')
Phi3.display()
︡2d0d92a1-ae94-4c58-93fe-769bcbf5038c︡︡{"html":"<div>$\\begin{array}{llcl} \\Phi_3:&amp; \\mathbb{H}^2 &amp; \\longrightarrow &amp; \\mathbb{R}^3 \\\\ \\mbox{on}\\ U : &amp; \\left(R, {\\varphi}\\right) &amp; \\longmapsto &amp; \\left(X, Y, Z\\right) = \\left(\\frac{2 \\, R \\cos\\left({\\varphi}\\right)}{R^{2} + 1}, \\frac{2 \\, R \\sin\\left({\\varphi}\\right)}{R^{2} + 1}, -\\frac{R^{2} - 1}{R^{2} + 1}\\right) \\\\ \\mbox{on}\\ U : &amp; \\left({\\theta}, {\\varphi}\\right) &amp; \\longmapsto &amp; \\left(X, Y, Z\\right) = \\left(\\cos\\left({\\varphi}\\right) \\sin\\left({\\theta}\\right), \\sin\\left({\\varphi}\\right) \\sin\\left({\\theta}\\right), \\cos\\left({\\theta}\\right)\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠681edb0b-87f5-11e5-8cfb-42010af04d0b︠
graph_spher = X_pol.plot(X3, mapping=Phi3, ranges={r: (0, 20)}, nb_values=15, color='orange', 
                         label_axes=False)
show(graph_hyp + graph_Pdisk + graph_spher, aspect_ratio=1, viewer=viewer3D, figsize=7)
︡e52b24cd-e05c-47b9-9bda-8570703ba52f︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"e087652b-69ce-424f-91de-dbffd3b0f821","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/10436/tmp_X6BjQA.png"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠681edb0c-87f5-11e5-8cfb-42010af04d0bi︠
%md
## Poincaré half-plane model

The **Poincaré half-plane model of $\mathbb{H}^2$** is obtained by stereographic projection from the point $W=(-1,0,0)$ of the hemispherical model to the plane $X=1$. This induces a new coordinate chart on $\mathbb{H}^2$ by setting $(x,y)=(Y,Z)$ in the plane $X=1$:
︡c61d5aa2-e5b6-49f8-a13d-1abd7274b73c︡︡{"done":true,"md":"## Poincaré half-plane model\n\nThe **Poincaré half-plane model of $\\mathbb{H}^2$** is obtained by stereographic projection from the point $W=(-1,0,0)$ of the hemispherical model to the plane $X=1$. This induces a new coordinate chart on $\\mathbb{H}^2$ by setting $(x,y)=(Y,Z)$ in the plane $X=1$:"}
︠681edb0d-87f5-11e5-8cfb-42010af04d0b︠
X_hplane.<x,y> = H2.chart('x y:(0,+oo)')
X_hplane
︡4c883f74-fed0-46dd-b479-5260de203b04︡︡{"html":"<div>$\\left(\\mathbb{H}^2,(x, y)\\right)$</div>","done":false}︡{"done":true}
︠681edb0e-87f5-11e5-8cfb-42010af04d0bi︠
%md
The coordinate transformation $(\theta,\varphi)\rightarrow (x,y)$ is easily deduced from the stereographic projection from the point $W$:
︡4007b551-6fd9-4244-b12d-9e9cd53d82b9︡︡{"done":true,"md":"The coordinate transformation $(\\theta,\\varphi)\\rightarrow (x,y)$ is easily deduced from the stereographic projection from the point $W$:"}
︠681edb0f-87f5-11e5-8cfb-42010af04d0b︠
spher_to_hplane = X_spher.transition_map(X_hplane, [2*sin(th)*sin(ph)/(1+sin(th)*cos(ph)),
                                                    2*cos(th)/(1+sin(th)*cos(ph))])
spher_to_hplane
︡be701f0c-b43e-4a7e-a25f-0025b4835541︡︡{"html":"<div>$\\left(U,({\\theta}, {\\varphi})\\right) \\rightarrow \\left(U,(x, y)\\right)$</div>","done":false}︡{"done":true}
︠681edb10-87f5-11e5-8cfb-42010af04d0b︠
spher_to_hplane.display()
︡627d61a1-957f-4446-a939-fc49d39618d1︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} x &amp; = &amp; \\frac{2 \\, \\sin\\left({\\varphi}\\right) \\sin\\left({\\theta}\\right)}{\\cos\\left({\\varphi}\\right) \\sin\\left({\\theta}\\right) + 1} \\\\ y &amp; = &amp; \\frac{2 \\, \\cos\\left({\\theta}\\right)}{\\cos\\left({\\varphi}\\right) \\sin\\left({\\theta}\\right) + 1} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edb11-87f5-11e5-8cfb-42010af04d0b︠
Pdisk_to_hplane = spher_to_hplane * Pdisk_to_spher
Pdisk_to_hplane
︡34693ff1-bb73-4309-9e72-5ee8e339b86a︡︡{"html":"<div>$\\left(U,(R, {\\varphi})\\right) \\rightarrow \\left(U,(x, y)\\right)$</div>","done":false}︡{"done":true}
︠681edb12-87f5-11e5-8cfb-42010af04d0b︠
Pdisk_to_hplane.display()
︡36dc52af-5233-492e-92cc-1e46b79de1bf︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} x &amp; = &amp; \\frac{4 \\, R \\sin\\left({\\varphi}\\right)}{R^{2} + 2 \\, R \\cos\\left({\\varphi}\\right) + 1} \\\\ y &amp; = &amp; -\\frac{2 \\, {\\left(R^{2} - 1\\right)}}{R^{2} + 2 \\, R \\cos\\left({\\varphi}\\right) + 1} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edb13-87f5-11e5-8cfb-42010af04d0b︠
Pdisk_cart_to_hplane_U = Pdisk_to_hplane * Pdisk_to_Pdisk_cart.inverse()
Pdisk_cart_to_hplane_U
︡f5a2f395-c19e-409b-be64-e84acc8d2d9f︡︡{"html":"<div>$\\left(U,(u, v)\\right) \\rightarrow \\left(U,(x, y)\\right)$</div>","done":false}︡{"done":true}
︠681edb14-87f5-11e5-8cfb-42010af04d0b︠
Pdisk_cart_to_hplane_U.display()
︡4b5759af-49d2-4287-986c-f613b9386438︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} x &amp; = &amp; \\frac{4 \\, v}{u^{2} + v^{2} + 2 \\, u + 1} \\\\ y &amp; = &amp; -\\frac{2 \\, {\\left(u^{2} + v^{2} - 1\\right)}}{u^{2} + v^{2} + 2 \\, u + 1} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edb15-87f5-11e5-8cfb-42010af04d0bi︠
%md
Let us use the above formula to define the transition map $(u,v)\rightarrow (x,y)$ on the whole manifold $\mathbb{H}^2$ (and not only on $U$):
︡71c502d3-bdc8-4119-ae1e-24e50974dbe7︡︡{"done":true,"md":"Let us use the above formula to define the transition map $(u,v)\\rightarrow (x,y)$ on the whole manifold $\\mathbb{H}^2$ (and not only on $U$):"}
︠681edb16-87f5-11e5-8cfb-42010af04d0b︠
Pdisk_cart_to_hplane = X_Pdisk_cart.transition_map(X_hplane, Pdisk_cart_to_hplane_U(u,v))
Pdisk_cart_to_hplane
︡6448a1d3-daea-4a3e-a779-f35f0b655636︡︡{"html":"<div>$\\left(\\mathbb{H}^2,(u, v)\\right) \\rightarrow \\left(\\mathbb{H}^2,(x, y)\\right)$</div>","done":false}︡{"done":true}
︠681edb17-87f5-11e5-8cfb-42010af04d0b︠
Pdisk_cart_to_hplane.display()
︡da31470a-fa07-4ce3-896f-c7e5c8aa1805︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} x &amp; = &amp; \\frac{4 \\, v}{u^{2} + v^{2} + 2 \\, u + 1} \\\\ y &amp; = &amp; -\\frac{2 \\, {\\left(u^{2} + v^{2} - 1\\right)}}{u^{2} + v^{2} + 2 \\, u + 1} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edb18-87f5-11e5-8cfb-42010af04d0b︠
Pdisk_cart_to_hplane.set_inverse((4-x^2-y^2)/(x^2+(2+y)^2), 4*x/(x^2+(2+y)^2))
Pdisk_cart_to_hplane.inverse().display()
︡35cbddb5-2ad0-4ca7-97fd-8b9142cf226c︡︡{"stdout":"Check of the inverse coordinate transformation:","done":false}︡{"stdout":"\n   u == u\n   v == ","done":false}︡{"stdout":"v\n   x == x\n   y == ","done":false}︡{"stdout":"y\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} u &amp; = &amp; -\\frac{x^{2} + y^{2} - 4}{x^{2} + {\\left(y + 2\\right)}^{2}} \\\\ v &amp; = &amp; \\frac{4 \\, x}{x^{2} + {\\left(y + 2\\right)}^{2}} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠681edb19-87f5-11e5-8cfb-42010af04d0bi︠
%md
Since the coordinates $(x,y)$ correspond to $(Y,Z)$ in the plane $X=1$, the embedding of $\mathbb{H}^2$ in $\mathbb{R}^3$ naturally associated with the Poincaré half-plane model is
︡ed2896a2-d6c4-4cf9-8e11-c6ffc0213ed5︡︡{"done":true,"md":"Since the coordinates $(x,y)$ correspond to $(Y,Z)$ in the plane $X=1$, the embedding of $\\mathbb{H}^2$ in $\\mathbb{R}^3$ naturally associated with the Poincaré half-plane model is"}
︠681edb1a-87f5-11e5-8cfb-42010af04d0b︠
Phi4 = H2.diff_mapping(R3, {(X_hplane, X3): [1, x, y]},
                       name='Phi_4', latex_name=r'\Phi_4')
Phi4.display()
︡00bbb1d5-ac88-4672-8aad-71dcff0d6002︡︡{"html":"<div>$\\begin{array}{llcl} \\Phi_4:&amp; \\mathbb{H}^2 &amp; \\longrightarrow &amp; \\mathbb{R}^3 \\\\ &amp; \\left(u, v\\right) &amp; \\longmapsto &amp; \\left(X, Y, Z\\right) = \\left(1, \\frac{4 \\, v}{u^{2} + v^{2} + 2 \\, u + 1}, -\\frac{2 \\, {\\left(u^{2} + v^{2} - 1\\right)}}{u^{2} + v^{2} + 2 \\, u + 1}\\right) \\\\ &amp; \\left(x, y\\right) &amp; \\longmapsto &amp; \\left(X, Y, Z\\right) = \\left(1, x, y\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠681edb1b-87f5-11e5-8cfb-42010af04d0b︠
graph_hplane = X_pol.plot(X3, mapping=Phi4.restrict(U), ranges={r: (0, 1.5)}, nb_values=15, 
                          color='brown', label_axes=False)
show(graph_hyp + graph_Pdisk + graph_spher + graph_hplane, aspect_ratio=1, viewer=viewer3D,
     figsize=8)
︡9df0b775-40ba-4889-8b77-23f040abda6f︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"fa8a848c-12e6-4f51-8d07-103ad69ce84c","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/10436/tmp_UMSsf0.png"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠681edb1c-87f5-11e5-8cfb-42010af04d0bi︠
%md
Let us draw the grid of the hyperboloidal coordinates $(r,\varphi)$ in terms of the half-plane coordinates $(x,y)$:
︡a3909f03-b16c-44c9-a64c-1c0d05dad9e4︡︡{"done":true,"md":"Let us draw the grid of the hyperboloidal coordinates $(r,\\varphi)$ in terms of the half-plane coordinates $(x,y)$:"}
︠681edb1d-87f5-11e5-8cfb-42010af04d0b︠
pol_to_hplane = Pdisk_to_hplane * pol_to_Pdisk
︡0055a6e6-13f1-42f1-88bf-148780ddef4e︡︡{"done":true}
︠681edb1e-87f5-11e5-8cfb-42010af04d0b︠
show(X_pol.plot(X_hplane, ranges={r: (0,24)}, style={r: '-', ph: '--'}, nb_values=15, 
                plot_points=200, color='brown'), xmin=-5, xmax=5, ymin=0, ymax=5, aspect_ratio=1)
︡d27d8451-ef73-448a-9220-fcde147a9f3b︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"89d05c63-7c77-4ca4-b175-138454aeca66","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/10436/tmp_H8w75X.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠681edb1f-87f5-11e5-8cfb-42010af04d0bi︠
%md
The solid curves are those along which $r$ varies while $\varphi$ is kept constant. Conversely, the dashed curves are those along which $\varphi$ varies, while $r$ is kept constant. We notice that the former curves are arcs of circles orthogonal to the half-plane boundary $y=0$, hence they are geodesics of $(\mathbb{H}^2,g)$. This is not surprising since they correspond to the intersections of the hyperboloid with planes through the origin (namely the plane $\varphi=\mathrm{const}$). The point $(x,y) = (0,2)$ corresponds to $r=0$.
︡351b07f3-5448-4219-9c7f-d09c140eb771︡︡{"done":true,"md":"The solid curves are those along which $r$ varies while $\\varphi$ is kept constant. Conversely, the dashed curves are those along which $\\varphi$ varies, while $r$ is kept constant. We notice that the former curves are arcs of circles orthogonal to the half-plane boundary $y=0$, hence they are geodesics of $(\\mathbb{H}^2,g)$. This is not surprising since they correspond to the intersections of the hyperboloid with planes through the origin (namely the plane $\\varphi=\\mathrm{const}$). The point $(x,y) = (0,2)$ corresponds to $r=0$."}
︠681edb20-87f5-11e5-8cfb-42010af04d0bi︠
%md
We may also depict the Poincaré disk coordinates $(u,v)$ in terms of the half-plane coordinates $(x,y)$:
︡5b1bd38b-33f6-46a4-bd1d-5e61b562d29d︡︡{"done":true,"md":"We may also depict the Poincaré disk coordinates $(u,v)$ in terms of the half-plane coordinates $(x,y)$:"}
︠681edb21-87f5-11e5-8cfb-42010af04d0b︠
### This plot unsuccesfuly converted to sagews ###
# X_Pdisk_cart.plot(ranges={u: (-1, 0), v: (-1, 0)},
#  style={u: '-', v: '--'}) + \
# X_Pdisk_cart.plot(ranges={u: (-1, 0), v: (0., 1)},
#  style={u: '-', v: '--'}, color='orange') + \
# X_Pdisk_cart.plot(ranges={u: (0, 1), v: (-1, 0)},
#  style={u: '-', v: '--'}, color='pink') + \
# X_Pdisk_cart.plot(ranges={u: (0, 1), v: (0, 1)},
#  style={u: '-', v: '--'}, color='violet')
︡a6499eb2-92d0-469f-9b55-359a993e7b09︡︡{"done":true}
︠681edb22-87f5-11e5-8cfb-42010af04d0b︠
show(X_Pdisk_cart.plot(X_hplane, ranges={u: (-1, 0), v: (-1, 0)}, 
                       style={u: '-', v: '--'}) + \
     X_Pdisk_cart.plot(X_hplane, ranges={u: (-1, 0), v: (0, 1)}, 
                       style={u: '-', v: '--'}, color='orange') + \
     X_Pdisk_cart.plot(X_hplane, ranges={u: (0, 1), v: (-1, 0)}, 
                       style={u: '-', v: '--'}, color='pink') + \
     X_Pdisk_cart.plot(X_hplane, ranges={u: (0, 1), v: (0, 1)}, 
                       style={u: '-', v: '--'}, color='violet'),
     xmin=-5, xmax=5, ymin=0, ymax=5, aspect_ratio=1)
︡81488b88-f076-44a2-88ea-70b4d74367a7︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"24a94e67-a030-41ab-a867-cb859286d8db","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/10436/tmp_hM6aCz.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠681edb23-87f5-11e5-8cfb-42010af04d0bi︠
%md
The expression of the metric tensor in the half-plane coordinates $(x,y)$ is
︡aec7db96-a3e0-4bae-992c-9f10e367c54c︡︡{"done":true,"md":"The expression of the metric tensor in the half-plane coordinates $(x,y)$ is"}
︠681edb24-87f5-11e5-8cfb-42010af04d0b︠
g.display(X_hplane.frame(), X_hplane)
︡3dfdbea1-c09b-4ad3-828b-8072b628781a︡︡{"html":"<div>$g = \\frac{1}{y^{2}} \\mathrm{d} x\\otimes \\mathrm{d} x + \\frac{1}{y^{2}} \\mathrm{d} y\\otimes \\mathrm{d} y$</div>","done":false}︡{"done":true}
︠681edb25-87f5-11e5-8cfb-42010af04d0bi︠
%md
## Summary

9 charts have been defined on $\mathbb{H}^2$:
︡ee3e44e8-5b3d-42c6-97ee-dfdbdd9fc98b︡︡{"done":true,"md":"## Summary\n\n9 charts have been defined on $\\mathbb{H}^2$:"}
︠681edb26-87f5-11e5-8cfb-42010af04d0b︠
H2.atlas()
︡42f4ff40-5828-4337-93f1-89d23984f1c7︡︡{"html":"<div>[$\\left(\\mathbb{H}^2,(X, Y)\\right)$, $\\left(U,(X, Y)\\right)$, $\\left(U,(r, {\\varphi})\\right)$, $\\left(U,(R, {\\varphi})\\right)$, $\\left(\\mathbb{H}^2,(u, v)\\right)$, $\\left(U,(u, v)\\right)$, $\\left(U,({\\theta}, {\\varphi})\\right)$, $\\left(\\mathbb{H}^2,(x, y)\\right)$, $\\left(U,(x, y)\\right)$]</div>","done":false}︡{"done":true}
︠681edb27-87f5-11e5-8cfb-42010af04d0bi︠
%md
There are actually 6 main charts, the other ones being subcharts:
︡e759e1e2-bec6-4963-a6ea-3ca38386a921︡︡{"done":true,"md":"There are actually 6 main charts, the other ones being subcharts:"}
︠681edb28-87f5-11e5-8cfb-42010af04d0b︠
H2.top_charts()
︡c5354ff0-7d28-4be8-bfd6-bf8728d8d6b7︡︡{"html":"<div>[$\\left(\\mathbb{H}^2,(X, Y)\\right)$, $\\left(U,(r, {\\varphi})\\right)$, $\\left(U,(R, {\\varphi})\\right)$, $\\left(\\mathbb{H}^2,(u, v)\\right)$, $\\left(U,({\\theta}, {\\varphi})\\right)$, $\\left(\\mathbb{H}^2,(x, y)\\right)$]</div>","done":false}︡{"done":true}
︠681edb29-87f5-11e5-8cfb-42010af04d0bi︠
%md
The expression of the metric tensor in each of these charts is
︡97d49f49-6079-40fb-ba89-00b9817c4ff4︡︡{"done":true,"md":"The expression of the metric tensor in each of these charts is"}
︠681edb2a-87f5-11e5-8cfb-42010af04d0b︠
for chart in H2.top_charts():
    show(g.display(chart.frame(), chart))
︡97237080-b359-4890-826a-d520752730be︡︡{"html":"<div align='center'>$\\displaystyle g = \\left( \\frac{Y^{2} + 1}{X^{2} + Y^{2} + 1} \\right) \\mathrm{d} X\\otimes \\mathrm{d} X + \\left( -\\frac{X Y}{X^{2} + Y^{2} + 1} \\right) \\mathrm{d} X\\otimes \\mathrm{d} Y + \\left( -\\frac{X Y}{X^{2} + Y^{2} + 1} \\right) \\mathrm{d} Y\\otimes \\mathrm{d} X + \\left( \\frac{X^{2} + 1}{X^{2} + Y^{2} + 1} \\right) \\mathrm{d} Y\\otimes \\mathrm{d} Y$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle g = \\left( \\frac{1}{r^{2} + 1} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + r^{2} \\mathrm{d} {\\varphi}\\otimes \\mathrm{d} {\\varphi}$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle g = \\frac{4}{{\\left(R + 1\\right)}^{2} {\\left(R - 1\\right)}^{2}} \\mathrm{d} R\\otimes \\mathrm{d} R + \\frac{4 \\, R^{2}}{{\\left(R + 1\\right)}^{2} {\\left(R - 1\\right)}^{2}} \\mathrm{d} {\\varphi}\\otimes \\mathrm{d} {\\varphi}$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle g = \\frac{4}{{\\left(u^{2} + v^{2} - 1\\right)}^{2}} \\mathrm{d} u\\otimes \\mathrm{d} u + \\frac{4}{{\\left(u^{2} + v^{2} - 1\\right)}^{2}} \\mathrm{d} v\\otimes \\mathrm{d} v$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle g = \\frac{1}{\\cos\\left({\\theta}\\right)^{2}} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + \\frac{\\sin\\left({\\theta}\\right)^{2}}{\\cos\\left({\\theta}\\right)^{2}} \\mathrm{d} {\\varphi}\\otimes \\mathrm{d} {\\varphi}$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle g = \\frac{1}{y^{2}} \\mathrm{d} x\\otimes \\mathrm{d} x + \\frac{1}{y^{2}} \\mathrm{d} y\\otimes \\mathrm{d} y$</div>","done":false}︡{"done":true}
︠681edb2b-87f5-11e5-8cfb-42010af04d0bi︠
%md
For each of these charts, the non-vanishing (and non-redundant w.r.t. the symmetry on the last 2 indices) **Christoffel symbols of $g$** are
︡8a5204ab-be5e-4f47-ac45-08965128e541︡︡{"done":true,"md":"For each of these charts, the non-vanishing (and non-redundant w.r.t. the symmetry on the last 2 indices) **Christoffel symbols of $g$** are"}
︠681edb2c-87f5-11e5-8cfb-42010af04d0b︠
for chart in H2.top_charts():
    show(chart)
    show(g.christoffel_symbols_display(chart=chart))
︡4a09ac50-1c42-45f6-af7f-5a510ac20781︡︡{"html":"<div align='center'>$\\displaystyle \\left(\\mathbb{H}^2,(X, Y)\\right)$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle \\begin{array}{lcl} \\Gamma_{ \\phantom{\\, X } \\, X \\, X }^{ \\, X \\phantom{\\, X } \\phantom{\\, X } } &amp; = &amp; -\\frac{X Y^{2} + X}{X^{2} + Y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, X } \\, X \\, Y }^{ \\, X \\phantom{\\, X } \\phantom{\\, Y } } &amp; = &amp; \\frac{X^{2} Y}{X^{2} + Y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, X } \\, Y \\, Y }^{ \\, X \\phantom{\\, Y } \\phantom{\\, Y } } &amp; = &amp; -\\frac{X^{3} + X}{X^{2} + Y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, Y } \\, X \\, X }^{ \\, Y \\phantom{\\, X } \\phantom{\\, X } } &amp; = &amp; -\\frac{Y^{3} + Y}{X^{2} + Y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, Y } \\, X \\, Y }^{ \\, Y \\phantom{\\, X } \\phantom{\\, Y } } &amp; = &amp; \\frac{X Y^{2}}{X^{2} + Y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, Y } \\, Y \\, Y }^{ \\, Y \\phantom{\\, Y } \\phantom{\\, Y } } &amp; = &amp; -\\frac{{\\left(X^{2} + 1\\right)} Y}{X^{2} + Y^{2} + 1} \\end{array}$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle \\left(U,(r, {\\varphi})\\right)$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle \\begin{array}{lcl} \\Gamma_{ \\phantom{\\, r } \\, r \\, r }^{ \\, r \\phantom{\\, r } \\phantom{\\, r } } &amp; = &amp; -\\frac{r}{r^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, r } \\, {\\varphi} \\, {\\varphi} }^{ \\, r \\phantom{\\, {\\varphi} } \\phantom{\\, {\\varphi} } } &amp; = &amp; -r^{3} - r \\\\ \\Gamma_{ \\phantom{\\, {\\varphi} } \\, r \\, {\\varphi} }^{ \\, {\\varphi} \\phantom{\\, r } \\phantom{\\, {\\varphi} } } &amp; = &amp; \\frac{1}{r} \\end{array}$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle \\left(U,(R, {\\varphi})\\right)$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle \\begin{array}{lcl} \\Gamma_{ \\phantom{\\, R } \\, R \\, R }^{ \\, R \\phantom{\\, R } \\phantom{\\, R } } &amp; = &amp; -\\frac{2 \\, R}{R^{2} - 1} \\\\ \\Gamma_{ \\phantom{\\, R } \\, {\\varphi} \\, {\\varphi} }^{ \\, R \\phantom{\\, {\\varphi} } \\phantom{\\, {\\varphi} } } &amp; = &amp; \\frac{R^{3} + R}{R^{2} - 1} \\\\ \\Gamma_{ \\phantom{\\, {\\varphi} } \\, R \\, {\\varphi} }^{ \\, {\\varphi} \\phantom{\\, R } \\phantom{\\, {\\varphi} } } &amp; = &amp; -\\frac{R^{2} + 1}{R^{3} - R} \\end{array}$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle \\left(\\mathbb{H}^2,(u, v)\\right)$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle \\begin{array}{lcl} \\Gamma_{ \\phantom{\\, u } \\, u \\, u }^{ \\, u \\phantom{\\, u } \\phantom{\\, u } } &amp; = &amp; -\\frac{2 \\, u}{u^{2} + v^{2} - 1} \\\\ \\Gamma_{ \\phantom{\\, u } \\, u \\, v }^{ \\, u \\phantom{\\, u } \\phantom{\\, v } } &amp; = &amp; -\\frac{2 \\, v}{u^{2} + v^{2} - 1} \\\\ \\Gamma_{ \\phantom{\\, u } \\, v \\, v }^{ \\, u \\phantom{\\, v } \\phantom{\\, v } } &amp; = &amp; \\frac{2 \\, u}{u^{2} + v^{2} - 1} \\\\ \\Gamma_{ \\phantom{\\, v } \\, u \\, u }^{ \\, v \\phantom{\\, u } \\phantom{\\, u } } &amp; = &amp; \\frac{2 \\, v}{u^{2} + v^{2} - 1} \\\\ \\Gamma_{ \\phantom{\\, v } \\, u \\, v }^{ \\, v \\phantom{\\, u } \\phantom{\\, v } } &amp; = &amp; -\\frac{2 \\, u}{u^{2} + v^{2} - 1} \\\\ \\Gamma_{ \\phantom{\\, v } \\, v \\, v }^{ \\, v \\phantom{\\, v } \\phantom{\\, v } } &amp; = &amp; -\\frac{2 \\, v}{u^{2} + v^{2} - 1} \\end{array}$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle \\left(U,({\\theta}, {\\varphi})\\right)$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle \\begin{array}{lcl} \\Gamma_{ \\phantom{\\, {\\theta} } \\, {\\theta} \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } } &amp; = &amp; \\frac{\\sin\\left({\\theta}\\right)}{\\cos\\left({\\theta}\\right)} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, {\\varphi} \\, {\\varphi} }^{ \\, {\\theta} \\phantom{\\, {\\varphi} } \\phantom{\\, {\\varphi} } } &amp; = &amp; -\\frac{\\sin\\left({\\theta}\\right)}{\\cos\\left({\\theta}\\right)} \\\\ \\Gamma_{ \\phantom{\\, {\\varphi} } \\, {\\theta} \\, {\\varphi} }^{ \\, {\\varphi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\varphi} } } &amp; = &amp; \\frac{1}{\\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)} \\end{array}$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle \\left(\\mathbb{H}^2,(x, y)\\right)$</div>","done":false}︡{"html":"<div align='center'>$\\displaystyle \\begin{array}{lcl} \\Gamma_{ \\phantom{\\, x } \\, x \\, y }^{ \\, x \\phantom{\\, x } \\phantom{\\, y } } &amp; = &amp; -\\frac{1}{y} \\\\ \\Gamma_{ \\phantom{\\, y } \\, x \\, x }^{ \\, y \\phantom{\\, x } \\phantom{\\, x } } &amp; = &amp; \\frac{1}{y} \\\\ \\Gamma_{ \\phantom{\\, y } \\, y \\, y }^{ \\, y \\phantom{\\, y } \\phantom{\\, y } } &amp; = &amp; -\\frac{1}{y} \\end{array}$</div>","done":false}︡{"done":true}
︠681edb2d-87f5-11e5-8cfb-42010af04d0b︠



















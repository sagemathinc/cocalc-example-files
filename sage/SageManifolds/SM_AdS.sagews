︠21db7fd3-1a35-4e66-ae45-b253c1630168as︠
%auto
typeset_mode(True, display=False)
︡9c7ed1b9-8903-4867-8dbf-aef5657ade82︡︡{"auto":true}︡{"done":true}
︠e5908576-6acb-45e9-994a-4e224804e10di︠
%html
<div id="cell_text_154" class="text_cell">
<h1 style="text-align: center;">Anti-de Sitter spacetime</h1>
<p>This worksheet demonstrates a few capabilities of <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.8) in computations regarding anti-de Sitter spacetime.</p>
<p>It is released under the GNU General Public License version 3.</p>
<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>
<p><em><span style="color: #008080;">The corresponding worksheet file can be downloaded from</span><span style="color: #ff6600;"><span style="color: #0000ff;"> <a href="http://sagemanifolds.obspm.fr/examples/sws/SM_AdS.sws"><span style="color: #0000ff;">here</span></a></span></span></em></p>
<p><em><span style="color: #ff6600;"><span style="color: #0000ff;"><span style="color: #0000ff;"><br /></span></span></span></em></p>
</div>
<h2>Spacetime manifold</h2>
<p><span id="cell_outer_3">We declare the anti-de Sitter spacetime (AdS) as a 4-dimensional differentiable manifold:</span></p>

︡5a905f65-a3bd-4889-971d-c3b0ecf65cab︡︡{"done":true,"html":"<div id=\"cell_text_154\" class=\"text_cell\">\n<h1 style=\"text-align: center;\">Anti-de Sitter spacetime</h1>\n<p>This worksheet demonstrates a few capabilities of <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.8) in computations regarding anti-de Sitter spacetime.</p>\n<p>It is released under the GNU General Public License version 3.</p>\n<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>\n<p><em><span style=\"color: #008080;\">The corresponding worksheet file can be downloaded from</span><span style=\"color: #ff6600;\"><span style=\"color: #0000ff;\"> <a href=\"http://sagemanifolds.obspm.fr/examples/sws/SM_AdS.sws\"><span style=\"color: #0000ff;\">here</span></a></span></span></em></p>\n<p><em><span style=\"color: #ff6600;\"><span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\"><br /></span></span></span></em></p>\n</div>\n<h2>Spacetime manifold</h2>\n<p><span id=\"cell_outer_3\">We declare the anti-de Sitter spacetime (AdS) as a 4-dimensional differentiable manifold:</span></p>"}
︠2a633602-a77e-4e76-a426-8228f58c318es︠
M = Manifold(4, 'M', r'\mathcal{M}')
print M ; M
︡5083962a-5a13-4813-bde9-ffafbfb9ea65︡︡{"stdout":"4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\mathcal{M}$</div>","done":false}︡{"done":true}
︠904251bd-0d18-45cd-8daa-f4de65340c96i︠
%html
<p>We consider hyperbolic coordinates $(\tau,\rho,\theta,\phi)$ on $\mathcal{M}$. Allowing for the standard coordinate singularities at $\rho=0$, $\theta=0$ or $\theta=\pi$, these coordinates cover the entire spacetime manifold (which is topologically $\mathbb{R}^4$). If we restrict ourselves to <em>regular</em> coordinates (i.e. to considering only mathematically well defined charts), the hyperbolic coordinates cover only an open part of $\mathcal{M}$, which we call $\mathcal{M}_0$, on which $\rho$ spans the open interval $(0,+\infty)$, $\theta$ the open interval $(0,\pi)$ and $\phi$ the open interval $(0,2\pi)$. Therefore, we declare:</p>

︡e2fc7a9f-431e-4309-bf63-4085792c8895︡︡{"done":true,"html":"<p>We consider hyperbolic coordinates $(\\tau,\\rho,\\theta,\\phi)$ on $\\mathcal{M}$. Allowing for the standard coordinate singularities at $\\rho=0$, $\\theta=0$ or $\\theta=\\pi$, these coordinates cover the entire spacetime manifold (which is topologically $\\mathbb{R}^4$). If we restrict ourselves to <em>regular</em> coordinates (i.e. to considering only mathematically well defined charts), the hyperbolic coordinates cover only an open part of $\\mathcal{M}$, which we call $\\mathcal{M}_0$, on which $\\rho$ spans the open interval $(0,+\\infty)$, $\\theta$ the open interval $(0,\\pi)$ and $\\phi$ the open interval $(0,2\\pi)$. Therefore, we declare:</p>"}
︠d21eedde-ce55-4bf8-b0ae-60c1c842b00ds︠
M0 = M.open_subset('M_0', r'\mathcal{M}_0' )
X_hyp.<ta,rh,th,ph> = M0.chart(r'ta:\tau rh:(0,+oo):\rho th:(0,pi):\theta ph:(0,2*pi):\phi')
print X_hyp ; X_hyp
︡a6580d0e-938a-4c2c-be56-323be9d44d3f︡︡{"stdout":"chart (M_0, (ta, rh, th, ph))\n","done":false}︡{"html":"<div>$\\left(\\mathcal{M}_0,({\\tau}, {\\rho}, {\\theta}, {\\phi})\\right)$</div>","done":false}︡{"done":true}
︠10890d8f-5c04-493f-a645-4731b7813387i︠
%html
<h2>$\mathbb{R}^5$ as an ambient space</h2>
<p>The AdS metric can be defined as that induced by the immersion of $\mathcal{M}$ in $\mathbb{R}^5$ equipped with a flat pseudo-Riemannian metric of signature $(-,-,+,+,+)$. We therefore introduce $\mathbb{R}^5$ as a 5-dimensional manifold covered by canonical coordinates:</p>

︡70ed26de-2130-4dd1-92ac-e0a36d5b7ef1︡︡{"done":true,"html":"<h2>$\\mathbb{R}^5$ as an ambient space</h2>\n<p>The AdS metric can be defined as that induced by the immersion of $\\mathcal{M}$ in $\\mathbb{R}^5$ equipped with a flat pseudo-Riemannian metric of signature $(-,-,+,+,+)$. We therefore introduce $\\mathbb{R}^5$ as a 5-dimensional manifold covered by canonical coordinates:</p>"}
︠e1d6267d-f2e9-40e6-af65-cf0abcb3335bs︠
R5 = Manifold(5, 'R5', r'\mathbb{R}^5')
X5.<U,V,X,Y,Z> = R5.chart()
print X5 ; X5
︡1ef3f080-3a4f-40b8-89e5-4db789aee468︡︡{"stdout":"chart (R5, (U, V, X, Y, Z))\n","done":false}︡{"html":"<div>$\\left(\\mathbb{R}^5,(U, V, X, Y, Z)\\right)$</div>","done":false}︡{"done":true}
︠96dd1d4a-716e-400d-b746-84ebdb201584i︠
%html
<p>The AdS immersion into $\mathbb{R}^5$ is defined as a differential mapping $\Phi$ from $\mathcal{M}$ to $\mathbb{R}^5$, by providing its expression in terms of $\mathcal{M}$'s default chart (which is X_hyp = $(\mathcal{M}_0,(\tau,\rho,\theta,\phi))$ ) and $\mathbb{R}^5$'s default chart (which is X5 = $(\mathbb{R}^5,(U,V,X,Y,Z))$ ):</p>

︡5b500950-09bd-4fe2-83f8-90725dc4ec48︡︡{"done":true,"html":"<p>The AdS immersion into $\\mathbb{R}^5$ is defined as a differential mapping $\\Phi$ from $\\mathcal{M}$ to $\\mathbb{R}^5$, by providing its expression in terms of $\\mathcal{M}$'s default chart (which is X_hyp = $(\\mathcal{M}_0,(\\tau,\\rho,\\theta,\\phi))$ ) and $\\mathbb{R}^5$'s default chart (which is X5 = $(\\mathbb{R}^5,(U,V,X,Y,Z))$ ):</p>"}
︠8a592ea4-d47d-44d9-91ae-d64f47b45666s︠
var('b')
assume(b>0)
Phi = M.diff_mapping(R5, [sin(b*ta)/b * cosh(rh),
                          cos(b*ta)/b * cosh(rh),
                          sinh(rh)/b *sin(th)*cos(ph),
                          sinh(rh)/b *sin(th)*sin(ph),
                          sinh(rh)/b *cos(th)],
                          name='Phi', latex_name=r'\Phi')
print Phi ; Phi.display()
︡59e4a7ef-04e4-49cf-8c54-c289481e5af4︡︡{"html":"<div>$b$</div>","done":false}︡{"stdout":"differentiable mapping 'Phi' from the 4-dimensional manifold 'M' to the 5-dimensional manifold 'R5'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} \\Phi:&amp; \\mathcal{M} &amp; \\longrightarrow &amp; \\mathbb{R}^5 \\\\ \\mbox{on}\\ \\mathcal{M}_0 : &amp; \\left({\\tau}, {\\rho}, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; \\left(U, V, X, Y, Z\\right) = \\left(\\frac{\\cosh\\left({\\rho}\\right) \\sin\\left(b {\\tau}\\right)}{b}, \\frac{\\cos\\left(b {\\tau}\\right) \\cosh\\left({\\rho}\\right)}{b}, \\frac{\\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\sinh\\left({\\rho}\\right)}{b}, \\frac{\\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\sinh\\left({\\rho}\\right)}{b}, \\frac{\\cos\\left({\\theta}\\right) \\sinh\\left({\\rho}\\right)}{b}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠4dcbc6a8-b25b-4b86-9644-538b1c225eaei︠
%html
<p>The constant $b$ is a scale parameter. Considering AdS metric as a solution of vacuum Einstein equation with negative cosmological constant $\Lambda$, one has $b = \sqrt{-\Lambda/3}$.&nbsp;</p>
<p>Let us evaluate the image of a point via the mapping $\Phi$:</p>

︡f0a274a1-25a6-4474-802d-9a0cb5165662︡︡{"done":true,"html":"<p>The constant $b$ is a scale parameter. Considering AdS metric as a solution of vacuum Einstein equation with negative cosmological constant $\\Lambda$, one has $b = \\sqrt{-\\Lambda/3}$.&nbsp;</p>\n<p>Let us evaluate the image of a point via the mapping $\\Phi$:</p>"}
︠aeb10b82-131e-460c-911d-649a50bdb902s︠
p = M.point((ta, rh, th, ph), name='p') ; print p
︡e3c8f0e0-8aeb-4dc1-838e-c5153527801f︡︡{"stdout":"point 'p' on 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠0cc1137f-62b6-477c-993b-96023f713cccs︠
p.coord()
︡c12b9e30-a267-425b-9ca0-18038a158e8e︡︡{"html":"<div>(${\\tau}$, ${\\rho}$, ${\\theta}$, ${\\phi}$)</div>","done":false}︡{"done":true}
︠28ab735c-7328-4fed-b0d8-b354af1fe754s︠
q = Phi(p) ; print q
︡6a83226d-9fe7-4c85-8801-b55550176851︡︡{"stdout":"point 'Phi(p)' on 5-dimensional manifold 'R5'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠494dcb19-016c-43fa-856f-87fb4023d81fs︠
q.coord()
︡bdaf7a5f-9ab1-4397-85b0-17ead6d14cc2︡︡{"html":"<div>($\\frac{\\cosh\\left({\\rho}\\right) \\sin\\left(b {\\tau}\\right)}{b}$, $\\frac{\\cos\\left(b {\\tau}\\right) \\cosh\\left({\\rho}\\right)}{b}$, $\\frac{\\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\sinh\\left({\\rho}\\right)}{b}$, $\\frac{\\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\sinh\\left({\\rho}\\right)}{b}$, $\\frac{\\cos\\left({\\theta}\\right) \\sinh\\left({\\rho}\\right)}{b}$)</div>","done":false}︡{"done":true}
︠068b60bc-20ae-4f17-8322-d0f044d0eb36i︠
%html
<p>The image of $\mathcal{M}$ by the immersion $\Phi$ is a hyperboloid of one sheet, of equation $-U^2-V^2+X^2+Y^2+Z^2=-b^{-2}$. Indeed:</p>

︡99a67af7-242e-4b5e-8ad3-7925178b2e50︡︡{"done":true,"html":"<p>The image of $\\mathcal{M}$ by the immersion $\\Phi$ is a hyperboloid of one sheet, of equation $-U^2-V^2+X^2+Y^2+Z^2=-b^{-2}$. Indeed:</p>"}
︠c4865d64-a781-43f0-a0dc-7696293d839ds︠
(Uq,Vq,Xq,Yq,Zq) = q.coord()
s = - Uq^2 - Vq^2 + Xq^2 + Yq^2 + Zq^2
s.simplify_full()
︡ba9a7cc3-0d3a-444e-8d5a-13feed526ed9︡︡{"html":"<div>$-\\frac{1}{b^{2}}$</div>","done":false}︡{"done":true}
︠ace1fb55-e86b-4f3f-9a39-3d6d02ecc5e0i︠
%html
<p>We may use the immersion $\Phi$ to draw the coordinate grid $(\tau,\rho)$ in terms of the coordinates $(U,V,X)$ for $\theta=\pi/2$ and $\phi=0$ (red) and $\theta=\pi/2$ and $\phi=\pi$ (green) (the brown lines are the lines $\tau={\rm const}$):</p>

︡39b31ebf-53bf-45b8-abb3-97f89e2cfcd9︡︡{"done":true,"html":"<p>We may use the immersion $\\Phi$ to draw the coordinate grid $(\\tau,\\rho)$ in terms of the coordinates $(U,V,X)$ for $\\theta=\\pi/2$ and $\\phi=0$ (red) and $\\theta=\\pi/2$ and $\\phi=\\pi$ (green) (the brown lines are the lines $\\tau={\\rm const}$):</p>"}
︠3badfed4-1d46-45d3-af08-fe161cd77e48s︠
graph1 = X_hyp.plot(X5, mapping=Phi, ambient_coords=(V,X,U), fixed_coords={th:pi/2, ph:0}, ranges={ta:(0,2*pi), rh:(0,2)}, nb_values=9, color={ta:'red', rh:'brown'}, thickness=2, parameters={b:1}, label_axes=False)
graph2 = X_hyp.plot(X5, mapping=Phi, ambient_coords=(V,X,U), fixed_coords={th:pi/2, ph:pi}, ranges={ta:(0,2*pi), rh:(0,2)}, nb_values=9, color={ta:'green', rh:'brown'}, thickness=2, parameters={b:1}, label_axes=False)
show(set_axes_labels(graph1+graph2,'V','X','U'), aspect_ratio=1)
︡cfd04a31-eb20-4ca1-9657-1c854c696351︡︡{"done":false,"file":{"uuid":"4f38eed0-94dd-4cd5-82b4-be310e21c94e","filename":"4f38eed0-94dd-4cd5-82b4-be310e21c94e.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠b5639770-b567-4a4e-a6be-58ffcf28ce79i︠
%html
<h2>Spacetime metric</h2>
<p>First, we introduce on $\mathbb{R}^5$ the flat pseudo-Riemannian metric $h$ of signature $(-,-,+,+,+)$:</p>

︡ecac02bd-0e14-4705-977c-a949c0b186ae︡︡{"done":true,"html":"<h2>Spacetime metric</h2>\n<p>First, we introduce on $\\mathbb{R}^5$ the flat pseudo-Riemannian metric $h$ of signature $(-,-,+,+,+)$:</p>"}
︠8a3b5ec3-b0dd-494c-b9aa-26016286931as︠
h = R5.metric('h')
h[0,0], h[1,1], h[2,2], h[3,3], h[4,4] = -1, -1, 1, 1, 1
h.display()
︡1c178614-c8b2-4551-851f-34ca4b60da12︡︡{"html":"<div>$h = -\\mathrm{d} U\\otimes \\mathrm{d} U-\\mathrm{d} V\\otimes \\mathrm{d} V+\\mathrm{d} X\\otimes \\mathrm{d} X+\\mathrm{d} Y\\otimes \\mathrm{d} Y+\\mathrm{d} Z\\otimes \\mathrm{d} Z$</div>","done":false}︡{"done":true}
︠e1f758ca-7834-43ce-85f4-a81ea5a6bc4di︠
%html
<p>As mentionned above, the AdS metric $g$ on $\mathcal{M}$ is that induced by $h$, i.e.$g$ is the pullback of $h$ by the mapping $\Phi$:</p>

︡ed4b8e15-88b4-46ba-a93c-4bfea38c4c97︡︡{"done":true,"html":"<p>As mentionned above, the AdS metric $g$ on $\\mathcal{M}$ is that induced by $h$, i.e.$g$ is the pullback of $h$ by the mapping $\\Phi$:</p>"}
︠c5f26bed-9f06-4b61-ba7c-bc9a35acd29cs︠
g = M.metric('g')
g.set( Phi.pullback(h) )
︡15202338-535a-4844-860a-64e73b2e74fc︡︡{"done":true}
︠c486f9e2-5fd7-4677-a0fa-1b795d4029b8i︠
%html
<p>The expression of $g$ in terms of $\mathcal{M}$'s default frame is found to be</p>

︡545ef86b-4fed-4376-b1e0-5adb78c03f0d︡︡{"done":true,"html":"<p>The expression of $g$ in terms of $\\mathcal{M}$'s default frame is found to be</p>"}
︠7247c07a-a7b8-473d-9690-adcb3e66ae0as︠
g.display()
︡822f7fb0-fcc6-4ffa-bf3b-ad2eb4f4d616︡︡{"html":"<div>$g = -\\cosh\\left({\\rho}\\right)^{2} \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\tau} + \\frac{1}{b^{2}} \\mathrm{d} {\\rho}\\otimes \\mathrm{d} {\\rho} + \\frac{\\sinh\\left({\\rho}\\right)^{2}}{b^{2}} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + \\frac{\\sin\\left({\\theta}\\right)^{2} \\sinh\\left({\\rho}\\right)^{2}}{b^{2}} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠4bb88df3-d43e-4c4c-abe6-8fc64e7a32e1s︠
g[:]
︡98d9314c-60e3-41c5-a2ed-721cfb876efe︡︡{"html":"<div>$\\left(\\begin{array}{rrrr}\n-\\cosh\\left({\\rho}\\right)^{2} &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; \\frac{1}{b^{2}} &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; \\frac{\\sinh\\left({\\rho}\\right)^{2}}{b^{2}} &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; \\frac{\\sin\\left({\\theta}\\right)^{2} \\sinh\\left({\\rho}\\right)^{2}}{b^{2}}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠abbda930-6073-4d40-858e-6b70b6628588i︠
%html
<h2>Curvature</h2>
<p>The Riemann tensor of $g$ is</p>

︡b4222e04-49b3-4332-a146-8facff56183f︡︡{"done":true,"html":"<h2>Curvature</h2>\n<p>The Riemann tensor of $g$ is</p>"}
︠83537f0d-4951-4dda-9033-740d3280c668s︠
Riem = g.riemann()
print Riem
Riem.display()
︡812a4f44-0861-44db-a796-840309dc872e︡︡{"stdout":"tensor field 'Riem(g)' of type (1,3) on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\mathrm{Riem}\\left(g\\right) = -\\frac{\\partial}{\\partial {\\tau} }\\otimes \\mathrm{d} {\\rho}\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\rho}+\\frac{\\partial}{\\partial {\\tau} }\\otimes \\mathrm{d} {\\rho}\\otimes \\mathrm{d} {\\rho}\\otimes \\mathrm{d} {\\tau} -\\sinh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\tau} }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\theta} + \\sinh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\tau} }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\tau} -\\sin\\left({\\theta}\\right)^{2} \\sinh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\tau} }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\phi} + \\sin\\left({\\theta}\\right)^{2} \\sinh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\tau} }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\tau} -b^{2} \\cosh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\rho} }\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\rho} + b^{2} \\cosh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\rho} }\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\rho}\\otimes \\mathrm{d} {\\tau} -\\sinh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\rho} }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\rho}\\otimes \\mathrm{d} {\\theta} + \\sinh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\rho} }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\rho} -\\sin\\left({\\theta}\\right)^{2} \\sinh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\rho} }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\rho}\\otimes \\mathrm{d} {\\phi} + \\sin\\left({\\theta}\\right)^{2} \\sinh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\rho} }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\rho} -b^{2} \\cosh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\theta} + b^{2} \\cosh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\tau} +\\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\rho}\\otimes \\mathrm{d} {\\rho}\\otimes \\mathrm{d} {\\theta} -\\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\rho}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\rho} -\\sin\\left({\\theta}\\right)^{2} \\sinh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\phi} + \\sin\\left({\\theta}\\right)^{2} \\sinh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\theta} -b^{2} \\cosh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\phi} + b^{2} \\cosh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\tau} +\\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\rho}\\otimes \\mathrm{d} {\\rho}\\otimes \\mathrm{d} {\\phi} -\\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\rho}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\rho} + \\sinh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\phi} -\\sinh\\left({\\rho}\\right)^{2} \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\theta}$</div>","done":false}︡{"done":true}
︠e1729753-7dba-4239-a46f-47e824e0f7a6s︠
Riem.display_comp(only_nonredundant=True)
︡c81791a3-be7d-4300-bab9-d716f4caa961︡︡{"html":"<div>$\\begin{array}{lcl} \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\tau} } \\, {\\rho} \\, {\\tau} \\, {\\rho} }^{ \\, {\\tau} \\phantom{\\, {\\rho} } \\phantom{\\, {\\tau} } \\phantom{\\, {\\rho} } } &amp; = &amp; -1 \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\tau} } \\, {\\theta} \\, {\\tau} \\, {\\theta} }^{ \\, {\\tau} \\phantom{\\, {\\theta} } \\phantom{\\, {\\tau} } \\phantom{\\, {\\theta} } } &amp; = &amp; -\\sinh\\left({\\rho}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\tau} } \\, {\\phi} \\, {\\tau} \\, {\\phi} }^{ \\, {\\tau} \\phantom{\\, {\\phi} } \\phantom{\\, {\\tau} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\sin\\left({\\theta}\\right)^{2} \\sinh\\left({\\rho}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\rho} } \\, {\\tau} \\, {\\tau} \\, {\\rho} }^{ \\, {\\rho} \\phantom{\\, {\\tau} } \\phantom{\\, {\\tau} } \\phantom{\\, {\\rho} } } &amp; = &amp; -b^{2} \\cosh\\left({\\rho}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\rho} } \\, {\\theta} \\, {\\rho} \\, {\\theta} }^{ \\, {\\rho} \\phantom{\\, {\\theta} } \\phantom{\\, {\\rho} } \\phantom{\\, {\\theta} } } &amp; = &amp; -\\sinh\\left({\\rho}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\rho} } \\, {\\phi} \\, {\\rho} \\, {\\phi} }^{ \\, {\\rho} \\phantom{\\, {\\phi} } \\phantom{\\, {\\rho} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\sin\\left({\\theta}\\right)^{2} \\sinh\\left({\\rho}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\theta} } \\, {\\tau} \\, {\\tau} \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, {\\tau} } \\phantom{\\, {\\tau} } \\phantom{\\, {\\theta} } } &amp; = &amp; -b^{2} \\cosh\\left({\\rho}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\theta} } \\, {\\rho} \\, {\\rho} \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, {\\rho} } \\phantom{\\, {\\rho} } \\phantom{\\, {\\theta} } } &amp; = &amp; 1 \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\theta} } \\, {\\phi} \\, {\\theta} \\, {\\phi} }^{ \\, {\\theta} \\phantom{\\, {\\phi} } \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\sin\\left({\\theta}\\right)^{2} \\sinh\\left({\\rho}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\phi} } \\, {\\tau} \\, {\\tau} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\tau} } \\phantom{\\, {\\tau} } \\phantom{\\, {\\phi} } } &amp; = &amp; -b^{2} \\cosh\\left({\\rho}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\phi} } \\, {\\rho} \\, {\\rho} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\rho} } \\phantom{\\, {\\rho} } \\phantom{\\, {\\phi} } } &amp; = &amp; 1 \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\phi} } \\, {\\theta} \\, {\\theta} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\sinh\\left({\\rho}\\right)^{2} \\end{array}$</div>","done":false}︡{"done":true}
︠10832dd7-d3c1-4da9-bab4-1f7a0e201536i︠
%html
<p>The Ricci tensor:</p>

︡e0917f8e-a4da-4d51-a410-2cea9cd26a25︡︡{"done":true,"html":"<p>The Ricci tensor:</p>"}
︠e9cdb083-6903-420e-84ef-6c2b6eea71d8s︠
Ric = g.ricci()
print Ric
Ric.display()
︡985fee6a-ddef-4ce7-a62f-0fa33328df6c︡︡{"stdout":"field of symmetric bilinear forms 'Ric(g)' on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\mathrm{Ric}\\left(g\\right) = 3 \\, b^{2} \\cosh\\left({\\rho}\\right)^{2} \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\tau} -3 \\mathrm{d} {\\rho}\\otimes \\mathrm{d} {\\rho} -3 \\, \\sinh\\left({\\rho}\\right)^{2} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} -3 \\, \\sin\\left({\\theta}\\right)^{2} \\sinh\\left({\\rho}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠96532318-7806-4113-80b0-3efb05e3aacfs︠
Ric[:]
︡ea914229-73b4-4dc8-a626-e8ebc266e01d︡︡{"html":"<div>$\\left(\\begin{array}{rrrr}\n3 \\, b^{2} \\cosh\\left({\\rho}\\right)^{2} &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; -3 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; -3 \\, \\sinh\\left({\\rho}\\right)^{2} &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; -3 \\, \\sin\\left({\\theta}\\right)^{2} \\sinh\\left({\\rho}\\right)^{2}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠f6ef9082-6544-45f4-8222-d59b6b2abf3fi︠
%html
<p>The Ricci scalar:</p>

︡59536501-aff2-433b-9420-d8f238259a76︡︡{"done":true,"html":"<p>The Ricci scalar:</p>"}
︠834781c5-1b1e-458a-bd94-cdd172bdf9b5s︠
R = g.ricci_scalar()
print R
R.display()
︡cd527551-3a3a-4cf9-af8a-1e9866700469︡︡{"stdout":"scalar field 'r(g)' on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} \\mathrm{r}\\left(g\\right):&amp; \\mathcal{M} &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ \\mbox{on}\\ \\mathcal{M}_0 : &amp; \\left({\\tau}, {\\rho}, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; -12 \\, b^{2} \\end{array}$</div>","done":false}︡{"done":true}
︠5a85fb05-fd0b-4603-8267-e2c1e584c587i︠
%html
<p>We recover the fact that AdS spacetime has a constant curvature. It is indeed a <strong>maximally symmetric space</strong>. In particular, the Riemann tensor is expressible as</p>
<p>\[ R^i_{\ \, jlk} = \frac{R}{n(n-1)} \left( \delta^i_{\ \, k} g_{jl} - \delta^i_{\ \, l} g_{jk} \right) \]</p>
<p>where $n$ is the dimension of $\mathcal{M}$: $n=4$ in the present case. Let us check this formula here, under the form $R^i_{\ \, jlk} = -\frac{R}{6} g_{j[k} \delta^i_{\ \, l]}$:</p>

︡bc6922c8-6cbc-469e-8fd2-86fa017c1d32︡︡{"done":true,"html":"<p>We recover the fact that AdS spacetime has a constant curvature. It is indeed a <strong>maximally symmetric space</strong>. In particular, the Riemann tensor is expressible as</p>\n<p>\\[ R^i_{\\ \\, jlk} = \\frac{R}{n(n-1)} \\left( \\delta^i_{\\ \\, k} g_{jl} - \\delta^i_{\\ \\, l} g_{jk} \\right) \\]</p>\n<p>where $n$ is the dimension of $\\mathcal{M}$: $n=4$ in the present case. Let us check this formula here, under the form $R^i_{\\ \\, jlk} = -\\frac{R}{6} g_{j[k} \\delta^i_{\\ \\, l]}$:</p>"}
︠6598f855-0628-4bbd-badf-bdc433de081cs︠
delta = M.tangent_identity_field() 
Riem == - (R/6)*(g*delta).antisymmetrize(2,3)  # 2,3 = last positions of the type-(1,3) tensor g*delta
︡d15f4c98-b08b-41e1-90df-2e86187fae5a︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠a7406f80-0f4d-44ef-bac1-0bba0c7c0361i︠
%html
<p>We may also check that AdS metric is a solution of the vacuum <strong>Einstein equation</strong> with (negative) cosmological constant:</p>

︡dcefef53-e31d-4ab6-b21d-25cbcfb3d205︡︡{"done":true,"html":"<p>We may also check that AdS metric is a solution of the vacuum <strong>Einstein equation</strong> with (negative) cosmological constant:</p>"}
︠0c8cf710-fd36-4a3f-a183-40eca418f3eas︠
Lambda = -3*b^2
Ric - 1/2*R*g + Lambda*g == 0
︡323adf3c-c1cf-4837-84f8-f0659ec04f57︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠ec4af8ba-e391-4a9e-a1c3-30f04a069c6ai︠
%html
<h2>Spherical coordinates</h2>
<p>Let us introduce spherical coordinates $(\tau,r,\theta,\phi)$ on the AdS spacetime via the coordinate change \[ r = \frac{\sinh(\rho)}{b} \]</p>

︡21439943-49d9-43c4-9825-c90d7e83cede︡︡{"done":true,"html":"<h2>Spherical coordinates</h2>\n<p>Let us introduce spherical coordinates $(\\tau,r,\\theta,\\phi)$ on the AdS spacetime via the coordinate change \\[ r = \\frac{\\sinh(\\rho)}{b} \\]</p>"}
︠6b7ff19b-9ebe-426e-8634-52b0abf04187s︠
X_spher.<ta,r,th,ph> = M0.chart(r'ta:\tau r:(0,+oo) th:(0,pi):\theta ph:(0,2*pi):\phi')
print X_spher ; X_spher
︡9ce1e04d-5246-43fd-a30f-7bb0eaf4d92f︡︡{"stdout":"chart (M_0, (ta, r, th, ph))\n","done":false}︡{"html":"<div>$\\left(\\mathcal{M}_0,({\\tau}, r, {\\theta}, {\\phi})\\right)$</div>","done":false}︡{"done":true}
︠a2886bf8-1d3c-483d-b14c-1750beadca1as︠
hyp_to_spher = X_hyp.transition_map(X_spher, [ta, sinh(rh)/b, th, ph])
hyp_to_spher.display()
︡db87b88e-3c71-4423-8183-693858d89b3c︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} {\\tau} &amp; = &amp; {\\tau} \\\\ r &amp; = &amp; \\frac{\\sinh\\left({\\rho}\\right)}{b} \\\\ {\\theta} &amp; = &amp; {\\theta} \\\\ {\\phi} &amp; = &amp; {\\phi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠8d36231e-4969-4327-8da6-bffb0ab83f1ds︠
hyp_to_spher.set_inverse(ta, asinh(b*r), th, ph)
spher_to_hyp = hyp_to_spher.inverse()
spher_to_hyp.display()
︡4353ad90-3ec3-403e-9c75-f0cbfd25852e︡︡{"stdout":"Check of the inverse coordinate transformation:","done":false}︡{"stdout":"\n   ta == ","done":false}︡{"stdout":"ta\n   rh == ","done":false}︡{"stdout":"arcsinh(sinh(rh))\n   th == ","done":false}︡{"stdout":"th\n   ph == ","done":false}︡{"stdout":"ph\n   ta == ","done":false}︡{"stdout":"ta\n   r == ","done":false}︡{"stdout":"r\n   th == ","done":false}︡{"stdout":"th\n   ph == ","done":false}︡{"stdout":"ph\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} {\\tau} &amp; = &amp; {\\tau} \\\\ {\\rho} &amp; = &amp; {\\rm arcsinh}\\left(b r\\right) \\\\ {\\theta} &amp; = &amp; {\\theta} \\\\ {\\phi} &amp; = &amp; {\\phi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠e671857b-01ca-49ba-8cd3-b01d65f5ace9i︠
%html
<p>The expression of the metric tensor in the new coordinates is</p>

︡fa34227f-45c4-4614-ad10-336ff2341fbc︡︡{"done":true,"html":"<p>The expression of the metric tensor in the new coordinates is</p>"}
︠8fafb558-7030-4bef-a616-e4e60dce5886s︠
g.display(X_spher.frame(), X_spher)
︡b72a4c3d-83db-4789-8462-245695c978f0︡︡{"html":"<div>$g = \\left( -b^{2} r^{2} - 1 \\right) \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\tau} + \\left( \\frac{1}{b^{2} r^{2} + 1} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + r^{2} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + r^{2} \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠4139bbee-89ce-4154-a017-cb488ff7a851︠










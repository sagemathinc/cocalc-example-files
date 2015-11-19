︠d6ee60bb-78ef-4b80-b64f-4a750284e1c9as︠
%auto
typeset_mode(True, display=False)
︡52af4726-05aa-4cac-a0d7-7ea6f1c8a922︡︡{"auto":true}︡{"done":true}
︠00d9adb6-9d1a-4ab0-b9e4-b80c8e03aa44i︠
%html
<div id="cell_text_154" class="text_cell">
<h1 style="text-align: center;">de Sitter spacetime</h1>
<p>This worksheet demonstrates a few capabilities of <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.8) in computations regarding de Sitter spacetime.</p>
<p>It is released under the GNU General Public License version 3.</p>
<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>
<p><em><span style="color: #008080;">The corresponding worksheet file can be downloaded from</span><span style="color: #ff6600;"><span style="color: #0000ff;"> <a href="http://sagemanifolds.obspm.fr/examples/sws/SM_de_Sitter.sws"><span style="color: #0000ff;">here</span></a></span></span></em></p>
<p><em><span style="color: #ff6600;"><span style="color: #0000ff;"><span style="color: #0000ff;"><br /></span></span></span></em></p>
</div>
<h2>Spacetime manifold</h2>
<p><span id="cell_outer_3"><span id="cell_outer_3">We declare the de Sitter spacetime as a 4-dimensional differentiable manifold:</span></span></p>

︡1a79dab5-14b4-46b6-bf98-37f372689817︡︡{"done":true,"html":"<div id=\"cell_text_154\" class=\"text_cell\">\n<h1 style=\"text-align: center;\">de Sitter spacetime</h1>\n<p>This worksheet demonstrates a few capabilities of <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.8) in computations regarding de Sitter spacetime.</p>\n<p>It is released under the GNU General Public License version 3.</p>\n<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>\n<p><em><span style=\"color: #008080;\">The corresponding worksheet file can be downloaded from</span><span style=\"color: #ff6600;\"><span style=\"color: #0000ff;\"> <a href=\"http://sagemanifolds.obspm.fr/examples/sws/SM_de_Sitter.sws\"><span style=\"color: #0000ff;\">here</span></a></span></span></em></p>\n<p><em><span style=\"color: #ff6600;\"><span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\"><br /></span></span></span></em></p>\n</div>\n<h2>Spacetime manifold</h2>\n<p><span id=\"cell_outer_3\"><span id=\"cell_outer_3\">We declare the de Sitter spacetime as a 4-dimensional differentiable manifold:</span></span></p>"}
︠24d5fa0f-8346-40be-b1f9-d290e19c7eb7s︠
M = Manifold(4, 'M', r'\mathcal{M}')
print M ; M
︡85f6bb30-509d-428e-bd30-179bddf5418b︡︡{"stdout":"4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\mathcal{M}$</div>","done":false}︡{"done":true}
︠7502fca3-ab19-4a0a-878a-cb917dc306c0i︠
%html
<p>We consider hyperspherical coordinates $(\tau,\chi,\theta,\phi)$ on $\mathcal{M}$. Allowing for the standard coordinate singularities at $\chi=0$, $\chi=\pi$, $\theta=0$ or $\theta=\pi$, these coordinates cover the entire spacetime manifold (which is topologically $\mathbb{R}\times\mathbb{S}^3$). If we restrict ourselves to <em>regular</em> coordinates (i.e. to consider only mathematically well defined charts), the hyperspherical coordinates cover only an open part of $\mathcal{M}$, which we call $\mathcal{M}_0$, on which $\chi$ spans the open interval $(0,\pi)$, $\theta$ the open interval $(0,\pi)$ and $\phi$ the open interval $(0,2\pi)$. Therefore, we declare:</p>

︡59173d33-0274-40c4-bb0f-e92bd7ab4c55︡︡{"done":true,"html":"<p>We consider hyperspherical coordinates $(\\tau,\\chi,\\theta,\\phi)$ on $\\mathcal{M}$. Allowing for the standard coordinate singularities at $\\chi=0$, $\\chi=\\pi$, $\\theta=0$ or $\\theta=\\pi$, these coordinates cover the entire spacetime manifold (which is topologically $\\mathbb{R}\\times\\mathbb{S}^3$). If we restrict ourselves to <em>regular</em> coordinates (i.e. to consider only mathematically well defined charts), the hyperspherical coordinates cover only an open part of $\\mathcal{M}$, which we call $\\mathcal{M}_0$, on which $\\chi$ spans the open interval $(0,\\pi)$, $\\theta$ the open interval $(0,\\pi)$ and $\\phi$ the open interval $(0,2\\pi)$. Therefore, we declare:</p>"}
︠f0299b37-e526-4d0c-b43c-40e69a814df5s︠
M0 = M.open_subset('M_0', r'\mathcal{M}_0')
X_hyp.<ta,ch,th,ph> = M0.chart(r'ta:\tau ch:(0,pi):\chi th:(0,pi):\theta ph:(0,2*pi):\phi')
print X_hyp ; X_hyp
︡a97b48ea-f28a-45c6-b1c9-1bbd5d2c78e9︡︡{"stdout":"chart (M_0, (ta, ch, th, ph))\n","done":false}︡{"html":"<div>$\\left(\\mathcal{M}_0,({\\tau}, {\\chi}, {\\theta}, {\\phi})\\right)$</div>","done":false}︡{"done":true}
︠8158c47f-4e84-43f9-8374-a938d8f5cf15i︠
%html
<h2>$\mathbb{R}^5$ as an ambient space</h2>
<p>The de Sitter metric can be defined as that induced by the embedding of $\mathcal{M}$ into a 5-dimensional Minkowski space, i.e. $\mathbb{R}^5$ equipped with a flat Lorentzian metric. We therefore introduce $\mathbb{R}^5$ as a 5-dimensional manifold covered by canonical coordinates:</p>

︡fca2182f-7629-4410-a727-14864325a0f7︡︡{"done":true,"html":"<h2>$\\mathbb{R}^5$ as an ambient space</h2>\n<p>The de Sitter metric can be defined as that induced by the embedding of $\\mathcal{M}$ into a 5-dimensional Minkowski space, i.e. $\\mathbb{R}^5$ equipped with a flat Lorentzian metric. We therefore introduce $\\mathbb{R}^5$ as a 5-dimensional manifold covered by canonical coordinates:</p>"}
︠d0b1e74d-4c91-4322-b795-80a0a7ca4195s︠
R5 = Manifold(5, 'R5', r'\mathbb{R}^5')
X5.<T,W,X,Y,Z> = R5.chart()
print X5 ; X5
︡91b82cf6-aba6-46ec-a4a2-8747263984fd︡︡{"stdout":"chart (R5, (T, W, X, Y, Z))\n","done":false}︡{"html":"<div>$\\left(\\mathbb{R}^5,(T, W, X, Y, Z)\\right)$</div>","done":false}︡{"done":true}
︠476d4a4c-3df5-4149-aae3-ff14e563ced4i︠
%html
<p>The embedding of $\mathcal{M}$ into $\mathbb{R}^5$ is defined as a differential mapping $\Phi$ from $\mathcal{M}$ to $\mathbb{R}^5$, by providing its expression in terms of $\mathcal{M}$'s default chart (which is X_hyp = $(\mathcal{M}_0,(\tau,\chi,\theta,\phi))$ ) and $\mathbb{R}^5$'s default chart (which is X5 = $(\mathbb{R}^5,(T,W,X,Y,Z))$ ):</p>

︡f221c66e-b9dc-45fc-80de-7cc4b93060e5︡︡{"done":true,"html":"<p>The embedding of $\\mathcal{M}$ into $\\mathbb{R}^5$ is defined as a differential mapping $\\Phi$ from $\\mathcal{M}$ to $\\mathbb{R}^5$, by providing its expression in terms of $\\mathcal{M}$'s default chart (which is X_hyp = $(\\mathcal{M}_0,(\\tau,\\chi,\\theta,\\phi))$ ) and $\\mathbb{R}^5$'s default chart (which is X5 = $(\\mathbb{R}^5,(T,W,X,Y,Z))$ ):</p>"}
︠fd1bf3f9-e4b2-48c7-9421-c203fc254746s︠
var('b')
Phi = M.diff_mapping(R5, [sinh(b*ta)/b,
                          cosh(b*ta)/b * cos(ch),
                          cosh(b*ta)/b * sin(ch)*sin(th)*cos(ph),
                          cosh(b*ta)/b * sin(ch)*sin(th)*sin(ph),
                          cosh(b*ta)/b * sin(ch)*cos(th)],
                  name='Phi', latex_name=r'\Phi')
print Phi ; Phi.display()
︡19ad33d3-b254-4a94-8456-7fea8eb685e4︡︡{"html":"<div>$b$</div>","done":false}︡{"stdout":"differentiable mapping 'Phi' from the 4-dimensional manifold 'M' to the 5-dimensional manifold 'R5'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} \\Phi:&amp; \\mathcal{M} &amp; \\longrightarrow &amp; \\mathbb{R}^5 \\\\ \\mbox{on}\\ \\mathcal{M}_0 : &amp; \\left({\\tau}, {\\chi}, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; \\left(T, W, X, Y, Z\\right) = \\left(\\frac{\\sinh\\left(b {\\tau}\\right)}{b}, \\frac{\\cos\\left({\\chi}\\right) \\cosh\\left(b {\\tau}\\right)}{b}, \\frac{\\cos\\left({\\phi}\\right) \\cosh\\left(b {\\tau}\\right) \\sin\\left({\\chi}\\right) \\sin\\left({\\theta}\\right)}{b}, \\frac{\\cosh\\left(b {\\tau}\\right) \\sin\\left({\\chi}\\right) \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)}{b}, \\frac{\\cos\\left({\\theta}\\right) \\cosh\\left(b {\\tau}\\right) \\sin\\left({\\chi}\\right)}{b}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠cd124048-d747-43a1-aa0d-381dade77282i︠
%html
<p>The constant $b$ is a scale parameter. Considering de Sitter metric as a solution of vacuum Einstein equation with positive cosmological constant $\Lambda$, one has $b = \sqrt{\Lambda/3}$.&nbsp;</p>
<p>Let us evaluate the image of a point via the mapping $\Phi$:</p>

︡3b910702-3d26-4988-8552-562ed75d4786︡︡{"done":true,"html":"<p>The constant $b$ is a scale parameter. Considering de Sitter metric as a solution of vacuum Einstein equation with positive cosmological constant $\\Lambda$, one has $b = \\sqrt{\\Lambda/3}$.&nbsp;</p>\n<p>Let us evaluate the image of a point via the mapping $\\Phi$:</p>"}
︠db99fc29-1ac0-4e02-a922-56c5f7380704s︠
p = M.point((ta, ch, th, ph), name='p') ; print p
︡67fda435-17c3-46a5-9440-b32c0aefd7d6︡︡{"stdout":"point 'p' on 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠840a88f5-a4ee-4e85-978e-e2a4da3f4d88s︠
p.coord()
︡4816f7f7-7ae9-4456-80b0-3234d342f6ed︡︡{"html":"<div>(${\\tau}$, ${\\chi}$, ${\\theta}$, ${\\phi}$)</div>","done":false}︡{"done":true}
︠2f8d4db0-e835-4b81-ae50-9e13f4976c1ds︠
q = Phi(p) ; print q
︡c3c467a2-762e-4418-af08-26bc88309282︡︡{"stdout":"point 'Phi(p)' on 5-dimensional manifold 'R5'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠27de973c-12ce-4fbb-a313-82e5696d86d7s︠
q.coord()
︡d548809a-f7d4-4717-8d90-cfe925a65050︡︡{"html":"<div>($\\frac{\\sinh\\left(b {\\tau}\\right)}{b}$, $\\frac{\\cos\\left({\\chi}\\right) \\cosh\\left(b {\\tau}\\right)}{b}$, $\\frac{\\cos\\left({\\phi}\\right) \\cosh\\left(b {\\tau}\\right) \\sin\\left({\\chi}\\right) \\sin\\left({\\theta}\\right)}{b}$, $\\frac{\\cosh\\left(b {\\tau}\\right) \\sin\\left({\\chi}\\right) \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)}{b}$, $\\frac{\\cos\\left({\\theta}\\right) \\cosh\\left(b {\\tau}\\right) \\sin\\left({\\chi}\\right)}{b}$)</div>","done":false}︡{"done":true}
︠50f172c7-6514-4d9f-be22-8708081c9d86i︠
%html
<p>The image of $\mathcal{M}$ by $\Phi$ is a hyperboloid of one sheet, of equation $-T^2+W^2+X^2+Y^2+Z^2=b^{-2}$. Indeed:</p>

︡169d759a-c5c2-40f9-b675-4523d50a1ce2︡︡{"done":true,"html":"<p>The image of $\\mathcal{M}$ by $\\Phi$ is a hyperboloid of one sheet, of equation $-T^2+W^2+X^2+Y^2+Z^2=b^{-2}$. Indeed:</p>"}
︠5a77bbbb-4503-4804-876a-6726eec509efs︠
(Tq,Wq,Xq,Yq,Zq) = q.coord()
s = -Tq^2 + Wq^2 + Xq^2 + Yq^2 + Zq^2
s.simplify_full()
︡317e2113-669c-48cb-aadf-138c4878c917︡︡{"html":"<div>$\\frac{1}{b^{2}}$</div>","done":false}︡{"done":true}
︠a59b260d-e8a3-4b60-a85b-6d95ebc1375ai︠
%html
<p>We may use the embedding $\Phi$ to draw the coordinate grid $(\tau,\chi)$ in terms of the coordinates $(W,X,T)$ for $\theta=\pi/2$ and $\phi=0$ (red) and $\theta=\pi/2$ and $\phi=\pi$ (green) (the brown lines are the lines $\tau={\rm const}$):</p>

︡a7f58c7b-5e1f-47aa-af3e-2279d975a032︡︡{"done":true,"html":"<p>We may use the embedding $\\Phi$ to draw the coordinate grid $(\\tau,\\chi)$ in terms of the coordinates $(W,X,T)$ for $\\theta=\\pi/2$ and $\\phi=0$ (red) and $\\theta=\\pi/2$ and $\\phi=\\pi$ (green) (the brown lines are the lines $\\tau={\\rm const}$):</p>"}
︠c8924865-aa83-486a-ae6d-1c263d1c8c42s︠
graph1 = X_hyp.plot(X5, mapping=Phi, ambient_coords=(W,X,T), fixed_coords={th:pi/2, ph:0}, nb_values=9, color={ta:'red', ch:'brown'}, thickness=2, max_value=2, parameters={b:1}, label_axes=False)
graph2 = X_hyp.plot(X5, mapping=Phi, ambient_coords=(W,X,T), fixed_coords={th:pi/2, ph:pi}, nb_values=9, color={ta:'green', ch:'brown'}, thickness=2, max_value=2, parameters={b:1}, label_axes=False)
show(set_axes_labels(graph1+graph2,'W','X','T'), aspect_ratio=1)
︡3e3373c9-2c1d-42e5-9471-4e765e0afbef︡︡{"done":false,"file":{"uuid":"f97f4212-d46d-4ad8-b8f7-4979d61774e6","filename":"f97f4212-d46d-4ad8-b8f7-4979d61774e6.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠b0c32c4b-e08c-47d9-bf00-638b410c1ef7i︠
%html
<h2>Spacetime metric</h2>
<p>First, we introduce on $\mathbb{R}^5$ the Minkowski metric $h$:</p>

︡46a2101e-2eb3-452a-a3c7-2e6277ec8e18︡︡{"done":true,"html":"<h2>Spacetime metric</h2>\n<p>First, we introduce on $\\mathbb{R}^5$ the Minkowski metric $h$:</p>"}
︠00290c1e-af84-4a35-b444-9921f139b586s︠
h = R5.lorentz_metric('h')
h[0,0], h[1,1], h[2,2], h[3,3], h[4,4] = -1, 1, 1, 1, 1
h.display()
︡af70c54a-d38e-4285-882f-890adf08aa0c︡︡{"html":"<div>$h = -\\mathrm{d} T\\otimes \\mathrm{d} T+\\mathrm{d} W\\otimes \\mathrm{d} W+\\mathrm{d} X\\otimes \\mathrm{d} X+\\mathrm{d} Y\\otimes \\mathrm{d} Y+\\mathrm{d} Z\\otimes \\mathrm{d} Z$</div>","done":false}︡{"done":true}
︠03f0f86c-84ce-4e2b-8278-045a459cd8adi︠
%html
<p>As mentioned above, the de Sitter metric $g$ on $\mathcal{M}$ is that induced by $h$, i.e.$g$ is the pullback of $h$ by the mapping $\Phi$:</p>

︡66015e29-a443-46e0-8133-268c82b58bf5︡︡{"done":true,"html":"<p>As mentioned above, the de Sitter metric $g$ on $\\mathcal{M}$ is that induced by $h$, i.e.$g$ is the pullback of $h$ by the mapping $\\Phi$:</p>"}
︠1f2033e1-fd99-4876-91ea-3e1fb4b77cccs︠
g = M.metric('g')
g.set( Phi.pullback(h) )
︡5d3bf181-75f6-4d24-896b-327a885a0652︡︡{"done":true}
︠82611c22-c1f0-4f6f-ab01-af664add70abi︠
%html
<p>The expression of $g$ in terms of $\mathcal{M}$'s default frame is found to be</p>

︡11d729b4-efa3-4795-a072-228ccba36891︡︡{"done":true,"html":"<p>The expression of $g$ in terms of $\\mathcal{M}$'s default frame is found to be</p>"}
︠c075b76d-dea7-4bba-b39c-74b3e3411526s︠
g.display()
︡89f32c3a-8bd9-4a33-b1fd-1b9f6ac2dd91︡︡{"html":"<div>$g = -\\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\tau} + \\frac{\\cosh\\left(b {\\tau}\\right)^{2}}{b^{2}} \\mathrm{d} {\\chi}\\otimes \\mathrm{d} {\\chi} + \\frac{\\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2}}{b^{2}} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + \\frac{\\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2}}{b^{2}} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠a173f763-a965-4285-bd04-93de610b0ca5s︠
g[:]
︡a1a77884-9446-4b1e-8a8b-07fdc014e1b6︡︡{"html":"<div>$\\left(\\begin{array}{rrrr}\n-1 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; \\frac{\\cosh\\left(b {\\tau}\\right)^{2}}{b^{2}} &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; \\frac{\\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2}}{b^{2}} &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; \\frac{\\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2}}{b^{2}}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠49ef964e-9a05-424f-b7f1-d45027db3c6fi︠
%html
<h2>Curvature</h2>
<p>The Riemann tensor of $g$ is</p>

︡e8de7ecc-1688-4aa6-b25d-db7e096eaa46︡︡{"done":true,"html":"<h2>Curvature</h2>\n<p>The Riemann tensor of $g$ is</p>"}
︠58358f7f-dfb7-410b-bbc3-f6e10a948911s︠
Riem = g.riemann()
print Riem
Riem.display()
︡203d7e6d-6c97-4f85-8c46-e44419a1739d︡︡{"stdout":"tensor field 'Riem(g)' of type (1,3) on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\mathrm{Riem}\\left(g\\right) = \\cosh\\left(b {\\tau}\\right)^{2} \\frac{\\partial}{\\partial {\\tau} }\\otimes \\mathrm{d} {\\chi}\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\chi} -\\cosh\\left(b {\\tau}\\right)^{2} \\frac{\\partial}{\\partial {\\tau} }\\otimes \\mathrm{d} {\\chi}\\otimes \\mathrm{d} {\\chi}\\otimes \\mathrm{d} {\\tau} + \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\frac{\\partial}{\\partial {\\tau} }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\theta} -\\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\frac{\\partial}{\\partial {\\tau} }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\tau} + \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} \\frac{\\partial}{\\partial {\\tau} }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\phi} -\\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} \\frac{\\partial}{\\partial {\\tau} }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\tau} + b^{2} \\frac{\\partial}{\\partial {\\chi} }\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\chi} -b^{2} \\frac{\\partial}{\\partial {\\chi} }\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\chi}\\otimes \\mathrm{d} {\\tau} + \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\frac{\\partial}{\\partial {\\chi} }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\chi}\\otimes \\mathrm{d} {\\theta} -\\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\frac{\\partial}{\\partial {\\chi} }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\chi} + \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} \\frac{\\partial}{\\partial {\\chi} }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\chi}\\otimes \\mathrm{d} {\\phi} -\\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} \\frac{\\partial}{\\partial {\\chi} }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\chi} + b^{2} \\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\theta} -b^{2} \\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\tau} + \\left( -\\frac{\\sin\\left({\\chi}\\right)^{2} \\sinh\\left(b {\\tau}\\right)^{2} - \\cos\\left({\\chi}\\right)^{2} + 1}{\\sin\\left({\\chi}\\right)^{2}} \\right) \\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\chi}\\otimes \\mathrm{d} {\\chi}\\otimes \\mathrm{d} {\\theta} + \\cosh\\left(b {\\tau}\\right)^{2} \\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\chi}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\chi} + \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} \\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\phi} -\\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} \\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\theta} + b^{2} \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\phi} -b^{2} \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\tau} + \\left( -\\frac{\\sin\\left({\\chi}\\right)^{2} \\sinh\\left(b {\\tau}\\right)^{2} - \\cos\\left({\\chi}\\right)^{2} + 1}{\\sin\\left({\\chi}\\right)^{2}} \\right) \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\chi}\\otimes \\mathrm{d} {\\chi}\\otimes \\mathrm{d} {\\phi} + \\cosh\\left(b {\\tau}\\right)^{2} \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\chi}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\chi} -\\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\phi} + \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\theta}$</div>","done":false}︡{"done":true}
︠406bd246-1a3b-49c1-bf02-fb09cc243708s︠
Riem.display_comp(only_nonredundant=True)
︡96f807ae-4076-47d5-9009-e1bd7f09d386︡︡{"html":"<div>$\\begin{array}{lcl} \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\tau} } \\, {\\chi} \\, {\\tau} \\, {\\chi} }^{ \\, {\\tau} \\phantom{\\, {\\chi} } \\phantom{\\, {\\tau} } \\phantom{\\, {\\chi} } } &amp; = &amp; \\cosh\\left(b {\\tau}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\tau} } \\, {\\theta} \\, {\\tau} \\, {\\theta} }^{ \\, {\\tau} \\phantom{\\, {\\theta} } \\phantom{\\, {\\tau} } \\phantom{\\, {\\theta} } } &amp; = &amp; \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\tau} } \\, {\\phi} \\, {\\tau} \\, {\\phi} }^{ \\, {\\tau} \\phantom{\\, {\\phi} } \\phantom{\\, {\\tau} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\chi} } \\, {\\tau} \\, {\\tau} \\, {\\chi} }^{ \\, {\\chi} \\phantom{\\, {\\tau} } \\phantom{\\, {\\tau} } \\phantom{\\, {\\chi} } } &amp; = &amp; b^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\chi} } \\, {\\theta} \\, {\\chi} \\, {\\theta} }^{ \\, {\\chi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\chi} } \\phantom{\\, {\\theta} } } &amp; = &amp; \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\chi} } \\, {\\phi} \\, {\\chi} \\, {\\phi} }^{ \\, {\\chi} \\phantom{\\, {\\phi} } \\phantom{\\, {\\chi} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\theta} } \\, {\\tau} \\, {\\tau} \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, {\\tau} } \\phantom{\\, {\\tau} } \\phantom{\\, {\\theta} } } &amp; = &amp; b^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\theta} } \\, {\\chi} \\, {\\chi} \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, {\\chi} } \\phantom{\\, {\\chi} } \\phantom{\\, {\\theta} } } &amp; = &amp; -\\frac{\\sin\\left({\\chi}\\right)^{2} \\sinh\\left(b {\\tau}\\right)^{2} - \\cos\\left({\\chi}\\right)^{2} + 1}{\\sin\\left({\\chi}\\right)^{2}} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\theta} } \\, {\\phi} \\, {\\theta} \\, {\\phi} }^{ \\, {\\theta} \\phantom{\\, {\\phi} } \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\phi} } \\, {\\tau} \\, {\\tau} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\tau} } \\phantom{\\, {\\tau} } \\phantom{\\, {\\phi} } } &amp; = &amp; b^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\phi} } \\, {\\chi} \\, {\\chi} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\chi} } \\phantom{\\, {\\chi} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\frac{\\sin\\left({\\chi}\\right)^{2} \\sinh\\left(b {\\tau}\\right)^{2} - \\cos\\left({\\chi}\\right)^{2} + 1}{\\sin\\left({\\chi}\\right)^{2}} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\phi} } \\, {\\theta} \\, {\\theta} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\end{array}$</div>","done":false}︡{"done":true}
︠8e6434ea-f8ab-4594-8ca4-d6751bef5b60i︠
%html
<p>The Ricci tensor:</p>

︡9b0779bd-c621-4774-a809-0eea8fa77737︡︡{"done":true,"html":"<p>The Ricci tensor:</p>"}
︠d2c5757d-d8b7-4412-8c18-406d3f39447bs︠
Ric = g.ricci()
print Ric
Ric.display()
︡97caaef6-9f5d-4e88-af8b-554d237f19f0︡︡{"stdout":"field of symmetric bilinear forms 'Ric(g)' on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\mathrm{Ric}\\left(g\\right) = -3 \\, b^{2} \\mathrm{d} {\\tau}\\otimes \\mathrm{d} {\\tau} + 3 \\, \\cosh\\left(b {\\tau}\\right)^{2} \\mathrm{d} {\\chi}\\otimes \\mathrm{d} {\\chi} + 3 \\, \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + 3 \\, \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠bc5a6b52-f5f3-497c-ac5f-ef33c950cc7bs︠
Ric[:]
︡224cf78c-6e5c-42db-899d-b8a9d13b0ead︡︡{"html":"<div>$\\left(\\begin{array}{rrrr}\n-3 \\, b^{2} &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 3 \\, \\cosh\\left(b {\\tau}\\right)^{2} &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 3 \\, \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 3 \\, \\cosh\\left(b {\\tau}\\right)^{2} \\sin\\left({\\chi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠19b562b5-a7d6-4d5d-9bf4-786ee2ed8902i︠
%html
<p>The Ricci scalar:</p>

︡00dc28fa-4415-4526-b0dd-0fb71cc1ac8b︡︡{"done":true,"html":"<p>The Ricci scalar:</p>"}
︠6125f2a0-de34-4f20-a144-86a36f361010s︠
R = g.ricci_scalar()
print R
R.display()
︡272d51d7-4d0a-44a0-bde0-ce5479f29f9f︡︡{"stdout":"scalar field 'r(g)' on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} \\mathrm{r}\\left(g\\right):&amp; \\mathcal{M} &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ \\mbox{on}\\ \\mathcal{M}_0 : &amp; \\left({\\tau}, {\\chi}, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; 12 \\, b^{2} \\end{array}$</div>","done":false}︡{"done":true}
︠751afc30-015d-4a43-a356-28f37204f5eci︠
%html
<p>We recover the fact that de Sitter spacetime has a constant curvature. It is indeed a <strong>maximally symmetric space</strong>. In particular, the Riemann tensor is expressible as</p>
<p>\[ R^i_{\ \, jlk} = \frac{R}{n(n-1)} \left( \delta^i_{\ \, k} g_{jl} - \delta^i_{\ \, l} g_{jk} \right) \]</p>
<p>where $n$ is the dimension of $\mathcal{M}$: $n=4$ in the present case. Let us check this formula here, under the form $R^i_{\ \, jlk} = -\frac{R}{6} g_{j[k} \delta^i_{\ \, l]}$:</p>

︡c547389d-1313-4bfc-b621-3ac084e7f338︡︡{"done":true,"html":"<p>We recover the fact that de Sitter spacetime has a constant curvature. It is indeed a <strong>maximally symmetric space</strong>. In particular, the Riemann tensor is expressible as</p>\n<p>\\[ R^i_{\\ \\, jlk} = \\frac{R}{n(n-1)} \\left( \\delta^i_{\\ \\, k} g_{jl} - \\delta^i_{\\ \\, l} g_{jk} \\right) \\]</p>\n<p>where $n$ is the dimension of $\\mathcal{M}$: $n=4$ in the present case. Let us check this formula here, under the form $R^i_{\\ \\, jlk} = -\\frac{R}{6} g_{j[k} \\delta^i_{\\ \\, l]}$:</p>"}
︠a2ae7c4d-1e8d-4810-b9d0-1c65db56478ds︠
delta = M.tangent_identity_field() 
Riem == - (R/6)*(g*delta).antisymmetrize(2,3)  # 2,3 = last positions of the type-(1,3) tensor g*delta
︡fce48102-e28d-4b9d-bd49-b116e28bdff6︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠3ee0796d-e092-41ff-8945-e978eec83025i︠
%html
<p>We may also check that de Sitter metric is a solution of the vacuum <strong>Einstein equation</strong> with (positive) cosmological constant:</p>

︡9e290803-38a7-47ba-a869-2b5004801949︡︡{"done":true,"html":"<p>We may also check that de Sitter metric is a solution of the vacuum <strong>Einstein equation</strong> with (positive) cosmological constant:</p>"}
︠66c1f5d7-c9a1-4fce-98d7-ddb66ea8800as︠
Lambda = 3*b^2
Ric - 1/2*R*g + Lambda*g == 0
︡34bf530c-9823-409d-a5ab-7d5d367d11cd︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠fda05c87-69e8-4784-9cf8-de571462e61e︠











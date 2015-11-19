︠09b44bae-4779-4a19-9e51-48b152801ab6as︠
%auto
typeset_mode(True, display=False)
︡9b3c7e60-f84c-4502-a833-f2bf93f5a4a6︡{"auto":true}︡
︠4b5a58ca-7d65-4b54-9b76-51bddcc37eabi︠
%html
<h1 style="text-align: center;">3+1 Simon-Mars tensor in Kerr spacetime</h1>
<p>This worksheet demonstrates a few capabilities of <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.7) in computations regarding 3+1 slicing of Kerr spacetime. In particular, it implements the computation of the 3+1 decomposition of the Simon-Mars tensor as given in the article <a href="http://arxiv.org/abs/1412.6542">arXiv:1412.6542</a>.</p>
<p>The worksheet is released under the GNU General Public License version 2.</p>
<p>(c) Claire Som&eacute;, Eric Gourgoulhon (2015)</p>
<p><em><span style="color: #008080;">The worksheet file in Sage notebook format is</span> <a href="http://sagemanifolds.obspm.fr/examples/sws/SM_Simon-Mars_3p1_Kerr.sws">here</a></em>.</p>
<h2>Spacelike hypersurface</h2>
<p>We consider some hypersurface $\Sigma$ of a spacelike foliation $(\Sigma_t)_{t\in\mathbb{R}}$ of Kerr spacetime; we declare $\Sigma_t$ as a 3-dimensional manifold:</p>

︡2cfe009d-ed65-4da6-b521-b6b86198f593︡︡{"done":true,"html":"<h1 style=\"text-align: center;\">3+1 Simon-Mars tensor in Kerr spacetime</h1>\n<p>This worksheet demonstrates a few capabilities of <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.7) in computations regarding 3+1 slicing of Kerr spacetime. In particular, it implements the computation of the 3+1 decomposition of the Simon-Mars tensor as given in the article <a href=\"http://arxiv.org/abs/1412.6542\">arXiv:1412.6542</a>.</p>\n<p>The worksheet is released under the GNU General Public License version 2.</p>\n<p>(c) Claire Som&eacute;, Eric Gourgoulhon (2015)</p>\n<p><em><span style=\"color: #008080;\">The worksheet file in Sage notebook format is</span> <a href=\"http://sagemanifolds.obspm.fr/examples/sws/SM_Simon-Mars_3p1_Kerr.sws\">here</a></em>.</p>\n<h2>Spacelike hypersurface</h2>\n<p>We consider some hypersurface $\\Sigma$ of a spacelike foliation $(\\Sigma_t)_{t\\in\\mathbb{R}}$ of Kerr spacetime; we declare $\\Sigma_t$ as a 3-dimensional manifold:</p>"}
︠84be549c-c9bf-41bb-9abe-4974c0493bb9︠
Sig = Manifold(3, 'Sigma', r'\Sigma', start_index=1)
︡ff40cb4b-43a7-47ae-850e-a264b9b3cb27︡︡{"done":true}
︠9d2b9b2d-0d35-43f8-afad-99729ee60cc5i︠
%html
<p>The two Kerr parameters:</p>

︡5078311a-5081-4599-b818-af32bd0dbc62︡︡{"done":true,"html":"<p>The two Kerr parameters:</p>"}
︠59b36c89-c44a-4ba5-8c2c-28249bac58ca︠
var('m, a')
assume(m>0)
assume(a>0)
︡06cb565a-776a-4a17-bf40-a1a705ba1f63︡︡{"html":"<div>($m$, $a$)</div>","done":false}︡{"done":true}
︠e19d5317-c519-4a39-a7b5-83e6a7051ca1i︠
%html
<h3>Riemannian metric on $\Sigma$</h3>
<p>The variables introduced so far satisfy the following assumptions:</p>

<p>Without any loss of generality (for $m\not =0$), we may set $m=1$:</p>

︡4ba7edda-2d4c-4bd9-99c3-c40d967b8799︡︡{"done":true,"html":"<h3>Riemannian metric on $\\Sigma$</h3>\n<p>The variables introduced so far satisfy the following assumptions:</p>\n\n<p>Without any loss of generality (for $m\\not =0$), we may set $m=1$:</p>"}
︠61b496c2-8d81-4323-b847-6832e351c512︠
m=1
assume(a<1)
︡09ef811d-2a3a-470d-a619-55b92064bee4︡︡{"done":true}
︠614ae45d-1158-4b89-9952-9f6e130a26bf︠
#a=1 # extreme Kerr
︡ac0d9532-dc4c-4d5b-9c43-8002a4a42b77︡︡{"done":true}
︠1a18581b-c0ee-4f55-86e1-ee0cfbe9d2f8i︠
%html
<p>On the hypersurface $\Sigma$, we are using coordinates $(r,y,\phi)$ that are related to the standard Boyer-Lindquist coordinates $(r,\theta,\phi)$ by $y=\cos\theta$:</p>

︡d8ac35ca-b863-4e89-99c1-305d1d384069︡︡{"done":true,"html":"<p>On the hypersurface $\\Sigma$, we are using coordinates $(r,y,\\phi)$ that are related to the standard Boyer-Lindquist coordinates $(r,\\theta,\\phi)$ by $y=\\cos\\theta$:</p>"}
︠4638a9a0-5555-4d40-a0dc-66b65766fb46︠
X.<r,y,ph> = Sig.chart(r'r:(1+sqrt(1-a^2),+oo) y:(-1,1) ph:(0,2*pi):\phi')
print X ; X
︡9610a5d4-c310-4d82-9ae9-573c1d4c90c7︡︡{"stdout":"chart (Sigma, (r, y, ph))\n","done":false}︡{"html":"<div>$\\left(\\Sigma,(r, y, {\\phi})\\right)$</div>","done":false}︡{"done":true}
︠5bbab54c-21da-4704-b8bd-fae466a84867i︠
%html
<h3>Riemannian metric on $\Sigma$</h3>
<p>The variables introduced so far obey the following assumptions:</p>

︡9c5ecae3-b200-4c41-9784-69c3df54d0a5︡︡{"done":true,"html":"<h3>Riemannian metric on $\\Sigma$</h3>\n<p>The variables introduced so far obey the following assumptions:</p>"}
︠b61c25f7-c56c-4392-9873-22850dbfd7fe︠
assumptions()
︡c630ed07-9bdb-42c3-9e0c-d16e617179cf︡︡{"html":"<div>[$m &gt; 0$, $a &gt; 0$, $a &lt; 1$, $\\text{\\texttt{r{ }is{ }real}}$, $\\text{\\texttt{y{ }is{ }real}}$, $y &gt; \\left(-1\\right)$, $y &lt; 1$, $\\text{\\texttt{ph{ }is{ }real}}$, ${\\phi} &gt; 0$, ${\\phi} &lt; 2 \\, \\pi$]</div>","done":false}︡{"done":true}
︠1d5af6ad-9ba6-4d26-93df-1a83d29cdef1i︠
%html
<p>Some shortcut notations:</p>

︡203f7130-72c5-4a8d-93cc-ae990a3eee8a︡︡{"done":true,"html":"<p>Some shortcut notations:</p>"}
︠6eff5017-aa49-4181-98a0-b5da8d9c3c72︠
rho2 = r^2 + a^2*y^2 
Del = r^2 -2*m*r + a^2
AA2 = rho2*(r^2 + a^2) + 2*a^2*m*r*(1-y^2)
BB2 = r^2 + a^2 + 2*a^2*m*r*(1-y^2)/rho2
︡e88b38d4-abd3-404f-acb7-12b093ee439a︡︡{"done":true}
︠826952d6-a9c2-4fdd-8ca8-0781e9bb5fb7i︠
%html
<p>The metric $h$ induced by the spacetime metric $g$ on $\Sigma$:</p>

︡b82300b9-1f06-4f7b-9e8f-5e62167700b8︡︡{"done":true,"html":"<p>The metric $h$ induced by the spacetime metric $g$ on $\\Sigma$:</p>"}
︠97849366-ff98-4c3a-9663-9def0a4f1844︠
gam = Sig.riemann_metric('gam', latex_name=r'\gamma') 
gam[1,1] = rho2/Del
gam[2,2] = rho2/(1-y^2)
gam[3,3] = BB2*(1-y^2)
gam.display()
︡e1aa5f05-7d3e-444c-8866-938c410ac0a9︡︡{"html":"<div>$\\gamma = \\left( \\frac{a^{2} y^{2} + r^{2}}{a^{2} + r^{2} - 2 \\, r} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + \\left( -\\frac{a^{2} y^{2} + r^{2}}{y^{2} - 1} \\right) \\mathrm{d} y\\otimes \\mathrm{d} y + \\left( -\\frac{{\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{4} - a^{2} r^{2} - r^{4} - 2 \\, a^{2} r - {\\left(a^{4} - r^{4} - 4 \\, a^{2} r\\right)} y^{2}}{a^{2} y^{2} + r^{2}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠f044c37c-dc33-4762-9569-28b15c3ac763i︠
%html
<p>A matrix view of the components w.r.t. coordinates $(r,y,\phi)$:</p>

︡04cab3f8-4acf-42bb-b99f-77a046ced0a5︡︡{"done":true,"html":"<p>A matrix view of the components w.r.t. coordinates $(r,y,\\phi)$:</p>"}
︠72364dc1-8198-4c74-a823-dff34e258ce0︠
gam[:]
︡12167295-cbf4-485b-a426-2a8347e1afe6︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n\\frac{a^{2} y^{2} + r^{2}}{a^{2} + r^{2} - 2 \\, r} &amp; 0 &amp; 0 \\\\\n0 &amp; -\\frac{a^{2} y^{2} + r^{2}}{y^{2} - 1} &amp; 0 \\\\\n0 &amp; 0 &amp; -\\frac{{\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{4} - a^{2} r^{2} - r^{4} - 2 \\, a^{2} r - {\\left(a^{4} - r^{4} - 4 \\, a^{2} r\\right)} y^{2}}{a^{2} y^{2} + r^{2}}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠4980bda1-39e5-4c4f-8436-9cccdd4adc0bi︠
%html
<h3>Lapse function and shift vector</h3>

︡ba598a65-f1c6-4183-bba3-a7181efe4659︡︡{"done":true,"html":"<h3>Lapse function and shift vector</h3>"}
︠7160df27-dc1a-43c1-a9af-9ffedcbb1434︠
N = Sig.scalar_field(sqrt(Del / BB2), name='N')
print N
N.display()
︡5c140800-856a-4460-a7f5-1cdbd762abea︡︡{"stdout":"scalar field 'N' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} N:&amp; \\Sigma &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(r, y, {\\phi}\\right) &amp; \\longmapsto &amp; \\sqrt{-\\frac{a^{2} + r^{2} - 2 \\, r}{\\frac{2 \\, {\\left(y^{2} - 1\\right)} a^{2} r}{a^{2} y^{2} + r^{2}} - a^{2} - r^{2}}} \\end{array}$</div>","done":false}︡{"done":true}
︠43c0a490-63c8-4f4b-9217-2d20c87c0198︠
b = Sig.vector_field('beta', latex_name=r'\beta') 
b[3] = -2*m*r*a/AA2   
# unset components are zero 
b.display()
︡d946e994-77f0-42d3-923d-354d8269f594︡︡{"html":"<div>$\\beta = \\left( -\\frac{2 \\, a r}{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} \\right) \\frac{\\partial}{\\partial {\\phi} }$</div>","done":false}︡{"done":true}
︠e651a8d3-faee-4fed-bd9c-3496624b2036i︠
%html
<h3>Extrinsic curvature of $\Sigma$</h3>
<p>We use the formula \[ K_{ij} = \frac{1}{2N} \mathcal{L}_{\beta} \gamma_{ij} \] which is valid for any stationary spacetime:</p>

︡5f5f8b73-ab77-4018-ac9c-c19cff3aeca7︡︡{"done":true,"html":"<h3>Extrinsic curvature of $\\Sigma$</h3>\n<p>We use the formula \\[ K_{ij} = \\frac{1}{2N} \\mathcal{L}_{\\beta} \\gamma_{ij} \\] which is valid for any stationary spacetime:</p>"}
︠d4f2b04c-06aa-4e72-a5cb-0a7a1ef8fe00︠
K = gam.lie_der(b) / (2*N)
K.set_name('K')
print K ; K.display()
︡ddbcedf1-4ed2-4ea6-b9f3-36c91c887c04︡︡{"stdout":"field of symmetric bilinear forms 'K' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$K = \\left( \\frac{{\\left(a^{3} r^{2} + 3 \\, a r^{4} + {\\left(a^{5} - a^{3} r^{2}\\right)} y^{4} - {\\left(a^{5} + 3 \\, a r^{4}\\right)} y^{2}\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}}}{{\\left(a^{2} r^{4} + r^{6} + 2 \\, a^{2} r^{3} + {\\left(a^{6} + a^{4} r^{2} - 2 \\, a^{4} r\\right)} y^{4} + 2 \\, {\\left(a^{4} r^{2} + a^{2} r^{4} + a^{4} r - a^{2} r^{3}\\right)} y^{2}\\right)} \\sqrt{a^{2} y^{2} + r^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}} \\right) \\mathrm{d} r\\otimes \\mathrm{d} {\\phi} + \\left( -\\frac{2 \\, \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} {\\left({\\left(a^{5} r + a^{3} r^{3} - 2 \\, a^{3} r^{2}\\right)} y^{3} - {\\left(a^{5} r + a^{3} r^{3} - 2 \\, a^{3} r^{2}\\right)} y\\right)}}{{\\left(a^{2} r^{4} + r^{6} + 2 \\, a^{2} r^{3} + {\\left(a^{6} + a^{4} r^{2} - 2 \\, a^{4} r\\right)} y^{4} + 2 \\, {\\left(a^{4} r^{2} + a^{2} r^{4} + a^{4} r - a^{2} r^{3}\\right)} y^{2}\\right)} \\sqrt{a^{2} y^{2} + r^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}} \\right) \\mathrm{d} y\\otimes \\mathrm{d} {\\phi} + \\left( \\frac{{\\left(a^{3} r^{2} + 3 \\, a r^{4} + {\\left(a^{5} - a^{3} r^{2}\\right)} y^{4} - {\\left(a^{5} + 3 \\, a r^{4}\\right)} y^{2}\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}}}{{\\left(a^{2} r^{4} + r^{6} + 2 \\, a^{2} r^{3} + {\\left(a^{6} + a^{4} r^{2} - 2 \\, a^{4} r\\right)} y^{4} + 2 \\, {\\left(a^{4} r^{2} + a^{2} r^{4} + a^{4} r - a^{2} r^{3}\\right)} y^{2}\\right)} \\sqrt{a^{2} y^{2} + r^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} r + \\left( -\\frac{2 \\, \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} {\\left({\\left(a^{5} r + a^{3} r^{3} - 2 \\, a^{3} r^{2}\\right)} y^{3} - {\\left(a^{5} r + a^{3} r^{3} - 2 \\, a^{3} r^{2}\\right)} y\\right)}}{{\\left(a^{2} r^{4} + r^{6} + 2 \\, a^{2} r^{3} + {\\left(a^{6} + a^{4} r^{2} - 2 \\, a^{4} r\\right)} y^{4} + 2 \\, {\\left(a^{4} r^{2} + a^{2} r^{4} + a^{4} r - a^{2} r^{3}\\right)} y^{2}\\right)} \\sqrt{a^{2} y^{2} + r^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} y$</div>","done":false}︡{"done":true}
︠d7d761e4-c003-4f9f-a8b2-30b923bc27aei︠
%html
<p>Check (comparison with known formulas):</p>

︡56536ef3-2701-4421-a8d1-4429a973c53c︡︡{"done":true,"html":"<p>Check (comparison with known formulas):</p>"}
︠7cea98ef-748e-4005-9934-4def3b42fced︠
Krp = a*m*(1-y^2)*(3*r^4+a^2*r^2+a^2*(r^2-a^2)*y^2) / rho2^2/sqrt(Del*BB2)
Krp
︡60abe4fe-3323-4fa2-a0c9-dbe41c81c099︡︡{"html":"<div>$\\frac{{\\left({\\left(a^{2} - r^{2}\\right)} a^{2} y^{2} - a^{2} r^{2} - 3 \\, r^{4}\\right)} {\\left(y^{2} - 1\\right)} a}{{\\left(a^{2} y^{2} + r^{2}\\right)}^{2} \\sqrt{-{\\left(\\frac{2 \\, {\\left(y^{2} - 1\\right)} a^{2} r}{a^{2} y^{2} + r^{2}} - a^{2} - r^{2}\\right)} {\\left(a^{2} + r^{2} - 2 \\, r\\right)}}}$</div>","done":false}︡{"done":true}
︠26963ce3-bd28-4af7-9009-9ccb7544131b︠
K[1,3] - Krp
︡d564f794-2811-4444-a285-10035cefde13︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠cdf83019-959f-4b5f-bbd8-b02ac8530293︠
Kyp = 2*m*r*a^3*(1-y^2)*y*sqrt(Del)/rho2^2/sqrt(BB2)
Kyp
︡1d87ac59-8d68-4b53-90b9-2284a6316d71︡︡{"html":"<div>$-\\frac{2 \\, \\sqrt{a^{2} + r^{2} - 2 \\, r} {\\left(y^{2} - 1\\right)} a^{3} r y}{{\\left(a^{2} y^{2} + r^{2}\\right)}^{2} \\sqrt{-\\frac{2 \\, {\\left(y^{2} - 1\\right)} a^{2} r}{a^{2} y^{2} + r^{2}} + a^{2} + r^{2}}}$</div>","done":false}︡{"done":true}
︠b407fe08-cb42-4729-9c87-dda0255c51f9︠
K[2,3] - Kyp
︡d03c74a3-66eb-4b10-a837-404d6ae95143︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠9b6a13c5-5541-49a7-9660-f6b4cc8247d2i︠
%html
<p>For now on, we use the expressions Krp and Kyp above for $K_{r\phi}$ and $K_{ry}$, respectively:</p>

︡ff557ded-bed2-4cf2-81fd-bfa5fe2bf652︡︡{"done":true,"html":"<p>For now on, we use the expressions Krp and Kyp above for $K_{r\\phi}$ and $K_{ry}$, respectively:</p>"}
︠65c51c43-745d-4dbe-9a47-25990f63bd56︠
K1 = Sig.sym_bilin_form_field('K')
K1[1,3] = Krp
K1[2,3] = Kyp
K = K1
K.display()
︡f60473d6-2bb2-45e9-ac21-d19cc49a9700︡︡{"html":"<div>$K = \\left( \\frac{{\\left(a^{3} r^{2} + 3 \\, a r^{4} + {\\left(a^{5} - a^{3} r^{2}\\right)} y^{4} - {\\left(a^{5} + 3 \\, a r^{4}\\right)} y^{2}\\right)} \\sqrt{a^{2} y^{2} + r^{2}}}{{\\left(a^{4} y^{4} + 2 \\, a^{2} r^{2} y^{2} + r^{4}\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}} \\right) \\mathrm{d} r\\otimes \\mathrm{d} {\\phi} + \\left( -\\frac{2 \\, {\\left(a^{3} r y^{3} - a^{3} r y\\right)} \\sqrt{a^{2} y^{2} + r^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}}{{\\left(a^{4} y^{4} + 2 \\, a^{2} r^{2} y^{2} + r^{4}\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}}} \\right) \\mathrm{d} y\\otimes \\mathrm{d} {\\phi} + \\left( \\frac{{\\left(a^{3} r^{2} + 3 \\, a r^{4} + {\\left(a^{5} - a^{3} r^{2}\\right)} y^{4} - {\\left(a^{5} + 3 \\, a r^{4}\\right)} y^{2}\\right)} \\sqrt{a^{2} y^{2} + r^{2}}}{{\\left(a^{4} y^{4} + 2 \\, a^{2} r^{2} y^{2} + r^{4}\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} r + \\left( -\\frac{2 \\, {\\left(a^{3} r y^{3} - a^{3} r y\\right)} \\sqrt{a^{2} y^{2} + r^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}}{{\\left(a^{4} y^{4} + 2 \\, a^{2} r^{2} y^{2} + r^{4}\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} y$</div>","done":false}︡{"done":true}
︠cfd200d2-8e32-4c1f-95c5-28ef2dbf738bi︠
%html
<p>The type-(1,1) tensor $K^\sharp$ of components $K^i_{\ \, j} = \gamma^{ik} K_{kj}$:</p>

︡183e3e12-a7be-4e58-95d0-f8becbc6e553︡︡{"done":true,"html":"<p>The type-(1,1) tensor $K^\\sharp$ of components $K^i_{\\ \\, j} = \\gamma^{ik} K_{kj}$:</p>"}
︠44828d1b-02b6-4080-9747-3d2ef77ed483︠
Ku = K.up(gam, 0)
print Ku ; Ku.display()
︡7a09197a-d8c7-4745-969d-ba250af80870︡︡{"stdout":"tensor field of type (1,1) on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\left( \\frac{{\\left(a^{3} r^{2} + 3 \\, a r^{4} + {\\left(a^{5} - a^{3} r^{2}\\right)} y^{4} - {\\left(a^{5} + 3 \\, a r^{4}\\right)} y^{2}\\right)} \\sqrt{a^{2} + r^{2} - 2 \\, r}}{{\\left(a^{4} y^{4} + 2 \\, a^{2} r^{2} y^{2} + r^{4}\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} \\sqrt{a^{2} y^{2} + r^{2}}} \\right) \\frac{\\partial}{\\partial r }\\otimes \\mathrm{d} {\\phi} + \\left( \\frac{2 \\, {\\left(a^{3} r y^{5} - 2 \\, a^{3} r y^{3} + a^{3} r y\\right)} \\sqrt{a^{2} + r^{2} - 2 \\, r}}{{\\left(a^{4} y^{4} + 2 \\, a^{2} r^{2} y^{2} + r^{4}\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} \\sqrt{a^{2} y^{2} + r^{2}}} \\right) \\frac{\\partial}{\\partial y }\\otimes \\mathrm{d} {\\phi} + \\left( \\frac{{\\left(a^{3} r^{2} + 3 \\, a r^{4} - {\\left(a^{5} - a^{3} r^{2}\\right)} y^{2}\\right)} \\sqrt{a^{2} y^{2} + r^{2}}}{{\\left(a^{2} r^{4} + r^{6} + 2 \\, a^{2} r^{3} + {\\left(a^{6} + a^{4} r^{2} - 2 \\, a^{4} r\\right)} y^{4} + 2 \\, {\\left(a^{4} r^{2} + a^{2} r^{4} + a^{4} r - a^{2} r^{3}\\right)} y^{2}\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}} \\right) \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} r + \\left( \\frac{2 \\, \\sqrt{a^{2} y^{2} + r^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r} a^{3} r y}{{\\left(a^{2} r^{4} + r^{6} + 2 \\, a^{2} r^{3} + {\\left(a^{6} + a^{4} r^{2} - 2 \\, a^{4} r\\right)} y^{4} + 2 \\, {\\left(a^{4} r^{2} + a^{2} r^{4} + a^{4} r - a^{2} r^{3}\\right)} y^{2}\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}}} \\right) \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} y$</div>","done":false}︡{"done":true}
︠c10826b1-09e7-4254-9c6b-90c0d07d9b32i︠
%html
<p>We may check that the hypersurface $\Sigma$ is maximal, i.e. that $K^k_{\ \, k} = 0$:</p>

︡28207a9b-cd72-41f6-9cef-c475379408ba︡︡{"done":true,"html":"<p>We may check that the hypersurface $\\Sigma$ is maximal, i.e. that $K^k_{\\ \\, k} = 0$:</p>"}
︠bd95a8e2-e21e-484b-b298-081b8d40742b︠
trK = Ku.trace()
print trK
︡d7447008-4320-4e7a-bce3-fcdd28d6cac4︡︡{"stdout":"scalar field on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}
︠4b08e359-493c-43d2-a467-b59e192944c3i︠
%html
<h3>Connection and curvature</h3>
<p>Let us call $D$ the Levi-Civita connection associated with $\gamma$: </p>

︡74a83070-17e9-4b88-a5dd-3ab646782b06︡︡{"done":true,"html":"<h3>Connection and curvature</h3>\n<p>Let us call $D$ the Levi-Civita connection associated with $\\gamma$: </p>"}
︠17c01af5-baf1-4c3f-a6ba-42d7b96d2d3a︠
D = gam.connection(name='D')
print D ; D
︡ceaf0cd7-2e3e-4912-8db3-36dca925a4b6︡{"stdout":"Levi-Civita connection 'D' associated with the Riemannian metric 'gam' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$D$</div>","done":false}︡{"done":true}︡
︠3209d9bf-f2e1-432e-ba96-c65cb856bc33i︠
%html
<p>The Ricci tensor associated with $\gamma$:</p>

︡5a8b0d18-6726-4182-a4d2-2191a6526e71︡︡{"done":true,"html":"<p>The Ricci tensor associated with $\\gamma$:</p>"}
︠a205a502-c18a-4635-a1aa-0e8f85d0b45b︠
Ric = gam.ricci()
print Ric ; Ric
︡a2026930-abeb-43c9-96c2-6c3955eac99c︡︡{"stdout":"field of symmetric bilinear forms 'Ric(gam)' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\mathrm{Ric}\\left(\\gamma\\right)$</div>","done":false}︡{"done":true}
︠f9521859-57ed-47f3-b92f-a896100b703f︠
Ric[1,1]
︡5c09301f-9d00-4400-bced-5fb9cece1307︡︡{"html":"<div>$-\\frac{8 \\, a^{4} r^{7} + 7 \\, a^{2} r^{9} + 2 \\, r^{11} + 5 \\, a^{6} r^{4} + 2 \\, a^{4} r^{6} - 7 \\, a^{2} r^{8} + {\\left(3 \\, a^{10} r + 3 \\, a^{6} r^{5} + a^{10} - 14 \\, a^{8} r^{2} - 11 \\, a^{6} r^{4} + 6 \\, {\\left(a^{8} + 2 \\, a^{6}\\right)} r^{3}\\right)} y^{6} + {\\left(3 \\, a^{6} - 4 \\, a^{4}\\right)} r^{5} - {\\left(9 \\, a^{10} r + 4 \\, a^{4} r^{7} + a^{10} - 30 \\, a^{8} r^{2} - 35 \\, a^{6} r^{4} - 16 \\, a^{4} r^{6} + {\\left(17 \\, a^{6} + 4 \\, a^{4}\\right)} r^{5} + 2 \\, {\\left(11 \\, a^{8} + 12 \\, a^{6}\\right)} r^{3}\\right)} y^{4} - {\\left(16 \\, a^{4} r^{7} + 5 \\, a^{2} r^{9} + 16 \\, a^{8} r^{2} + 29 \\, a^{6} r^{4} + 18 \\, a^{4} r^{6} - 7 \\, a^{2} r^{8} + {\\left(17 \\, a^{6} - 8 \\, a^{4}\\right)} r^{5} + 6 \\, {\\left(a^{8} - 2 \\, a^{6}\\right)} r^{3}\\right)} y^{2}}{3 \\, a^{2} r^{12} + r^{14} + 6 \\, a^{4} r^{9} - 2 \\, r^{13} + 4 \\, a^{6} r^{6} + {\\left(3 \\, a^{4} - 8 \\, a^{2}\\right)} r^{10} + {\\left(a^{6} - 4 \\, a^{4}\\right)} r^{8} + {\\left(a^{14} + a^{8} r^{6} - 6 \\, a^{12} r - 6 \\, a^{8} r^{5} + 3 \\, {\\left(a^{10} + 4 \\, a^{8}\\right)} r^{4} - 4 \\, {\\left(3 \\, a^{10} + 2 \\, a^{8}\\right)} r^{3} + 3 \\, {\\left(a^{12} + 4 \\, a^{10}\\right)} r^{2}\\right)} y^{8} + 4 \\, {\\left(a^{6} - 2 \\, a^{4}\\right)} r^{7} + 4 \\, {\\left(a^{6} r^{8} + a^{12} r - 5 \\, a^{6} r^{7} + {\\left(3 \\, a^{8} + 8 \\, a^{6}\\right)} r^{6} - {\\left(9 \\, a^{8} + 4 \\, a^{6}\\right)} r^{5} + {\\left(3 \\, a^{10} + 4 \\, a^{8}\\right)} r^{4} - {\\left(3 \\, a^{10} - 4 \\, a^{8}\\right)} r^{3} + {\\left(a^{12} - 4 \\, a^{10}\\right)} r^{2}\\right)} y^{6} + 2 \\, {\\left(3 \\, a^{4} r^{10} - 12 \\, a^{4} r^{9} + 2 \\, a^{10} r^{2} + 16 \\, a^{6} r^{5} + {\\left(9 \\, a^{6} + 14 \\, a^{4}\\right)} r^{8} - 2 \\, {\\left(9 \\, a^{6} + 2 \\, a^{4}\\right)} r^{7} + 3 \\, {\\left(3 \\, a^{8} - 2 \\, a^{6}\\right)} r^{6} + 3 \\, {\\left(a^{10} - 6 \\, a^{8}\\right)} r^{4} + 2 \\, {\\left(3 \\, a^{10} - 2 \\, a^{8}\\right)} r^{3}\\right)} y^{4} + 4 \\, {\\left(a^{2} r^{12} - 3 \\, a^{4} r^{9} - 3 \\, a^{2} r^{11} + 2 \\, a^{8} r^{4} + {\\left(3 \\, a^{4} + 2 \\, a^{2}\\right)} r^{10} + 3 \\, {\\left(a^{6} - 2 \\, a^{4}\\right)} r^{8} + {\\left(3 \\, a^{6} + 4 \\, a^{4}\\right)} r^{7} + {\\left(a^{8} - 6 \\, a^{6}\\right)} r^{6} + {\\left(3 \\, a^{8} - 4 \\, a^{6}\\right)} r^{5}\\right)} y^{2}}$</div>","done":false}︡{"done":true}
︠d7b771da-b75b-41a0-92d9-98c9204072cf︠
Ric[1,2]
︡f675277b-86bc-4729-aecd-340179780b76︡︡{"html":"<div>$\\frac{{\\left(3 \\, a^{10} + 6 \\, a^{8} r^{2} + 3 \\, a^{6} r^{4} - 4 \\, a^{8} r - 8 \\, a^{6} r^{3}\\right)} y^{5} - 2 \\, {\\left(3 \\, a^{8} r^{2} + 6 \\, a^{6} r^{4} + 3 \\, a^{4} r^{6} - 2 \\, a^{8} r - 12 \\, a^{6} r^{3} - 6 \\, a^{4} r^{5}\\right)} y^{3} - {\\left(9 \\, a^{6} r^{4} + 18 \\, a^{4} r^{6} + 9 \\, a^{2} r^{8} + 16 \\, a^{6} r^{3} + 12 \\, a^{4} r^{5}\\right)} y}{a^{4} r^{8} + 2 \\, a^{2} r^{10} + r^{12} + 4 \\, a^{4} r^{7} + 4 \\, a^{2} r^{9} + 4 \\, a^{4} r^{6} + {\\left(a^{12} + a^{8} r^{4} - 4 \\, a^{10} r - 4 \\, a^{8} r^{3} + 2 \\, {\\left(a^{10} + 2 \\, a^{8}\\right)} r^{2}\\right)} y^{8} + 4 \\, {\\left(a^{6} r^{6} + a^{10} r - 2 \\, a^{8} r^{3} - 3 \\, a^{6} r^{5} + 2 \\, {\\left(a^{8} + a^{6}\\right)} r^{4} + {\\left(a^{10} - 2 \\, a^{8}\\right)} r^{2}\\right)} y^{6} + 2 \\, {\\left(3 \\, a^{4} r^{8} + 6 \\, a^{8} r^{3} - 6 \\, a^{4} r^{7} + 2 \\, a^{8} r^{2} + 2 \\, {\\left(3 \\, a^{6} + a^{4}\\right)} r^{6} + {\\left(3 \\, a^{8} - 8 \\, a^{6}\\right)} r^{4}\\right)} y^{4} + 4 \\, {\\left(2 \\, a^{4} r^{8} + a^{2} r^{10} + 3 \\, a^{6} r^{5} + 2 \\, a^{4} r^{7} - a^{2} r^{9} + 2 \\, a^{6} r^{4} + {\\left(a^{6} - 2 \\, a^{4}\\right)} r^{6}\\right)} y^{2}}$</div>","done":false}︡{"done":true}
︠e10efefb-82f1-48cf-a89e-dc572f73ff43︠
Ric[1,3]
︡38d9e79e-4b23-4318-823b-a758ad3bd964︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠539bbd69-d85b-4010-9b58-fad85522e1db︠
Ric[2,2]
︡e249fe63-8852-4206-94bf-eed5461e6041︡︡{"html":"<div>$\\frac{7 \\, a^{4} r^{7} + 5 \\, a^{2} r^{9} + r^{11} + 6 \\, a^{6} r^{4} + 4 \\, a^{4} r^{6} - 2 \\, a^{2} r^{8} + 2 \\, {\\left(3 \\, a^{10} r + 3 \\, a^{6} r^{5} - 10 \\, a^{8} r^{2} - 10 \\, a^{6} r^{4} + 2 \\, {\\left(3 \\, a^{8} + 4 \\, a^{6}\\right)} r^{3}\\right)} y^{6} + {\\left(3 \\, a^{6} - 8 \\, a^{4}\\right)} r^{5} - {\\left(9 \\, a^{10} r - a^{4} r^{7} - 34 \\, a^{8} r^{2} - 36 \\, a^{6} r^{4} - 2 \\, a^{4} r^{6} + {\\left(7 \\, a^{6} + 8 \\, a^{4}\\right)} r^{5} + {\\left(17 \\, a^{8} + 32 \\, a^{6}\\right)} r^{3}\\right)} y^{4} - 2 \\, {\\left(7 \\, a^{4} r^{7} + 2 \\, a^{2} r^{9} + 7 \\, a^{8} r^{2} + 11 \\, a^{6} r^{4} + 3 \\, a^{4} r^{6} - a^{2} r^{8} + 8 \\, {\\left(a^{6} - a^{4}\\right)} r^{5} + {\\left(3 \\, a^{8} - 8 \\, a^{6}\\right)} r^{3}\\right)} y^{2}}{a^{4} r^{8} + 2 \\, a^{2} r^{10} + r^{12} + 4 \\, a^{4} r^{7} + 4 \\, a^{2} r^{9} - {\\left(a^{12} + a^{8} r^{4} - 4 \\, a^{10} r - 4 \\, a^{8} r^{3} + 2 \\, {\\left(a^{10} + 2 \\, a^{8}\\right)} r^{2}\\right)} y^{10} + 4 \\, a^{4} r^{6} + {\\left(a^{12} - 4 \\, a^{6} r^{6} - 8 \\, a^{10} r + 4 \\, a^{8} r^{3} + 12 \\, a^{6} r^{5} - {\\left(7 \\, a^{8} + 8 \\, a^{6}\\right)} r^{4} - 2 \\, {\\left(a^{10} - 6 \\, a^{8}\\right)} r^{2}\\right)} y^{8} - 2 \\, {\\left(3 \\, a^{4} r^{8} - 2 \\, a^{10} r + 10 \\, a^{8} r^{3} + 6 \\, a^{6} r^{5} - 6 \\, a^{4} r^{7} + 2 \\, {\\left(2 \\, a^{6} + a^{4}\\right)} r^{6} - {\\left(a^{8} + 12 \\, a^{6}\\right)} r^{4} - 2 \\, {\\left(a^{10} - 3 \\, a^{8}\\right)} r^{2}\\right)} y^{6} - 2 \\, {\\left(a^{4} r^{8} + 2 \\, a^{2} r^{10} - 6 \\, a^{8} r^{3} + 6 \\, a^{6} r^{5} + 10 \\, a^{4} r^{7} - 2 \\, a^{2} r^{9} - 2 \\, a^{8} r^{2} - 2 \\, {\\left(2 \\, a^{6} + 3 \\, a^{4}\\right)} r^{6} - 3 \\, {\\left(a^{8} - 4 \\, a^{6}\\right)} r^{4}\\right)} y^{4} + {\\left(7 \\, a^{4} r^{8} + 2 \\, a^{2} r^{10} - r^{12} + 12 \\, a^{6} r^{5} + 4 \\, a^{4} r^{7} - 8 \\, a^{2} r^{9} + 8 \\, a^{6} r^{4} + 4 \\, {\\left(a^{6} - 3 \\, a^{4}\\right)} r^{6}\\right)} y^{2}}$</div>","done":false}︡{"done":true}
︠37983451-81db-4d51-8cd8-63250fe23b65︠
Ric[2,3]
︡5e342b94-2a7d-4bf2-9614-42de744ba680︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠bd09f7ab-5b22-4f2f-ae35-ed655a0d5125︠
Ric[3,3]
︡7e8510b3-88a0-4be3-96e7-8a29c983e597︡︡{"html":"<div>$\\frac{a^{4} r^{7} + 2 \\, a^{2} r^{9} + r^{11} + a^{6} r^{4} + 10 \\, a^{4} r^{6} + 13 \\, a^{2} r^{8} + 4 \\, a^{4} r^{5} + {\\left(3 \\, a^{10} r + 3 \\, a^{6} r^{5} + a^{10} - 18 \\, a^{8} r^{2} - 15 \\, a^{6} r^{4} + 2 \\, {\\left(3 \\, a^{8} + 10 \\, a^{6}\\right)} r^{3}\\right)} y^{8} - {\\left(3 \\, a^{10} r - 5 \\, a^{4} r^{7} + 2 \\, a^{10} - 38 \\, a^{8} r^{2} - 22 \\, a^{6} r^{4} + 2 \\, a^{4} r^{6} - {\\left(7 \\, a^{6} - 4 \\, a^{4}\\right)} r^{5} + {\\left(a^{8} + 60 \\, a^{6}\\right)} r^{3}\\right)} y^{6} - {\\left(3 \\, a^{4} r^{7} - a^{2} r^{9} - a^{10} + 22 \\, a^{8} r^{2} - 2 \\, a^{6} r^{4} - 14 \\, a^{4} r^{6} - 13 \\, a^{2} r^{8} + 3 \\, {\\left(3 \\, a^{6} - 4 \\, a^{4}\\right)} r^{5} + 5 \\, {\\left(a^{8} - 12 \\, a^{6}\\right)} r^{3}\\right)} y^{4} - {\\left(3 \\, a^{4} r^{7} + 3 \\, a^{2} r^{9} + r^{11} - 2 \\, a^{8} r^{2} + 10 \\, a^{6} r^{4} + 22 \\, a^{4} r^{6} + 26 \\, a^{2} r^{8} + 20 \\, a^{6} r^{3} + {\\left(a^{6} + 12 \\, a^{4}\\right)} r^{5}\\right)} y^{2}}{a^{2} r^{10} + r^{12} + 2 \\, a^{2} r^{9} + {\\left(a^{12} + a^{10} r^{2} - 2 \\, a^{10} r\\right)} y^{10} + {\\left(5 \\, a^{10} r^{2} + 5 \\, a^{8} r^{4} + 2 \\, a^{10} r - 8 \\, a^{8} r^{3}\\right)} y^{8} + 2 \\, {\\left(5 \\, a^{8} r^{4} + 5 \\, a^{6} r^{6} + 4 \\, a^{8} r^{3} - 6 \\, a^{6} r^{5}\\right)} y^{6} + 2 \\, {\\left(5 \\, a^{6} r^{6} + 5 \\, a^{4} r^{8} + 6 \\, a^{6} r^{5} - 4 \\, a^{4} r^{7}\\right)} y^{4} + {\\left(5 \\, a^{4} r^{8} + 5 \\, a^{2} r^{10} + 8 \\, a^{4} r^{7} - 2 \\, a^{2} r^{9}\\right)} y^{2}}$</div>","done":false}︡{"done":true}
︠80e648fb-484a-4dac-914a-d2e503a4a4d7i︠
%html
<p>The scalar curvature $R = \gamma^{ij} R_{ij}$:</p>

︡dc885a3a-c649-474a-b5ed-df46d7e58617︡︡{"done":true,"html":"<p>The scalar curvature $R = \\gamma^{ij} R_{ij}$:</p>"}
︠0908eb54-4192-46aa-9ff3-3b2de11d182e︠
R = gam.ricci_scalar(name='R')
print R
R.display()
︡1eacfe1c-9f93-4e4a-b259-715ef6cfbdee︡︡{"stdout":"scalar field 'R' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} \\mathrm{r}\\left(\\gamma\\right):&amp; \\Sigma &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(r, y, {\\phi}\\right) &amp; \\longmapsto &amp; \\frac{2 \\, {\\left(a^{6} r^{4} + 6 \\, a^{4} r^{6} + 9 \\, a^{2} r^{8} - {\\left(a^{10} - 6 \\, a^{8} r^{2} - 3 \\, a^{6} r^{4} + 8 \\, a^{6} r^{3}\\right)} y^{6} + {\\left(a^{10} - 8 \\, a^{8} r^{2} - 3 \\, a^{6} r^{4} - 6 \\, a^{4} r^{6} + 16 \\, a^{6} r^{3}\\right)} y^{4} + {\\left(2 \\, a^{8} r^{2} - a^{6} r^{4} - 9 \\, a^{2} r^{8} - 8 \\, a^{6} r^{3}\\right)} y^{2}\\right)}}{a^{4} r^{10} + 2 \\, a^{2} r^{12} + r^{14} + 4 \\, a^{4} r^{9} + 4 \\, a^{2} r^{11} + 4 \\, a^{4} r^{8} + {\\left(a^{14} + a^{10} r^{4} - 4 \\, a^{12} r - 4 \\, a^{10} r^{3} + 2 \\, {\\left(a^{12} + 2 \\, a^{10}\\right)} r^{2}\\right)} y^{10} + {\\left(5 \\, a^{8} r^{6} + 4 \\, a^{12} r - 12 \\, a^{10} r^{3} - 16 \\, a^{8} r^{5} + 2 \\, {\\left(5 \\, a^{10} + 6 \\, a^{8}\\right)} r^{4} + {\\left(5 \\, a^{12} - 8 \\, a^{10}\\right)} r^{2}\\right)} y^{8} + 2 \\, {\\left(5 \\, a^{6} r^{8} + 8 \\, a^{10} r^{3} - 4 \\, a^{8} r^{5} - 12 \\, a^{6} r^{7} + 2 \\, a^{10} r^{2} + 2 \\, {\\left(5 \\, a^{8} + 3 \\, a^{6}\\right)} r^{6} + {\\left(5 \\, a^{10} - 12 \\, a^{8}\\right)} r^{4}\\right)} y^{6} + 2 \\, {\\left(5 \\, a^{4} r^{10} + 12 \\, a^{8} r^{5} + 4 \\, a^{6} r^{7} - 8 \\, a^{4} r^{9} + 6 \\, a^{8} r^{4} + 2 \\, {\\left(5 \\, a^{6} + a^{4}\\right)} r^{8} + {\\left(5 \\, a^{8} - 12 \\, a^{6}\\right)} r^{6}\\right)} y^{4} + {\\left(10 \\, a^{4} r^{10} + 5 \\, a^{2} r^{12} + 16 \\, a^{6} r^{7} + 12 \\, a^{4} r^{9} - 4 \\, a^{2} r^{11} + 12 \\, a^{6} r^{6} + {\\left(5 \\, a^{6} - 8 \\, a^{4}\\right)} r^{8}\\right)} y^{2}} \\end{array}$</div>","done":false}︡{"done":true}
︠61fc0f10-8167-422f-bb80-4bc080e5be57i︠
%html
<h2>Test: 3+1 Einstein equations</h2>
<p>Let us check that the vacuum 3+1 Einstein equations are satisfied.</p>
<p>We start by the contraint equations:</p>
<h3>Hamiltonian constraint</h3>
<p>Let us first evaluate the term $K_{ij} K^{ij}$:</p>

︡9b489439-21c9-469f-bfdb-3e464e55523f︡︡{"done":true,"html":"<h2>Test: 3+1 Einstein equations</h2>\n<p>Let us check that the vacuum 3+1 Einstein equations are satisfied.</p>\n<p>We start by the contraint equations:</p>\n<h3>Hamiltonian constraint</h3>\n<p>Let us first evaluate the term $K_{ij} K^{ij}$:</p>"}
︠317d2fee-6809-4869-a824-4f839837318a︠
Kuu = Ku.up(gam, 1)
trKK = K['_ij']*Kuu['^ij']
print trKK ; trKK.display()
︡aeaabb18-8052-49b4-ac30-16be61ce7e34︡︡{"stdout":"scalar field on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} &amp; \\Sigma &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(r, y, {\\phi}\\right) &amp; \\longmapsto &amp; \\frac{2 \\, {\\left(a^{6} r^{4} + 6 \\, a^{4} r^{6} + 9 \\, a^{2} r^{8} - {\\left(a^{10} - 6 \\, a^{8} r^{2} - 3 \\, a^{6} r^{4} + 8 \\, a^{6} r^{3}\\right)} y^{6} + {\\left(a^{10} - 8 \\, a^{8} r^{2} - 3 \\, a^{6} r^{4} - 6 \\, a^{4} r^{6} + 16 \\, a^{6} r^{3}\\right)} y^{4} + {\\left(2 \\, a^{8} r^{2} - a^{6} r^{4} - 9 \\, a^{2} r^{8} - 8 \\, a^{6} r^{3}\\right)} y^{2}\\right)}}{a^{4} r^{10} + 2 \\, a^{2} r^{12} + r^{14} + 4 \\, a^{4} r^{9} + 4 \\, a^{2} r^{11} + 4 \\, a^{4} r^{8} + {\\left(a^{14} + a^{10} r^{4} - 4 \\, a^{12} r - 4 \\, a^{10} r^{3} + 2 \\, {\\left(a^{12} + 2 \\, a^{10}\\right)} r^{2}\\right)} y^{10} + {\\left(5 \\, a^{8} r^{6} + 4 \\, a^{12} r - 12 \\, a^{10} r^{3} - 16 \\, a^{8} r^{5} + 2 \\, {\\left(5 \\, a^{10} + 6 \\, a^{8}\\right)} r^{4} + {\\left(5 \\, a^{12} - 8 \\, a^{10}\\right)} r^{2}\\right)} y^{8} + 2 \\, {\\left(5 \\, a^{6} r^{8} + 8 \\, a^{10} r^{3} - 4 \\, a^{8} r^{5} - 12 \\, a^{6} r^{7} + 2 \\, a^{10} r^{2} + 2 \\, {\\left(5 \\, a^{8} + 3 \\, a^{6}\\right)} r^{6} + {\\left(5 \\, a^{10} - 12 \\, a^{8}\\right)} r^{4}\\right)} y^{6} + 2 \\, {\\left(5 \\, a^{4} r^{10} + 12 \\, a^{8} r^{5} + 4 \\, a^{6} r^{7} - 8 \\, a^{4} r^{9} + 6 \\, a^{8} r^{4} + 2 \\, {\\left(5 \\, a^{6} + a^{4}\\right)} r^{8} + {\\left(5 \\, a^{8} - 12 \\, a^{6}\\right)} r^{6}\\right)} y^{4} + {\\left(10 \\, a^{4} r^{10} + 5 \\, a^{2} r^{12} + 16 \\, a^{6} r^{7} + 12 \\, a^{4} r^{9} - 4 \\, a^{2} r^{11} + 12 \\, a^{6} r^{6} + {\\left(5 \\, a^{6} - 8 \\, a^{4}\\right)} r^{8}\\right)} y^{2}} \\end{array}$</div>","done":false}︡{"done":true}
︠ad1676c9-380a-4cae-a544-7c1c1167dc68i︠
%html
<p>The vacuum Hamiltonian constraint equation is \[R + K^2 -K_{ij} K^{ij} = 0 \]</p>

︡0beba772-0a1c-4855-8118-1d4b666210f2︡︡{"done":true,"html":"<p>The vacuum Hamiltonian constraint equation is \\[R + K^2 -K_{ij} K^{ij} = 0 \\]</p>"}
︠ba4db164-097e-44da-89f1-a868db7c5863︠
Ham = R + trK^2 - trKK
print Ham ; Ham.display()
︡efb42320-7299-4f60-9d69-375d816d89e6︡︡{"stdout":"scalar field 'zero' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} 0:&amp; \\Sigma &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(r, y, {\\phi}\\right) &amp; \\longmapsto &amp; 0 \\end{array}$</div>","done":false}︡{"done":true}
︠4ff7b00d-0321-4887-b80a-33142f2bfd1ei︠
%html
<h3>Momentum constraint</h3>
<p>In vaccum, the momentum constraint is \[ D_j K^j_{\ \, i} - D_i K = 0 \]</p>

︡8818cac0-2015-4627-9d33-e5007bf3a7d1︡︡{"done":true,"html":"<h3>Momentum constraint</h3>\n<p>In vaccum, the momentum constraint is \\[ D_j K^j_{\\ \\, i} - D_i K = 0 \\]</p>"}
︠81dad9b9-6e13-4e76-a639-0b6dab4cbab7︠
mom = D(Ku).trace(0,2) - D(trK)
print mom
mom.display()
︡09bc3eb8-a6b9-4af7-a1d1-685bbbf8f988︡︡{"stdout":"1-form on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠7e38221c-0a3f-4898-956d-891dcd08bd33i︠
%html
<h3>Dynamical Einstein equations</h3>
<p>Let us first evaluate the symmetric bilinear form $k_{ij} := K_{ik} K^k_{\ \, j}$:</p>

︡1c522140-7406-42c6-80e3-ad3dc88457ba︡︡{"done":true,"html":"<h3>Dynamical Einstein equations</h3>\n<p>Let us first evaluate the symmetric bilinear form $k_{ij} := K_{ik} K^k_{\\ \\, j}$:</p>"}
︠8872f232-4bdc-44cd-b89f-a05da5f7493f︠
KK = K['_ik']*Ku['^k_j']
print KK
︡405d2451-102a-4c0b-8dd2-48245da37ec6︡︡{"stdout":"tensor field of type (0,2) on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}
︠69c70867-35d2-4c7c-afc2-bce658084b03︠
KK1 = KK.symmetrize()
KK == KK1
︡8b3e102d-6230-4469-a534-d3c1e7101e6f︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}︡
︠b304f5a5-f41c-463a-b553-3c67596eef3f︠
KK = KK1
print KK
︡5e113d0d-867c-449b-b3ae-47dcf6f60630︡{"stdout":"field of symmetric bilinear forms on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠a7d97cc3-ade2-40f9-8232-17f5f49094ef︠
KK[1,1]
︡038cda65-946e-4232-a447-48fdce9df025︡{"html":"<div>$\\frac{a^{6} r^{4} + 6 \\, a^{4} r^{6} + 9 \\, a^{2} r^{8} - {\\left(a^{10} - 2 \\, a^{8} r^{2} + a^{6} r^{4}\\right)} y^{6} + {\\left(a^{10} + 5 \\, a^{6} r^{4} - 6 \\, a^{4} r^{6}\\right)} y^{4} - {\\left(2 \\, a^{8} r^{2} + 5 \\, a^{6} r^{4} + 9 \\, a^{2} r^{8}\\right)} y^{2}}{3 \\, a^{2} r^{12} + r^{14} + 6 \\, a^{4} r^{9} - 2 \\, r^{13} + 4 \\, a^{6} r^{6} + {\\left(3 \\, a^{4} - 8 \\, a^{2}\\right)} r^{10} + {\\left(a^{6} - 4 \\, a^{4}\\right)} r^{8} + {\\left(a^{14} + a^{8} r^{6} - 6 \\, a^{12} r - 6 \\, a^{8} r^{5} + 3 \\, {\\left(a^{10} + 4 \\, a^{8}\\right)} r^{4} - 4 \\, {\\left(3 \\, a^{10} + 2 \\, a^{8}\\right)} r^{3} + 3 \\, {\\left(a^{12} + 4 \\, a^{10}\\right)} r^{2}\\right)} y^{8} + 4 \\, {\\left(a^{6} - 2 \\, a^{4}\\right)} r^{7} + 4 \\, {\\left(a^{6} r^{8} + a^{12} r - 5 \\, a^{6} r^{7} + {\\left(3 \\, a^{8} + 8 \\, a^{6}\\right)} r^{6} - {\\left(9 \\, a^{8} + 4 \\, a^{6}\\right)} r^{5} + {\\left(3 \\, a^{10} + 4 \\, a^{8}\\right)} r^{4} - {\\left(3 \\, a^{10} - 4 \\, a^{8}\\right)} r^{3} + {\\left(a^{12} - 4 \\, a^{10}\\right)} r^{2}\\right)} y^{6} + 2 \\, {\\left(3 \\, a^{4} r^{10} - 12 \\, a^{4} r^{9} + 2 \\, a^{10} r^{2} + 16 \\, a^{6} r^{5} + {\\left(9 \\, a^{6} + 14 \\, a^{4}\\right)} r^{8} - 2 \\, {\\left(9 \\, a^{6} + 2 \\, a^{4}\\right)} r^{7} + 3 \\, {\\left(3 \\, a^{8} - 2 \\, a^{6}\\right)} r^{6} + 3 \\, {\\left(a^{10} - 6 \\, a^{8}\\right)} r^{4} + 2 \\, {\\left(3 \\, a^{10} - 2 \\, a^{8}\\right)} r^{3}\\right)} y^{4} + 4 \\, {\\left(a^{2} r^{12} - 3 \\, a^{4} r^{9} - 3 \\, a^{2} r^{11} + 2 \\, a^{8} r^{4} + {\\left(3 \\, a^{4} + 2 \\, a^{2}\\right)} r^{10} + 3 \\, {\\left(a^{6} - 2 \\, a^{4}\\right)} r^{8} + {\\left(3 \\, a^{6} + 4 \\, a^{4}\\right)} r^{7} + {\\left(a^{8} - 6 \\, a^{6}\\right)} r^{6} + {\\left(3 \\, a^{8} - 4 \\, a^{6}\\right)} r^{5}\\right)} y^{2}}$</div>","done":false}︡{"done":true}︡
︠7a1fb838-f126-4837-a1d4-e9036a3d7298︠
KK[1,2]
︡124e1265-8f0b-48b2-bdb6-4c6b5290657e︡{"html":"<div>$\\frac{2 \\, {\\left({\\left(a^{8} r - a^{6} r^{3}\\right)} y^{5} - {\\left(a^{8} r + 3 \\, a^{4} r^{5}\\right)} y^{3} + {\\left(a^{6} r^{3} + 3 \\, a^{4} r^{5}\\right)} y\\right)}}{a^{4} r^{8} + 2 \\, a^{2} r^{10} + r^{12} + 4 \\, a^{4} r^{7} + 4 \\, a^{2} r^{9} + 4 \\, a^{4} r^{6} + {\\left(a^{12} + a^{8} r^{4} - 4 \\, a^{10} r - 4 \\, a^{8} r^{3} + 2 \\, {\\left(a^{10} + 2 \\, a^{8}\\right)} r^{2}\\right)} y^{8} + 4 \\, {\\left(a^{6} r^{6} + a^{10} r - 2 \\, a^{8} r^{3} - 3 \\, a^{6} r^{5} + 2 \\, {\\left(a^{8} + a^{6}\\right)} r^{4} + {\\left(a^{10} - 2 \\, a^{8}\\right)} r^{2}\\right)} y^{6} + 2 \\, {\\left(3 \\, a^{4} r^{8} + 6 \\, a^{8} r^{3} - 6 \\, a^{4} r^{7} + 2 \\, a^{8} r^{2} + 2 \\, {\\left(3 \\, a^{6} + a^{4}\\right)} r^{6} + {\\left(3 \\, a^{8} - 8 \\, a^{6}\\right)} r^{4}\\right)} y^{4} + 4 \\, {\\left(2 \\, a^{4} r^{8} + a^{2} r^{10} + 3 \\, a^{6} r^{5} + 2 \\, a^{4} r^{7} - a^{2} r^{9} + 2 \\, a^{6} r^{4} + {\\left(a^{6} - 2 \\, a^{4}\\right)} r^{6}\\right)} y^{2}}$</div>","done":false}︡{"done":true}︡
︠3f712f0b-3dac-4751-bc8d-04db2c459d7e︠
KK[1,3]
︡47c4dd80-0a90-4466-bb31-6e6fc9dad5d9︡{"html":"<div>$0$</div>","done":false}︡{"done":true}︡
︠40b58407-7b26-4a15-895c-b42af626085e︠
KK[2,2]
︡74c2f362-26cb-4dda-b3db-3bd4110a07ee︡{"html":"<div>$-\\frac{4 \\, {\\left({\\left(a^{8} r^{2} + a^{6} r^{4} - 2 \\, a^{6} r^{3}\\right)} y^{4} - {\\left(a^{8} r^{2} + a^{6} r^{4} - 2 \\, a^{6} r^{3}\\right)} y^{2}\\right)}}{a^{4} r^{8} + 2 \\, a^{2} r^{10} + r^{12} + 4 \\, a^{4} r^{7} + 4 \\, a^{2} r^{9} + 4 \\, a^{4} r^{6} + {\\left(a^{12} + a^{8} r^{4} - 4 \\, a^{10} r - 4 \\, a^{8} r^{3} + 2 \\, {\\left(a^{10} + 2 \\, a^{8}\\right)} r^{2}\\right)} y^{8} + 4 \\, {\\left(a^{6} r^{6} + a^{10} r - 2 \\, a^{8} r^{3} - 3 \\, a^{6} r^{5} + 2 \\, {\\left(a^{8} + a^{6}\\right)} r^{4} + {\\left(a^{10} - 2 \\, a^{8}\\right)} r^{2}\\right)} y^{6} + 2 \\, {\\left(3 \\, a^{4} r^{8} + 6 \\, a^{8} r^{3} - 6 \\, a^{4} r^{7} + 2 \\, a^{8} r^{2} + 2 \\, {\\left(3 \\, a^{6} + a^{4}\\right)} r^{6} + {\\left(3 \\, a^{8} - 8 \\, a^{6}\\right)} r^{4}\\right)} y^{4} + 4 \\, {\\left(2 \\, a^{4} r^{8} + a^{2} r^{10} + 3 \\, a^{6} r^{5} + 2 \\, a^{4} r^{7} - a^{2} r^{9} + 2 \\, a^{6} r^{4} + {\\left(a^{6} - 2 \\, a^{4}\\right)} r^{6}\\right)} y^{2}}$</div>","done":false}︡{"done":true}︡
︠5c493e09-b4ac-4376-8ce1-19a2c476c2ed︠
KK[2,3]
︡e4a543f7-f941-42bc-ac62-080a9ab4a27e︡{"html":"<div>$0$</div>","done":false}︡{"done":true}︡
︠fab9b616-5f14-4b40-a49b-19fc3c34334b︠
KK[3,3]
︡bddd69ef-8ccb-4c6e-b3bc-a858afb56233︡{"html":"<div>$\\frac{a^{6} r^{4} + 6 \\, a^{4} r^{6} + 9 \\, a^{2} r^{8} + {\\left(a^{10} - 6 \\, a^{8} r^{2} - 3 \\, a^{6} r^{4} + 8 \\, a^{6} r^{3}\\right)} y^{8} - 2 \\, {\\left(a^{10} - 7 \\, a^{8} r^{2} - 3 \\, a^{6} r^{4} - 3 \\, a^{4} r^{6} + 12 \\, a^{6} r^{3}\\right)} y^{6} + {\\left(a^{10} - 10 \\, a^{8} r^{2} - 2 \\, a^{6} r^{4} - 6 \\, a^{4} r^{6} + 9 \\, a^{2} r^{8} + 24 \\, a^{6} r^{3}\\right)} y^{4} + 2 \\, {\\left(a^{8} r^{2} - a^{6} r^{4} - 3 \\, a^{4} r^{6} - 9 \\, a^{2} r^{8} - 4 \\, a^{6} r^{3}\\right)} y^{2}}{a^{2} r^{10} + r^{12} + 2 \\, a^{2} r^{9} + {\\left(a^{12} + a^{10} r^{2} - 2 \\, a^{10} r\\right)} y^{10} + {\\left(5 \\, a^{10} r^{2} + 5 \\, a^{8} r^{4} + 2 \\, a^{10} r - 8 \\, a^{8} r^{3}\\right)} y^{8} + 2 \\, {\\left(5 \\, a^{8} r^{4} + 5 \\, a^{6} r^{6} + 4 \\, a^{8} r^{3} - 6 \\, a^{6} r^{5}\\right)} y^{6} + 2 \\, {\\left(5 \\, a^{6} r^{6} + 5 \\, a^{4} r^{8} + 6 \\, a^{6} r^{5} - 4 \\, a^{4} r^{7}\\right)} y^{4} + {\\left(5 \\, a^{4} r^{8} + 5 \\, a^{2} r^{10} + 8 \\, a^{4} r^{7} - 2 \\, a^{2} r^{9}\\right)} y^{2}}$</div>","done":false}︡{"done":true}︡
︠ee2db939-20a9-4463-bd03-64db501bb5cci︠
%html
<p>In vacuum and for stationary spacetimes, the dynamical Einstein equations are \[ \mathcal{L}_\beta K_{ij} - D_i D_j N + N \left( R_{ij} + K K_{ij} - 2 K_{ik} K^k_{\ \, j}\right) = 0 \]</p>

︡6a07ec3a-47bc-4610-afa8-76bbfc7b0d9a︡︡{"done":true,"html":"<p>In vacuum and for stationary spacetimes, the dynamical Einstein equations are \\[ \\mathcal{L}_\\beta K_{ij} - D_i D_j N + N \\left( R_{ij} + K K_{ij} - 2 K_{ik} K^k_{\\ \\, j}\\right) = 0 \\]</p>"}
︠17fc9998-3d4b-4d7b-a9a4-98e2ee26623d︠
dyn = K.lie_der(b) - D(D(N)) + N*( Ric + trK*K - 2*KK )
print dyn
dyn.display()
︡f65ab329-507f-41c3-87f5-99beac7fd870︡︡{"stdout":"tensor field of type (0,2) on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠3ff63e3c-d8da-45ff-a26e-fb86ef4ba8b4i︠
%html
<p>Hence, we have checked that all the vacuum 3+1 Einstein equations are fulfilled.</p>

<h2>Electric and magnetic parts of the Weyl tensor</h2>
<p>The electric part is the bilinear form $E$ given by \[ E_{ij} = R_{ij} + K K_{ij} - K_{ik} K^k_{\ \, j} \]</p>

︡ac7706b3-2c17-47a5-9166-a6121cc294d5︡︡{"done":true,"html":"<p>Hence, we have checked that all the vacuum 3+1 Einstein equations are fulfilled.</p>\n\n<h2>Electric and magnetic parts of the Weyl tensor</h2>\n<p>The electric part is the bilinear form $E$ given by \\[ E_{ij} = R_{ij} + K K_{ij} - K_{ik} K^k_{\\ \\, j} \\]</p>"}
︠cf814373-8a19-403e-91b0-4444001e9a2f︠
E = Ric + trK*K - KK
print E
︡e3592b51-0fea-4559-b74c-abd9a558de3e︡︡{"stdout":"field of symmetric bilinear forms on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}
︠05a19d28-b080-45c3-9dd9-8ea29328fd5d︠
E[1,1]
︡9d627dd5-1b08-4c9d-ab64-770c63085c34︡︡{"html":"<div>$-\\frac{3 \\, a^{4} r^{3} + 5 \\, a^{2} r^{5} + 2 \\, r^{7} - 2 \\, a^{2} r^{4} + 3 \\, {\\left(a^{6} r + a^{4} r^{3} - 2 \\, a^{4} r^{2}\\right)} y^{4} - {\\left(9 \\, a^{6} r + 16 \\, a^{4} r^{3} + 7 \\, a^{2} r^{5} - 6 \\, a^{4} r^{2} - 2 \\, a^{2} r^{4}\\right)} y^{2}}{2 \\, a^{2} r^{8} + r^{10} + 2 \\, a^{4} r^{5} - 2 \\, r^{9} + {\\left(a^{4} - 4 \\, a^{2}\\right)} r^{6} + {\\left(a^{10} + a^{6} r^{4} - 4 \\, a^{8} r - 4 \\, a^{6} r^{3} + 2 \\, {\\left(a^{8} + 2 \\, a^{6}\\right)} r^{2}\\right)} y^{6} + {\\left(3 \\, a^{4} r^{6} + 2 \\, a^{8} r - 8 \\, a^{6} r^{3} - 10 \\, a^{4} r^{5} + 2 \\, {\\left(3 \\, a^{6} + 4 \\, a^{4}\\right)} r^{4} + {\\left(3 \\, a^{8} - 4 \\, a^{6}\\right)} r^{2}\\right)} y^{4} + {\\left(3 \\, a^{2} r^{8} + 4 \\, a^{6} r^{3} - 4 \\, a^{4} r^{5} - 8 \\, a^{2} r^{7} + 2 \\, {\\left(3 \\, a^{4} + 2 \\, a^{2}\\right)} r^{6} + {\\left(3 \\, a^{6} - 8 \\, a^{4}\\right)} r^{4}\\right)} y^{2}}$</div>","done":false}︡{"done":true}
︠07d79df2-25ef-4535-b709-30fd9496bcd3︠
E[1,1].factor()
︡21fad2bf-ae21-4478-a134-dbf0e99043fc︡︡{"html":"<div>$-\\frac{{\\left(a^{4} y^{2} + a^{2} r^{2} y^{2} - 2 \\, a^{2} r y^{2} - 3 \\, a^{4} - 5 \\, a^{2} r^{2} - 2 \\, r^{4} + 2 \\, a^{2} r\\right)} {\\left(3 \\, a^{2} y^{2} - r^{2}\\right)} r}{{\\left(a^{4} y^{2} + a^{2} r^{2} y^{2} - 2 \\, a^{2} r y^{2} + a^{2} r^{2} + r^{4} + 2 \\, a^{2} r\\right)} {\\left(a^{2} y^{2} + r^{2}\\right)}^{2} {\\left(a^{2} + r^{2} - 2 \\, r\\right)}}$</div>","done":false}︡{"done":true}
︠54032e8f-63ee-4e4a-aa22-a428f50e8414︠
E[1,2]
︡ba3aeef0-b230-4f99-b5fa-ae8abed0342d︡︡{"html":"<div>$\\frac{3 \\, {\\left({\\left(a^{6} + a^{4} r^{2}\\right)} y^{3} - 3 \\, {\\left(a^{4} r^{2} + a^{2} r^{4}\\right)} y\\right)}}{a^{2} r^{6} + r^{8} + 2 \\, a^{2} r^{5} + {\\left(a^{8} + a^{6} r^{2} - 2 \\, a^{6} r\\right)} y^{6} + {\\left(3 \\, a^{6} r^{2} + 3 \\, a^{4} r^{4} + 2 \\, a^{6} r - 4 \\, a^{4} r^{3}\\right)} y^{4} + {\\left(3 \\, a^{4} r^{4} + 3 \\, a^{2} r^{6} + 4 \\, a^{4} r^{3} - 2 \\, a^{2} r^{5}\\right)} y^{2}}$</div>","done":false}︡{"done":true}
︠5ef1d8bc-1672-41da-8b57-c9e56540cd38︠
E[1,2].factor()
︡b5c93c54-1dce-460c-880b-7d3a028dc777︡︡{"html":"<div>$\\frac{3 \\, {\\left(a^{2} y^{2} - 3 \\, r^{2}\\right)} {\\left(a^{2} + r^{2}\\right)} a^{2} y}{{\\left(a^{4} y^{2} + a^{2} r^{2} y^{2} - 2 \\, a^{2} r y^{2} + a^{2} r^{2} + r^{4} + 2 \\, a^{2} r\\right)} {\\left(a^{2} y^{2} + r^{2}\\right)}^{2}}$</div>","done":false}︡{"done":true}
︠8315a02d-d4e6-4c9c-b71f-dbe8cd649a08︠
E[1,3]
︡a0eb4bfa-d0c3-4441-8a74-458c6bfca7b1︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠716f096c-c111-4a9f-b4ae-d52aeb6447a0︠
E[2,2]
︡4759b1c4-5c04-434e-9db2-054bbb8c5760︡︡{"html":"<div>$-\\frac{3 \\, a^{4} r^{3} + 4 \\, a^{2} r^{5} + r^{7} - 4 \\, a^{2} r^{4} + 6 \\, {\\left(a^{6} r + a^{4} r^{3} - 2 \\, a^{4} r^{2}\\right)} y^{4} - {\\left(9 \\, a^{6} r + 14 \\, a^{4} r^{3} + 5 \\, a^{2} r^{5} - 12 \\, a^{4} r^{2} - 4 \\, a^{2} r^{4}\\right)} y^{2}}{{\\left(a^{8} + a^{6} r^{2} - 2 \\, a^{6} r\\right)} y^{8} - a^{2} r^{6} - r^{8} - 2 \\, a^{2} r^{5} - {\\left(a^{8} - 2 \\, a^{6} r^{2} - 3 \\, a^{4} r^{4} - 4 \\, a^{6} r + 4 \\, a^{4} r^{3}\\right)} y^{6} - {\\left(3 \\, a^{6} r^{2} - 3 \\, a^{2} r^{6} + 2 \\, a^{6} r - 8 \\, a^{4} r^{3} + 2 \\, a^{2} r^{5}\\right)} y^{4} - {\\left(3 \\, a^{4} r^{4} + 2 \\, a^{2} r^{6} - r^{8} + 4 \\, a^{4} r^{3} - 4 \\, a^{2} r^{5}\\right)} y^{2}}$</div>","done":false}︡{"done":true}
︠a2894889-74a5-42d9-908f-929074ddfb63︠
E[2,2].factor()
︡821d36db-1a21-4db5-8a91-c44c2ebc86b2︡︡{"html":"<div>$-\\frac{{\\left(2 \\, a^{4} y^{2} + 2 \\, a^{2} r^{2} y^{2} - 4 \\, a^{2} r y^{2} - 3 \\, a^{4} - 4 \\, a^{2} r^{2} - r^{4} + 4 \\, a^{2} r\\right)} {\\left(3 \\, a^{2} y^{2} - r^{2}\\right)} r}{{\\left(a^{4} y^{2} + a^{2} r^{2} y^{2} - 2 \\, a^{2} r y^{2} + a^{2} r^{2} + r^{4} + 2 \\, a^{2} r\\right)} {\\left(a^{2} y^{2} + r^{2}\\right)}^{2} {\\left(y + 1\\right)} {\\left(y - 1\\right)}}$</div>","done":false}︡{"done":true}
︠e579c42d-dd37-43ba-af25-fffdf340a5da︠
E[2,3]
︡6f364657-bab8-4970-a06b-d6762d98b050︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠132ce405-ea9d-49db-90f3-8027633e0853︠
E[3,3]
︡90f92853-7829-4296-9e65-aad1cbb3f9bd︡︡{"html":"<div>$\\frac{a^{2} r^{5} + r^{7} + 3 \\, {\\left(a^{6} r + a^{4} r^{3} - 2 \\, a^{4} r^{2}\\right)} y^{6} + 2 \\, a^{2} r^{4} - {\\left(3 \\, a^{6} r + a^{4} r^{3} - 2 \\, a^{2} r^{5} - 12 \\, a^{4} r^{2} - 2 \\, a^{2} r^{4}\\right)} y^{4} - {\\left(2 \\, a^{4} r^{3} + 3 \\, a^{2} r^{5} + r^{7} + 6 \\, a^{4} r^{2} + 4 \\, a^{2} r^{4}\\right)} y^{2}}{a^{8} y^{8} + 4 \\, a^{6} r^{2} y^{6} + 6 \\, a^{4} r^{4} y^{4} + 4 \\, a^{2} r^{6} y^{2} + r^{8}}$</div>","done":false}︡{"done":true}
︠30354fc1-40f5-48d0-b2cc-7441eaaae245︠
E[3,3].factor()
︡b64f0a4a-e90d-4325-9a12-52668d2a6d11︡︡{"html":"<div>$\\frac{{\\left(a^{4} y^{2} + a^{2} r^{2} y^{2} - 2 \\, a^{2} r y^{2} + a^{2} r^{2} + r^{4} + 2 \\, a^{2} r\\right)} {\\left(3 \\, a^{2} y^{2} - r^{2}\\right)} r {\\left(y + 1\\right)} {\\left(y - 1\\right)}}{{\\left(a^{2} y^{2} + r^{2}\\right)}^{4}}$</div>","done":false}︡{"done":true}
︠01df12ce-7e69-4da6-9fa1-3f7dc951dbc1i︠
%html
<p>The magnetic part is the bilinear form $B$ defined by \[ B_{ij} = \epsilon^k_{\ \, l i} D_k K^l_{\ \, j}, \]</p>
<p>where $\epsilon^k_{\ \, l i}$ are the components of the type-(1,2) tensor $\epsilon^\sharp$, related to the&nbsp;Levi-Civita alternating tensor $\epsilon$ associated with $\gamma$ by $\epsilon^k_{\ \, l i} = \gamma^{km} \epsilon_{m l i}$. In SageManifolds, $\epsilon$ is obtained by the command <span style="font-family: courier new,courier;">volume_form()</span> and $\epsilon^\sharp$ by the command <span style="font-family: courier new,courier;">volume_form(1)</span> (1 = 1 index raised):</p>

︡1f80d208-d412-4a2e-8692-19753259c598︡︡{"done":true,"html":"<p>The magnetic part is the bilinear form $B$ defined by \\[ B_{ij} = \\epsilon^k_{\\ \\, l i} D_k K^l_{\\ \\, j}, \\]</p>\n<p>where $\\epsilon^k_{\\ \\, l i}$ are the components of the type-(1,2) tensor $\\epsilon^\\sharp$, related to the&nbsp;Levi-Civita alternating tensor $\\epsilon$ associated with $\\gamma$ by $\\epsilon^k_{\\ \\, l i} = \\gamma^{km} \\epsilon_{m l i}$. In SageManifolds, $\\epsilon$ is obtained by the command <span style=\"font-family: courier new,courier;\">volume_form()</span> and $\\epsilon^\\sharp$ by the command <span style=\"font-family: courier new,courier;\">volume_form(1)</span> (1 = 1 index raised):</p>"}
︠674dfd51-b625-4e29-8371-2d651acdf078︠
eps = gam.volume_form() 
print eps ; eps.display()
︡01aefa02-cb61-49b4-9dd5-cfe41ec4e472︡︡{"stdout":"3-form 'eps_gam' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\epsilon_{\\gamma} = \\left( \\frac{\\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} \\sqrt{a^{2} y^{2} + r^{2}}}{\\sqrt{a^{2} + r^{2} - 2 \\, r}} \\right) \\mathrm{d} r\\wedge \\mathrm{d} y\\wedge \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠0695b835-2ef2-4e21-9fbe-a8580a3715a1︠
epsu = gam.volume_form(1)
print epsu ; epsu.display()
︡524188bd-778d-472d-b146-1f171340e1f5︡︡{"stdout":"tensor field of type (1,2) on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\left( \\frac{\\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}}{\\sqrt{a^{2} y^{2} + r^{2}}} \\right) \\frac{\\partial}{\\partial r }\\otimes \\mathrm{d} y\\otimes \\mathrm{d} {\\phi} + \\left( -\\frac{\\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}}{\\sqrt{a^{2} y^{2} + r^{2}}} \\right) \\frac{\\partial}{\\partial r }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} y + \\left( \\frac{\\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} {\\left(y^{2} - 1\\right)}}{\\sqrt{a^{2} y^{2} + r^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}} \\right) \\frac{\\partial}{\\partial y }\\otimes \\mathrm{d} r\\otimes \\mathrm{d} {\\phi} + \\left( -\\frac{\\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} {\\left(y^{2} - 1\\right)}}{\\sqrt{a^{2} y^{2} + r^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}} \\right) \\frac{\\partial}{\\partial y }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} r + \\left( -\\frac{\\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} {\\left(a^{2} y^{2} + r^{2}\\right)}^{\\frac{3}{2}}}{{\\left({\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{4} - a^{2} r^{2} - r^{4} - 2 \\, a^{2} r - {\\left(a^{4} - r^{4} - 4 \\, a^{2} r\\right)} y^{2}\\right)} \\sqrt{a^{2} + r^{2} - 2 \\, r}} \\right) \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} r\\otimes \\mathrm{d} y + \\left( \\frac{\\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} {\\left(a^{2} y^{2} + r^{2}\\right)}^{\\frac{3}{2}}}{{\\left({\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{4} - a^{2} r^{2} - r^{4} - 2 \\, a^{2} r - {\\left(a^{4} - r^{4} - 4 \\, a^{2} r\\right)} y^{2}\\right)} \\sqrt{a^{2} + r^{2} - 2 \\, r}} \\right) \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} y\\otimes \\mathrm{d} r$</div>","done":false}︡{"done":true}
︠2db4d8d3-3906-489f-abca-26956ebdd5fa︠
DKu = D(Ku)
B = epsu['^k_li']*DKu['^l_jk'] 
print B
︡e5e750a8-2c44-43df-862d-ccda936901d2︡︡{"stdout":"tensor field of type (0,2) on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}
︠b1a44a23-c766-49dc-80b1-8d3b8ac05ddfi︠
%html
<p>Let us check that $B$ is symmetric:</p>

︡e9d8749d-cb3f-4bc6-a24c-779b8fbe9ea4︡︡{"done":true,"html":"<p>Let us check that $B$ is symmetric:</p>"}
︠61436395-df39-42ba-811d-6e23d1a78ef1︠
B1 = B.symmetrize()
B == B1
︡acaafa69-c505-4c46-b865-6eab3865f204︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠a08fb8b2-a518-4fca-a33e-a1afe3a43986i︠
%html
<p>Accordingly, we set</p>

︡35a4107a-2474-4cad-88c8-eefa765fd575︡︡{"done":true,"html":"<p>Accordingly, we set</p>"}
︠06f33e08-d8c3-45ae-b09b-d2d16053a2cc︠
B = B1
B.set_name('B')
print B
︡4608dd73-6d9a-4e6c-9510-2227ee499a19︡︡{"stdout":"field of symmetric bilinear forms 'B' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}
︠1e0bdc27-af6a-4c48-b5be-7aec68559641︠
B[1,1]
︡892eec22-334e-470d-b21c-7fa30a6f65e1︡︡{"html":"<div>$-\\frac{{\\left(a^{7} + a^{5} r^{2} - 2 \\, a^{5} r\\right)} y^{5} - {\\left(3 \\, a^{7} + 8 \\, a^{5} r^{2} + 5 \\, a^{3} r^{4} - 2 \\, a^{5} r - 6 \\, a^{3} r^{3}\\right)} y^{3} + 3 \\, {\\left(3 \\, a^{5} r^{2} + 5 \\, a^{3} r^{4} + 2 \\, a r^{6} - 2 \\, a^{3} r^{3}\\right)} y}{2 \\, a^{2} r^{8} + r^{10} + 2 \\, a^{4} r^{5} - 2 \\, r^{9} + {\\left(a^{4} - 4 \\, a^{2}\\right)} r^{6} + {\\left(a^{10} + a^{6} r^{4} - 4 \\, a^{8} r - 4 \\, a^{6} r^{3} + 2 \\, {\\left(a^{8} + 2 \\, a^{6}\\right)} r^{2}\\right)} y^{6} + {\\left(3 \\, a^{4} r^{6} + 2 \\, a^{8} r - 8 \\, a^{6} r^{3} - 10 \\, a^{4} r^{5} + 2 \\, {\\left(3 \\, a^{6} + 4 \\, a^{4}\\right)} r^{4} + {\\left(3 \\, a^{8} - 4 \\, a^{6}\\right)} r^{2}\\right)} y^{4} + {\\left(3 \\, a^{2} r^{8} + 4 \\, a^{6} r^{3} - 4 \\, a^{4} r^{5} - 8 \\, a^{2} r^{7} + 2 \\, {\\left(3 \\, a^{4} + 2 \\, a^{2}\\right)} r^{6} + {\\left(3 \\, a^{6} - 8 \\, a^{4}\\right)} r^{4}\\right)} y^{2}}$</div>","done":false}︡{"done":true}
︠73d83983-3ca8-4405-bdd1-003f776f05ae︠
B[1,1].factor()
︡c6a5fe01-1347-4c1b-bc38-e92ed545c525︡︡{"html":"<div>$-\\frac{{\\left(a^{4} y^{2} + a^{2} r^{2} y^{2} - 2 \\, a^{2} r y^{2} - 3 \\, a^{4} - 5 \\, a^{2} r^{2} - 2 \\, r^{4} + 2 \\, a^{2} r\\right)} {\\left(a^{2} y^{2} - 3 \\, r^{2}\\right)} a y}{{\\left(a^{4} y^{2} + a^{2} r^{2} y^{2} - 2 \\, a^{2} r y^{2} + a^{2} r^{2} + r^{4} + 2 \\, a^{2} r\\right)} {\\left(a^{2} y^{2} + r^{2}\\right)}^{2} {\\left(a^{2} + r^{2} - 2 \\, r\\right)}}$</div>","done":false}︡{"done":true}
︠e345ce8e-7b90-46e1-be75-63420974c658︠
B[1,2]
︡22b15eb4-3208-4c23-9116-52e10cf3424b︡︡{"html":"<div>$\\frac{3 \\, {\\left(a^{3} r^{3} + a r^{5} - 3 \\, {\\left(a^{5} r + a^{3} r^{3}\\right)} y^{2}\\right)}}{a^{2} r^{6} + r^{8} + 2 \\, a^{2} r^{5} + {\\left(a^{8} + a^{6} r^{2} - 2 \\, a^{6} r\\right)} y^{6} + {\\left(3 \\, a^{6} r^{2} + 3 \\, a^{4} r^{4} + 2 \\, a^{6} r - 4 \\, a^{4} r^{3}\\right)} y^{4} + {\\left(3 \\, a^{4} r^{4} + 3 \\, a^{2} r^{6} + 4 \\, a^{4} r^{3} - 2 \\, a^{2} r^{5}\\right)} y^{2}}$</div>","done":false}︡{"done":true}
︠69668f51-15e9-4be7-bce3-7eda5863b91f︠
B[1,2].factor()
︡5e7dd18b-1219-4c7e-a487-d3ea6eda75b0︡︡{"html":"<div>$-\\frac{3 \\, {\\left(3 \\, a^{2} y^{2} - r^{2}\\right)} {\\left(a^{2} + r^{2}\\right)} a r}{{\\left(a^{4} y^{2} + a^{2} r^{2} y^{2} - 2 \\, a^{2} r y^{2} + a^{2} r^{2} + r^{4} + 2 \\, a^{2} r\\right)} {\\left(a^{2} y^{2} + r^{2}\\right)}^{2}}$</div>","done":false}︡{"done":true}
︠4cded374-908c-4a1b-8ae3-215f4ed12629︠
B[1,3]
︡493a886e-158b-4172-a48f-68a55055aa9a︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠7dbac6a9-ad88-4851-970b-d270c1bdb65a︠
B[2,2]
︡b384df84-1615-43ac-86b6-81152f84c8fa︡︡{"html":"<div>$-\\frac{2 \\, {\\left(a^{7} + a^{5} r^{2} - 2 \\, a^{5} r\\right)} y^{5} - {\\left(3 \\, a^{7} + 10 \\, a^{5} r^{2} + 7 \\, a^{3} r^{4} - 4 \\, a^{5} r - 12 \\, a^{3} r^{3}\\right)} y^{3} + 3 \\, {\\left(3 \\, a^{5} r^{2} + 4 \\, a^{3} r^{4} + a r^{6} - 4 \\, a^{3} r^{3}\\right)} y}{{\\left(a^{8} + a^{6} r^{2} - 2 \\, a^{6} r\\right)} y^{8} - a^{2} r^{6} - r^{8} - 2 \\, a^{2} r^{5} - {\\left(a^{8} - 2 \\, a^{6} r^{2} - 3 \\, a^{4} r^{4} - 4 \\, a^{6} r + 4 \\, a^{4} r^{3}\\right)} y^{6} - {\\left(3 \\, a^{6} r^{2} - 3 \\, a^{2} r^{6} + 2 \\, a^{6} r - 8 \\, a^{4} r^{3} + 2 \\, a^{2} r^{5}\\right)} y^{4} - {\\left(3 \\, a^{4} r^{4} + 2 \\, a^{2} r^{6} - r^{8} + 4 \\, a^{4} r^{3} - 4 \\, a^{2} r^{5}\\right)} y^{2}}$</div>","done":false}︡{"done":true}
︠26952506-3ebe-4c7c-883c-e3a90b87d1b6︠
B[2,2].factor()
︡3b6dfd14-f09d-4382-81b7-1ebc1d3680dd︡︡{"html":"<div>$-\\frac{{\\left(2 \\, a^{4} y^{2} + 2 \\, a^{2} r^{2} y^{2} - 4 \\, a^{2} r y^{2} - 3 \\, a^{4} - 4 \\, a^{2} r^{2} - r^{4} + 4 \\, a^{2} r\\right)} {\\left(a^{2} y^{2} - 3 \\, r^{2}\\right)} a y}{{\\left(a^{4} y^{2} + a^{2} r^{2} y^{2} - 2 \\, a^{2} r y^{2} + a^{2} r^{2} + r^{4} + 2 \\, a^{2} r\\right)} {\\left(a^{2} y^{2} + r^{2}\\right)}^{2} {\\left(y + 1\\right)} {\\left(y - 1\\right)}}$</div>","done":false}︡{"done":true}
︠b11028a0-17ec-4843-bd64-bd950ace96ba︠
B[2,3]
︡5155ff35-adfe-41a0-850d-436046021653︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠18bfc1a4-f07c-4f7a-946e-46fdb3fd8485︠
B[3,3]
︡59ad0a7b-7e52-4300-8d37-95f16b4d9c78︡︡{"html":"<div>$\\frac{{\\left(a^{7} + a^{5} r^{2} - 2 \\, a^{5} r\\right)} y^{7} - {\\left(a^{7} + 3 \\, a^{5} r^{2} + 2 \\, a^{3} r^{4} - 4 \\, a^{5} r - 6 \\, a^{3} r^{3}\\right)} y^{5} + {\\left(2 \\, a^{5} r^{2} - a^{3} r^{4} - 3 \\, a r^{6} - 2 \\, a^{5} r - 12 \\, a^{3} r^{3}\\right)} y^{3} + 3 \\, {\\left(a^{3} r^{4} + a r^{6} + 2 \\, a^{3} r^{3}\\right)} y}{a^{8} y^{8} + 4 \\, a^{6} r^{2} y^{6} + 6 \\, a^{4} r^{4} y^{4} + 4 \\, a^{2} r^{6} y^{2} + r^{8}}$</div>","done":false}︡{"done":true}
︠60d4e024-f7f7-45f8-9f5a-c2a14d1c9bda︠
B[3,3].factor()
︡e803c2dc-cc05-4804-aceb-6ab4ea1a0c96︡︡{"html":"<div>$\\frac{{\\left(a^{4} y^{2} + a^{2} r^{2} y^{2} - 2 \\, a^{2} r y^{2} + a^{2} r^{2} + r^{4} + 2 \\, a^{2} r\\right)} {\\left(a^{2} y^{2} - 3 \\, r^{2}\\right)} a {\\left(y + 1\\right)} {\\left(y - 1\\right)} y}{{\\left(a^{2} y^{2} + r^{2}\\right)}^{4}}$</div>","done":false}︡{"done":true}
︠28842427-ee08-422b-a6fc-5866ce00daa3i︠
%html
<h2>3+1 decomposition of the Simon-Mars tensor</h2>
<p>We follow the computation presented in <a href="http://arxiv.org/abs/1412.6542">arXiv:1412.6542</a>. We start by the tensor $E^\sharp$ of components $E^i_ {\ \, j}$:</p>

︡7a4089ee-7168-4a11-934f-594538a15a0e︡︡{"done":true,"html":"<h2>3+1 decomposition of the Simon-Mars tensor</h2>\n<p>We follow the computation presented in <a href=\"http://arxiv.org/abs/1412.6542\">arXiv:1412.6542</a>. We start by the tensor $E^\\sharp$ of components $E^i_ {\\ \\, j}$:</p>"}
︠607a905a-4348-436b-b293-451f5b063439︠
Eu = E.up(gam, 0) 
print Eu
︡4ad4e2b5-774f-4238-a25f-aaa9e54dd7de︡︡{"stdout":"tensor field of type (1,1) on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}
︠b7470fc0-b0b2-44de-aa74-61bbb5fe1713i︠
%html
<p>Tensor $B^\sharp$ of components $B^i_{\ \, j}$:</p>

︡1cadc884-9c13-4c65-83d0-f6dc6dfbfda3︡︡{"done":true,"html":"<p>Tensor $B^\\sharp$ of components $B^i_{\\ \\, j}$:</p>"}
︠cc568af4-fc68-4d34-b982-eb70f5bfab65︠
Bu = B.up(gam, 0)
print Bu
︡59ab115b-ab72-4143-89b2-840671bdd980︡︡{"stdout":"tensor field of type (1,1) on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}
︠6060a92d-30cb-4c25-ac50-c748465f2fd5i︠
%html
<p>1-form $\beta^\flat$ of components $\beta_i$ and its exterior derivative:</p>

︡c7e8c14b-5d36-4b30-81d7-82f796c0d890︡︡{"done":true,"html":"<p>1-form $\\beta^\\flat$ of components $\\beta_i$ and its exterior derivative:</p>"}
︠c1e39782-e9d6-4575-8659-6ea2fb2f2bdc︠
bd = b.down(gam)
xdb = bd.exterior_der()
print xdb ; xdb.display()
︡adbf964e-763b-49ed-8f5b-31904a6eccc2︡︡{"stdout":"2-form on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\left( \\frac{2 \\, {\\left(a^{3} y^{4} + a r^{2} - {\\left(a^{3} + a r^{2}\\right)} y^{2}\\right)}}{a^{4} y^{4} + 2 \\, a^{2} r^{2} y^{2} + r^{4}} \\right) \\mathrm{d} r\\wedge \\mathrm{d} {\\phi} + \\left( \\frac{4 \\, {\\left(a^{3} r + a r^{3}\\right)} y}{a^{4} y^{4} + 2 \\, a^{2} r^{2} y^{2} + r^{4}} \\right) \\mathrm{d} y\\wedge \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠8422e208-7e7b-40ee-9d8b-1b2bb08cc9b5i︠
%html
<p>Scalar square of shift $\beta_i \beta^i$:</p>

︡09fedbe0-4e7a-47c2-8619-a1cfe1c34c5e︡︡{"done":true,"html":"<p>Scalar square of shift $\\beta_i \\beta^i$:</p>"}
︠cb4dddb5-e002-43b9-8ef2-27e6f9db2116︠
b2 = bd(b)
print b2 ; b2.display()
︡9eb17180-d1c0-4656-a89a-ca33d9e9ed45︡︡{"stdout":"scalar field on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} &amp; \\Sigma &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(r, y, {\\phi}\\right) &amp; \\longmapsto &amp; -\\frac{4 \\, {\\left(a^{2} r^{2} y^{2} - a^{2} r^{2}\\right)}}{a^{2} r^{4} + r^{6} + 2 \\, a^{2} r^{3} + {\\left(a^{6} + a^{4} r^{2} - 2 \\, a^{4} r\\right)} y^{4} + 2 \\, {\\left(a^{4} r^{2} + a^{2} r^{4} + a^{4} r - a^{2} r^{3}\\right)} y^{2}} \\end{array}$</div>","done":false}︡{"done":true}
︠9fd6b9ee-6b5c-42fd-b412-d0a002679b59i︠
%html
<p>Scalar $Y = E(\beta,\beta) = E_{ij} \beta^i \beta^j$:</p>

︡2b7e151d-db2e-4bbe-8271-f1e7622b8330︡︡{"done":true,"html":"<p>Scalar $Y = E(\\beta,\\beta) = E_{ij} \\beta^i \\beta^j$:</p>"}
︠362de9a3-07d1-4399-8ab4-befc61ec3f4b︠
Ebb = E(b,b)
Y = Ebb
print Y ; Y.display()
︡e4749bd4-f9c2-401a-a093-e1ff6b597315︡︡{"stdout":"scalar field on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} &amp; \\Sigma &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(r, y, {\\phi}\\right) &amp; \\longmapsto &amp; \\frac{4 \\, {\\left(3 \\, a^{4} r^{3} y^{4} + a^{2} r^{5} - {\\left(3 \\, a^{4} r^{3} + a^{2} r^{5}\\right)} y^{2}\\right)}}{a^{2} r^{10} + r^{12} + 2 \\, a^{2} r^{9} + {\\left(a^{12} + a^{10} r^{2} - 2 \\, a^{10} r\\right)} y^{10} + {\\left(5 \\, a^{10} r^{2} + 5 \\, a^{8} r^{4} + 2 \\, a^{10} r - 8 \\, a^{8} r^{3}\\right)} y^{8} + 2 \\, {\\left(5 \\, a^{8} r^{4} + 5 \\, a^{6} r^{6} + 4 \\, a^{8} r^{3} - 6 \\, a^{6} r^{5}\\right)} y^{6} + 2 \\, {\\left(5 \\, a^{6} r^{6} + 5 \\, a^{4} r^{8} + 6 \\, a^{6} r^{5} - 4 \\, a^{4} r^{7}\\right)} y^{4} + {\\left(5 \\, a^{4} r^{8} + 5 \\, a^{2} r^{10} + 8 \\, a^{4} r^{7} - 2 \\, a^{2} r^{9}\\right)} y^{2}} \\end{array}$</div>","done":false}︡{"done":true}
︠09f9075e-aaad-474b-822a-4fb0139f2ba1︠
Ebb.function_chart().factor()
︡1dc672e6-38b7-475c-a1c7-29c06c5b223b︡︡{"html":"<div>$\\frac{4 \\, {\\left(3 \\, a^{2} y^{2} - r^{2}\\right)} a^{2} r^{3} {\\left(y + 1\\right)} {\\left(y - 1\\right)}}{{\\left(a^{4} y^{2} + a^{2} r^{2} y^{2} - 2 \\, a^{2} r y^{2} + a^{2} r^{2} + r^{4} + 2 \\, a^{2} r\\right)} {\\left(a^{2} y^{2} + r^{2}\\right)}^{4}}$</div>","done":false}︡{"done":true}
︠9191b9e9-fbbf-42b1-b82d-58d870f7ec2b︠
Ebb.display()
︡b39bf33a-b049-41ab-a408-8ac7c9c4998d︡︡{"html":"<div>$\\begin{array}{llcl} &amp; \\Sigma &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(r, y, {\\phi}\\right) &amp; \\longmapsto &amp; \\frac{4 \\, {\\left(3 \\, a^{2} y^{2} - r^{2}\\right)} a^{2} r^{3} {\\left(y + 1\\right)} {\\left(y - 1\\right)}}{{\\left(a^{4} y^{2} + a^{2} r^{2} y^{2} - 2 \\, a^{2} r y^{2} + a^{2} r^{2} + r^{4} + 2 \\, a^{2} r\\right)} {\\left(a^{2} y^{2} + r^{2}\\right)}^{4}} \\end{array}$</div>","done":false}︡{"done":true}
︠334cb764-7dff-4b54-bd62-b3212bda887bi︠
%html
<p>Scalar $\bar Y = B(\beta,\beta) = B_{ij}\beta^i \beta^j$:</p>

︡5c7769cd-e03b-4541-8f27-532c38215b9a︡︡{"done":true,"html":"<p>Scalar $\\bar Y = B(\\beta,\\beta) = B_{ij}\\beta^i \\beta^j$:</p>"}
︠647d7b74-3c91-4031-a3c2-53124195d2f6︠
Bbb = B(b,b)
Y_bar = Bbb
print Y_bar ; Y_bar.display()
︡739d0050-3f11-4764-96c7-46902faf3500︡︡{"stdout":"scalar field 'B(beta,beta)' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} B\\left(\\beta,\\beta\\right):&amp; \\Sigma &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(r, y, {\\phi}\\right) &amp; \\longmapsto &amp; \\frac{4 \\, {\\left(a^{5} r^{2} y^{5} + 3 \\, a^{3} r^{4} y - {\\left(a^{5} r^{2} + 3 \\, a^{3} r^{4}\\right)} y^{3}\\right)}}{a^{2} r^{10} + r^{12} + 2 \\, a^{2} r^{9} + {\\left(a^{12} + a^{10} r^{2} - 2 \\, a^{10} r\\right)} y^{10} + {\\left(5 \\, a^{10} r^{2} + 5 \\, a^{8} r^{4} + 2 \\, a^{10} r - 8 \\, a^{8} r^{3}\\right)} y^{8} + 2 \\, {\\left(5 \\, a^{8} r^{4} + 5 \\, a^{6} r^{6} + 4 \\, a^{8} r^{3} - 6 \\, a^{6} r^{5}\\right)} y^{6} + 2 \\, {\\left(5 \\, a^{6} r^{6} + 5 \\, a^{4} r^{8} + 6 \\, a^{6} r^{5} - 4 \\, a^{4} r^{7}\\right)} y^{4} + {\\left(5 \\, a^{4} r^{8} + 5 \\, a^{2} r^{10} + 8 \\, a^{4} r^{7} - 2 \\, a^{2} r^{9}\\right)} y^{2}} \\end{array}$</div>","done":false}︡{"done":true}
︠56d9a5a9-b715-4b6d-9a17-489eca11b6b5︠
Bbb.function_chart().factor()
︡e95342c0-38f3-4775-93b9-b90ce8915cad︡︡{"html":"<div>$\\frac{4 \\, {\\left(a^{2} y^{2} - 3 \\, r^{2}\\right)} a^{3} r^{2} {\\left(y + 1\\right)} {\\left(y - 1\\right)} y}{{\\left(a^{4} y^{2} + a^{2} r^{2} y^{2} - 2 \\, a^{2} r y^{2} + a^{2} r^{2} + r^{4} + 2 \\, a^{2} r\\right)} {\\left(a^{2} y^{2} + r^{2}\\right)}^{4}}$</div>","done":false}︡{"done":true}
︠73d5a2f5-ff95-4563-8be7-52eb2230dc52i︠
%html
<p>1-form of components $Eb_i = E_{ij} \beta^j$:</p>

︡d7d3086a-000d-46c7-a48d-c7e3cf4c3164︡︡{"done":true,"html":"<p>1-form of components $Eb_i = E_{ij} \\beta^j$:</p>"}
︠20970f45-9277-45bb-a61e-8e4a13abd725︠
Eb = E.contract(b)
print Eb ; Eb.display()
︡10b556bd-304f-422d-ae6e-212472259e0e︡︡{"stdout":"1-form on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\left( -\\frac{2 \\, {\\left(3 \\, a^{3} r^{2} y^{4} + a r^{4} - {\\left(3 \\, a^{3} r^{2} + a r^{4}\\right)} y^{2}\\right)}}{a^{8} y^{8} + 4 \\, a^{6} r^{2} y^{6} + 6 \\, a^{4} r^{4} y^{4} + 4 \\, a^{2} r^{6} y^{2} + r^{8}} \\right) \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠2f61da78-4d3c-451f-82ba-1c2f7f3fc826i︠
%html
<p>Vector field of components $Eub^i = E^i_{\ \, j} \beta^j$:</p>

︡194a32f9-7fd3-43de-9102-3e6f175c8d13︡︡{"done":true,"html":"<p>Vector field of components $Eub^i = E^i_{\\ \\, j} \\beta^j$:</p>"}
︠67c98ece-d19d-4f4a-b9a2-4fcb8aba5715︠
Eub = Eu.contract(b)
print Eub ; Eub.display()
︡cfd240a4-abf3-427f-b211-63b59921e626︡︡{"stdout":"vector field on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\left( \\frac{2 \\, {\\left(3 \\, a^{3} r^{2} y^{2} - a r^{4}\\right)}}{a^{2} r^{8} + r^{10} + 2 \\, a^{2} r^{7} + {\\left(a^{10} + a^{8} r^{2} - 2 \\, a^{8} r\\right)} y^{8} + 2 \\, {\\left(2 \\, a^{8} r^{2} + 2 \\, a^{6} r^{4} + a^{8} r - 3 \\, a^{6} r^{3}\\right)} y^{6} + 6 \\, {\\left(a^{6} r^{4} + a^{4} r^{6} + a^{6} r^{3} - a^{4} r^{5}\\right)} y^{4} + 2 \\, {\\left(2 \\, a^{4} r^{6} + 2 \\, a^{2} r^{8} + 3 \\, a^{4} r^{5} - a^{2} r^{7}\\right)} y^{2}} \\right) \\frac{\\partial}{\\partial {\\phi} }$</div>","done":false}︡{"done":true}
︠940e5fe9-f680-4968-93e3-f4584bea1785i︠
%html
<p>1-form of components $Bb_i = B_{ij} \beta^j$:</p>

︡281f53af-5482-476d-982e-f71886c6ee53︡︡{"done":true,"html":"<p>1-form of components $Bb_i = B_{ij} \\beta^j$:</p>"}
︠8219df1b-765c-4750-8ae5-8b7c5e67f6cf︠
Bb = B.contract(b)
print Bb ; Bb.display()
︡1c418593-d0c1-4b63-a1e3-20a3c04f4f9e︡︡{"stdout":"1-form on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\left( -\\frac{2 \\, {\\left(a^{4} r y^{5} + 3 \\, a^{2} r^{3} y - {\\left(a^{4} r + 3 \\, a^{2} r^{3}\\right)} y^{3}\\right)}}{a^{8} y^{8} + 4 \\, a^{6} r^{2} y^{6} + 6 \\, a^{4} r^{4} y^{4} + 4 \\, a^{2} r^{6} y^{2} + r^{8}} \\right) \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠4843321e-237b-4af7-b716-e9c681acf6e5i︠
%html
<p>Vector field of components $Bub^i = B^i_{\ \, j} \beta^j$:</p>

︡2ae5d5e7-9511-48fb-9b63-9a51df2f6f72︡︡{"done":true,"html":"<p>Vector field of components $Bub^i = B^i_{\\ \\, j} \\beta^j$:</p>"}
︠4ef9d9c6-1937-49db-8b17-cdaaf1f078ba︠
Bub = Bu.contract(b)
print Bub ; Bub.display()
︡eaf79566-0b74-4e3a-923d-c7685a80aefd︡︡{"stdout":"vector field on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\left( \\frac{2 \\, {\\left(a^{4} r y^{3} - 3 \\, a^{2} r^{3} y\\right)}}{a^{2} r^{8} + r^{10} + 2 \\, a^{2} r^{7} + {\\left(a^{10} + a^{8} r^{2} - 2 \\, a^{8} r\\right)} y^{8} + 2 \\, {\\left(2 \\, a^{8} r^{2} + 2 \\, a^{6} r^{4} + a^{8} r - 3 \\, a^{6} r^{3}\\right)} y^{6} + 6 \\, {\\left(a^{6} r^{4} + a^{4} r^{6} + a^{6} r^{3} - a^{4} r^{5}\\right)} y^{4} + 2 \\, {\\left(2 \\, a^{4} r^{6} + 2 \\, a^{2} r^{8} + 3 \\, a^{4} r^{5} - a^{2} r^{7}\\right)} y^{2}} \\right) \\frac{\\partial}{\\partial {\\phi} }$</div>","done":false}︡{"done":true}
︠8e2d7d3d-631d-49cb-a392-e61754c872b6i︠
%html
<p>Vector field of components $Kub^i = K^i_{\ \, j} \beta^j$:</p>

︡620898ad-674e-4e56-a69d-77532c33a9fa︡︡{"done":true,"html":"<p>Vector field of components $Kub^i = K^i_{\\ \\, j} \\beta^j$:</p>"}
︠b3d87328-b575-464a-9711-30d81afeae91︠
Kub = Ku.contract(b)
print Kub ; Kub.display()
︡185c8249-176a-454b-bb0a-c91e66e85a2c︡︡{"stdout":"vector field on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\left( -\\frac{2 \\, {\\left(a^{4} r^{3} + 3 \\, a^{2} r^{5} + {\\left(a^{6} r - a^{4} r^{3}\\right)} y^{4} - {\\left(a^{6} r + 3 \\, a^{2} r^{5}\\right)} y^{2}\\right)} \\sqrt{a^{2} + r^{2} - 2 \\, r}}{{\\left(a^{2} r^{6} + r^{8} + 2 \\, a^{2} r^{5} + {\\left(a^{8} + a^{6} r^{2} - 2 \\, a^{6} r\\right)} y^{6} + {\\left(3 \\, a^{6} r^{2} + 3 \\, a^{4} r^{4} + 2 \\, a^{6} r - 4 \\, a^{4} r^{3}\\right)} y^{4} + {\\left(3 \\, a^{4} r^{4} + 3 \\, a^{2} r^{6} + 4 \\, a^{4} r^{3} - 2 \\, a^{2} r^{5}\\right)} y^{2}\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} \\sqrt{a^{2} y^{2} + r^{2}}} \\right) \\frac{\\partial}{\\partial r } + \\left( -\\frac{4 \\, {\\left(a^{4} r^{2} y^{5} - 2 \\, a^{4} r^{2} y^{3} + a^{4} r^{2} y\\right)} \\sqrt{a^{2} + r^{2} - 2 \\, r}}{{\\left(a^{2} r^{6} + r^{8} + 2 \\, a^{2} r^{5} + {\\left(a^{8} + a^{6} r^{2} - 2 \\, a^{6} r\\right)} y^{6} + {\\left(3 \\, a^{6} r^{2} + 3 \\, a^{4} r^{4} + 2 \\, a^{6} r - 4 \\, a^{4} r^{3}\\right)} y^{4} + {\\left(3 \\, a^{4} r^{4} + 3 \\, a^{2} r^{6} + 4 \\, a^{4} r^{3} - 2 \\, a^{2} r^{5}\\right)} y^{2}\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} \\sqrt{a^{2} y^{2} + r^{2}}} \\right) \\frac{\\partial}{\\partial y }$</div>","done":false}︡{"done":true}
︠ba1998a8-abaf-47b0-8717-24dab42f5666︠
T = 2*b(N) - 2*K(b,b)
print T ; T.display()
︡d5b5007f-6569-4cab-ac80-b1f6f5c808ce︡︡{"stdout":"scalar field 'zero' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} 0:&amp; \\Sigma &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(r, y, {\\phi}\\right) &amp; \\longmapsto &amp; 0 \\end{array}$</div>","done":false}︡{"done":true}
︠d9e10acf-7e22-4cb9-93ee-d2897be4bf91︠
Db = D(b)  #  Db^i_j = D_j b^i
Dbu = Db.up(gam, 1)  # Dbu^{ij} = D^j b^i
bDb = b*Dbu  # bDb^{ijk} = b^i D^k b^j
T_bar = eps['_ijk']*bDb['^ikj']
print T_bar ; T_bar.display()
︡73e22058-f7e7-44db-b556-a14e105f0026︡︡{"stdout":"scalar field on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} &amp; \\Sigma &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(r, y, {\\phi}\\right) &amp; \\longmapsto &amp; 0 \\end{array}$</div>","done":false}︡{"done":true}
︠afbdb425-7d4b-4528-9fa8-b98f56576a2d︠
epsb = eps.contract(b) 
print epsb
epsb.display()
︡185e2046-c45f-4d53-bc71-47b975a9941c︡︡{"stdout":"2-form on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\left( -\\frac{2 \\, \\sqrt{a^{2} y^{2} + r^{2}} a r}{\\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}} \\right) \\mathrm{d} r\\wedge \\mathrm{d} y$</div>","done":false}︡{"done":true}
︠64b8461a-a086-4138-be1e-5431c314eb01︠
epsB = eps['_ijl']*Bu['^l_k']
print epsB
︡d5a59133-5892-4b77-b403-00043b93e4a0︡︡{"stdout":"tensor field of type (0,3) on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}
︠aee7e77e-8f79-49a8-88a4-84e3ae5e0ccf︠
epsB.symmetries()
︡f3020fb0-a84a-4dc0-b4f2-cf77359a3f2a︡︡{"stdout":"no symmetry; antisymmetry: (0, 1)\n","done":false}︡{"done":true}
︠61335d9d-1324-4ef4-bea7-2c157a7a63d2︠
epsB[1,2,3]
︡c93328d2-b9c7-4ee6-ba2f-03b2e0668ea3︡︡{"html":"<div>$-\\frac{{\\left(a^{3} y^{3} - 3 \\, a r^{2} y\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} \\sqrt{a^{2} y^{2} + r^{2}}}{{\\left(a^{6} y^{6} + 3 \\, a^{4} r^{2} y^{4} + 3 \\, a^{2} r^{4} y^{2} + r^{6}\\right)} \\sqrt{a^{2} + r^{2} - 2 \\, r}}$</div>","done":false}︡{"done":true}
︠95494885-5531-4cb6-86ca-20a4d4c2852c︠
Z = 2*N*( D(N)  -K.contract(b)) + b.contract(xdb)
print Z ; Z.display()
︡5ce1e032-c1e7-4f58-b813-abf29929dadf︡︡{"stdout":"1-form on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\left( -\\frac{2 \\, {\\left(a^{2} y^{2} - r^{2}\\right)}}{a^{4} y^{4} + 2 \\, a^{2} r^{2} y^{2} + r^{4}} \\right) \\mathrm{d} r + \\left( \\frac{4 \\, a^{2} r y}{a^{4} y^{4} + 2 \\, a^{2} r^{2} y^{2} + r^{4}} \\right) \\mathrm{d} y$</div>","done":false}︡{"done":true}
︠3a5a8e6d-2688-44b3-ac21-86593d6971cf︠
DNu = D(N).up(gam)
A = 2*(DNu - Ku.contract(b))*b + N*Dbu
Z_bar = eps['_ijk']*A['^kj']
print Z_bar ; Z_bar.display()
︡be256df8-aadc-493e-9fc2-d678c65d29a8︡︡{"stdout":"1-form on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\left( \\frac{4 \\, a r y}{a^{4} y^{4} + 2 \\, a^{2} r^{2} y^{2} + r^{4}} \\right) \\mathrm{d} r + \\left( \\frac{2 \\, {\\left(a^{3} y^{2} - a r^{2}\\right)}}{a^{4} y^{4} + 2 \\, a^{2} r^{2} y^{2} + r^{4}} \\right) \\mathrm{d} y$</div>","done":false}︡{"done":true}
︠33729059-f630-4414-bc89-ea26f31f7f99︠
# Test:
Dbdu = D(bd).up(gam,1).up(gam,1)  # (Db)^{ij} = D^i b^j
A = 2*b*(DNu - Ku.contract(b)) + N*Dbdu
Z_bar0 = eps['_ijk']*A['^jk']  # NB: '^jk' and not 'kj'
Z_bar0 == Z_bar
︡5aa76a42-2db9-4771-ac82-f6fa92850f08︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}︡
︠b6e3e48b-af2a-4c2e-b573-ba83cff8c4f0︠
W = N*Eb + epsb.contract(Bub)
print W ; W.display()
︡ee621daa-853b-4ae1-b436-11e4daa8c308︡{"stdout":"1-form on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\left( -\\frac{2 \\, {\\left(3 \\, a^{3} r^{2} y^{4} + a r^{4} - {\\left(3 \\, a^{3} r^{2} + a r^{4}\\right)} y^{2}\\right)} \\sqrt{a^{2} y^{2} + r^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}}{{\\left(a^{8} y^{8} + 4 \\, a^{6} r^{2} y^{6} + 6 \\, a^{4} r^{4} y^{4} + 4 \\, a^{2} r^{6} y^{2} + r^{8}\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}}} \\right) \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}︡
︠771543c7-1bfa-473c-ba60-adf71e7ea04e︠
W_bar = N*Bb - epsb.contract(Eub)
print W_bar ; W_bar.display()
︡952f52e6-6798-4717-9cd6-131339117005︡{"stdout":"1-form on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\left( -\\frac{2 \\, {\\left(a^{4} r y^{5} + 3 \\, a^{2} r^{3} y - {\\left(a^{4} r + 3 \\, a^{2} r^{3}\\right)} y^{3}\\right)} \\sqrt{a^{2} y^{2} + r^{2}} \\sqrt{a^{2} + r^{2} - 2 \\, r}}{{\\left(a^{8} y^{8} + 4 \\, a^{6} r^{2} y^{6} + 6 \\, a^{4} r^{4} y^{4} + 4 \\, a^{2} r^{6} y^{2} + r^{8}\\right)} \\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}}} \\right) \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}︡
︠570411c9-8ad2-4e45-9275-4f6a3a3f3dae︠
W[3].factor()
︡e05f8ac2-29dc-43f7-bb02-c616b47fe105︡{"html":"<div>$-\\frac{2 \\, {\\left(3 \\, a^{2} y^{2} - r^{2}\\right)} \\sqrt{a^{2} + r^{2} - 2 \\, r} a r^{2} {\\left(y + 1\\right)} {\\left(y - 1\\right)}}{\\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} {\\left(a^{2} y^{2} + r^{2}\\right)}^{\\frac{7}{2}}}$</div>","done":false}︡{"done":true}︡
︠86b99dc2-5bb0-4d19-a941-8fdd5e374fb8︠
W_bar[3].factor()
︡5a31fb24-cd43-4cf4-930d-6471334d4415︡{"html":"<div>$-\\frac{2 \\, {\\left(a^{2} y^{2} - 3 \\, r^{2}\\right)} \\sqrt{a^{2} + r^{2} - 2 \\, r} a^{2} r {\\left(y + 1\\right)} {\\left(y - 1\\right)} y}{\\sqrt{a^{2} r^{2} + r^{4} + 2 \\, a^{2} r + {\\left(a^{4} + a^{2} r^{2} - 2 \\, a^{2} r\\right)} y^{2}} {\\left(a^{2} y^{2} + r^{2}\\right)}^{\\frac{7}{2}}}$</div>","done":false}︡{"done":true}︡
︠25729eff-c7fe-43a3-b4db-94a5dcf6fefa︠
M = - 4*Eb(Kub - DNu) - 2*(epsB['_ij.']*Dbu['^ji'])(b)
print M ; M.display()
︡6deafad5-fc77-4eca-a49a-6c47eb1841fe︡{"stdout":"scalar field 'zero' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} 0:&amp; \\Sigma &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(r, y, {\\phi}\\right) &amp; \\longmapsto &amp; 0 \\end{array}$</div>","done":false}︡{"done":true}︡
︠003a6fb3-4a7a-4fbf-90df-a4624a92ac3c︠
M_bar = 2*(eps.contract(Eub))['_ij']*Dbu['^ji'] - 4*Bb(Kub - DNu)
print M_bar ; M_bar.display()
︡8c7641db-e421-4cd7-bcba-7ee29ebe96a4︡{"stdout":"scalar field 'zero' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} 0:&amp; \\Sigma &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(r, y, {\\phi}\\right) &amp; \\longmapsto &amp; 0 \\end{array}$</div>","done":false}︡{"done":true}︡
︠477bff0d-5ce0-478b-9b4b-0ce62170b14a︠
A = epsB['_ilk']*b['^l'] + epsB['_ikl']*b['^l'] + Bu['^m_i']*epsb['_mk'] - 2*N*E
xdbE = xdb['_kl']*Eu['^k_i']
L = 2*N*epsB['_kli']*Dbu['^kl'] + 2*xdb['_ij']*Eub['^j'] + 2*xdbE['_li']*b['^l'] \
    + 2*A['_ik']*(Kub - DNu)['^k']
print L
︡bb2fe841-7717-446f-b608-e0a97f74ca8f︡{"stdout":"1-form on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠9bf8432f-3403-490b-a3a1-d34791c23ad4︠
L[1]
︡de44302f-f0e5-48f3-9a7d-145f53749ffd︡{"html":"<div>$-\\frac{8 \\, {\\left(5 \\, a^{4} r y^{4} - 10 \\, a^{2} r^{3} y^{2} + r^{5}\\right)}}{a^{10} y^{10} + 5 \\, a^{8} r^{2} y^{8} + 10 \\, a^{6} r^{4} y^{6} + 10 \\, a^{4} r^{6} y^{4} + 5 \\, a^{2} r^{8} y^{2} + r^{10}}$</div>","done":false}︡{"done":true}︡
︠da8f1a63-a19c-4419-bd21-8182ee2effe4︠
L[1].factor()
︡12ff9928-4d3f-4cfa-a599-59f9b3ad3942︡{"html":"<div>$-\\frac{8 \\, {\\left(5 \\, a^{4} y^{4} - 10 \\, a^{2} r^{2} y^{2} + r^{4}\\right)} r}{{\\left(a^{2} y^{2} + r^{2}\\right)}^{5}}$</div>","done":false}︡{"done":true}︡
︠517ee502-c483-4e27-a402-24ae4cebcc55︠
L[2]
︡346a5df9-1405-40f9-8cbb-5c22e81da150︡{"html":"<div>$-\\frac{8 \\, {\\left(a^{6} y^{5} - 10 \\, a^{4} r^{2} y^{3} + 5 \\, a^{2} r^{4} y\\right)}}{a^{10} y^{10} + 5 \\, a^{8} r^{2} y^{8} + 10 \\, a^{6} r^{4} y^{6} + 10 \\, a^{4} r^{6} y^{4} + 5 \\, a^{2} r^{8} y^{2} + r^{10}}$</div>","done":false}︡{"done":true}︡
︠8b78f027-8fb2-4bb0-bd6b-50ef825b4046︠
L[2].factor()
︡38e38e6b-80be-4ca5-922c-a67dfb81b540︡{"html":"<div>$-\\frac{8 \\, {\\left(a^{4} y^{4} - 10 \\, a^{2} r^{2} y^{2} + 5 \\, r^{4}\\right)} a^{2} y}{{\\left(a^{2} y^{2} + r^{2}\\right)}^{5}}$</div>","done":false}︡{"done":true}︡
︠9a227ce7-6664-4dd3-8383-e20d800956e8︠
L[3]
︡399addb5-13d1-4836-94a7-c8508b5264de︡{"html":"<div>$0$</div>","done":false}︡{"done":true}︡
︠fae2e4cb-e7d2-4b50-acc3-35fad0d13c69︠
N2pbb = N^2 + b2
V = N2pbb*E - 2*(b.contract(E)*bd).symmetrize() + Ebb*gam + 2*N*(b.contract(epsB).symmetrize())
print V
︡9b5316ca-a1b3-4465-934e-b95ae8610fe0︡
︠36e875d4-ff52-4b93-9b3d-03f8cc0d28fa︠
V[1,1]
︡f18e7847-a45e-45a4-a67f-83b3c6a65be0︡
︠28eb1f39-2956-485d-bcbb-cd757c4bb4b8︠
V[1,1].factor()
︡6274c73d-fa81-4b8c-bcaf-ba65e629164e︡
︠8c5b8523-f8c8-40ce-9b69-028ad07ad193︠
V[1,2]
︡af2f6f89-3911-4bbe-bd25-882309f9d51e︡
︠1444d871-4ca0-4855-9cd8-139b849af87c︠
V[1,2].factor()
︡936c20b1-d0dc-4306-9fed-691e576cf0b0︡
︠d79ed938-b11e-4f19-b10e-0a9ad8c9ae14︠
V[1,3]
︡ec07ff16-1108-4d49-9bfc-5ea829efdc4a︡
︠856b5783-5861-49a2-a527-8ff9af4143bd︠
V[2,2]
︡fe544ca1-1a8f-4d8a-bc83-052a8c60fc2b︡
︠ba127333-531a-4c05-a3ab-da57f84015c7︠
V[2,2].factor()
︡bbe24518-43df-40fe-92b1-0dcd1b9b563c︡
︠bd061366-5cd7-42d2-964d-b59507aedec3︠
V[2,3]
︡f13e5c20-4b19-4b3d-8b15-c6e4215f51ab︡
︠6f022b45-e11c-4d73-b84d-b08417433d59︠
V[3,3]
︡764dbcff-ec06-4059-9537-dd00a1cb69e6︡
︠743d866f-7960-442b-b4e2-93b8265d3b80︠
V[3,3].factor()
︡0d6e8466-b04b-4e21-9e6c-f2a2ef784cb1︡
︠5bff1b95-f374-48ef-8f1f-a012b7b0eb48︠
beps = b.contract(eps)
V_bar = N2pbb*B - 2*(b.contract(B)*bd).symmetrize() + Bbb*gam \
        -2*N*(beps['_il']*Eu['^l_j']).symmetrize()
print V_bar
︡f0edf217-213b-4faa-94f5-e07352a74b66︡
︠1caafe43-c04a-40e3-b9cf-b2b5ffc36e4a︠
V_bar[1,1]
︡bbe7e22e-ef6a-43dd-8df8-1792bb9d8f38︡
︠b9ced511-7502-4932-96bc-37fd7340da23︠
V_bar[1,1].factor()
︡1b9d7463-0a29-4ac9-8252-c46464d3f74d︡
︠db362083-b00e-4016-9530-3464ce61549c︠
V_bar[1,2]
︡e2588a98-947c-4f4b-99db-468779e4efea︡
︠1f80c140-986f-49b7-9803-9dfc42a580ff︠
V_bar[1,2].factor()
︡6755aca4-ffca-490e-8660-6c0379ff5972︡
︠7efe97be-ed07-4c62-85c5-f6c08cdd762e︠
V_bar[1,3]
︡8357fa6c-2f7d-42c8-bc6b-ae6e3cf8494b︡
︠0578c639-4304-4d9b-90b8-d9d67f74e54f︠
V_bar[2,2]
︡f37f5f82-543f-4413-8607-f76cc29132c9︡
︠271cfbcf-7898-4422-9876-9098b36f1da4︠
V_bar[2,2].factor()
︡dcd128ec-eba9-44b2-aaa8-2e4bfb9e694f︡
︠19a4e20d-b135-46ff-a257-013b079c5972︠
V_bar[2,3]
︡0ab9cb59-e101-4580-803c-54addbc8762d︡
︠392f3e29-7a24-48b3-8e65-e47ceb49f3c4︠
V_bar[3,3]
︡035c3f8b-d117-4d4f-86c8-946adc818732︡
︠63f6ac33-afbf-41c0-a0a8-39287b07fc30︠
V_bar[3,3].factor()
︡e2ab466e-2066-4a30-b0e0-c388579722ef︡
︠814240ed-93db-406f-8014-27f5243abb2e︠
G = (N^2 - b2)*gam + bd*bd
print G
︡0934763b-75a8-4ed9-809b-f8a66b84a6b5︡
︠d7e9c4fd-9e86-4af8-a601-956d0f072ba8︠
G.display()
︡d85c5063-bbc6-4aeb-bf15-01c1a3e65ee3︡
︠b8a357a6-8ef3-4bc5-87a6-8090302e0920i︠
%html
<h3>3+1 decomposition of the real part of the Simon-Mars tensor</h3>
<p>We follow Eqs. (77)-(80) of <a href="http://arxiv.org/abs/1412.6542">arXiv:1412.6542</a>:</p>

︡fb0a4169-dc13-48a3-9127-95a3d7674d4d︡︡{"done":true,"html":"<h3>3+1 decomposition of the real part of the Simon-Mars tensor</h3>\n<p>We follow Eqs. (77)-(80) of <a href=\"http://arxiv.org/abs/1412.6542\">arXiv:1412.6542</a>:</p>"}
︠3c9fc088-db94-4dd7-b4c2-f985c6d7d1b3︠
S1 = (4*(V*Z - V_bar*Z_bar) + G*L).antisymmetrize(1,2)
print S1
︡b128004d-6084-4cfd-9621-1cd4e134cb10︡
︠56120dc6-7cf4-4385-97fc-5777b86d5251︠
S1.display()
︡10957b9d-5221-4ea2-896a-1cfba53e1f81︡
︠8a338161-ed4c-4912-ab03-b8283230eb8b︠
S2 = 4*(T*V - T_bar*V_bar - W*Z + W_bar*Z_bar) + M*G - N*bd*L
print S2
︡10d1967f-b36d-41eb-b1c9-1efbe245de8e︡
︠dd0dc96a-ddf5-4514-98e2-cf9153bb54ef︠
S2.display()
︡a24a524c-25ab-44bf-9207-cfffb19485c3︡
︠72a2e746-a220-448b-a74d-3e662bab24ec︠
S3 = (4*(W*Z - W_bar*Z_bar) + N*bd*L).antisymmetrize()
print S3
︡52313bdd-b4cf-48b8-88c4-fd72ca7b871b︡
︠d42c7760-616e-4b0a-89cd-680fe7836ea6︠
S3.display()
︡d3e09649-630c-4a15-8864-5ff584988e15︡
︠f52259ba-c130-40fd-828c-b4a60fa6765b︠
S2[3,1] == -2*S3[3,1]
︡93a5c4aa-aefd-4522-bb36-8730f141fc86︡
︠b44eec44-705a-4992-bd5f-5c2df75a6dc7︠
S2[3,2] == -2*S3[3,2]
︡74d42208-a73f-475b-bc53-63e8bea41d4a︡
︠f7d37dd2-1ccb-4eb3-99b3-6a4cdc2097de︠
S4 = 4*(T*W - T_bar*W_bar) -4*(Y*Z - Y_bar*Z_bar) + N*M*bd - b2*L
print S4
︡0d456e35-8472-46be-8d8e-90a3b729a703︡
︠4c291119-be2c-4097-acf2-8bff25f70550︠
S4.display()
︡77e67d9f-e8ba-49b9-8a8e-cbbaaca17039︡
︠59cb7ba7-a8fa-4e8d-8b79-f0cd75120670i︠
%html
<p>Hence all the tensors $S^1$, $S^2$, $S^3$ and $S^4$ involved in the 3+1 decomposition of the real part of the Simon-Mars are zero, as they should since the Simon-Mars tensor vanishes identically for the Kerr spacetime.</p>

<h3>3+1 decomposition of the imaginary part of the Simon-Mars tensor</h3>

<p>We follow Eqs. (82)-(85) of <a href="http://arxiv.org/abs/1412.6542">arXiv:1412.6542</a>.</p>

︡0d8b800c-4deb-4d46-8f54-5382d592f06b︡︡{"done":true,"html":"<p>Hence all the tensors $S^1$, $S^2$, $S^3$ and $S^4$ involved in the 3+1 decomposition of the real part of the Simon-Mars are zero, as they should since the Simon-Mars tensor vanishes identically for the Kerr spacetime.</p>\n\n<h3>3+1 decomposition of the imaginary part of the Simon-Mars tensor</h3>\n\n<p>We follow Eqs. (82)-(85) of <a href=\"http://arxiv.org/abs/1412.6542\">arXiv:1412.6542</a>.</p>"}
︠b2294127-700d-4f27-ac29-ca57edd8f961︠
epsE = eps['_ijl']*Eu['^l_k']
print epsE
︡6c2f3ec9-519a-46ae-87b7-e3c4b9284c7f︡
︠c2f582be-c42e-4c23-9e1c-e7f4b206becc︠
A = - epsE['_ilk']*b['^l'] - epsE['_ikl']*b['^l'] - Eu['^m_i']*epsb['_mk'] - 2*N*B
xdbB = xdb['_kl']*Bu['^k_i']
L_bar = - 2*N*epsE['_kli']*Dbu['^kl'] + 2*xdb['_ij']*Bub['^j'] + 2*xdbB['_li']*b['^l'] \
    + 2*A['_ik']*(Kub - DNu)['^k']
print L_bar
︡0f4312b5-7130-4c44-83a7-330dbf30304f︡
︠0259c407-a876-44af-a487-3edec06a0ef7︠
L_bar.display()
︡54f3f837-dc1d-4f82-a733-ccb2ac4d7efa︡
︠9b6ed1af-7d62-4b42-9bee-3542a030a1ec︠
S1_bar = (4*(V*Z_bar + V_bar*Z) + G*L_bar).antisymmetrize(1,2)
print S1_bar
︡ceb18aa4-e8ff-436b-825f-d1b927c50603︡
︠0630a1b8-2011-491a-89bf-4e5e0d7d5186︠
S1_bar.display()
︡a8964877-9944-4f5b-aa28-3c744a5b1953︡
︠dc773b83-4e3f-4716-a859-4391813d1082︠
S2_bar = 4*(T_bar*V + T*V_bar) - 4*(W*Z_bar + W_bar*Z) + M_bar*G - N*bd*L_bar
print S2_bar
︡90475a77-bee2-4d55-b15e-4789256768a5︡
︠b0bd0884-9dfa-4878-be63-9c15663185b3︠
S2_bar.display()
︡73288756-1499-4000-9fa3-e3826dc00aa8︡
︠7f863fa2-1c02-435d-80e2-4985e259940b︠
S3_bar = (4*(W*Z_bar + W_bar*Z) + N*bd*L_bar).antisymmetrize()
print S3_bar
︡76267f48-f14a-42b3-9677-d560ce664092︡
︠751d4356-f751-4c6b-9842-075af92627a3︠
S3_bar.display()
︡81c8b9cb-94d2-448d-b840-402c9fd556f2︡
︠922f18d7-2736-46bf-96ae-8f63852c7a07︠
S4_bar = 4*(T_bar*W + T*W_bar - Y*Z_bar - Y_bar*Z) + M_bar*N*bd - b2*L_bar
print S4_bar
︡06645487-f889-4cac-aa5b-d538a62cdfce︡
︠eb9575a5-251d-49dd-a30d-a9de92aabf27︠
S4_bar.display()
︡a4f3d75f-287b-449e-9568-05980564c2d5︡
︠2a501510-96b8-476c-9b4c-1a2434a2fe7ai︠
%html
<p>Hence all the tensors ${\bar S}^1$, ${\bar S}^2$, ${\bar S}^3$ and ${\bar S}^4$ involved in the 3+1 decomposition of the imaginary part of the Simon-Mars are zero, as they should since the Simon-Mars tensor vanishes identically for the Kerr spacetime.</p>

︡7c200938-3469-4dfa-9eab-b113bd9ad5a2︡︡{"done":true,"html":"<p>Hence all the tensors ${\\bar S}^1$, ${\\bar S}^2$, ${\\bar S}^3$ and ${\\bar S}^4$ involved in the 3+1 decomposition of the imaginary part of the Simon-Mars are zero, as they should since the Simon-Mars tensor vanishes identically for the Kerr spacetime.</p>"}
︠132af374-83ba-4dfc-b0e7-54dd036514da︠

︡6bb8bc42-83fc-4875-a72b-db77320250e1︡










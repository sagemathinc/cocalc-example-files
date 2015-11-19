︠36514058-3c58-4e55-a14c-b2de28397a5bas︠
%auto
typeset_mode(True, display=False)
︡b2e21a11-7163-427f-81a6-6e71c51c84d2︡︡{"auto":true}︡{"done":true}
︠57fbbee5-cbd9-40e3-ab9f-be728c6599bfi︠
%html
<h1 style="text-align: center;">Simon-Mars tensor in Curzon-Chazy spacetime</h1>
<p>This worksheet is based on <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.7). It implements the computation of the Simon-Mars tensor of Curzon-Chazy spacetime used in the article <a href="http://arxiv.org/abs/1412.6542">arXiv:1412.6542</a>.</p>
<p>It is released under the GNU General Public License version 2.</p>
<p>(c) Claire Som&eacute;, Eric Gourgoulhon (2015)</p>
<p><em><span style="color: #008080;">The worksheet file in Sage notebook format is</span> <a href="http://sagemanifolds.obspm.fr/examples/sws/SM_Simon-Mars_Curzon-Chazy.sws">here</a>.</em></p>
<h2>Spacetime manifold</h2>
<p>We start by declaring the&nbsp;Curzon-Chazy spacetime as a 4-dimensional manifold:</p>

︡935636e8-9cf2-45c3-86f7-a209171dec52︡︡{"done":true,"html":"<h1 style=\"text-align: center;\">Simon-Mars tensor in Curzon-Chazy spacetime</h1>\n<p>This worksheet is based on <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.7). It implements the computation of the Simon-Mars tensor of Curzon-Chazy spacetime used in the article <a href=\"http://arxiv.org/abs/1412.6542\">arXiv:1412.6542</a>.</p>\n<p>It is released under the GNU General Public License version 2.</p>\n<p>(c) Claire Som&eacute;, Eric Gourgoulhon (2015)</p>\n<p><em><span style=\"color: #008080;\">The worksheet file in Sage notebook format is</span> <a href=\"http://sagemanifolds.obspm.fr/examples/sws/SM_Simon-Mars_Curzon-Chazy.sws\">here</a>.</em></p>\n<h2>Spacetime manifold</h2>\n<p>We start by declaring the&nbsp;Curzon-Chazy spacetime as a 4-dimensional manifold:</p>"}
︠1803ba28-d136-4f61-b8c6-d44953afbb43s︠
M = Manifold(4, 'M', latex_name=r'\mathcal{M}')
print M
︡2622916e-3c8c-42b4-873c-72b160dc615c︡︡{"stdout":"4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠3111f2a1-46b1-4d01-abb9-df0f1ea167d3i︠
%html
<p>We introduce the coordinates $(t,r,y,\phi)$ with $y$ related to the standard <strong>Weyl-Papapetrou coordinates</strong> $(t,r,\theta,\phi)$ by $y=\cos\theta$:</p>

︡e9065465-23f1-4455-8502-e548f726e81e︡︡{"done":true,"html":"<p>We introduce the coordinates $(t,r,y,\\phi)$ with $y$ related to the standard <strong>Weyl-Papapetrou coordinates</strong> $(t,r,\\theta,\\phi)$ by $y=\\cos\\theta$:</p>"}
︠4f46720d-1174-413b-9fb2-2b19336e0802s︠
X.<t,r,y,ph> = M.chart(r't r:(0,+oo) y:(-1,1) ph:(0,2*pi):\phi') 
print X ; X
︡b945fe52-b56d-4910-b4a0-aaefc8e8e633︡︡{"stdout":"chart (M, (t, r, y, ph))\n","done":false}︡{"html":"<div>$\\left(\\mathcal{M},(t, r, y, {\\phi})\\right)$</div>","done":false}︡{"done":true}
︠364ba5ab-1c0a-4d57-8d49-5fa6e87fec62i︠
%html
<h2>Metric tensor</h2>
<p>We declare the only parameter of the Curzon-Chazy spacetime, which is the mass $m$ as a symbolic variable:</p>

︡937ffb05-bf2e-450b-8ee2-270ee20ac846︡︡{"done":true,"html":"<h2>Metric tensor</h2>\n<p>We declare the only parameter of the Curzon-Chazy spacetime, which is the mass $m$ as a symbolic variable:</p>"}
︠270ff48d-90f6-427b-a8a9-1f92cec3a4b2s︠
var('m')
︡8bcef82a-11ca-4950-9b57-827838195d7c︡︡{"html":"<div>$m$</div>","done":false}︡{"done":true}
︠c45f2394-3620-4d73-a947-082ea89fa116i︠
%html
<p>Without any loss of generality, we set $m$ to some specific value (this amounts simply to fixing some length scale):</p>

︡7cb5c90b-7e04-4a88-8565-b3778a630806︡︡{"done":true,"html":"<p>Without any loss of generality, we set $m$ to some specific value (this amounts simply to fixing some length scale):</p>"}
︠8b4799c6-af70-4081-a5be-31603671498cs︠
m = 12
︡8878b318-7d21-4bd1-b8e5-a8945988377e︡︡{"done":true}
︠feffac48-64d2-4f0c-aedb-c38e392add7fi︠
%html
<p>Let us introduce the spacetime metric $g$ and set its components in the coordinate frame associated with Weyl-Papapetrou coordinates:</p>

︡7002803a-d7ef-4301-862a-8a5ba4db5e1e︡︡{"done":true,"html":"<p>Let us introduce the spacetime metric $g$ and set its components in the coordinate frame associated with Weyl-Papapetrou coordinates:</p>"}
︠339e5524-08f4-41c5-a1e8-83f986684e4fs︠
g = M.lorentz_metric('g')
g[0,0] = - exp(-2*m/r)
g[1,1] = exp(2*m/r-m^2*(1-y^2)/r^2)
g[2,2] = exp(2*m/r-m^2*(1-y^2)/r^2)*r^2/(1-y^2)
g[3,3] = exp(2*m/r)*r^2*(1-y^2)
︡182360e5-bc9d-47e7-b340-b8d3a8d597e9︡︡{"done":true}
︠17696dcb-2e27-45cd-b466-74d92fe98868s︠
g[:]
︡846dd692-0d9c-4305-8caa-d1fad46037a2︡︡{"html":"<div>$\\left(\\begin{array}{rrrr}\n-e^{\\left(-\\frac{24}{r}\\right)} &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; e^{\\left(\\frac{144 \\, y^{2}}{r^{2}} + \\frac{24}{r} - \\frac{144}{r^{2}}\\right)} &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; -\\frac{r^{2} e^{\\left(\\frac{144 \\, y^{2}}{r^{2}} + \\frac{24}{r}\\right)}}{y^{2} e^{\\left(\\frac{144}{r^{2}}\\right)} - e^{\\left(\\frac{144}{r^{2}}\\right)}} &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; -r^{2} y^{2} e^{\\frac{24}{r}} + r^{2} e^{\\frac{24}{r}}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠75ff1b1e-0523-4d28-851d-d04a6c5f92f9i︠
%html
<p>The Levi-Civita connection $\nabla$ associated with $g$:</p>

︡12ae77d4-697f-4e54-91af-d7661238f7a7︡︡{"done":true,"html":"<p>The Levi-Civita connection $\\nabla$ associated with $g$:</p>"}
︠4a6b4362-055d-4411-b0c1-2a3abed0cd96s︠
nab = g.connection() ; print nab
︡f3377238-adcc-4c6c-a6a2-fedcf3dae183︡︡{"stdout":"Levi-Civita connection 'nabla_g' associated with the Lorentzian metric 'g' on the 4-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠231038fb-407e-4f00-b0cf-cc1f2cc62d80i︠
%html
<p>As a check, we verify that the covariant derivative of $g$ with respect to $\nabla$ vanishes identically:</p>

︡d11c60c2-4227-4165-a627-960b10364405︡︡{"done":true,"html":"<p>As a check, we verify that the covariant derivative of $g$ with respect to $\\nabla$ vanishes identically:</p>"}
︠86fafcc8-3e4c-415d-bbf4-3eb3581c8e99s︠
nab(g).display()
︡2f714436-7d19-4c89-b8cd-7fc81d881599︡︡{"html":"<div>$\\nabla_{g} g = 0$</div>","done":false}︡{"done":true}
︠9257daf2-9fc7-4996-b67d-ceb14a878971i︠
%html
<h2>Killing vector</h2>
<p>The default vector frame on the spacetime manifold is the coordinate basis associated with Weyl-Papapetrou coordinates:</p>

︡f6934852-b902-42c7-ac8b-e9734b558f68︡︡{"done":true,"html":"<h2>Killing vector</h2>\n<p>The default vector frame on the spacetime manifold is the coordinate basis associated with Weyl-Papapetrou coordinates:</p>"}
︠69c49352-64d2-45fa-b62e-990cb6b0be70s︠
M.default_frame() is X.frame()
︡c4d10f85-157e-4a65-8829-ca625350157e︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠9f019493-1bcb-4529-ac3e-8fba4c61d439s︠
X.frame()
︡abeae06b-3aa7-4344-be65-c19ee2022f6d︡︡{"html":"<div>$\\left(\\mathcal{M} ,\\left(\\frac{\\partial}{\\partial t },\\frac{\\partial}{\\partial r },\\frac{\\partial}{\\partial y },\\frac{\\partial}{\\partial {\\phi} }\\right)\\right)$</div>","done":false}︡{"done":true}
︠0dde29a5-541f-4ee1-a50a-b7c90c681cc7i︠
%html
<p>Let us consider the first vector field of this frame:</p>

︡d2a73911-e77e-4a91-b325-d84da42bfb03︡︡{"done":true,"html":"<p>Let us consider the first vector field of this frame:</p>"}
︠3e28fa6c-6c81-4688-9410-ab1342fac770s︠
xi = X.frame()[0] ; xi
︡eeca8213-e611-42ff-8c73-f69cbc812854︡︡{"html":"<div>$\\frac{\\partial}{\\partial t }$</div>","done":false}︡{"done":true}
︠8d453a0c-3e4f-4586-83c6-e645c0387c03s︠
print xi
︡b35d273c-ede9-45b2-ab01-b96f873714c1︡︡{"stdout":"vector field 'd/dt' on the 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠1effe0c0-a2cf-4692-9897-784455063b90i︠
%html
<p>The 1-form associated to it by metric duality is</p>

︡f2412a87-e9b6-494b-949a-9cfde8f1889c︡︡{"done":true,"html":"<p>The 1-form associated to it by metric duality is</p>"}
︠b13eff10-5177-4e09-b8ed-56df8120f9cbs︠
xi_form = xi.down(g)
xi_form.set_name('xi_form', r'\underline{\xi}')
print xi_form ; xi_form.display()
︡5a0de45d-c07c-4a7f-a8f1-ec32f2cfaa90︡︡{"stdout":"1-form 'xi_form' on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\underline{\\xi} = -e^{\\left(-\\frac{24}{r}\\right)} \\mathrm{d} t$</div>","done":false}︡{"done":true}
︠d5972656-5cf3-4619-9bbe-5e579c13ea04i︠
%html
<p>Its covariant derivative is</p>

︡544b41b5-e9a6-461f-8c8c-f7b68e3dc292︡︡{"done":true,"html":"<p>Its covariant derivative is</p>"}
︠6c682d8f-c76b-4c83-9f8e-5e8787d563e5s︠
nab_xi = nab(xi_form)
print nab_xi ; nab_xi.display()
︡2fa9da89-d866-4b61-adaf-4b4973a8dd6c︡︡{"stdout":"tensor field 'nabla_g xi_form' of type (0,2) on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\nabla_{g} \\underline{\\xi} = -\\frac{12 \\, e^{\\left(-\\frac{24}{r}\\right)}}{r^{2}} \\mathrm{d} t\\otimes \\mathrm{d} r + \\frac{12 \\, e^{\\left(-\\frac{24}{r}\\right)}}{r^{2}} \\mathrm{d} r\\otimes \\mathrm{d} t$</div>","done":false}︡{"done":true}
︠b104907a-2901-42da-a6cc-3bcd503fc203i︠
%html
<p>Let us check that the Killing equation is satisfied:</p>

︡38fc22da-cea1-48f5-9d23-6488a95463d3︡︡{"done":true,"html":"<p>Let us check that the Killing equation is satisfied:</p>"}
︠db43d384-d650-41a0-bd3a-5b282f0b398ds︠
nab_xi.symmetrize().display()
︡20d75325-82ab-4f70-84ef-96ba5a49f8c1︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠27fd170b-a763-41a8-ba30-2a5b02062814i︠
%html
<p>Equivalently, we check that the Lie derivative of the metric along $\xi$ vanishes:</p>

︡f15611d1-f25c-42c3-9d56-302e861acffa︡︡{"done":true,"html":"<p>Equivalently, we check that the Lie derivative of the metric along $\\xi$ vanishes:</p>"}
︠2915bd52-250f-49e5-b6f7-eb6ddf7043a9s︠
g.lie_der(xi).display()
︡37250085-b0fd-45a9-a036-40af18d12546︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠5f9504a5-f8b4-4507-babc-29819a23715ai︠
%html
<p>Thank to Killing equation, $\nabla_g \underline{\xi}$ is antisymmetric. We may therefore define a 2-form by $F := - \nabla_g \xi$. Here we enforce the antisymmetry by calling the function <span style="font-family: courier new,courier;">antisymmetrize()</span> on <span style="font-family: courier new,courier;">nab_xi</span>:</p>

︡133cbf1f-a46a-4a61-a181-6a23e68976de︡︡{"done":true,"html":"<p>Thank to Killing equation, $\\nabla_g \\underline{\\xi}$ is antisymmetric. We may therefore define a 2-form by $F := - \\nabla_g \\xi$. Here we enforce the antisymmetry by calling the function <span style=\"font-family: courier new,courier;\">antisymmetrize()</span> on <span style=\"font-family: courier new,courier;\">nab_xi</span>:</p>"}
︠22cfd51c-8d9f-4a82-9e8a-6bf4be0bb9bcs︠
F = - nab_xi.antisymmetrize()
F.set_name('F')
print F
F.display()
︡e9b5a673-de5b-4c7b-89db-fac2159b3153︡︡{"stdout":"2-form 'F' on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$F = \\frac{12 \\, e^{\\left(-\\frac{24}{r}\\right)}}{r^{2}} \\mathrm{d} t\\wedge \\mathrm{d} r$</div>","done":false}︡{"done":true}
︠bc3fc30c-b5a9-4c7e-9693-f8de818f5f3ai︠
%html
<p>We check that</p>

︡596dfe6b-6cb5-4c81-927a-6a6a1965d720︡︡{"done":true,"html":"<p>We check that</p>"}
︠8eb2af33-491c-4cc2-b763-11a9531571eds︠
F == - nab_xi
︡0bca1476-3c54-41ac-9f8e-bfeb6e3e3ad8︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠01564650-4857-4c8b-8504-59d1302510a0i︠
%html
<p>The squared norm of the Killing vector is</p>

︡9a0bb746-4e61-4214-b479-a10edcd7e8d9︡︡{"done":true,"html":"<p>The squared norm of the Killing vector is</p>"}
︠9d92bc13-1b45-4485-aaed-2c31eab275bcs︠
lamb = - g(xi,xi)
lamb.set_name('lambda', r'\lambda')
print lamb
lamb.display()
︡c5c27d3c-ac6e-4531-b205-faf8cca3484d︡︡{"stdout":"scalar field 'lambda' on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} \\lambda:&amp; \\mathcal{M} &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(t, r, y, {\\phi}\\right) &amp; \\longmapsto &amp; e^{\\left(-\\frac{24}{r}\\right)} \\end{array}$</div>","done":false}︡{"done":true}
︠b6732d86-bfcc-4428-b936-7be568d0ddf4i︠
%html
<p>Instead of invoking $g(\xi,\xi)$, we could have evaluated $\lambda$ by means of the 1-form $\underline{\xi}$ acting on the vector field $\xi$:</p>

︡576b3c7a-9b2d-4047-9a39-2c789b1c7e41︡︡{"done":true,"html":"<p>Instead of invoking $g(\\xi,\\xi)$, we could have evaluated $\\lambda$ by means of the 1-form $\\underline{\\xi}$ acting on the vector field $\\xi$:</p>"}
︠09bc1d06-c311-469a-b633-d1a8473d0a36s︠
lamb == - xi_form(xi)
︡29ccf1d2-c5bc-499c-a88e-46f193e41d90︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠f2113896-bcb4-4408-b799-3b690a8d5659i︠
%html
<p>or we could have used index notation in the form $\lambda = - \xi_a \xi^a$:</p>

︡06610cad-bb11-4e69-ba6c-9951a6ef8020︡︡{"done":true,"html":"<p>or we could have used index notation in the form $\\lambda = - \\xi_a \\xi^a$:</p>"}
︠4650bae9-0aee-433d-85ef-bc8acf29ecfbs︠
lamb == - ( xi_form['_a']*xi['^a'] )
︡dbea00d6-53ff-4de8-928b-d2b70b4b013e︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠4a643f18-a478-4392-8921-c11c17db8aa1i︠
%html
<h2>Curvature</h2>
<p>The Riemann curvature tensor associated with $g$ is</p>

︡c96c2df1-6394-4111-ac09-ae5c015a11c0︡︡{"done":true,"html":"<h2>Curvature</h2>\n<p>The Riemann curvature tensor associated with $g$ is</p>"}
︠76494bc0-4157-4cce-bea7-b84735e46ad6s︠
Riem = g.riemann()
print Riem
︡f852dbfe-a387-4d3d-b31b-a9d3e2bdf27c︡︡{"stdout":"tensor field 'Riem(g)' of type (1,3) on the 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠1483e628-5eb3-4e94-9786-7e63e4da2783i︠
%html
<p>The component $R^0_{\ \, 101} = R^t_{\ \, rtr}$ is</p>

︡86c2f379-a904-4023-8b7a-b2e5df7b22ac︡︡{"done":true,"html":"<p>The component $R^0_{\\ \\, 101} = R^t_{\\ \\, rtr}$ is</p>"}
︠58b949e7-68b5-46f9-96e8-73ac7fe4c438s︠
Riem[0,1,0,1]
︡d773a48f-ddc2-4273-bc70-38bf4b4f580b︡︡{"html":"<div>$\\frac{24 \\, {\\left(r^{2} - 72 \\, y^{2} - 12 \\, r + 72\\right)}}{r^{5}}$</div>","done":false}︡{"done":true}
︠61c1fb34-a600-4c46-ad45-3a042625a55fi︠
%html
<p>while the component $R^2_{\ \, 323} = R^y_{\ \, \phi y \phi}$ is</p>

︡8119a8f8-caae-424e-9be6-46289fb79db5︡︡{"done":true,"html":"<p>while the component $R^2_{\\ \\, 323} = R^y_{\\ \\, \\phi y \\phi}$ is</p>"}
︠043c646c-018b-40e7-9325-251b073ccdc6s︠
Riem[2,3,2,3]
︡ea253272-a8b1-4d85-b78b-c4f568461421︡︡{"html":"<div>$\\frac{24 \\, {\\left(72 \\, y^{4} e^{\\left(\\frac{144}{r^{2}}\\right)} - {\\left(r^{2} - 12 \\, r + 144\\right)} y^{2} e^{\\left(\\frac{144}{r^{2}}\\right)} + {\\left(r^{2} - 12 \\, r + 72\\right)} e^{\\left(\\frac{144}{r^{2}}\\right)}\\right)} e^{\\left(-\\frac{144 \\, y^{2}}{r^{2}}\\right)}}{r^{3}}$</div>","done":false}︡{"done":true}
︠c2f4990b-a86a-4a26-aee4-55321a0022a6i︠
%html
<p>The Ricci tensor:</p>

︡e8b8dcd3-f71c-48da-a971-2984c3b4a16c︡︡{"done":true,"html":"<p>The Ricci tensor:</p>"}
︠7efc26a4-95e0-4a0a-8488-95a609f6dadds︠
Ric = g.ricci()
print Ric
︡2e8692c4-4994-4889-8183-219f642bb06c︡︡{"stdout":"field of symmetric bilinear forms 'Ric(g)' on the 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠f4decf4d-7e4e-427a-8646-8c0765f3963ci︠
%html
<p>Let us check that the Curzon-Chazy metric is a solution of the<strong> vacuum Einstein equation</strong>:</p>

︡85f26087-ed2c-45b6-8459-42499885a8a9︡︡{"done":true,"html":"<p>Let us check that the Curzon-Chazy metric is a solution of the<strong> vacuum Einstein equation</strong>:</p>"}
︠2fbb5277-4260-4cd1-a452-d23c05658089s︠
Ric.display()
︡76e307ea-7d24-4c5d-a35d-ad958ef9e152︡︡{"html":"<div>$\\mathrm{Ric}\\left(g\\right) = 0$</div>","done":false}︡{"done":true}
︠a8e44642-8da6-4b2c-9e90-6dee1e2c3756i︠
%html
<p><span id="cell_outer_24">The Weyl conformal curvature tensor is<br /></span></p>

︡b7762f81-a9c1-450b-be3a-a4829ac48e40︡︡{"done":true,"html":"<p><span id=\"cell_outer_24\">The Weyl conformal curvature tensor is<br /></span></p>"}
︠494e87e5-b49f-4adc-8608-6732b04a3c83s︠
C = g.weyl()
print C
︡2ae74b8a-399e-4978-98ec-c35712749c4c︡︡{"stdout":"tensor field 'C(g)' of type (1,3) on the 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠00de13f5-3946-4fb3-8f39-23344e7e8ff3i︠
%html
<p>Let us exhibit two of its components $C^0_{\ \, 123}$ and $C^0_{\ \, 101}$:</p>

︡08a3a85a-e35d-4887-8e5e-1ab781f78ee8︡︡{"done":true,"html":"<p>Let us exhibit two of its components $C^0_{\\ \\, 123}$ and $C^0_{\\ \\, 101}$:</p>"}
︠58ecc34b-56a6-4e32-9cf7-18a53d821b70s︠
C[0,1,2,3]
︡1b17118a-e3ea-40dd-b50e-ac0524820a45︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠8aa6aebd-a816-46fe-b94e-11a9b2ca1ac7s︠
C[0,1,0,1]
︡1b30fdc8-f3dd-4d0a-b653-1b23f68e4514︡︡{"html":"<div>$\\frac{24 \\, {\\left(r^{2} - 72 \\, y^{2} - 12 \\, r + 72\\right)}}{r^{5}}$</div>","done":false}︡{"done":true}
︠e8deb17e-8b72-49ad-82fa-422769527584i︠
%html
<p>To form the Mars-Simon tensor, we need the fully covariant (type-(0,4) tensor) form of the Weyl tensor (i.e. $C_{\alpha\beta\mu\nu} = g_{\alpha\sigma} C^\sigma_{\ \, \beta\mu\nu}$); we get it by lowering the first index with the metric:</p>

︡eb21c6cb-a0cc-402e-b416-805b1fd2eb88︡︡{"done":true,"html":"<p>To form the Mars-Simon tensor, we need the fully covariant (type-(0,4) tensor) form of the Weyl tensor (i.e. $C_{\\alpha\\beta\\mu\\nu} = g_{\\alpha\\sigma} C^\\sigma_{\\ \\, \\beta\\mu\\nu}$); we get it by lowering the first index with the metric:</p>"}
︠46eaca62-1da4-411c-aef4-b393e8d19542s︠
Cd = C.down(g)
print Cd
︡43550040-3398-4536-bbe8-cd79f15ca2e6︡︡{"stdout":"tensor field of type (0,4) on the 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠91beb1ac-68b6-45df-8b75-e9931783e53di︠
%html
<p>The (monoterm) symmetries of this tensor are those inherited from the Weyl tensor, i.e. the antisymmetry on the last two indices (position 2 and 3, the first index being at position 0):</p>

︡0390f0b6-4668-44a9-b052-afa79f5960bb︡︡{"done":true,"html":"<p>The (monoterm) symmetries of this tensor are those inherited from the Weyl tensor, i.e. the antisymmetry on the last two indices (position 2 and 3, the first index being at position 0):</p>"}
︠758abda1-1f05-4173-b229-4d17d681b022s︠
Cd.symmetries()
︡768f9ccd-499c-46ed-80d5-069da2b343d0︡︡{"stdout":"no symmetry; antisymmetry: (2, 3)\n","done":false}︡{"done":true}
︠8fe9131c-168f-4c22-8a48-f6524d73bbf5i︠
%html
<p>Actually, Cd is also antisymmetric with respect to the first two indices (positions 0 and 1), as we can check:</p>

︡6f202def-76de-4005-9cdd-fd3ca98c9679︡︡{"done":true,"html":"<p>Actually, Cd is also antisymmetric with respect to the first two indices (positions 0 and 1), as we can check:</p>"}
︠15c1917a-3d8d-4022-a8ea-30db1846d95as︠
Cd == Cd.antisymmetrize(0,1)
︡7895e81f-55d8-470e-a319-c8ac146c50b0︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠3995af25-6db0-4e54-9fe7-496078fb5b0ei︠
%html
<p>To take this symmetry into account explicitely, we set</p>

︡3dee89f6-f934-4f19-8163-9ab318b410f5︡︡{"done":true,"html":"<p>To take this symmetry into account explicitely, we set</p>"}
︠baefe6c3-4a39-4454-99fd-947d06f53551s︠
Cd = Cd.antisymmetrize(0,1)
︡f2008525-098d-4ad4-a6cd-148094ab6de7︡︡{"done":true}
︠0f19039d-dc7c-4bce-a1a0-2b3b620ae648i︠
%html
<p>Hence we have now</p>

︡9499f578-75c3-40fe-adb1-fdc4b46f8caa︡︡{"done":true,"html":"<p>Hence we have now</p>"}
︠a1590dd4-04f2-41f6-a54a-f714308f278es︠
Cd.symmetries()
︡2b47835d-2c6c-46de-9545-c15ac8410dd8︡︡{"stdout":"no symmetry; antisymmetries: [(0, 1), (2, 3)]\n","done":false}︡{"done":true}
︠925d54d3-47c8-4b66-b8ad-de1acfcd6108i︠
%html
<h2>Simon-Mars tensor</h2>
<p>The Simon-Mars tensor with respect to the Killing vector $\xi$ is a rank-3 tensor introduced by Marc Mars in 1999 (<a href="http://iopscience.iop.org/0264-9381/16/7/323/">Class. Quantum Grav. <strong>16</strong>, 2507</a>). It has the remarkable property to vanish identically if, and only if, the spacetime $(\mathcal{M},g)$ is locally isometric to a Kerr spacetime.</p>
<p>Let us evaluate the&nbsp;Simon-Mars tensor by following the formulas given in Mars' article. The starting point is the self-dual complex 2-form associated with the Killing 2-form $F$, i.e. the object $\mathcal{F} := F + i \, {}^* F$, where ${}^*F$ is the Hodge dual of $F$:</p>

︡17b5a493-acb5-4073-bc2a-96400c102f0d︡︡{"done":true,"html":"<h2>Simon-Mars tensor</h2>\n<p>The Simon-Mars tensor with respect to the Killing vector $\\xi$ is a rank-3 tensor introduced by Marc Mars in 1999 (<a href=\"http://iopscience.iop.org/0264-9381/16/7/323/\">Class. Quantum Grav. <strong>16</strong>, 2507</a>). It has the remarkable property to vanish identically if, and only if, the spacetime $(\\mathcal{M},g)$ is locally isometric to a Kerr spacetime.</p>\n<p>Let us evaluate the&nbsp;Simon-Mars tensor by following the formulas given in Mars' article. The starting point is the self-dual complex 2-form associated with the Killing 2-form $F$, i.e. the object $\\mathcal{F} := F + i \\, {}^* F$, where ${}^*F$ is the Hodge dual of $F$:</p>"}
︠7a102757-b9be-4c0f-8638-0d15e8c5ef88s︠
FF = F + I * F.hodge_star(g)
FF.set_name('FF', r'\mathcal{F}')
print FF ; FF.display()
︡4e55643c-431a-4547-9a5c-3c5696a332b1︡︡{"stdout":"2-form 'FF' on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\mathcal{F} = \\frac{12 \\, e^{\\left(-\\frac{24}{r}\\right)}}{r^{2}} \\mathrm{d} t\\wedge \\mathrm{d} r -12 i \\mathrm{d} y\\wedge \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠5b591072-0003-412d-985d-406a417ab797i︠
%html
<p>Let us check that $\mathcal{F}$ is self-dual, i.e. that it obeys ${}^* \mathcal{F} = -i \mathcal{F}$:</p>

︡bced88c5-5daf-4004-82d4-4c0b15033cc3︡︡{"done":true,"html":"<p>Let us check that $\\mathcal{F}$ is self-dual, i.e. that it obeys ${}^* \\mathcal{F} = -i \\mathcal{F}$:</p>"}
︠5e2f3527-310a-4062-9eae-528ae95f37bas︠
FF.hodge_star(g) == - I * FF
︡1bc050e3-585e-4ee7-be5d-3852ccb3a52c︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠5181d0fc-fc9d-46f6-930a-b1cd1cdd65eci︠
%html
<p>Let us form the right self-dual of the Weyl tensor as follows</p>
<p>\[\mathcal{C}_{\alpha\beta\mu\nu} = C_{\alpha\beta\mu\nu} + \frac{i}{2} \epsilon^{\rho\sigma}_{\ \ \ \mu\nu} \, C_{\alpha\beta\rho\sigma}\]</p>
<p>where $\epsilon^{\rho\sigma}_{\ \ \ \mu\nu}$ is associated to the Levi-Civita tensor $\epsilon_{\rho\sigma\mu\nu}$ and is obtained by</p>

︡aed89548-0f67-48f8-b77e-294349d88aa0︡︡{"done":true,"html":"<p>Let us form the right self-dual of the Weyl tensor as follows</p>\n<p>\\[\\mathcal{C}_{\\alpha\\beta\\mu\\nu} = C_{\\alpha\\beta\\mu\\nu} + \\frac{i}{2} \\epsilon^{\\rho\\sigma}_{\\ \\ \\ \\mu\\nu} \\, C_{\\alpha\\beta\\rho\\sigma}\\]</p>\n<p>where $\\epsilon^{\\rho\\sigma}_{\\ \\ \\ \\mu\\nu}$ is associated to the Levi-Civita tensor $\\epsilon_{\\rho\\sigma\\mu\\nu}$ and is obtained by</p>"}
︠bb658110-7345-40a2-b658-98936027e3bds︠
eps = g.volume_form(2)  # 2 = the first 2 indices are contravariant
print eps
eps.symmetries()
︡cb4fc43d-b15a-441d-a8ae-47c5e4ba845d︡︡{"stdout":"tensor field of type (2,2) on the 4-dimensional manifold 'M'\n","done":false}︡{"stdout":"no symmetry; antisymmetries: [(0, 1), (2, 3)]\n","done":false}︡{"done":true}
︠477a0f9a-a88a-462d-bc34-7006cbda2605i︠
%html
<p>The right self-dual Weyl tensor is then:</p>

︡65f4dd9d-273d-4fb2-b282-e0b0de7daa6c︡︡{"done":true,"html":"<p>The right self-dual Weyl tensor is then:</p>"}
︠db4cf275-b502-421d-94f5-70935d24e810s︠
CC = Cd + I/2*( eps['^rs_..']*Cd['_..rs'] )
CC.set_name('CC', r'\mathcal{C}') ; print CC
︡122da1fb-e054-4c0c-906c-784b854bcd4b︡︡{"stdout":"tensor field 'CC' of type (0,4) on the 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠1ec16684-4603-4b88-b334-41a10e99f45ds︠
CC.symmetries()
︡2081b252-d331-456f-9c4c-cee58fd6fa59︡︡{"stdout":"no symmetry; antisymmetries: [(0, 1), (2, 3)]\n","done":false}︡{"done":true}
︠854cd536-b52c-4e6a-8f3b-c13b47439b9bs︠
CC[0,1,2,3]
︡3351f10e-4482-4ade-9af6-568a74322fdb︡︡{"html":"<div>$\\frac{24 i \\, r^{2} - 1728 i \\, y^{2} - 288 i \\, r + 1728 i}{r^{3}}$</div>","done":false}︡{"done":true}
︠70dca3ef-84a8-40fc-a762-bd2f41412200i︠
%html
<p>The Ernst 1-form $\sigma_\alpha = 2 \mathcal{F}_{\mu\alpha} \, \xi^\mu$ (0 = contraction on the first index of $\mathcal{F}$):</p>

︡c4a4917c-1041-414a-a412-06f533a8a2cd︡︡{"done":true,"html":"<p>The Ernst 1-form $\\sigma_\\alpha = 2 \\mathcal{F}_{\\mu\\alpha} \\, \\xi^\\mu$ (0 = contraction on the first index of $\\mathcal{F}$):</p>"}
︠32c25cbd-191e-4ca8-93e6-1d72b73a49d8s︠
sigma = 2*FF.contract(0, xi)
︡6ed24176-fba7-4c8c-ba25-3b0741885ab0︡︡{"done":true}
︠e9208b93-a5dd-4c9a-b09c-95e03d42024ai︠
%html
<p>Instead of invoking the function <span style="font-family: courier new,courier;">contract()</span>, we could have used the index notation to denote the contraction:</p>

︡be646c73-e4f8-42a7-9ee2-702c1a1fa595︡︡{"done":true,"html":"<p>Instead of invoking the function <span style=\"font-family: courier new,courier;\">contract()</span>, we could have used the index notation to denote the contraction:</p>"}
︠6f028a1e-a9ec-44c2-8b64-68f5e3a962c6s︠
sigma == 2*( FF['_ma']*xi['^m'] )
︡08f574c2-4b3d-4067-98b1-f18f45ae48dc︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠7f779b44-25dd-4d29-816e-feb845a75658s︠
sigma.set_name('sigma', r'\sigma')
print sigma ; sigma.display()
︡1bec2886-f034-4032-9280-5b7436064f8c︡︡{"stdout":"1-form 'sigma' on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\sigma = \\frac{24 \\, e^{\\left(-\\frac{24}{r}\\right)}}{r^{2}} \\mathrm{d} r$</div>","done":false}︡{"done":true}
︠2045d94a-3923-4b0e-a6c9-b3e9c139e661i︠
%html
<p>The symmetric bilinear form $\gamma = \lambda \, g + \underline{\xi}\otimes\underline{\xi}$:</p>

︡6617d998-eb57-47c0-8c7e-99154be001a2︡︡{"done":true,"html":"<p>The symmetric bilinear form $\\gamma = \\lambda \\, g + \\underline{\\xi}\\otimes\\underline{\\xi}$:</p>"}
︠669eda9e-b73d-41e9-ab14-e6e5a881251es︠
gamma = lamb*g + xi_form * xi_form
gamma.set_name('gamma', r'\gamma')
print gamma ; gamma.display()
︡57c4e84e-d65c-48a9-90ff-509d104cedae︡︡{"stdout":"field of symmetric bilinear forms 'gamma' on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\gamma = e^{\\left(\\frac{144 \\, y^{2}}{r^{2}} - \\frac{144}{r^{2}}\\right)} \\mathrm{d} r\\otimes \\mathrm{d} r + \\left( -\\frac{r^{2} e^{\\left(\\frac{144 \\, y^{2}}{r^{2}}\\right)}}{y^{2} e^{\\left(\\frac{144}{r^{2}}\\right)} - e^{\\left(\\frac{144}{r^{2}}\\right)}} \\right) \\mathrm{d} y\\otimes \\mathrm{d} y + \\left( -r^{2} y^{2} + r^{2} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠2ca3b0f6-faa4-4883-a359-72d59812f65bi︠
%html
<h3>Final computation leading to the Simon-Mars tensor:</h3>
<p>The first part of the Simon-Mars tensor is</p>
<p>\[ S^{(1)}_{\alpha\beta\gamma} = 4 \mathcal{C}_{\mu\alpha\nu\beta} \, \xi^\mu \, \xi^\nu \, \sigma_\gamma\]</p>

︡baf45f01-bb16-449c-87a6-d257919ee466︡︡{"done":true,"html":"<h3>Final computation leading to the Simon-Mars tensor:</h3>\n<p>The first part of the Simon-Mars tensor is</p>\n<p>\\[ S^{(1)}_{\\alpha\\beta\\gamma} = 4 \\mathcal{C}_{\\mu\\alpha\\nu\\beta} \\, \\xi^\\mu \\, \\xi^\\nu \\, \\sigma_\\gamma\\]</p>"}
︠f63b538a-d79c-4f55-a9a8-9f14d040348fs︠
S1 = 4*( CC.contract(0,xi).contract(1,xi) ) * sigma
print S1
︡0aeaf5c9-4233-4f02-a2ca-e1c5afbe09cf︡︡{"stdout":"tensor field of type (0,3) on the 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠9d2d4629-8445-4964-a0cd-a0bd7e6d102ci︠
%html
<p>The second part is the tensor</p>
<p>\[ S^{(2)}_{\alpha\beta\gamma} = - \gamma_{\alpha\beta} \, \mathcal{C}_{\rho\gamma\mu\nu} \, \xi^\rho \, \mathcal{F}^{\mu\nu}\]</p>
<p>which we compute by using the index notation to denote the contractions:</p>

︡61791bd7-f551-43cf-b47a-ef359de6bb8e︡︡{"done":true,"html":"<p>The second part is the tensor</p>\n<p>\\[ S^{(2)}_{\\alpha\\beta\\gamma} = - \\gamma_{\\alpha\\beta} \\, \\mathcal{C}_{\\rho\\gamma\\mu\\nu} \\, \\xi^\\rho \\, \\mathcal{F}^{\\mu\\nu}\\]</p>\n<p>which we compute by using the index notation to denote the contractions:</p>"}
︠e0f2eb8c-8cd6-49db-873e-b45c291d9352︠
FFuu = FF.up(g)
xiCC = CC['_.r..']*xi['^r']
S2 = gamma * ( xiCC['_.mn']*FFuu['^mn'] )
print S2
︡0e36a184-28f6-47de-88ca-32eee7b7cc05︡{"stdout":"tensor field of type (0,3) on the 4-dimensional manifold 'M'\n","done":false}︡{"done":true}︡{"done":true}︡
︠d8ff07e2-fe36-4e71-9904-08d6f0054880︠
S2.symmetries()
︡1416a672-7b92-4617-9d67-11c4fbb9631f︡︡{"stdout":"symmetry: (0, 1); no antisymmetry\n","done":false}︡{"done":true}
︠ca35e021-2c8e-492f-a2aa-432f579617c1i︠
%html
<p>The Mars-Simon tensor with respect to $\xi$ is obtained by antisymmetrizing $S^{(1)}$ and $S^{(2)}$ on their last two indices and adding them:</p>
<div>\[ S_{\alpha\beta\gamma} = S^{(1)}_{\alpha[\beta\gamma]} + S^{(2)}_{\alpha[\beta\gamma]}\]</div>

<p>We use the index notation for the antisymmetrization:</p>

︡f8c3f5ac-15b3-42d9-b7c1-34c6aef93557︡︡{"done":true,"html":"<p>The Mars-Simon tensor with respect to $\\xi$ is obtained by antisymmetrizing $S^{(1)}$ and $S^{(2)}$ on their last two indices and adding them:</p>\n<div>\\[ S_{\\alpha\\beta\\gamma} = S^{(1)}_{\\alpha[\\beta\\gamma]} + S^{(2)}_{\\alpha[\\beta\\gamma]}\\]</div>\n\n<p>We use the index notation for the antisymmetrization:</p>"}
︠b27bbe0f-9525-4ee0-87be-c9bc30a1073as︠
S1A = S1['_a[bc]']
S2A = S2['_a[bc]']
︡8347f731-1851-4ebb-9b2a-f2ebae326bf3︡{"done":true}︡
︠dd395504-381a-4a7a-b7f8-565e53214b3ei︠
%html
<p>An equivalent writing would have been (the last two indices being in position 1 and 2):</p>

︡7a98bd3f-1463-426c-8156-c70725c92c59︡︡{"done":true,"html":"<p>An equivalent writing would have been (the last two indices being in position 1 and 2):</p>"}
︠fd8f0020-b5ec-48a2-89d9-63d5cb706dfds︠
# S1A = S1.antisymmetrize(1,2)
# S2A = S2.antisymmetrize(1,2)
︡91e3094d-2ae1-4777-99c0-11a407b48308︡{"done":true}︡
︠662447f7-c086-4b67-8000-7ffd53f8f0fai︠
%html
<p>The Simon-Mars tensor is</p>

︡354630bd-8da4-4596-ae55-dd119a1b1c8c︡︡{"done":true,"html":"<p>The Simon-Mars tensor is</p>"}
︠8f95ff1a-8dd4-4768-9eb4-57cf99c14de6s︠
S = S1A + S2A
S.set_name('S') ; print S
S.symmetries()
︡2bf34ce4-bd76-4499-ad32-dd036ed2f36e︡︡{"stdout":"tensor field 'S' of type (0,3) on the 4-dimensional manifold 'M'\n","done":false}︡{"stdout":"no symmetry; antisymmetry: (1, 2)\n","done":false}︡{"done":true}
︠ef933719-67cd-4ec7-adb5-b9d6cb5f0864s︠
S.display()
︡9b5c0219-4745-4050-88e8-6922c20e9e84︡︡{"html":"<div>$S = \\frac{41472 \\, y e^{\\left(-\\frac{48}{r}\\right)}}{r^{6}} \\mathrm{d} r\\otimes \\mathrm{d} r\\otimes \\mathrm{d} y -\\frac{41472 \\, y e^{\\left(-\\frac{48}{r}\\right)}}{r^{6}} \\mathrm{d} r\\otimes \\mathrm{d} y\\otimes \\mathrm{d} r -\\frac{41472 \\, e^{\\left(-\\frac{48}{r}\\right)}}{r^{5}} \\mathrm{d} y\\otimes \\mathrm{d} r\\otimes \\mathrm{d} y + \\frac{41472 \\, e^{\\left(-\\frac{48}{r}\\right)}}{r^{5}} \\mathrm{d} y\\otimes \\mathrm{d} y\\otimes \\mathrm{d} r + \\frac{41472 \\, {\\left(y^{4} e^{\\left(\\frac{144}{r^{2}}\\right)} - 2 \\, y^{2} e^{\\left(\\frac{144}{r^{2}}\\right)} + e^{\\left(\\frac{144}{r^{2}}\\right)}\\right)} e^{\\left(-\\frac{144 \\, y^{2}}{r^{2}} - \\frac{48}{r}\\right)}}{r^{5}} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} r\\otimes \\mathrm{d} {\\phi} -\\frac{41472 \\, {\\left(y^{3} e^{\\left(\\frac{144}{r^{2}}\\right)} - y e^{\\left(\\frac{144}{r^{2}}\\right)}\\right)} e^{\\left(-\\frac{144 \\, y^{2}}{r^{2}} - \\frac{48}{r}\\right)}}{r^{4}} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} y\\otimes \\mathrm{d} {\\phi} -\\frac{41472 \\, {\\left(y^{4} e^{\\left(\\frac{144}{r^{2}}\\right)} - 2 \\, y^{2} e^{\\left(\\frac{144}{r^{2}}\\right)} + e^{\\left(\\frac{144}{r^{2}}\\right)}\\right)} e^{\\left(-\\frac{144 \\, y^{2}}{r^{2}} - \\frac{48}{r}\\right)}}{r^{5}} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} r + \\frac{41472 \\, {\\left(y^{3} e^{\\left(\\frac{144}{r^{2}}\\right)} - y e^{\\left(\\frac{144}{r^{2}}\\right)}\\right)} e^{\\left(-\\frac{144 \\, y^{2}}{r^{2}} - \\frac{48}{r}\\right)}}{r^{4}} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} y$</div>","done":false}︡{"done":true}
︠a3120ddb-d51f-4a57-82c2-094b8af9cf0ei︠
%html
<p>Hence the Simon-Mars tensor is not zero: the Curzon-Chazy spacetime is not locally isomorphic to the Kerr spacetime.</p>
<h3>Computation of the Simon-Mars scalars</h3>
<p>First we form the "square" of the Simon-Mars tensor:</p>

︡a6405f51-0dc2-4be2-afc5-f909a8525980︡︡{"done":true,"html":"<p>Hence the Simon-Mars tensor is not zero: the Curzon-Chazy spacetime is not locally isomorphic to the Kerr spacetime.</p>\n<h3>Computation of the Simon-Mars scalars</h3>\n<p>First we form the \"square\" of the Simon-Mars tensor:</p>"}
︠d58cf0a3-8fee-4f2a-af43-81508ec19ab5s︠
Su = S.up(g)
print Su
︡e8bed40b-22e2-4d50-afb5-bd6172e626a7︡︡{"stdout":"tensor field of type (3,0) on the 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠77baa4e8-44b6-4fcf-b1c9-131d4b25518ds︠
SS = S['_ijk']*Su['^ijk']
print SS
︡70cf86b5-74a7-459c-ab00-dfba7848e19b︡︡{"stdout":"scalar field on the 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠7b9c8f9f-134e-4300-8faf-174f98dfadc1s︠
SS.display()
︡401ec652-fa3e-40c7-ba8b-c7925a3a6148︡︡{"html":"<div>$\\begin{array}{llcl} &amp; \\mathcal{M} &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(t, r, y, {\\phi}\\right) &amp; \\longmapsto &amp; -\\frac{6879707136 \\, {\\left(y^{2} e^{\\left(\\frac{432}{r^{2}}\\right)} - e^{\\left(\\frac{432}{r^{2}}\\right)}\\right)} e^{\\left(-\\frac{432 \\, y^{2}}{r^{2}} - \\frac{168}{r}\\right)}}{r^{14}} \\end{array}$</div>","done":false}︡{"done":true}
︠5b6bd216-d4ae-4add-bae8-4940d8b9668cs︠
SSE=SS.expr()
︡f7da5f08-e3a4-4297-8572-6c2b925795b8︡︡{"done":true}
︠c43bebe9-6f3a-4755-bfce-c58fd24309f1i︠
%html
<p>Then we take the real and imaginary part of this compex scalar field. Because this spacetime is spherically symmetric, we expect that the imaginary part vanishes.</p>

︡d81580c5-c286-403f-9698-a555a6d61e6d︡︡{"done":true,"html":"<p>Then we take the real and imaginary part of this compex scalar field. Because this spacetime is spherically symmetric, we expect that the imaginary part vanishes.</p>"}
︠8118580e-74f1-4349-af57-871c9bbc0bfbs︠
SS1 = real(SSE) ; SS1
︡d9d0e797-4b10-4d32-97bd-9ba76bb0daa6︡︡{"html":"<div>$-\\frac{6879707136 \\, y^{2} e^{\\left(-\\frac{432 \\, y^{2}}{r^{2}} - \\frac{168}{r} + \\frac{432}{r^{2}}\\right)}}{r^{14}} + \\frac{6879707136 \\, e^{\\left(-\\frac{432 \\, y^{2}}{r^{2}} - \\frac{168}{r} + \\frac{432}{r^{2}}\\right)}}{r^{14}}$</div>","done":false}︡{"done":true}
︠cec1f9ed-4d2a-4fe4-8e2a-6b9dd668e626s︠
SS2 = imag(SSE) ; SS2
︡81d92a56-c3a5-4189-9cb3-6f9a50261f02︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠2d8ed5df-f186-4204-bdfd-380bb192975bi︠
%html
<p>Furthermore we scale those scalars by the ADM mass of the Curzon-Chazy spacetime, which corresponds to $m$:</p>

︡59552600-c2dc-4b18-81eb-5c9624ec04b5︡︡{"done":true,"html":"<p>Furthermore we scale those scalars by the ADM mass of the Curzon-Chazy spacetime, which corresponds to $m$:</p>"}
︠958dc778-a055-4555-8495-6f20a53546dds︠
SS1ad = m^6*SS1 ; SS1ad
︡84d644e1-39d2-4ba5-ab89-993c6f8faef2︡︡{"html":"<div>$-\\frac{20542695432781824 \\, y^{2} e^{\\left(-\\frac{432 \\, y^{2}}{r^{2}} - \\frac{168}{r} + \\frac{432}{r^{2}}\\right)}}{r^{14}} + \\frac{20542695432781824 \\, e^{\\left(-\\frac{432 \\, y^{2}}{r^{2}} - \\frac{168}{r} + \\frac{432}{r^{2}}\\right)}}{r^{14}}$</div>","done":false}︡{"done":true}
︠0dd93094-cc90-45ea-a238-2b31e5889d30i︠
%html
<p>And we take the log of this quantity</p>

︡1ea06801-20f2-481a-9cf2-54c9dfed5f99︡︡{"done":true,"html":"<p>And we take the log of this quantity</p>"}
︠c63f6678-b8f8-419a-bbe5-40bd0bf5365fs︠
lSS1ad = log(SS1ad,10) ; lSS1ad
︡69bc1874-c335-4c4b-845b-6e67f16335b1︡︡{"html":"<div>$\\frac{\\log\\left(-\\frac{20542695432781824 \\, y^{2} e^{\\left(-\\frac{432 \\, y^{2}}{r^{2}} - \\frac{168}{r} + \\frac{432}{r^{2}}\\right)}}{r^{14}} + \\frac{20542695432781824 \\, e^{\\left(-\\frac{432 \\, y^{2}}{r^{2}} - \\frac{168}{r} + \\frac{432}{r^{2}}\\right)}}{r^{14}}\\right)}{\\log\\left(10\\right)}$</div>","done":false}︡{"done":true}
︠ee183151-9211-44d5-bb3f-1378c178767bi︠
%html
<p>Then we plot the value of this quantity as a function of $\rho = x = r \sqrt{1-y^2}$ and $z = r y$, thereby producing Figure 10 of <a href="http://arxiv.org/abs/1412.6542">arXiv:1412.6542</a>:</p>

︡db3ff6e8-44b4-4e41-ab27-ebbe22cade42︡︡{"done":true,"html":"<p>Then we plot the value of this quantity as a function of $\\rho = x = r \\sqrt{1-y^2}$ and $z = r y$, thereby producing Figure 10 of <a href=\"http://arxiv.org/abs/1412.6542\">arXiv:1412.6542</a>:</p>"}
︠9ada7c8d-da95-4c50-8c60-6862e6f24d4es︠
var('x z')
lSS1xzad = lSS1ad.subs(r=sqrt(x^2+z^2), y = z/sqrt(x^2+z^2)).simplify_full() ; lSS1xzad
︡e002722a-c122-4094-8148-0406d20d252d︡︡{"html":"<div>($x$, $z$)</div>","done":false}︡{"html":"<div>$\\frac{\\log\\left(\\frac{20542695432781824 \\, x^{2} e^{\\left(-\\frac{432 \\, z^{2}}{x^{4} + 2 \\, x^{2} z^{2} + z^{4}} - \\frac{168}{\\sqrt{x^{2} + z^{2}}} + \\frac{432}{x^{2} + z^{2}}\\right)}}{x^{16} + 8 \\, x^{14} z^{2} + 28 \\, x^{12} z^{4} + 56 \\, x^{10} z^{6} + 70 \\, x^{8} z^{8} + 56 \\, x^{6} z^{10} + 28 \\, x^{4} z^{12} + 8 \\, x^{2} z^{14} + z^{16}}\\right)}{\\log\\left(10\\right)}$</div>","done":false}︡{"done":true}
︠4ff53b91-da94-4740-b319-c4da4b2f6ecas︠
S1CC1 = contour_plot(lSS1xzad, (x,-20,20), (z,-20,20), plot_points=200, fill=False, cmap='hsv', linewidths=1, contours=(-14,-13.5,-13,-12.5,-12,-11.5,-11,-10.5,-10,-9.5,-9,-8.5,-8,-7.5,-7,-6.5,-6,-5.5,-5,-4.5,-4,-3.5,-3,-2.5,-2,-1.5,-1,-0.5,0), colorbar=True, colorbar_spacing='uniform', colorbar_format='%1.f', axes_labels=(r"$\rho\,\left[M\right]$", r"$z\,\left[M\right]$"), fontsize=14)
show(S1CC1)
︡e5078723-34f2-4025-a0f2-af4d684a21ee︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"49390b14-a6f0-4eae-959a-4bd65c0a56e4","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/25175/tmp_lx9RIr.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠48c9edaf-594c-4dbb-a5ec-f7389a029bafs︠
plot3d(lSS1xzad, (x,0.12,20), (z,0.12,20), plot_points=100)
︡f974404f-c119-4630-b086-3d80c4a2f75a︡︡{"done":false,"file":{"uuid":"95fb7e13-6294-41f1-bac0-ebfcf452b92b","filename":"95fb7e13-6294-41f1-bac0-ebfcf452b92b.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠f2fbae0e-8194-434d-930b-a112f0428fe2s︠

︡8a44b9cd-a7b8-4cb4-9022-cf128e5b8e24︡︡{"done":true}










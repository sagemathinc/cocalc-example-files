︠b5f7a66e-184d-4d47-ad32-9b6586a05d12a︠
%auto
typeset_mode(True, display=False)
︠9251b803-1c83-476f-9414-be051e54c19di︠
%html
<div id="cell_text_154" class="text_cell">
<h1 style="text-align: center;">Schwarzschild spacetime</h1>
<p>This worksheet demonstrates a few capabilities of <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.8) in computations regarding Schwarzschild spacetime.</p>
<p>It is released under the GNU General Public License version 3.</p>
<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>
<p><em><span style="color: #008080;">The corresponding worksheet file can be downloaded from</span><span style="color: #ff6600;"><span style="color: #0000ff;"> <a href="http://sagemanifolds.obspm.fr/examples/sws/SM_Schwarzschild.sws"><span style="color: #0000ff;">here</span></a></span></span></em></p>
<p><em><span style="color: #ff6600;"><span style="color: #0000ff;"><span style="color: #0000ff;"><br /></span></span></span></em></p>
</div>
<h2>Spacetime manifold</h2>
<p>We declare the Schwarzschild spacetime as a 4-dimensional differentiable manifold:</p>

︡0cac1a20-b79c-4f5a-8114-fb87e3920859︡{"html": "<div id=\"cell_text_154\" class=\"text_cell\">\n<h1 style=\"text-align: center;\">Schwarzschild spacetime</h1>\n<p>This worksheet demonstrates a few capabilities of <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.8) in computations regarding Schwarzschild spacetime.</p>\n<p>It is released under the GNU General Public License version 3.</p>\n<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>\n<p><em><span style=\"color: #008080;\">The corresponding worksheet file can be downloaded from</span><span style=\"color: #ff6600;\"><span style=\"color: #0000ff;\"> <a href=\"http://sagemanifolds.obspm.fr/examples/sws/SM_Schwarzschild.sws\"><span style=\"color: #0000ff;\">here</span></a></span></span></em></p>\n<p><em><span style=\"color: #ff6600;\"><span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\"><br /></span></span></span></em></p>\n</div>\n<h2>Spacetime manifold</h2>\n<p>We declare the Schwarzschild spacetime as a 4-dimensional differentiable manifold:</p>"}︡
︠1ebb3139-98b8-482b-b792-1b7f2cc2fb63︠
M = Manifold(4, 'M', r'\mathcal{M}') ; M
︡9a011c3d-1793-4005-abe0-82bf5b35eca8︡︡
︠72ba23cd-21eb-4fba-b32d-1035adf93178︠
print M
︡e1fbc53b-4726-4549-8846-bf45a26ac2a5︡︡
︠6da2a077-3b65-4d7a-b494-f9f90f121396i︠
%html
<p>The spacetime manifold $\mathcal{M}$ can be split into 4 regions, corresponding to the 4 quadrants in the Kruskal diagram.Let us denote by $\mathcal{R}_{\mathrm{I}}$ to $\mathcal{R}_{\mathrm{IV}}$ the interiors of these 4 regions. $\mathcal{R}_{\mathrm{I}}$ and&nbsp; $\mathcal{R}_{\mathrm{III}}$&nbsp; are asymtotically flat regions outside the event horizon;&nbsp; $\mathcal{R}_{\mathrm{II}}$ is inside the future event horizon and $\mathcal{R}_{\mathrm{IV}}$ is inside the past event horizon.</p>

︡ee8d62e8-f8bb-483c-a745-26fe6f6bfde2︡{"html": "<p>The spacetime manifold $\\mathcal{M}$ can be split into 4 regions, corresponding to the 4 quadrants in the Kruskal diagram.Let us denote by $\\mathcal{R}_{\\mathrm{I}}$ to $\\mathcal{R}_{\\mathrm{IV}}$ the interiors of these 4 regions. $\\mathcal{R}_{\\mathrm{I}}$ and&nbsp; $\\mathcal{R}_{\\mathrm{III}}$&nbsp; are asymtotically flat regions outside the event horizon;&nbsp; $\\mathcal{R}_{\\mathrm{II}}$ is inside the future event horizon and $\\mathcal{R}_{\\mathrm{IV}}$ is inside the past event horizon.</p>"}︡
︠cf03cfe4-b217-4f23-8d71-2870855b33c7︠
regI = M.open_subset('R_I', r'\mathcal{R}_{\mathrm{I}}')
regII = M.open_subset('R_II', r'\mathcal{R}_{\mathrm{II}}')
regIII = M.open_subset('R_III', r'\mathcal{R}_{\mathrm{III}}')
regIV = M.open_subset('R_IV', r'\mathcal{R}_{\mathrm{IV}}')
regI, regII, regIII, regIV
︡0d1ca148-78dd-4ecc-ab39-97e77966bc1c︡︡
︠e9d9cc31-8f3d-4dc7-8379-25ceddf3cf73i︠
%html
<p><span id="cell_outer_8">The parameter $m$ of </span><span id="cell_outer_8">the Schwarzschild spacetime is declared as a symbolic variable:</span></p>

︡679bde30-26d4-4e34-8684-39eb539a7326︡{"html": "<p><span id=\"cell_outer_8\">The parameter $m$ of </span><span id=\"cell_outer_8\">the Schwarzschild spacetime is declared as a symbolic variable:</span></p>"}︡
︠9a32594f-7ec4-468a-9129-0fd19de97fa5︠
m = var('m') ; assume(m>=0)
︡59aa915b-0619-4bbb-85a5-1563cb16871f︡︡
︠8f6e12f4-2d28-4304-b833-b67106e33179i︠
%html
<h2>Boyer-Lindquist coordinates</h2>
<p>The standard Boyer-Lindquist coordinates (also called Schwarzschild coordinates) are defined on $\mathcal{R}_{\mathrm{I}}\cup \mathcal{R}_{\mathrm{II}}$</p>

︡2b75d1e7-95f5-496a-9b74-b4fb306b612d︡{"html": "<h2>Boyer-Lindquist coordinates</h2>\n<p>The standard Boyer-Lindquist coordinates (also called Schwarzschild coordinates) are defined on $\\mathcal{R}_{\\mathrm{I}}\\cup \\mathcal{R}_{\\mathrm{II}}$</p>"}︡
︠5977cc89-9f18-40e9-bab4-6aba44ddd49d︠
regI_II = regI.union(regII) ; regI_II
︡c8d8fa1e-64c9-4e7b-987d-6433868e7ec7︡︡
︠35c52ffe-531b-472b-8a06-736bb5f2c3ae︠
X.<t,r,th,ph> = regI_II.chart(r't r:(0,+oo) th:(0,pi):\theta ph:(0,2*pi):\phi')
print X
︡924dedcd-e9c4-431d-8b94-051aa14b8b9e︡︡
︠2243c292-04b9-43b4-ac10-93e0707b52a9︠
X
︡ad6fd237-4338-4d3f-be28-8d9800107766︡︡
︠fe26743d-ffd1-4899-b826-adcce06bfc22i︠
%html
<p>We naturally introduce two subcharts as the restrictions of the chart $X$ to regions $\mathcal{R}_{\mathrm{I}}$ and $\mathcal{R}_{\mathrm{II}}$ respectively. Since, in terms of the Boyer-Lindquist coordinates, $\mathcal{R}_{\mathrm{I}}$ (resp. $\mathcal{R}_{\mathrm{II}}$) is defined by $r&gt;2m$ (resp. $r&lt;2m$), we set</p>

︡c5e7561c-96c6-467b-bea7-5a438f21bc39︡{"html": "<p>We naturally introduce two subcharts as the restrictions of the chart $X$ to regions $\\mathcal{R}_{\\mathrm{I}}$ and $\\mathcal{R}_{\\mathrm{II}}$ respectively. Since, in terms of the Boyer-Lindquist coordinates, $\\mathcal{R}_{\\mathrm{I}}$ (resp. $\\mathcal{R}_{\\mathrm{II}}$) is defined by $r&gt;2m$ (resp. $r&lt;2m$), we set</p>"}︡
︠ae1f7f95-1304-4ec4-a373-955617eb64e3︠
X_I = X.restrict(regI, r>2*m) ; X_I
︡6eff9f50-4d0e-41e9-91d3-cbcc77574599︡︡
︠ff4db306-6689-44b2-bc14-045715bd5f65︠
X_II = X.restrict(regII, r<2*m) ; X_II
︡55312509-4c22-4e2f-a36b-ee1f5d365f06︡︡
︠5dee0e1d-ed6d-4c17-a3d0-cabd7998a1a5i︠
%html
<p>At this stage, the manifold's atlas has 3 charts:</p>

︡fcf4ed35-9764-44e8-b74c-8d3c7ac63d65︡{"html": "<p>At this stage, the manifold's atlas has 3 charts:</p>"}︡
︠c4a42bad-4bef-4b42-b9a8-74cc8ec2a56b︠
M.atlas()
︡4fd6390d-cec1-42bb-a143-6b21c3198a28︡︡
︠46467f3b-22d7-442b-8b71-e82470a86192︠
M.default_chart()
︡421f9c52-650b-4d20-b385-447f1575f88c︡︡
︠dda50b9f-8c97-4b16-a8ff-b73e27f5fe78i︠
%html
<p>Three vector frames have been defined on the manifold: the three coordinate frames:</p>

︡d3cdc63f-ed30-4d94-9b20-ad3966848f9a︡{"html": "<p>Three vector frames have been defined on the manifold: the three coordinate frames:</p>"}︡
︠5036e1f2-b2ab-41b5-b872-72bd19e20255︠
M.frames()
︡d64b74cb-6c57-43c5-81b2-e4f0e79cacea︡︡
︠fc462bf1-7b39-48ca-8867-920641aed8d7︠
print M.default_frame()
︡4046d26f-9352-4157-8b67-02b791292953︡︡
︠3ad93563-ca84-44a3-8552-ad346268c62e︠
M.default_frame().domain()
︡94662c73-372b-428c-8cf1-4dbee708e138︡︡
︠809077e2-2ba4-4f99-aced-d1a23badc744i︠
%html
<h2>Metric tensor</h2>
<p>The metric tensor is defined as follows:</p>

︡2cfc46b9-7f0e-4fc1-a7c2-22919b24055b︡{"html": "<h2>Metric tensor</h2>\r\n<p>The metric tensor is defined as follows:</p>"}︡
︠f2c7a87c-42d5-4477-a96e-279ccc9f75b6︠
g = M.lorentz_metric('g')
︡2ca0c743-71c4-4c92-ba71-cf10bc00459b︡︡
︠8ac90b5c-a3ed-4fe9-ba67-3160de02369ei︠
%html
<p><span>The metric tensor is set by its components in the coordinate frame associated with Schwarzschild coordinates, which is the current manifold's default frame:</span></p>

︡b9a958c6-deb9-4c44-87c3-1e20c8c5cc08︡{"html": "<p><span>The metric tensor is set by its components in the coordinate frame associated with Schwarzschild coordinates, which is the current manifold's default frame:</span></p>"}︡
︠e014c9b0-4adc-44f4-b752-03ccc3ec5d2c︠
g[0,0], g[1,1] = -(1-2*m/r), 1/(1-2*m/r)
g[2,2], g[3,3] = r^2, (r*sin(th))^2
︡f367b340-1b62-4595-a6b2-044521d2e4cc︡︡
︠c436b117-4b27-47e1-bb3f-ba6237840ee7︠
g.display()
︡2aa76366-bacc-4829-9a86-bdbac7f9cdf6︡︡
︠130df1f8-01e8-4e99-abf7-86eb687796f3i︠
%html
<p>As an example, let us consider a vector field defined only on $\mathcal{R}_{\mathrm{I}}$:</p>

︡e3bb0b30-17b4-4ebf-a576-f9577038c6a4︡{"html": "<p>As an example, let us consider a vector field defined only on $\\mathcal{R}_{\\mathrm{I}}$:</p>"}︡
︠3a421955-dd31-4868-9c73-573f3e80cffc︠
v = regI.vector_field('v')
v[0] = 1
v[1] = 1 - 2*m/r
# unset components are zero   
v.display()
︡f762ac05-4deb-4579-adcc-d6eadc7e80ec︡︡
︠5d5e6404-3ca3-4c3c-9a42-1b9f9ba34cd7︠
v.domain()
︡88b569aa-e573-45dc-9db5-f2d87e8ee6ae︡︡
︠498d0179-e612-44a5-a6f8-8da3d17bf66c︠
g.domain()
︡71f3f3b6-e762-4fda-94cb-0b419a540d27︡︡
︠1534c26a-c7a8-4425-902b-597872c455d4i︠
%html
<p>Since $\mathcal{R}_{\mathrm{I}}\subset \mathcal{M}$, it is possible to apply $g$ to $v$:</p>

︡24a6c81b-7d7f-4883-80a9-8a0634c52697︡{"html": "<p>Since $\\mathcal{R}_{\\mathrm{I}}\\subset \\mathcal{M}$, it is possible to apply $g$ to $v$:</p>"}︡
︠3db48fcd-19da-4fb7-ab84-0ec7c4a4e1eb︠
s = g(v,v) ; print s
︡84c1a403-6604-49c5-9d2c-98ba601ef3c0︡︡
︠6917864f-f3af-4a7f-938f-53eee434550b︠
s.display() # v is indeed a null vector
︡e265313e-9ca1-42d2-820e-1e7013daa6a6︡︡
︠3e35084b-679e-4089-a87d-d5c9650ee928i︠
%html
<div id="cell_text_59" class="text_cell">
<h2>Levi-Civita Connection</h2>
</div>
<div id="insert_new_cell_before27" class="insert_new_cell">&nbsp;</div>
<div id="cell_text_27" class="text_cell">
<p>The Levi-Civita connection $\nabla$ associated with $g$:</p>
</div>

︡33c6a821-89b3-4a4c-a976-233fb1960238︡{"html": "<div id=\"cell_text_59\" class=\"text_cell\">\r\n<h2>Levi-Civita Connection</h2>\r\n</div>\r\n<div id=\"insert_new_cell_before27\" class=\"insert_new_cell\">&nbsp;</div>\r\n<div id=\"cell_text_27\" class=\"text_cell\">\r\n<p>The Levi-Civita connection $\\nabla$ associated with $g$:</p>\r\n</div>"}︡
︠0c175250-9fa5-4ea8-ae1a-2dc25a416c4e︠
nab = g.connection() ; print nab
︡3a28c22c-f89a-41af-a325-3f282ff48b8b︡︡
︠63fd7053-98f6-42b2-9dd2-393cbad346e8i︠
%html
<p>Let us verify that the covariant derivative of $g$ with respect to $\nabla$ vanishes identically:</p>

︡0235c657-d965-429b-9f82-fcb7e46d7bde︡{"html": "<p>Let us verify that the covariant derivative of $g$ with respect to $\\nabla$ vanishes identically:</p>"}︡
︠91c6608c-d751-4f9b-9522-b28547a6b4e3︠
nab(g) == 0
︡af0618c1-fdc7-4f7a-a51b-50c834d58682︡︡
︠17b7ca9f-4685-46a2-be17-9a602be4c04a︠
nab(g).display()
︡817de9cb-1836-4d73-8730-99f03247843b︡︡
︠fc570666-a551-4e24-89ca-c6199f6b8a38i︠
%html
<p>The nonzero Christoffel symbols of $g$ with respect to Schwarzschild coordinates, skipping those that can be deduced by symmetry:</p>

︡634c4144-fa3a-4ede-a6b2-f1f460c0b0eb︡{"html": "<p>The nonzero Christoffel symbols of $g$ with respect to Schwarzschild coordinates, skipping those that can be deduced by symmetry:</p>"}︡
︠4521e046-d7b3-44f6-9de8-991c3596c7ed︠
g.christoffel_symbols_display()
︡21c974ac-5587-4c6d-8993-d5fa23f224cf︡︡
︠d1a07048-ed51-4ccf-b233-e24730f0f688i︠
%html
<h2>Curvature</h2>

<p>The Riemann curvature tensor associated with $g$:</p>

︡30c01f1e-8f61-4ebb-8bb2-80decf6b88df︡{"html": "<h2>Curvature</h2>\r\n\r\n<p>The Riemann curvature tensor associated with $g$:</p>"}︡
︠c2385ff1-f598-40ec-ad95-0e6b9305d1ea︠
R = g.riemann() ; print R
︡2102048f-15dc-454b-bce7-67f12e1bd741︡︡
︠dca83f7d-ba3b-47f1-9faf-61868568a20ei︠
%html
<p>The Weyl conformal tensor associated with $g$:</p>

︡98234d6f-a908-4dde-8e12-a9efeb9f497c︡{"html": "<p>The Weyl conformal tensor associated with $g$:</p>"}︡
︠2bb2616f-08ae-4241-b036-7976d1a53f11︠
C = g.weyl() ; print C
︡9281e2d8-6184-4bcc-b415-81129d89fd6c︡︡
︠79b26346-31e6-46d0-9fd7-04e187a570ee︠
C.display()
︡626eb97e-97d5-48be-9957-3432d0393149︡︡
︠27bfe342-1674-49d7-be4a-dbe66c1ea458i︠
%html
<p>The Ricci tensor associated with $g$:</p>

︡6568e2ed-ad84-4e39-b470-f956519a03bc︡{"html": "<p>The Ricci tensor associated with $g$:</p>"}︡
︠182c4a58-270c-4531-ac3d-7aaacbeaf5fa︠
Ric = g.ricci() ; print Ric
︡520e3f2d-86cc-4140-8ba6-cdbee4cc7b6d︡︡
︠add0be35-cfa1-4ae9-8d35-92d4fef0ff0bi︠
%html
<h3>Einstein equation</h3>
<p>Let us check that the Schwarzschild metric is a solution of the vacuum Einstein equation:</p>

︡18729711-d72f-4185-9a94-e4e37ba683da︡{"html": "<h3>Einstein equation</h3>\r\n<p>Let us check that the Schwarzschild metric is a solution of the vacuum Einstein equation:</p>"}︡
︠9ae6ff28-d59e-4f67-b02f-0cf479c08719︠
Ric == 0
︡ae7f72c8-96b3-4e33-b144-023547dfc6f6︡︡
︠37b81a41-8ad6-4783-b97f-33bc28484684︠
Ric.display() # another view of the above
︡d1ea7192-dd5c-4e71-b29d-8d14448ae8b8︡︡
︠4150dfa7-4a2b-4cb9-a358-a71760e41148i︠
%html
<p>Contrary to the Ricci tensor, the Riemann tensor does not vanish:</p>

︡27518ac3-25fb-4fa7-9fe1-8cd77c30b060︡{"html": "<p>Contrary to the Ricci tensor, the Riemann tensor does not vanish:</p>"}︡
︠a4da7912-dbdf-4bc8-bf1e-cc126a4444f5︠
R[:]
︡f426b3d0-c1f8-48a5-b6e7-cd10f1715d91︡︡
︠bb36b951-6cbc-4753-89b7-16f081b232f2︠
R.display()
︡ab86dd96-f403-49b6-a5d3-9f9c8a86d2cb︡︡
︠acdc3e8e-2e2e-47df-8c4f-0375d0d0e510i︠
%html
<p>The nonzero components of the Riemann tensor, skipping those that can be deduced by antisymmetry:</p>

︡bd472f3d-18d6-4c9c-be68-1d8d67812598︡{"html": "<p>The nonzero components of the Riemann tensor, skipping those that can be deduced by antisymmetry:</p>"}︡
︠79054dae-1284-40ef-9656-67c783dc9686︠
R.display_comp(only_nonredundant=True)
︡be467c74-66d4-49dc-b5df-d0bace72aa48︡︡
︠9a1b6b7d-9612-44a9-874b-7059816ba39f︠
Ric[:]
︡0424e585-db97-4905-9b70-17d06a85707d︡︡
︠f83b7515-1438-4edf-980a-4705be8c1a23i︠
%html
<p>Since the Ricci tensor is zero, the Weyl tensor is of course equal to the Riemann tensor:</p>

︡06f77a07-de38-46cb-b574-6f8df61d7759︡{"html": "<p>Since the Ricci tensor is zero, the Weyl tensor is of course equal to the Riemann tensor:</p>"}︡
︠6249d127-ae9a-417c-b081-51fadaabe6c5︠
C == R
︡1a10dca4-e976-41be-ad7f-71a949043613︡︡
︠e6dc10e9-86ec-4443-a871-8846206fcf74i︠
%html
<h3>Bianchi identity</h3>

<p>Let us check the Bianchi identity $\nabla_p R^i_{\ \, j kl} + \nabla_k R^i_{\ \, jlp} + \nabla_l R^i_{\ \, jpk} = 0$:</p>

︡e0e987c9-6f78-441b-92fa-d5f7e933ed1e︡{"html": "<h3>Bianchi identity</h3>\r\n\r\n<p>Let us check the Bianchi identity $\\nabla_p R^i_{\\ \\, j kl} + \\nabla_k R^i_{\\ \\, jlp} + \\nabla_l R^i_{\\ \\, jpk} = 0$:</p>"}︡
︠7e22128b-9ded-4555-947f-3d33257e1af6︠
DR = nab(R) ; print DR
︡def54937-1e32-41ba-9a0d-c66904304116︡︡
︠e8a56567-d43d-4843-8c6e-0c1c68c674fb︠
for i in M.irange():
    for j in M.irange():
        for k in M.irange():
            for l in M.irange():
                for p in M.irange():
                    print DR[i,j,k,l,p] + DR[i,j,l,p,k] + DR[i,j,p,k,l] ,
︡cd386677-e121-41a2-a4c0-59b620f31013︡︡
︠e0ed9a48-116b-4678-a66a-389ed0630140i︠
%html
<p>Let us check that if we turn the first $+$ sign into a $-$ one, the Bianchi identity does no longer hold:</p>

︡0fa05cad-b9be-4c23-938f-6ae884527172︡{"html": "<p>Let us check that if we turn the first $+$ sign into a $-$ one, the Bianchi identity does no longer hold:</p>"}︡
︠a66942dd-8c53-4b06-8194-53a8fb6a73c3︠
for i in M.irange():
    for j in M.irange():
        for k in M.irange():
            for l in M.irange():
                for p in M.irange():
                    print DR[i,j,k,l,p] - DR[i,j,l,p,k] + DR[i,j,p,k,l] ,
︡067af249-4e74-4dd5-9774-55fba0553ae8︡︡
︠22475206-c205-4bc6-b893-d6dbbdaab717i︠
%html
<h3>Kretschmann scalar</h3>
<p>Let us first introduce tensor $R^\flat$, of components $R_{ijkl} = g_{ip} R^p_{\ \, jkl}$:</p>

︡ccdcddc9-00ff-472a-ada7-4d918e4b3fdf︡{"html": "<h3>Kretschmann scalar</h3>\r\n<p>Let us first introduce tensor $R^\\flat$, of components $R_{ijkl} = g_{ip} R^p_{\\ \\, jkl}$:</p>"}︡
︠dad7402f-1e7b-428f-a4a6-169191d515ff︠
dR = R.down(g) ; print dR
︡c4a9eba8-473f-4774-bc54-d24b8f62ed26︡︡
︠937bb887-cebe-424a-8e41-fde9383f7611i︠
%html
<p>and tensor $R^\sharp$, of components $R^{ijkl} = g^{jp} g^{kq} g^{lr} R^i_{\ \, pqr}$:</p>

︡a227a2af-d910-4a25-85f0-337807e72a6e︡{"html": "<p>and tensor $R^\\sharp$, of components $R^{ijkl} = g^{jp} g^{kq} g^{lr} R^i_{\\ \\, pqr}$:</p>"}︡
︠9fa23f49-ade9-4abe-8035-5296c6cebaeb︠
uR = R.up(g) ; print uR
︡41f690bb-4ef4-4b1b-b75c-70c09a8dda07︡︡
︠c9244608-02e8-4668-b2d2-988220acc839i︠
%html
<p>The Kretschmann scalar is $K := R^{ijkl} R_{ijkl}$:</p>

︡b9bdf246-beed-4d21-bbb0-39f3bb4c4671︡{"html": "<p>The Kretschmann scalar is $K := R^{ijkl} R_{ijkl}$:</p>"}︡
︠50d19b26-b864-4280-bfc0-7543b645a485︠
Kr = 0
for i in M.irange():
    for j in M.irange():
        for k in M.irange():
            for l in M.irange():
                Kr += uR[i,j,k,l]*dR[i,j,k,l]
Kr
︡a8fdf1c6-93ae-4383-96f9-e29ec337dfa8︡︡
︠13fba830-6e72-42e1-ba17-24859be6f1d3i︠
%html
<p>Instead of the above loops, the Kretschmann scalar can also be computed by means of the contract() method, asking that the contraction takes place on all indices (positions 0, 1, 2, 3):</p>

︡12550908-a8c0-4d6b-8501-b2a35d137438︡{"html": "<p>Instead of the above loops, the Kretschmann scalar can also be computed by means of the contract() method, asking that the contraction takes place on all indices (positions 0, 1, 2, 3):</p>"}︡
︠e19e3331-6730-4ab1-a5d9-7ef8b825ee66︠
Kr = uR.contract(0, 1, 2, 3, dR, 0, 1, 2, 3)
Kr.expr()
︡c000a7f9-9f91-45df-8450-c6e3995e3264︡︡
︠98a2cc4f-65af-4468-9dc7-32c6aad81568i︠
%html
<p>The contraction can also be performed by means of index notations:</p>

︡402485d3-4089-4966-b024-5fae7f47a871︡{"html": "<p>The contraction can also be performed by means of index notations:</p>"}︡
︠f430869a-f0fe-42c5-a7d3-c6516c04c8ab︠
Kr = uR['^{ijkl}']*dR['_{ijkl}']
Kr.expr()
︡d0fa8f7c-4ebe-4dd7-92a4-2584b95b4623︡︡
︠0c9f6f1a-504c-4ae5-9aad-ca5192cf5547i︠
%html
<h2>Eddington-Finkelstein coordinates</h2>
<p>Let us introduce new coordinates on the spacetime manifold: the ingoing Eddington-Finkelstein ones:</p>

︡01aed4f8-c459-4113-98dd-261b24b914c1︡{"html": "<h2>Eddington-Finkelstein coordinates</h2>\r\n<p>Let us introduce new coordinates on the spacetime manifold: the ingoing Eddington-Finkelstein ones:</p>"}︡
︠58f85ed3-3ec6-43a5-b02e-9a04787f557c︠
X_EF.<v,r,th,ph> = regI_II.chart(r'v r:(0,+oo) th:(0,pi):\theta ph:(0,2*pi):\varphi')
print X_EF ; X_EF
︡ea42491e-6379-401e-b076-c2ec62d456bd︡︡
︠1e37e3c1-fd97-413c-baf0-5858ecf81e7ai︠
%html
<p>The change from Schwarzschild (Boyer-Lindquist) coordinates to the ingoing Eddington-Finkelstein ones:</p>

︡5f90b031-437e-4b5e-8582-51b63c09db50︡{"html": "<p>The change from Schwarzschild (Boyer-Lindquist) coordinates to the ingoing Eddington-Finkelstein ones:</p>"}︡
︠b6eb2e86-e87b-4a4b-bf35-6865cef7b371︠
ch_BL_EF_I = X_I.transition_map(X_EF, [t+r+2*m*ln(r/(2*m)-1), r, th, ph], restrictions2=r>2*m)
︡e35ae299-f628-43f3-bcc7-24ae552f426e︡︡
︠3b37528b-839d-492d-bf40-9c87b310c301︠
print ch_BL_EF_I ; ch_BL_EF_I
︡b9a45084-3c20-469e-8b3b-226ae616db27︡︡
︠3359068a-ff8c-4da6-bfc4-96e8a0dd45c0︠
ch_BL_EF_I.display()
︡1a226b04-466f-4f05-b8e7-ffcf0df31b56︡︡
︠69995e7f-c595-4ec9-900e-3664d135279a︠
X_EF_I = X_EF.restrict(regI) ; X_EF_I
︡0234b989-f23d-455f-827e-2805c79f9fe5︡︡
︠66b67995-a5b0-4800-85ee-10d3348d9e43︠
ch_BL_EF_II = X_II.transition_map(X_EF, [t+r+2*m*ln(1-r/(2*m)), r, th, ph], restrictions2=r<2*m)
︡08dc8007-423c-4324-be7a-362389ce7b16︡︡
︠ecd79324-2f72-452f-ad81-2c41ce6eb0cc︠
print ch_BL_EF_II ; ch_BL_EF_II
︡8ee0e6fa-5efd-4551-91ee-bae8a6fc9eb6︡︡
︠d480c240-4938-4104-a9e1-70823ff77c43︠
ch_BL_EF_II.display()
︡3e9efcf7-35bc-4a1b-b7a4-5fd74c4c8214︡︡
︠000b381e-b4f3-4f90-8ff0-540b4a0f62a7︠
X_EF_II = X_EF.restrict(regII) ; X_EF_II
︡67ecde1d-9834-4b78-9537-b1fa3470c4c1︡︡
︠eb92d177-2cbd-4060-bccc-28af35f053a8i︠
%html
<p>The manifold's atlas has now 6 charts:</p>

︡75419061-8099-4b6e-bb6e-3a06e26e8d27︡{"html": "<p>The manifold's atlas has now 6 charts:</p>"}︡
︠bdd8b281-c38e-4e4f-ac2c-3e6c03474d8f︠
M.atlas()
︡4bf5903e-1632-48ef-a47a-09c9fc2780fb︡︡
︠a34dff78-b62d-42a8-bce9-26670b0635f0i︠
%html
<p>The default chart is 'BL':</p>

︡566d4966-5a8e-4d07-8014-af94b4dbf6d3︡{"html": "<p>The default chart is 'BL':</p>"}︡
︠e8e19883-39cf-4559-8072-531989fa590d︠
M.default_chart()
︡c4eb483d-f765-4f3f-9186-be666f628b7a︡︡
︠4a1ff8e8-2daf-4838-9213-1ce24826dcf5i︠
%html
<p>The change from Eddington-Finkelstein coordinates to the Schwarzschild (Boyer-Lindquist) ones, computed as the inverse of ch_BL_EF:</p>

︡e264c3c7-f88b-4a67-8439-878ce18f35df︡{"html": "<p>The change from Eddington-Finkelstein coordinates to the Schwarzschild (Boyer-Lindquist) ones, computed as the inverse of ch_BL_EF:</p>"}︡
︠2800d5c3-66b8-44f3-9266-acd40906cfdc︠
ch_EF_BL_I = ch_BL_EF_I.inverse() ; print ch_EF_BL_I
︡e6971f34-cbdc-4605-9f23-a9e3d41a48ca︡︡
︠def297de-e60d-4df8-86a7-2819bf7b0de0︠
ch_EF_BL_I.display()
︡1559f049-98ac-4a03-a163-afa8fc6d1850︡︡
︠382d3969-f8d4-4c5b-ad29-de760c20207c︠
ch_EF_BL_II = ch_BL_EF_II.inverse() ; print ch_EF_BL_II
︡4da31bef-6b49-4c52-b0f0-2984fb0a7bf8︡︡
︠9dbe0efd-1100-460a-a59b-1310434c37fc︠
ch_EF_BL_II.display()
︡2c8f4cd7-d881-407a-8f0f-18a76e054881︡︡
︠9293baf6-7797-4f6d-9292-15980970da9bi︠
%html
<p>At this stage, 6 vector frames have been defined on the manifold: the 6 coordinate frames associated with the various charts:</p>

︡0dfa297f-c06c-4bdb-aa8f-5187342421e7︡{"html": "<p>At this stage, 6 vector frames have been defined on the manifold: the 6 coordinate frames associated with the various charts:</p>"}︡
︠d6e7f3dc-33b2-4db9-b795-8e928a0bb7ce︠
M.frames()
︡85303417-60fc-4771-85b0-9a765ebac842︡︡
︠40cd3dcd-4e2d-42c6-84f0-102a938329b7i︠
%html
<p>The default frame is:</p>

︡6aba9685-6cbf-4e39-9173-cf5912b0f2a4︡{"html": "<p>The default frame is:</p>"}︡
︠3fe2e607-eb92-4040-ae8d-a1e94660a796︠
M.default_frame()
︡c6742d87-cd75-42ae-bbcd-42ff81af60e2︡︡
︠a193a0e9-5141-4722-a10c-64d45e1aa0f0i︠
%html
<p>The coframes are the duals of the defined vector frames:</p>

︡6899de4c-21f4-4ae2-8efd-1157ecc3cc2a︡{"html": "<p>The coframes are the duals of the defined vector frames:</p>"}︡
︠0b615bbe-9c0d-4cdf-a6c3-453ad9f56a11︠
M.coframes()
︡28aa106d-d702-4993-ad53-7fdd18668e9a︡︡
︠3fee6e7a-0e32-405e-b3de-0519709966f2i︠
%html
<p>If not specified, tensor components are assumed to refer to the manifold's default frame. For instance, for the metric tensor:</p>

︡4f0272ba-1256-4c8c-b07c-9417e1ed952e︡{"html": "<p>If not specified, tensor components are assumed to refer to the manifold's default frame. For instance, for the metric tensor:</p>"}︡
︠d76349be-3f48-499a-9a2c-cac5d345be91︠
g.display()
︡c370b82b-01dd-42da-95b9-396bc848ba43︡︡
︠ed8f7b24-0b69-49ed-bf8d-4eada5437876︠
g[:]
︡48149485-2008-430a-81f6-aad60a651563︡︡
︠18bf3f3b-b653-49d6-9945-23002ddffc56i︠
%html
<p>The tensor components in the frame associated with Eddington-Finkelstein coordinates in Region I are obtained by providing the frame to the function <span style="font-family: courier new,courier;">display()</span>:</p>

︡865676a6-d344-45f7-a645-79b6e6a7fb5b︡{"html": "<p>The tensor components in the frame associated with Eddington-Finkelstein coordinates in Region I are obtained by providing the frame to the function <span style=\"font-family: courier new,courier;\">display()</span>:</p>"}︡
︠8499fd82-254c-4c1c-939b-e542aabf5651︠
g.display(X_EF_I.frame())
︡e4239fa0-4d2c-4e5a-91e3-338152b8b792︡︡
︠47cbe347-a1d1-4137-be31-ba31875b8d9fi︠
%html
<p>They are also returned by the method comp(), with the frame as argument:</p>

︡7c29b859-bff7-43a8-ad8b-da3379868bdb︡{"html": "<p>They are also returned by the method comp(), with the frame as argument:</p>"}︡
︠25168d1a-39be-4881-b1a1-e58e0ce27edb︠
g.comp(X_EF_I.frame())[:]
︡7a4d8019-92a6-41e4-87d5-f61669b798da︡︡
︠b9339a17-5ef8-485f-9b80-fc1dc1695f7bi︠
%html
<p>or, as a schortcut,</p>

︡090e4a74-b25c-47a8-921c-49311e245b18︡{"html": "<p>or, as a schortcut,</p>"}︡
︠9293ef67-9543-4ebe-bb51-9fac9457aa96︠
g[X_EF_I.frame(),:]
︡a0ca0fbc-7ce4-417e-b0dc-24fa64466f66︡︡
︠537e3546-a676-4ac4-84d1-b16d8a40b301i︠
%html
<p>Similarly, the metric<span id="cell_outer_53"> components in the frame associated with Eddington-Finkelstein coordinates in Region II are obtained by<br /></span></p>

︡4b720735-c5b8-4a3c-83b9-a217d3e3b327︡{"html": "<p>Similarly, the metric<span id=\"cell_outer_53\"> components in the frame associated with Eddington-Finkelstein coordinates in Region II are obtained by<br /></span></p>"}︡
︠cd2af4f7-86c0-47c6-ac2d-666b57ac2d09︠
g.display(X_EF_II.frame())
︡f4475426-cbb4-46a1-9d16-3b590f2004db︡︡
︠42e18b4d-646a-49a3-b8ea-fb96622b2e87i︠
%html
<p><span id="cell_outer_56">Note that their form is identical to that in Region I.</span></p>

<h3>Plot of the Boyer-Lindquist coordinates in terms of the Eddington-Finkelstein ones</h3>
<p>Let us perform the plot in Region I:</p>

︡b13e4566-a7ab-4154-a4ff-fdd5170d2c13︡{"html": "<p><span id=\"cell_outer_56\">Note that their form is identical to that in Region I.</span></p>\n\n<h3>Plot of the Boyer-Lindquist coordinates in terms of the Eddington-Finkelstein ones</h3>\n<p>Let us perform the plot in Region I:</p>"}︡
︠eb08ac97-7dcf-45bd-b62c-5b48d5b05b8b︠
X_I.plot(X_EF_I, ranges={t:(0,8), r:(2.1,10)}, fixed_coords={th:pi/2,ph:0}, ambient_coords=(r,v), style={t:'--', r:'-'}, parameters={m:1})
︡8ac17fdd-2030-41fc-98b3-a08b455eda5d︡︡
︠6771f9c5-2439-4cc3-848c-105b51118ab5i︠
%html
<h2>Tetrad of the static observer</h2>
<p>Let us introduce the orthonormal tetrad $(e_\alpha)$ associated with the static observers in Schwarzschild spacetime, i.e. the observers whose worldlines are parallel to the timelike Killing vector in the Region I.</p>
<p>The orthonormal tetrad is defined via a tangent-space automorphism that relates it to the Boyer-Lindquist coordinate frame in Region I:</p>

︡96f394a1-61bf-4d17-b9f6-a169151650f7︡{"html": "<h2>Tetrad of the static observer</h2>\n<p>Let us introduce the orthonormal tetrad $(e_\\alpha)$ associated with the static observers in Schwarzschild spacetime, i.e. the observers whose worldlines are parallel to the timelike Killing vector in the Region I.</p>\n<p>The orthonormal tetrad is defined via a tangent-space automorphism that relates it to the Boyer-Lindquist coordinate frame in Region I:</p>"}︡
︠852134d4-92e0-4ac3-bcbd-7a2e15dea3d3︠
ch_to_stat = regI.automorphism_field()
ch_to_stat[0,0], ch_to_stat[1,1] = 1/sqrt(1-2*m/r), sqrt(1-2*m/r)
ch_to_stat[2,2], ch_to_stat[3,3] = 1/r, 1/(r*sin(th))
ch_to_stat[:]
︡59c190d5-0f3f-47a1-9285-6ea515bc5d68︡︡
︠73cb495e-ba1a-4e2d-acab-10cd831865a0︠
e = X_I.frame().new_frame(ch_to_stat, 'e') ; print e
︡43dd9944-bea6-4731-9f3f-0da5f9fa9f76︡︡
︠b45224b9-a5db-475d-b4e8-e7c413ca99aci︠
%html
<p>At this stage, 7 vector frames have been defined on the manifold $\mathcal{M}$:</p>

︡6590abfc-ae9e-44ad-9486-41ea48a30b6c︡{"html": "<p>At this stage, 7 vector frames have been defined on the manifold $\\mathcal{M}$:</p>"}︡
︠0c0d4076-819e-4e4a-a33e-402e029c737b︠
M.frames()
︡af62cd8b-1312-4deb-a9ea-13024ef92f24︡︡
︠2c87db5b-c0c0-4ac6-9eac-fe58811a1a05i︠
%html
<p>The first vector of the tetrad is the static observer 4-velocity:</p>

︡4125e9dd-c1f1-410d-a06c-cfeab02d56cd︡{"html": "<p>The first vector of the tetrad is the static observer 4-velocity:</p>"}︡
︠162fb19f-985a-4acf-9e69-5fccea1482b7︠
print e[0]
︡b3464a54-1b5c-46ba-98ce-e5373e3e68f3︡︡
︠5f258574-29eb-44da-8172-e933e8190fb0︠
e[0].display()
︡31e002f4-9ae9-45eb-992f-936dbf1864d7︡︡
︠55e30d81-3e19-4a8f-acaa-978121fcfc73i︠
%html
<p>As any 4-velocity, it is a unit timelike vector:</p>

︡4cd35c92-7be2-4eac-8c49-d8500a1e8dea︡{"html": "<p>As any 4-velocity, it is a unit timelike vector:</p>"}︡
︠01064ad9-6839-4b13-bb38-a1226d90201e︠
g(e[0],e[0]).expr()
︡1ec9b061-8dd7-45c9-bd83-9e621939b831︡︡
︠ff295d0a-4d34-4590-b00a-cc67940f88cdi︠
%html
<p>Let us check that the tetrad $(e_\alpha)$ is orthonormal:</p>

︡2acb9ccf-a06e-4267-9185-cf1e8880f7d8︡{"html": "<p>Let us check that the tetrad $(e_\\alpha)$ is orthonormal:</p>"}︡
︠c1af6ee9-74db-4a8f-9fa6-274a6c1e68b9︠
for i in M.irange():
    for j in M.irange():
        print g(e[i],e[j]).expr() , 
    print " "
︡41c58d6d-d3cb-4d5a-8f78-1b3a314ddf64︡︡
︠8affe2d7-f52f-4ab7-9df7-f85192cad068i︠
%html
<p>Another view of the above result:</p>

︡5b43d7cb-cbb7-45ec-9d09-d2d0b585c469︡{"html": "<p>Another view of the above result:</p>"}︡
︠e1a3de87-e87f-46d1-9fbf-ab04697df310︠
g[e,:]
︡2c3e4808-c5f6-4737-b5ba-e5e6dd36e791︡︡
︠aa7b013c-eefe-4d56-b973-6651376ea734i︠
%html
<p>or, equivalently,</p>

︡b1aeac4f-0781-4c40-bb4a-11aedbcc31cd︡{"html": "<p>or, equivalently,</p>"}︡
︠884ebdea-76c5-4d1c-ae13-dc7430728196︠
g.display(e)
︡0a1cda4e-c934-40e2-a7e8-a9aa1d3b8670︡︡
︠827e62d8-7ce2-417a-ad38-4f37213c4f28i︠
%html
<p>The expression of the 4-velocity $e_0$ and the vector $e_1$ in terms of the frame associated with Eddington-Finkelstein coordinates:</p>

︡f3c3d3d0-6480-462b-94c5-3a3de4979b5d︡{"html": "<p>The expression of the 4-velocity $e_0$ and the vector $e_1$ in terms of the frame associated with Eddington-Finkelstein coordinates:</p>"}︡
︠2524c270-c92d-4c71-ad85-0bc7ae45973a︠
e[0].display(X_EF_I.frame())
︡8b04d54c-23ba-4f52-b84d-b307f3c0cb5b︡︡
︠d5439254-7cc6-4368-9d80-5498bb628663︠
e[1].display(X_EF_I.frame())
︡909fa022-1dda-426f-8157-810a6d93f6c0︡︡
︠939bfd91-efbd-482c-83a0-64072461dca7i︠
%html
<p>Contrary to vectors of a coordinate frame, the vectors of the tetrad $e$ do not commute: their structure coefficients are not identically zero:</p>

︡6de7fc12-79fd-491f-bbb7-6e70737aab01︡{"html": "<p>Contrary to vectors of a coordinate frame, the vectors of the tetrad $e$ do not commute: their structure coefficients are not identically zero:</p>"}︡
︠8eedeca0-a5d3-4c3b-ad91-3c0b87224657︠
e.structure_coef()[:]
︡63b48cb2-6370-4445-97c8-da43ed850e79︡︡
︠e92b3677-2066-4307-ba54-72199117de69i︠
%html
<p>Equivalently, the Lie derivative of one vector along another one is not necessarily zero:</p>

︡808b3d1f-2ec3-462d-b56c-54d5424c6d5c︡{"html": "<p>Equivalently, the Lie derivative of one vector along another one is not necessarily zero:</p>"}︡
︠9a196cf7-af28-4211-9d9b-911a79cdae49︠
e[0].lie_der(e[1]).display(e)
︡06cdb8ef-a193-4887-bac1-5e2a831dafef︡︡
︠dc53ea28-8507-4b0d-9d1b-c51f3e175eeei︠
%html
<p>The curvature 2-form $\Omega^0_{\ \, 1}$ associated with the tetrad $(e_\alpha)$:</p>

︡046eec1a-a6fa-4e5b-829b-6a44c815ce7a︡{"html": "<p>The curvature 2-form $\\Omega^0_{\\ \\, 1}$ associated with the tetrad $(e_\\alpha)$:</p>"}︡
︠ed01a47f-c041-4751-94fa-f6edf8ecdcd5︠
g.connection().curvature_form(0,1,e).display(X_I.frame())
︡bcf30a98-32d3-4bcd-a97d-70c19311bab5︡︡
︠990ccbe8-fc23-47b2-b9dd-9da9fa5248d2i︠
%html
<h2>Kruskal-Szekeres coordinates</h2>
<p>Let us now introduce the Kruskal-Szekeres coordinates $(U,V,\theta,\varphi)$ on the spacetime manifold, via the standard transformation expressing them in terms of the Boyer-Lindquist coordinates $(t,r,\theta,\varphi)$:</p>

︡3b9d8e40-03df-4d97-be96-e628f68983ed︡{"html": "<h2>Kruskal-Szekeres coordinates</h2>\r\n<p>Let us now introduce the Kruskal-Szekeres coordinates $(U,V,\\theta,\\varphi)$ on the spacetime manifold, via the standard transformation expressing them in terms of the Boyer-Lindquist coordinates $(t,r,\\theta,\\varphi)$:</p>"}︡
︠5795cd8e-8dc0-4a91-9be7-184b52d12012︠
M0 = regI.union(regII).union(regIII).union(regIV) ; M0
︡51bc86e5-d7d7-44e7-85c2-04dce3f6d664︡︡
︠44551158-91a7-4e0c-bbc1-08f661cb6b70︠
X_KS.<U,V,th,ph> = M0.chart(r'U V th:(0,pi):\theta ph:(0,2*pi):\varphi')
X_KS.add_restrictions(V^2 < 1 + U^2)
X_KS
︡60a7dba5-206c-4a35-91eb-756d9ef00bde︡︡
︠6237b61b-9039-426a-a2a5-bd160459324d︠
X_KS_I = X_KS.restrict(regI, [U>0, V<U, V>-U]) ; X_KS_I
︡9d65965a-ba24-44ee-897f-9b255d0518a0︡︡
︠3ae55f75-e393-4c02-82cd-2a4cca8cd9e8︠
ch_BL_KS_I = X_I.transition_map(X_KS_I, [sqrt(r/(2*m)-1)*exp(r/(4*m))*cosh(t/(4*m)), \
                                         sqrt(r/(2*m)-1)*exp(r/(4*m))*sinh(t/(4*m)), th, ph])
print ch_BL_KS_I
ch_BL_KS_I.display()
︡b10b92f1-ab31-4d1d-90d2-6ec01acf2a04︡︡
︠dd2e034b-1c67-43fc-b15a-09b758730b5c︠
X_KS_II = X_KS.restrict(regII, [V>0, V>U, V>-U]) ; X_KS_II
︡9e081912-1766-4d3d-8c2c-521573a431df︡︡
︠0e8c3fbf-3449-4d6b-9fc8-01eddac92479︠
ch_BL_KS_II = X_II.transition_map(X_KS_II, [sqrt(1-r/(2*m))*exp(r/(4*m))*sinh(t/(4*m)), \
                                            sqrt(1-r/(2*m))*exp(r/(4*m))*cosh(t/(4*m)), th, ph])
print ch_BL_KS_II
ch_BL_KS_II.display()
︡1b71d0d2-f638-4d12-856a-fa9991fdf477︡︡
︠b8eec78a-118f-4499-81d6-d6f49394d646i︠
%html
<h3>Plot of the Boyer-Lindquist coordinates in terms of the Kruskal ones</h3>
<p>We draw the Boyer-Lindquist chart in Region I (red) and Region II (green), with lines of constant $r$ being dashed:</p>

︡f20555ac-efe8-49ad-a3d1-a6d6d1dbe050︡{"html": "<h3>Plot of the Boyer-Lindquist coordinates in terms of the Kruskal ones</h3>\n<p>We draw the Boyer-Lindquist chart in Region I (red) and Region II (green), with lines of constant $r$ being dashed:</p>"}︡
︠8a98f572-4f3b-4101-9279-90988f13ea1c︠
graphI = X_I.plot(X_KS, ranges={t:(-12,12), r:(2.001,5)}, nb_values={t:17, r:9}, fixed_coords={th:pi/2,ph:0}, ambient_coords=(U,V), style={t:'--', r:'-'}, parameters={m:1})
graphII = X_II.plot(X_KS, ranges={t:(-12,12), r:(0.001,1.999)}, nb_values={t:17, r:9}, fixed_coords={th:pi/2,ph:0}, ambient_coords=(U,V), style={t:'--', r:'-'}, color='green', parameters={m:1})
show(graphI+graphII, xmin=-3, xmax=3, ymin=-3, ymax=3, axes_labels=['$U$', '$V$'])
︡cc51294a-0901-48fb-8f2e-c45c7aaa7672︡︡
︠b4213b0c-234e-4135-bf6c-283db4167d98i︠
%html
<p>We may add to the graph the singularity $r=0$ as a Boyer-Lindquist chart plot with $(r,\theta,\phi)$ fixed at $(0, \pi/2, 0)$.&nbsp; Similarly, we add the event horizon $r=2m$ as a Boyer-Lindquist chart plot with $(r,\theta,\phi)$ fixed at $(2.00001m, \pi/2, 0)$:</p>

︡a7fdb648-41dd-4b56-97ec-7b2d9223f58b︡{"html": "<p>We may add to the graph the singularity $r=0$ as a Boyer-Lindquist chart plot with $(r,\\theta,\\phi)$ fixed at $(0, \\pi/2, 0)$.&nbsp; Similarly, we add the event horizon $r=2m$ as a Boyer-Lindquist chart plot with $(r,\\theta,\\phi)$ fixed at $(2.00001m, \\pi/2, 0)$:</p>"}︡
︠2800e8cb-a3d5-40fa-950e-f0fe35c3460d︠
graph_r0 = X_II.plot(X_KS, fixed_coords={r:0, th:pi/2, ph:0}, ambient_coords=(U,V), color='black', thickness=3, parameters={m:1})
graph_r2 = X_I.plot(X_KS, ranges={t:(-40,40)}, fixed_coords={r:2.00001, th:pi/2, ph:0}, ambient_coords=(U,V), color='yellow', thickness=2, parameters={m:1})
show(graphI+graphII+graph_r0+graph_r2, xmin=-3, xmax=3, ymin=-3, ymax=3, axes_labels=['$U$', '$V$'])
︡72d371f9-308b-4857-ac74-2dc95aab35aa︡︡
︠d00cfacd-a05e-489a-9c46-940870e3e16fi︠
%html
<h3>Plot of the Eddington-Finkelstein coordinates in terms of the Kruskal ones</h3>
<p>We first get the change of coordinates $(v,r,\theta,\phi) \mapsto (U,V,\theta,\phi)$ by composing the change $(v,r,\theta,\phi) \mapsto (t,r,\theta,\phi)$ with $(t,r,\theta,\phi) \mapsto (U,V,\theta,\phi)$: </p>

︡b0835767-3636-4cc9-b52c-47f649b60d36︡{"html": "<h3>Plot of the Eddington-Finkelstein coordinates in terms of the Kruskal ones</h3>\n<p>We first get the change of coordinates $(v,r,\\theta,\\phi) \\mapsto (U,V,\\theta,\\phi)$ by composing the change $(v,r,\\theta,\\phi) \\mapsto (t,r,\\theta,\\phi)$ with $(t,r,\\theta,\\phi) \\mapsto (U,V,\\theta,\\phi)$: </p>"}︡
︠81789f30-d682-435c-8333-8f420dde3673︠
ch_EF_KS_I = ch_BL_KS_I * ch_EF_BL_I
ch_EF_KS_I
︡cbced02a-de03-4a2f-96aa-4782b8c058cf︡︡
︠bfe48cdf-dad7-4e43-88ec-3e4c1712b096︠
ch_EF_KS_I.display()
︡074ff76d-3245-4b61-8722-a5d7fd8eb546︡︡
︠0188fdad-3e35-457a-a32a-a665dddafeae︠
ch_EF_KS_II = ch_BL_KS_II * ch_EF_BL_II
ch_EF_KS_II
︡b03fbbfc-07e0-4ca1-85f0-4b7bd8cb71b8︡︡
︠0f12154c-ea98-4686-b3e1-07e1d6dc88f0︠
graphI_EF = X_EF_I.plot(X_KS, ranges={v:(-12,12), r:(2.001,5)}, nb_values={v:17, r:9}, fixed_coords={th:pi/2,ph:0}, ambient_coords=(U,V), style={v:'--', r:'-'}, parameters={m:1})
graphII_EF = X_EF_II.plot(X_KS, ranges={v:(-12,12), r:(0.001,1.999)}, nb_values={v:17, r:9}, fixed_coords={th:pi/2,ph:0}, ambient_coords=(U,V), style={v:'--', r:'-'}, color='green', parameters={m:1})
show(graphI_EF+graphII_EF+graph_r0+graph_r2, xmin=-3, xmax=3, ymin=-3, ymax=3, axes_labels=['$U$', '$V$'])
︡e8d354be-c312-41e6-b9cb-3729c143536b︡︡
︠94c51ac7-3873-49c1-ac36-f504f36f03c4i︠
%html
<p>There are now 9 charts defined on the spacetime manifold:</p>

︡d9d0190b-1ef8-4540-af5d-79072f7f4f77︡{"html": "<p>There are now 9 charts defined on the spacetime manifold:</p>"}︡
︠8afd87f6-08cd-42f2-a1ac-93b289b2f4c3︠
M.atlas()
︡18c5ba36-0e65-4873-bea3-dc3fe52dda54︡︡
︠c48df7b6-f629-415f-86d9-d131a3ef95a7i︠
%html
<p>There are 8 explicit coordinate changes (the coordinate change KS $\rightarrow$ BL is not known in explicit form):</p>

︡f021a97e-14e3-466b-9f94-d4db51c27733︡{"html": "<p>There are 8 explicit coordinate changes (the coordinate change KS $\\rightarrow$ BL is not known in explicit form):</p>"}︡
︠ce97f98e-186f-4332-833b-ccccecc1b77d︠
M.coord_changes()
︡65005611-17af-4a2c-8957-53f965c952c7︡︡
︠dcc6af72-5a36-42c4-98c0-7dcfc5e06b9ei︠
%html
<p>There are 10 vector frames (among which 9 coordinate frames):</p>

︡3263deb2-ca1a-416d-88cf-e5491e0f28c7︡{"html": "<p>There are 10 vector frames (among which 9 coordinate frames):</p>"}︡
︠86bcfdae-50b2-4bd5-b7e9-08b82f250622︠
M.frames()
︡bea712a9-a24b-47a2-9358-0ea83945f522︡︡
︠6afee0ce-fc63-4800-9f9b-56eb2d551887i︠
%html
<p>There are 16 fields of tangent space automorphisms expressing the changes of coordinate bases and tetrad:</p>

︡43c7d71c-e8c9-42aa-8106-c95e1ae70552︡{"html": "<p>There are 16 fields of tangent space automorphisms expressing the changes of coordinate bases and tetrad:</p>"}︡
︠aaa58a84-6b03-47df-a595-14545524061c︠
len(M.frame_changes())
︡460f2d0f-f501-413e-aa40-1b0714c3ef49︡︡
︠62946165-ebec-4e83-ad61-ae29b5821ed8i︠
%html
<p>Thanks to these changes of frames, the components of the metric tensor with respect to the Kruskal-Szekeres can be computed by the method <span style="font-family: courier new,courier;">display()</span> and are found to be:</p>

︡786d8619-1052-4391-9ea8-1e1bcfa07c38︡{"html": "<p>Thanks to these changes of frames, the components of the metric tensor with respect to the Kruskal-Szekeres can be computed by the method <span style=\"font-family: courier new,courier;\">display()</span> and are found to be:</p>"}︡
︠22993186-4822-4c50-8d8d-47aa8f9d4bf8︠
g.display(X_KS_I.frame())
︡e63c484c-3105-428f-b979-1c5611b1d2d9︡︡
︠0a16fd95-e099-43da-9ac2-ca7406651a8d︠
g[X_KS_I.frame(),:]
︡d939f5fe-0b28-4ff1-b11d-0a3985c6f5c0︡︡
︠9fa27b53-50e3-4452-91ae-2003439a9f67︠
g.display(X_KS_II.frame())
︡94f47ebf-b62b-491e-a641-b97a826fdbc8︡︡
︠cfc079e3-0222-4442-8dd2-37ad03a6507fi︠
%html
<p>The first vector of the orthonormal tetrad $e$ expressed on the <span id="cell_outer_86"><span id="cell_outer_121">Kruskal-Szekeres</span></span> frame:</p>

︡93893449-540a-4959-986c-b7aba31380bb︡{"html": "<p>The first vector of the orthonormal tetrad $e$ expressed on the <span id=\"cell_outer_86\"><span id=\"cell_outer_121\">Kruskal-Szekeres</span></span> frame:</p>"}︡
︠f5ae912a-f6ce-411e-a8eb-52fcc2863029︠
e[0].display(X_KS_I.frame())
︡1f5082cc-3caf-4e6f-adea-f548fb6c3e57︡︡
︠87683a9a-92f1-4674-aaf8-043ef4fad140i︠
%html
<p>The Riemann curvature tensor in terms of the <span id="cell_outer_121">Kruskal-Szekeres</span> coordinates:</p>

︡0ae1e68d-8d98-4fdf-92a8-5a3aea6e57de︡{"html": "<p>The Riemann curvature tensor in terms of the <span id=\"cell_outer_121\">Kruskal-Szekeres</span> coordinates:</p>"}︡
︠75520159-9456-4c81-8e06-b0dcc0e50e80︠
g.riemann().display(X_KS_I.frame())
︡3369815b-0615-4dc0-84c0-8c53c1ee36af︡︡
︠bf37ea6e-8893-4d27-9616-759a25a96f5e︠
g.riemann().display_comp(X_KS_I.frame(), only_nonredundant=True)
︡bf843ca5-96c4-4b3f-9392-b2d25fbbcb9b︡︡
︠710e8887-d57b-4734-8ec7-1baff6cd8802i︠
%html
<p>The curvature 2-form $\Omega^0_{\ \, 1}$ associated to the Kruskal-Szekeres coordinate frame:</p>

︡a7c2c6fa-b22a-4d3a-a589-3bd488c533f4︡{"html": "<p>The curvature 2-form $\\Omega^0_{\\ \\, 1}$ associated to the Kruskal-Szekeres coordinate frame:</p>"}︡
︠e14d75de-8ae5-4b32-aaa3-e49f5aec2339︠
om = g.connection().curvature_form(0,1, X_KS_I.frame()) ; print om
︡584ce4e1-0a51-4070-bc93-af41c826503b︡︡
︠6f4ddef3-aa53-4f0f-aac0-43fb43171236︠
om.display(X_KS_I.frame())
︡4ff58855-b33e-4ca7-8e8e-3803e744142e︡︡
︠f8e9727e-e465-4926-a604-bc8661034142i︠
%html
<h2>Isotropic coordinates</h2>
<p>Let us now introduce isotropic coordinates $(t,\bar{r},\theta,\varphi)$ on the spacetime manifold:</p>

︡29212f8c-96d7-4063-a675-6d37f051f934︡{"html": "<h2>Isotropic coordinates</h2>\r\n<p>Let us now introduce isotropic coordinates $(t,\\bar{r},\\theta,\\varphi)$ on the spacetime manifold:</p>"}︡
︠aac90c41-ec78-4de9-9d31-70ada6c58024︠
regI_III = regI.union(regIII) ; regI_III
︡249f253b-82c7-416c-a6de-81618ec2af3c︡︡
︠a9a20380-072a-4ce7-96ac-489256f4adf0︠
X_iso.<t,ri,th,ph> = regI_III.chart(r't ri:(0,+oo):\bar{r} th:(0,pi):\theta ph:(0,2*pi):\varphi')
print X_iso ; X_iso
︡fdd6edfd-903c-4d7f-8c6b-09ded20ab840︡︡
︠7c027f59-f6bb-4b61-8f29-8f9891e9552c︠
X_iso_I = X_iso.restrict(regI, ri>m/2) ; X_iso_I
︡817c64cc-dabf-4e70-9810-aa618d0d1a99︡︡
︠2d06f110-4479-40a3-a2dd-74e08ac71e83i︠
%html
<p>The transformation from the isotropic coordinates to the Boyer-Lindquist ones:</p>

︡2ff556c0-0573-45b5-a8ec-929f0d19795b︡{"html": "<p>The transformation from the isotropic coordinates to the Boyer-Lindquist ones:</p>"}︡
︠02e77476-7024-4bd7-bdf3-33ec22cb8d7a︠
assume(2*ri>m) # we consider only region I
ch_iso_BL_I = X_iso_I.transition_map(X_I, [t, ri*(1+m/(2*ri))^2, th, ph])
print ch_iso_BL_I
ch_iso_BL_I.display()
︡5860b1b5-3e31-4cfa-832d-1990caee3767︡︡
︠7d25f855-e14f-4387-bd3a-7e0272942be3︠
assume(r>2*m) # we consider only region I
ch_iso_BL_I.set_inverse(t, (r-m+sqrt(r*(r-2*m)))/2, th, ph)
︡ac3062af-2ad0-44c8-9a0c-57ce603af6f7︡︡
︠c7c5b095-e492-4986-a1a3-93fe67d1580c︠
ch_iso_BL_I.inverse().display()
︡49a0e4dd-e66f-44ba-87b9-24ecba2e049a︡︡
︠0816bf7b-2ced-4f56-a043-e0e4330db301i︠
%html
<p><span id="cell_outer_90">At this stage, 11 charts have been defined on the manifold $\mathcal{M}$:</span></p>

︡46d70a97-9d15-4610-a1ce-b81ecdbe27f4︡{"html": "<p><span id=\"cell_outer_90\">At this stage, 11 charts have been defined on the manifold $\\mathcal{M}$:</span></p>"}︡
︠1bc06678-9312-446d-854b-92217f593c3a︠
M.atlas()
︡08d0d0b4-9df2-40b6-9219-cc48e43b14e6︡︡
︠4c996f17-0f7b-45e7-b2af-8379272223d0i︠
%html
<p>12 vector frames have been defined on $\mathcal{M}$: 11 coordinate bases and the tetrad $(e_\alpha)$:</p>

︡8bd63e78-48ee-465d-8774-782d1a054b77︡{"html": "<p>12 vector frames have been defined on $\\mathcal{M}$: 11 coordinate bases and the tetrad $(e_\\alpha)$:</p>"}︡
︠0b7ed0b7-65b1-4b9d-80e3-41e60bbb9d99︠
M.frames()
︡58ec2562-ed84-4c59-8c00-4e9f086bab38︡︡
︠3ac6f454-f2ee-4762-91e6-bcf3ace82b1fi︠
%html
<p>The components of the metric tensor in terms of the isotropic coordinates are given by</p>

︡920e0285-79b8-4b82-bf3c-abe6ae9931d3︡{"html": "<p>The components of the metric tensor in terms of the isotropic coordinates are given by</p>"}︡
︠640a52d3-b416-4ffa-bf4b-eba3843a7406︠
g.display(X_iso_I.frame(), X_iso_I)
︡6ce417f9-fc43-437a-a669-385f1e5ba1c2︡︡
︠34595859-120d-4645-a5b3-1224694e1315i︠
%html
<p>The $g_{00}$ component can be factorized:</p>

︡ff7ae15c-a706-47e2-8f60-fcb0f28a878b︡{"html": "<p>The $g_{00}$ component can be factorized:</p>"}︡
︠79596909-93dc-413f-b393-6b5d2b569929︠
g[X_iso_I.frame(), 0,0, X_iso_I]
︡ff413f3c-a272-4c26-afe5-e695e9b3cbee︡︡
︠f7f50210-95c3-4cce-a632-8da4e5e699ec︠
g[X_iso_I.frame(), 0,0, X_iso_I].factor()
︡99aefc66-23cc-459d-ae4c-e9623150627a︡︡
︠5228dbbe-5b60-45a7-b53b-3d577d5dada3i︠
%html
<p>Let us also factorize the other components:</p>

︡b2ac3f41-6d5a-4a5e-a7e1-a12624fa6f44︡{"html": "<p>Let us also factorize the other components:</p>"}︡
︠e6cd8023-e3ae-4389-8753-cb509bf0dc16︠
for i in range(1,4):
    g[X_iso_I.frame(), i,i, X_iso_I].factor()
︡abb895d1-9576-4b97-920b-da27fe20ff9f︡︡
︠01d17457-a381-4b77-aa9f-cc4bcc5ee51ei︠
%html
<p>The output of the <span style="font-family: courier new,courier;">display()</span> command looks nicer:</p>

︡3ce7a759-120b-4403-9385-b4925818f8b0︡{"html": "<p>The output of the <span style=\"font-family: courier new,courier;\">display()</span> command looks nicer:</p>"}︡
︠f48e266f-30e3-4859-919a-2b4042326003︠
g.display(X_iso_I.frame(), X_iso_I)
︡fa020b32-1b6b-4735-b724-497d0698a98f︡︡
︠be336e4f-cf07-4d8a-a48a-b853d31a1f10i︠
%html
<p>Expression of the tetrad associated with the static observer in terms of the isotropic coordinate basis:</p>

︡e303e4d2-02e3-4fa5-8141-b99c5603a5ba︡{"html": "<p>Expression of the tetrad associated with the static observer in terms of the isotropic coordinate basis:</p>"}︡
︠1a58a689-ba7b-44b1-8bbf-22ef8c685f39︠
e[0].display(X_iso_I.frame(), X_iso_I)
︡9e635d02-b9ba-4089-9006-ff2eb8d08323︡︡
︠86df188f-c52d-471c-be1b-8ed98f4e9529︠
e[1].display(X_iso_I.frame(), X_iso_I)
︡25de5d52-72fb-4c46-8cdc-7ab264c74e79︡︡
︠d0d7f6d9-a29c-448e-8660-c8058fde504f︠
e[2].display(X_iso_I.frame(), X_iso_I)
︡c1a82a8c-ab1d-45ae-8b7d-05d8c69a35a6︡︡
︠103b8716-b569-42be-97c4-8176500d04a1︠
e[3].display(X_iso_I.frame(), X_iso_I)
︡33a12f82-285f-4a14-a9cc-9ef7b3c42013︡︡

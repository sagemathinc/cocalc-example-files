︠8988a732-0d25-4529-bbcd-cc2e86f44047as︠
%auto
typeset_mode(True, display=False)
︡54e501e6-c623-40ec-a280-5732b3ade015︡︡{"auto":true}︡{"done":true}
︠f6a62ce0-aec5-42f0-bb7d-5333bf0c123fi︠
%html
<div id="cell_text_154" class="text_cell">
<h1 style="text-align: center;">Carter-Penrose diagrams of Schwarzschild spacetime</h1>
<p>This worksheet demonstrates a few capabilities of <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.8) in producing Carter-Penrose diagrams.</p>
<p>It is released under the GNU General Public License version 3.</p>
<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>
<p><em><span style="color: #008080;">The corresponding worksheet file can be downloaded from</span><span style="color: #ff6600;"><span style="color: #0000ff;"> <a href="http://sagemanifolds.obspm.fr/examples/sws/SM_Carter-Penrose_diag.sws"><span style="color: #0000ff;">here</span></a></span></span></em></p>
<p><em><span style="color: #ff6600;"><span style="color: #0000ff;"><span style="color: #0000ff;"><br /></span></span></span></em></p>
</div>
<h2>Spacetime manifold</h2>
<p>We declare the Schwarzschild spacetime as a 4-dimensional differentiable manifold:</p>

︡f5fd5281-d6d9-4183-aaf6-92d5ffdf8680︡︡{"done":true,"html":"<div id=\"cell_text_154\" class=\"text_cell\">\n<h1 style=\"text-align: center;\">Carter-Penrose diagrams of Schwarzschild spacetime</h1>\n<p>This worksheet demonstrates a few capabilities of <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.8) in producing Carter-Penrose diagrams.</p>\n<p>It is released under the GNU General Public License version 3.</p>\n<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>\n<p><em><span style=\"color: #008080;\">The corresponding worksheet file can be downloaded from</span><span style=\"color: #ff6600;\"><span style=\"color: #0000ff;\"> <a href=\"http://sagemanifolds.obspm.fr/examples/sws/SM_Carter-Penrose_diag.sws\"><span style=\"color: #0000ff;\">here</span></a></span></span></em></p>\n<p><em><span style=\"color: #ff6600;\"><span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\"><br /></span></span></span></em></p>\n</div>\n<h2>Spacetime manifold</h2>\n<p>We declare the Schwarzschild spacetime as a 4-dimensional differentiable manifold:</p>"}
︠c3a4202a-297b-43f1-8df5-40defb86089bs︠
M = Manifold(4, 'M', r'\mathcal{M}') ; M
︡2c91a76f-8221-4324-9932-336487f75caf︡︡{"html":"<div>$\\mathcal{M}$</div>","done":false}︡{"done":true}
︠f20b3c8f-f689-460a-9e92-6b7eed233ba1i︠
%html
<p>The manifold $\mathcal{M}$ is diffeomorphic to $\mathbb{R}^2\times\mathbb{S}^2$. Since we shall deal with spherical coordinates $(\theta,\varphi)$ on $\mathbb{S}^2$, we shall consider the part $\mathcal {M}_0$ of $\mathcal{M}$ that excludes the two poles of $\mathbb{S}^2$ where the coordinate $\varphi$ is not defined: \[\mathcal{M}_0 \simeq \mathbb{R}^2\times\left(\mathbb{S}^2\setminus\{N,S\} \right),\] where $N$ (resp. $S$) stands for the North pole (resp. South pole):</p>

︡83264775-6984-4b5b-abaf-95abc4a20722︡︡{"done":true,"html":"<p>The manifold $\\mathcal{M}$ is diffeomorphic to $\\mathbb{R}^2\\times\\mathbb{S}^2$. Since we shall deal with spherical coordinates $(\\theta,\\varphi)$ on $\\mathbb{S}^2$, we shall consider the part $\\mathcal {M}_0$ of $\\mathcal{M}$ that excludes the two poles of $\\mathbb{S}^2$ where the coordinate $\\varphi$ is not defined: \\[\\mathcal{M}_0 \\simeq \\mathbb{R}^2\\times\\left(\\mathbb{S}^2\\setminus\\{N,S\\} \\right),\\] where $N$ (resp. $S$) stands for the North pole (resp. South pole):</p>"}
︠b899d495-2529-4bb3-8af8-20277f92276as︠
M0 = M.open_subset('M0', r'\mathcal{M}_0') ; M0
︡be97c45c-4cc4-41eb-985b-60f114174f90︡︡{"html":"<div>$\\mathcal{M}_0$</div>","done":false}︡{"done":true}
︠658c993e-394d-4bd1-9d61-b3f71e550a69i︠
%html
<p>$\mathcal{M}_0$ can be split into 4 regions, corresponding to the 4 quadrants in the Kruskal diagram.Let us denote by $\mathcal{R}_{\mathrm{I}}$ to $\mathcal{R}_{\mathrm{IV}}$ the<em> interiors</em> of these 4 regions (i.e. we exclude the past and furture event horizons from these regions). $\mathcal{R}_{\mathrm{I}}$ and&nbsp; $\mathcal{R}_{\mathrm{III}}$&nbsp; are asymtotically flat regions outside the event horizons;&nbsp; $\mathcal{R}_{\mathrm{II}}$ is inside the future event horizon and $\mathcal{R}_{\mathrm{IV}}$ is inside the past event horizon.</p>

︡7465e36e-23e2-44b2-80c6-74d20840b35d︡︡{"done":true,"html":"<p>$\\mathcal{M}_0$ can be split into 4 regions, corresponding to the 4 quadrants in the Kruskal diagram.Let us denote by $\\mathcal{R}_{\\mathrm{I}}$ to $\\mathcal{R}_{\\mathrm{IV}}$ the<em> interiors</em> of these 4 regions (i.e. we exclude the past and furture event horizons from these regions). $\\mathcal{R}_{\\mathrm{I}}$ and&nbsp; $\\mathcal{R}_{\\mathrm{III}}$&nbsp; are asymtotically flat regions outside the event horizons;&nbsp; $\\mathcal{R}_{\\mathrm{II}}$ is inside the future event horizon and $\\mathcal{R}_{\\mathrm{IV}}$ is inside the past event horizon.</p>"}
︠ef2d7498-87c1-4fab-9007-4c75470830d0s︠
regI = M0.open_subset('R_I', r'\mathcal{R}_{\mathrm{I}}')
regII = M0.open_subset('R_II', r'\mathcal{R}_{\mathrm{II}}')
regIII = M0.open_subset('R_III', r'\mathcal{R}_{\mathrm{III}}')
regIV = M0.open_subset('R_IV', r'\mathcal{R}_{\mathrm{IV}}')
regI, regII, regIII, regIV
︡f2794739-9cb6-4f93-82a6-2a4ac273f51a︡︡{"html":"<div>($\\mathcal{R}_{\\mathrm{I}}$, $\\mathcal{R}_{\\mathrm{II}}$, $\\mathcal{R}_{\\mathrm{III}}$, $\\mathcal{R}_{\\mathrm{IV}}$)</div>","done":false}︡{"done":true}
︠dd14ad18-31ca-4254-bef8-248fd6b23dc4i︠
%html
<p>The mass parameter $m$ of Schwarzschild spacetime is declared as a symbolic variable:</p>

︡770e8fda-0357-45ad-a1e8-86faa2e3b6d4︡︡{"done":true,"html":"<p>The mass parameter $m$ of Schwarzschild spacetime is declared as a symbolic variable:</p>"}
︠55a9642d-8169-4913-9dd0-c45a10759fces︠
m = var('m') ; assume(m>=0)
︡6b967cb2-d6ec-4d88-96c6-830a1443cab7︡︡{"done":true}
︠3cb473f5-da4b-48b0-b9b5-8462ac7f664ai︠
%html
<h2>Kruskal-Szekeres coordinates</h2>
<p>The Kruskal-Szekeres coordinates $(T,X,\theta,\varphi)$ cover $\mathcal{M}_0$ and are subject to the restrictions $T^2&lt;1+X^2$:</p>

︡34b686ae-c253-42df-a5c1-84011c965585︡︡{"done":true,"html":"<h2>Kruskal-Szekeres coordinates</h2>\n<p>The Kruskal-Szekeres coordinates $(T,X,\\theta,\\varphi)$ cover $\\mathcal{M}_0$ and are subject to the restrictions $T^2&lt;1+X^2$:</p>"}
︠b9696e66-8b69-4a56-bc17-6d3cfe9bb3ebs︠
XKS.<T,X,th,ph> = M0.chart(r'T X th:(0,pi):\theta ph:(0,2*pi):\varphi')
XKS.add_restrictions(T^2 < 1 + X^2)
XKS
︡9c13b5bf-0102-441b-a815-a86b7fab8269︡︡{"html":"<div>$\\left(\\mathcal{M}_0,(T, X, {\\theta}, {\\varphi})\\right)$</div>","done":false}︡{"done":true}
︠7d8fbcf9-6420-4add-92c9-18d36a48f8e4i︠
%html
<p>The Kruskal-Szekeres chart ploted in terms of itself:</p>

︡8514447f-b889-4288-b44f-8d9681c7c909︡︡{"done":true,"html":"<p>The Kruskal-Szekeres chart ploted in terms of itself:</p>"}
︠193e89d2-afd4-4a71-8bec-7a3d60c5d994s︠
XKS.plot(XKS, ambient_coords=(X,T), max_value=3, nb_values=25)
︡1345a99b-f40e-460b-8dd2-d10f28705c39︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"0019095b-fad1-4735-ada7-70ac79113da8","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/5268/tmp_Ybrpv2.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠216a366c-ad3e-4b87-8901-a4194f0b3027i︠
%html
<h3>Compactified coordinates</h3>
<p>The coordinates $(\tilde T, \tilde X, \theta, \varphi)$ associated with the conformal compactification of the Schwarzschild spacetime are</p>

︡3208daee-7aa3-434e-a835-ecc13ad1a748︡︡{"done":true,"html":"<h3>Compactified coordinates</h3>\n<p>The coordinates $(\\tilde T, \\tilde X, \\theta, \\varphi)$ associated with the conformal compactification of the Schwarzschild spacetime are</p>"}
︠e596a08f-47a3-4cca-a6a4-3367b68aa45cs︠
XCP.<T1,X1,th,ph> = M0.chart(r'T1:(-pi/4,pi/4):\tilde{T} X1:(-pi/2,pi/2):\tilde{X} th:(0,pi):\theta ph:(0,2*pi):\varphi')
XCP.add_restrictions([-pi/2+abs(X1)<T1, T1<pi/2-abs(X1)])
XCP
︡93fcc5f9-b383-4661-abe0-84e3eb1b519c︡︡{"html":"<div>$\\left(\\mathcal{M}_0,({\\tilde{T}}, {\\tilde{X}}, {\\theta}, {\\varphi})\\right)$</div>","done":false}︡{"done":true}
︠18faef28-087f-4883-9d71-3de3c0bc8496i︠
%html
<p>The chart of compactified coordinates plotted in terms of itself:</p>

︡7c1a01d1-4bdd-4f0b-8463-ff5fad50d9e3︡︡{"done":true,"html":"<p>The chart of compactified coordinates plotted in terms of itself:</p>"}
︠4ce6f98c-2222-4512-903d-cc455d00313cs︠
XCP.plot(XCP, ambient_coords=(X1,T1), nb_values=25)
︡fe0cc0f0-8b3a-4baf-8513-866a2b1379bc︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"356cbdf8-1fe7-4c71-a317-de2feb23f7bb","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/5268/tmp_hSzlnf.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠ca1a4643-70f4-443b-8601-92b50560b100i︠
%html
<p>The transition map from <span id="cell_outer_5">Kruskal-Szekeres coordinates to the compactified ones:<br /></span></p>

︡ff5eb52d-6599-4308-b06f-40037f67a630︡︡{"done":true,"html":"<p>The transition map from <span id=\"cell_outer_5\">Kruskal-Szekeres coordinates to the compactified ones:<br /></span></p>"}
︠87d4dfab-9054-4620-aa1c-f2d6fef6c73cs︠
KS_to_CP = XKS.transition_map(XCP, [1/2*(atan(T+X)+atan(T-X)), 1/2*(atan(T+X)-atan(T-X)), th, ph])
print KS_to_CP
KS_to_CP.display()
︡b91e1b7e-b0ad-4a8a-b494-ed0e23a03c60︡︡{"stdout":"coordinate change from chart (M0, (T, X, th, ph)) to chart (M0, (T1, X1, th, ph))\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} {\\tilde{T}} &amp; = &amp; \\frac{1}{2} \\, \\arctan\\left(T + X\\right) + \\frac{1}{2} \\, \\arctan\\left(T - X\\right) \\\\ {\\tilde{X}} &amp; = &amp; \\frac{1}{2} \\, \\arctan\\left(T + X\\right) - \\frac{1}{2} \\, \\arctan\\left(T - X\\right) \\\\ {\\theta} &amp; = &amp; {\\theta} \\\\ {\\varphi} &amp; = &amp; {\\varphi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠7e18f5ff-cfbe-4bac-ab1f-43b9dbd7bdbdi︠
%html
<p>The <span id="cell_outer_71"><span id="cell_outer_5">Kruskal-Szekeres chart plotted in terms of the compactified coordinates:<br /></span></span></p>

︡9a1361ea-79b9-4627-b268-46beac54adc1︡︡{"done":true,"html":"<p>The <span id=\"cell_outer_71\"><span id=\"cell_outer_5\">Kruskal-Szekeres chart plotted in terms of the compactified coordinates:<br /></span></span></p>"}
︠1b55fa83-7612-469c-b1d6-65a7d8b11870s︠
graphKS = XKS.plot(XCP, ambient_coords=(X1,T1), fixed_coords={th:pi/2,ph:0}, ranges={T:(-15,15), X:(-8,8)}, nb_values=33, plot_points=150, style={T:'--', X:'-'})
show(graphKS)
︡45c2e640-92b5-48e4-bbf9-7fbe70126795︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"a11d8cbf-93a3-4c13-8884-d06851e33a11","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/5268/tmp_yq9j52.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠d43d2fb0-6685-4dfa-af14-bc9ab7bc2501i︠
%html
<p><span id="cell_outer_8"><br id="cell_outer_8" /></span></p>
<h2>Schwarzschild-Droste coordinates</h2>
<p>The standard <em>Schwarzschild-Droste coordinates</em> (also called simply <em>Schwarzschild coordinates</em>) $(t,r,\theta,\varphi)$ are defined on $\mathcal{R}_{\mathrm{I}}\cup \mathcal{R}_{\mathrm{II}}$:</p>

︡acd6a30a-bb33-4806-b0a1-9f7087733a72︡︡{"done":true,"html":"<p><span id=\"cell_outer_8\"><br id=\"cell_outer_8\" /></span></p>\n<h2>Schwarzschild-Droste coordinates</h2>\n<p>The standard <em>Schwarzschild-Droste coordinates</em> (also called simply <em>Schwarzschild coordinates</em>) $(t,r,\\theta,\\varphi)$ are defined on $\\mathcal{R}_{\\mathrm{I}}\\cup \\mathcal{R}_{\\mathrm{II}}$:</p>"}
︠d92145ad-50ce-486a-9e9a-e4dc014deffcs︠
regI_II = regI.union(regII)
XSD.<t,r,th,ph> = regI_II.chart(r't r:(0,+oo) th:(0,pi):\theta ph:(0,2*pi):\varphi')
XSD.add_restrictions(r!=2*m)
XSD
︡3fd33407-1e0b-4fdb-b92f-bbc8293cf865︡︡{"html":"<div>$\\left(\\mathcal{R}_{\\mathrm{I}}\\cup \\mathcal{R}_{\\mathrm{II}},(t, r, {\\theta}, {\\varphi})\\right)$</div>","done":false}︡{"done":true}
︠228f1e9e-d7c9-4a79-8079-5b0b6fa72ad8i︠
%html
<p>We naturally introduce two subcharts as the restrictions of the chart XSD to regions $\mathcal{R}_{\mathrm{I}}$ and $\mathcal{R}_{\mathrm{II}}$ respectively. Since, in terms of the Schwarzschild-Droste coordinates, $\mathcal{R}_{\mathrm{I}}$ (resp. $\mathcal{R}_{\mathrm{II}}$) is defined by $r&gt;2m$ (resp. $r&lt;2m$), we set</p>

︡d18d5842-b1ac-4abd-93b4-0132355401f1︡︡{"done":true,"html":"<p>We naturally introduce two subcharts as the restrictions of the chart XSD to regions $\\mathcal{R}_{\\mathrm{I}}$ and $\\mathcal{R}_{\\mathrm{II}}$ respectively. Since, in terms of the Schwarzschild-Droste coordinates, $\\mathcal{R}_{\\mathrm{I}}$ (resp. $\\mathcal{R}_{\\mathrm{II}}$) is defined by $r&gt;2m$ (resp. $r&lt;2m$), we set</p>"}
︠af64389f-449c-47b3-826e-a507c33f999fs︠
XSDI = XSD.restrict(regI, r>2*m)
XSDII = XSD.restrict(regII, r<2*m)
XSDI, XSDII
︡974b01d4-c763-422a-b66e-c83b867441ca︡︡{"html":"<div>($\\left(\\mathcal{R}_{\\mathrm{I}},(t, r, {\\theta}, {\\varphi})\\right)$, $\\left(\\mathcal{R}_{\\mathrm{II}},(t, r, {\\theta}, {\\varphi})\\right)$)</div>","done":false}︡{"done":true}
︠2630cdce-3280-401e-b4b8-78d3a68b146ei︠
%html
<p>The metric tensor is defined by its components w.r.t. Schwarzschild-Droste coordinates:</p>

︡53180e25-3781-4a5c-b7c2-8eadb50109b1︡︡{"done":true,"html":"<p>The metric tensor is defined by its components w.r.t. Schwarzschild-Droste coordinates:</p>"}
︠7a5d1e74-cc4e-435e-afe0-66ae19edeff6s︠
g = M.lorentz_metric('g')
M.set_default_chart(XSD)
M.set_default_frame(XSD.frame())
g[0,0], g[1,1] = -(1-2*m/r), 1/(1-2*m/r)
g[2,2], g[3,3] = r^2, (r*sin(th))^2
g.display()
︡17f4f8bc-7327-4826-9030-a8dd4ff946f2︡︡{"html":"<div>$g = \\left( \\frac{2 \\, m - r}{r} \\right) \\mathrm{d} t\\otimes \\mathrm{d} t + \\left( -\\frac{r}{2 \\, m - r} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + r^{2} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + r^{2} \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\varphi}\\otimes \\mathrm{d} {\\varphi}$</div>","done":false}︡{"done":true}
︠182a1a86-22af-40ab-af50-fe70be3b6b1ei︠
%html
<h3>Transition map between the <span id="cell_outer_9">Schwarzschild-Droste chart and the Kruskal</span><span id="cell_outer_71"><span id="cell_outer_5">-Szekeres one<br /></span></span></h3>

︡fdca1221-2fb7-41b5-9ddc-29cef0665144︡︡{"done":true,"html":"<h3>Transition map between the <span id=\"cell_outer_9\">Schwarzschild-Droste chart and the Kruskal</span><span id=\"cell_outer_71\"><span id=\"cell_outer_5\">-Szekeres one<br /></span></span></h3>"}
︠fb95c8f0-7028-4973-b0eb-8743f024d105s︠
SDI_to_KS = XSDI.transition_map(XKS, [sqrt(r/(2*m)-1)*exp(r/(4*m))*sinh(t/(4*m)), \
                                      sqrt(r/(2*m)-1)*exp(r/(4*m))*cosh(t/(4*m)), th, ph],
                                restrictions2=[X>0, T<X, T>-X])
print SDI_to_KS
SDI_to_KS.display()
︡613d3d7d-288b-476a-9707-f446e171da60︡︡{"stdout":"coordinate change from chart (R_I, (t, r, th, ph)) to chart (R_I, (T, X, th, ph))\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} T &amp; = &amp; \\sqrt{\\frac{r}{2 \\, m} - 1} e^{\\left(\\frac{r}{4 \\, m}\\right)} \\sinh\\left(\\frac{t}{4 \\, m}\\right) \\\\ X &amp; = &amp; \\sqrt{\\frac{r}{2 \\, m} - 1} \\cosh\\left(\\frac{t}{4 \\, m}\\right) e^{\\left(\\frac{r}{4 \\, m}\\right)} \\\\ {\\theta} &amp; = &amp; {\\theta} \\\\ {\\varphi} &amp; = &amp; {\\varphi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠67bc5f17-ec71-4de4-adfb-32d0f501e5b1s︠
SDII_to_KS = XSDII.transition_map(XKS, [sqrt(1-r/(2*m))*exp(r/(4*m))*cosh(t/(4*m)), \
                                        sqrt(1-r/(2*m))*exp(r/(4*m))*sinh(t/(4*m)), th, ph], 
                                  restrictions2=[T>0, X<T, T>-X])
print SDII_to_KS
SDII_to_KS.display()
︡aacfe852-f6fd-49cb-a3ef-cf6f8b269085︡︡{"stdout":"coordinate change from chart (R_II, (t, r, th, ph)) to chart (R_II, (T, X, th, ph))\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} T &amp; = &amp; \\sqrt{-\\frac{r}{2 \\, m} + 1} \\cosh\\left(\\frac{t}{4 \\, m}\\right) e^{\\left(\\frac{r}{4 \\, m}\\right)} \\\\ X &amp; = &amp; \\sqrt{-\\frac{r}{2 \\, m} + 1} e^{\\left(\\frac{r}{4 \\, m}\\right)} \\sinh\\left(\\frac{t}{4 \\, m}\\right) \\\\ {\\theta} &amp; = &amp; {\\theta} \\\\ {\\varphi} &amp; = &amp; {\\varphi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠1606a8e3-195d-47c2-95da-162007458fd9i︠
%html
<h3>Transition map between the <span id="cell_outer_9">Schwarzschild-Droste chart and the chart of compactified coordinates</span></h3>
<p><span><br />The transition map is obtained by composition of previously defined ones:<br /></span></p>

︡4fbb7cd9-e4a4-49e3-88aa-4e7f4bb2b246︡︡{"done":true,"html":"<h3>Transition map between the <span id=\"cell_outer_9\">Schwarzschild-Droste chart and the chart of compactified coordinates</span></h3>\n<p><span><br />The transition map is obtained by composition of previously defined ones:<br /></span></p>"}
︠d73985ab-6d6b-4ae5-8e33-9438f1881253s︠
SDI_to_CP = KS_to_CP.restrict(regI) * SDI_to_KS
print SDI_to_CP
SDI_to_CP.display()
︡7db7d915-32c7-4cfc-8a63-4042c5e5c6ea︡︡{"stdout":"coordinate change from chart (R_I, (t, r, th, ph)) to chart (R_I, (T1, X1, th, ph))\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} {\\tilde{T}} &amp; = &amp; \\frac{1}{2} \\, \\arctan\\left(\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{t}{4 \\, m}\\right) e^{\\left(\\frac{r}{4 \\, m}\\right)} + \\sqrt{2} e^{\\left(\\frac{r}{4 \\, m}\\right)} \\sinh\\left(\\frac{t}{4 \\, m}\\right)\\right)} \\sqrt{-2 \\, m + r}}{2 \\, \\sqrt{m}}\\right) + \\frac{1}{2} \\, \\arctan\\left(-\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{t}{4 \\, m}\\right) e^{\\left(\\frac{r}{4 \\, m}\\right)} - \\sqrt{2} e^{\\left(\\frac{r}{4 \\, m}\\right)} \\sinh\\left(\\frac{t}{4 \\, m}\\right)\\right)} \\sqrt{-2 \\, m + r}}{2 \\, \\sqrt{m}}\\right) \\\\ {\\tilde{X}} &amp; = &amp; \\frac{1}{2} \\, \\arctan\\left(\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{t}{4 \\, m}\\right) e^{\\left(\\frac{r}{4 \\, m}\\right)} + \\sqrt{2} e^{\\left(\\frac{r}{4 \\, m}\\right)} \\sinh\\left(\\frac{t}{4 \\, m}\\right)\\right)} \\sqrt{-2 \\, m + r}}{2 \\, \\sqrt{m}}\\right) - \\frac{1}{2} \\, \\arctan\\left(-\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{t}{4 \\, m}\\right) e^{\\left(\\frac{r}{4 \\, m}\\right)} - \\sqrt{2} e^{\\left(\\frac{r}{4 \\, m}\\right)} \\sinh\\left(\\frac{t}{4 \\, m}\\right)\\right)} \\sqrt{-2 \\, m + r}}{2 \\, \\sqrt{m}}\\right) \\\\ {\\theta} &amp; = &amp; {\\theta} \\\\ {\\varphi} &amp; = &amp; {\\varphi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠2f8acff0-7d78-4c82-9b9b-08b513d80db9s︠
SDII_to_CP = KS_to_CP.restrict(regII) * SDII_to_KS
print SDII_to_CP
SDII_to_CP.display()
︡99a13ee4-88ed-404e-8b70-bf2461f56856︡︡{"stdout":"coordinate change from chart (R_II, (t, r, th, ph)) to chart (R_II, (T1, X1, th, ph))\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} {\\tilde{T}} &amp; = &amp; \\frac{1}{2} \\, \\arctan\\left(\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{t}{4 \\, m}\\right) e^{\\left(\\frac{r}{4 \\, m}\\right)} + \\sqrt{2} e^{\\left(\\frac{r}{4 \\, m}\\right)} \\sinh\\left(\\frac{t}{4 \\, m}\\right)\\right)} \\sqrt{2 \\, m - r}}{2 \\, \\sqrt{m}}\\right) - \\frac{1}{2} \\, \\arctan\\left(-\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{t}{4 \\, m}\\right) e^{\\left(\\frac{r}{4 \\, m}\\right)} - \\sqrt{2} e^{\\left(\\frac{r}{4 \\, m}\\right)} \\sinh\\left(\\frac{t}{4 \\, m}\\right)\\right)} \\sqrt{2 \\, m - r}}{2 \\, \\sqrt{m}}\\right) \\\\ {\\tilde{X}} &amp; = &amp; \\frac{1}{2} \\, \\arctan\\left(\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{t}{4 \\, m}\\right) e^{\\left(\\frac{r}{4 \\, m}\\right)} + \\sqrt{2} e^{\\left(\\frac{r}{4 \\, m}\\right)} \\sinh\\left(\\frac{t}{4 \\, m}\\right)\\right)} \\sqrt{2 \\, m - r}}{2 \\, \\sqrt{m}}\\right) + \\frac{1}{2} \\, \\arctan\\left(-\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{t}{4 \\, m}\\right) e^{\\left(\\frac{r}{4 \\, m}\\right)} - \\sqrt{2} e^{\\left(\\frac{r}{4 \\, m}\\right)} \\sinh\\left(\\frac{t}{4 \\, m}\\right)\\right)} \\sqrt{2 \\, m - r}}{2 \\, \\sqrt{m}}\\right) \\\\ {\\theta} &amp; = &amp; {\\theta} \\\\ {\\varphi} &amp; = &amp; {\\varphi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠eaa812f1-5e18-4bc3-a9f7-6c2badd5218bi︠
%html
<h2>The Carter-Penrose diagram</h2>
<p>Plot of <span id="cell_outer_8">the Schwarzschild-Droste chart in region I in terms of the compactified coordinates:<br /></span></p>

︡3404d66b-7f3c-4225-a053-0c3e01ee278e︡︡{"done":true,"html":"<h2>The Carter-Penrose diagram</h2>\n<p>Plot of <span id=\"cell_outer_8\">the Schwarzschild-Droste chart in region I in terms of the compactified coordinates:<br /></span></p>"}
︠66a984f6-977c-4eb4-b60d-a85527d8eefbs︠
graphSDI = XSDI.plot(XCP, ranges={t:(-16,16), r:(2.001,12)}, fixed_coords={th:pi/2,ph:0}, ambient_coords=(X1,T1), nb_values=25, style={t:'--', r:'-'}, parameters={m:1})
show(graphSDI)
︡24c090ee-904e-4e53-9f2c-7426ddab6040︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"5ab0e9e3-6fd6-43b2-90a6-aa6bb369ede6","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/5268/tmp_44YTtg.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠f0b97e96-a59c-4ddf-9057-f4219f8fb5c1i︠
%html
<p>Same thing for the <span id="cell_outer_76"><span id="cell_outer_8">Schwarzschild-Droste chart in region II:<br /></span></span></p>

︡50136040-ce7f-4ff2-acad-7b498d37dd1c︡︡{"done":true,"html":"<p>Same thing for the <span id=\"cell_outer_76\"><span id=\"cell_outer_8\">Schwarzschild-Droste chart in region II:<br /></span></span></p>"}
︠ed179df8-517c-4da9-b6c9-4f6a5f733cfas︠
graphSDII = XSDII.plot(XCP, ranges={t:(-16,16), r:(0.001,1.999)}, fixed_coords={th:pi/2,ph:0}, ambient_coords=(X1,T1), nb_values=25, style={t:'--', r:'-'}, color='green', parameters={m:1})
show(graphSDI+graphSDII)
︡54b42867-87cf-4d9d-a6e3-ac9d5de50ac7︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"6ac66708-d012-414f-8bc4-e07b9b8c7cad","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/5268/tmp_unPbmL.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠60f80df1-a267-4b24-ab74-10477b940cc2i︠
%html
<h3>Schwarzschild-Droste coordinates in Regions III and IV</h3>
<p>We introduce a second patch $(t',r',\theta,\varphi)$ of Schwarzschild-Droste coordinates to cover $\mathcal{R}_{\mathrm{III}}\cup \mathcal{R}_{\mathrm{IV}}$:</p>

︡52a2b9e8-e195-4175-a5cc-d809770eec27︡︡{"done":true,"html":"<h3>Schwarzschild-Droste coordinates in Regions III and IV</h3>\n<p>We introduce a second patch $(t',r',\\theta,\\varphi)$ of Schwarzschild-Droste coordinates to cover $\\mathcal{R}_{\\mathrm{III}}\\cup \\mathcal{R}_{\\mathrm{IV}}$:</p>"}
︠f178c75d-383a-4f7c-96ee-abfbb54152bes︠
regIII_IV = regIII.union(regIV)
XSDP.<tp,rp,th,ph> = regIII_IV.chart(r"tp:t' rp:r':(0,+oo) th:(0,pi):\theta ph:(0,2*pi):\varphi")
XSDP.add_restrictions(rp!=2*m)
XSDP
︡d45506f2-a5ff-4b5d-874b-b926c78778fa︡︡{"html":"<div>$\\left(\\mathcal{R}_{\\mathrm{III}}\\cup \\mathcal{R}_{\\mathrm{IV}},({t'}, {r'}, {\\theta}, {\\varphi})\\right)$</div>","done":false}︡{"done":true}
︠c48555b8-84cb-40c5-8c21-f267df5b1e55s︠
XSDIII = XSDP.restrict(regIII, rp>2*m)
XSDIV = XSDP.restrict(regIV, rp<2*m)
XSDIII, XSDIV
︡652bcbc3-fda7-4345-b96d-f4b1e026a8f4︡︡{"html":"<div>($\\left(\\mathcal{R}_{\\mathrm{III}},({t'}, {r'}, {\\theta}, {\\varphi})\\right)$, $\\left(\\mathcal{R}_{\\mathrm{IV}},({t'}, {r'}, {\\theta}, {\\varphi})\\right)$)</div>","done":false}︡{"done":true}
︠11741234-fa27-48d4-8b30-41a48e52710di︠
%html
<p>The transition maps to <span id="cell_outer_71"><span id="cell_outer_5">Kruskal-Szekeres coordinates and compactified coordinates are defined in a manner similar to above:<br /></span></span></p>

︡1cf94800-bd34-42f2-a1fb-1664a6ef9b76︡︡{"done":true,"html":"<p>The transition maps to <span id=\"cell_outer_71\"><span id=\"cell_outer_5\">Kruskal-Szekeres coordinates and compactified coordinates are defined in a manner similar to above:<br /></span></span></p>"}
︠469ecc7d-8b20-46e4-9af8-281a827c4cb9s︠
SDIII_to_KS = XSDIII.transition_map(XKS, [-sqrt(rp/(2*m)-1)*exp(rp/(4*m))*sinh(tp/(4*m)), \
                                          -sqrt(rp/(2*m)-1)*exp(rp/(4*m))*cosh(tp/(4*m)), th, ph],
                                   restrictions2=[X<0, X<T, T<-X])
print SDIII_to_KS
SDIII_to_KS.display()
︡6684623b-2774-4ee7-a5ee-609b7cec6cc7︡︡{"stdout":"coordinate change from chart (R_III, (tp, rp, th, ph)) to chart (R_III, (T, X, th, ph))\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} T &amp; = &amp; -\\sqrt{\\frac{{r'}}{2 \\, m} - 1} e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} \\sinh\\left(\\frac{{t'}}{4 \\, m}\\right) \\\\ X &amp; = &amp; -\\sqrt{\\frac{{r'}}{2 \\, m} - 1} \\cosh\\left(\\frac{{t'}}{4 \\, m}\\right) e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} \\\\ {\\theta} &amp; = &amp; {\\theta} \\\\ {\\varphi} &amp; = &amp; {\\varphi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠1daca34b-a281-41dc-84bb-333958e985b1s︠
SDIV_to_KS = XSDIV.transition_map(XKS, [-sqrt(1-rp/(2*m))*exp(rp/(4*m))*cosh(tp/(4*m)), \
                                        -sqrt(1-rp/(2*m))*exp(rp/(4*m))*sinh(tp/(4*m)), th, ph],
                                       restrictions2=[T<0, T<-X, T<X])
print SDIV_to_KS
SDIV_to_KS.display()
︡a1299574-e89a-4d0d-a16b-4e4a65da043c︡︡{"stdout":"coordinate change from chart (R_IV, (tp, rp, th, ph)) to chart (R_IV, (T, X, th, ph))\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} T &amp; = &amp; -\\sqrt{-\\frac{{r'}}{2 \\, m} + 1} \\cosh\\left(\\frac{{t'}}{4 \\, m}\\right) e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} \\\\ X &amp; = &amp; -\\sqrt{-\\frac{{r'}}{2 \\, m} + 1} e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} \\sinh\\left(\\frac{{t'}}{4 \\, m}\\right) \\\\ {\\theta} &amp; = &amp; {\\theta} \\\\ {\\varphi} &amp; = &amp; {\\varphi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠fdd0e566-0f32-499c-a086-70445d6cca19s︠
SDIII_to_CP = KS_to_CP.restrict(regIII) * SDIII_to_KS
print SDIII_to_CP
SDIII_to_CP.display()
︡15e6778e-d94e-40e3-8573-a7ac6d44da03︡︡{"stdout":"coordinate change from chart (R_III, (tp, rp, th, ph)) to chart (R_III, (T1, X1, th, ph))\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} {\\tilde{T}} &amp; = &amp; -\\frac{1}{2} \\, \\arctan\\left(\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{{t'}}{4 \\, m}\\right) e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} + \\sqrt{2} e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} \\sinh\\left(\\frac{{t'}}{4 \\, m}\\right)\\right)} \\sqrt{-2 \\, m + {r'}}}{2 \\, \\sqrt{m}}\\right) - \\frac{1}{2} \\, \\arctan\\left(-\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{{t'}}{4 \\, m}\\right) e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} - \\sqrt{2} e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} \\sinh\\left(\\frac{{t'}}{4 \\, m}\\right)\\right)} \\sqrt{-2 \\, m + {r'}}}{2 \\, \\sqrt{m}}\\right) \\\\ {\\tilde{X}} &amp; = &amp; -\\frac{1}{2} \\, \\arctan\\left(\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{{t'}}{4 \\, m}\\right) e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} + \\sqrt{2} e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} \\sinh\\left(\\frac{{t'}}{4 \\, m}\\right)\\right)} \\sqrt{-2 \\, m + {r'}}}{2 \\, \\sqrt{m}}\\right) + \\frac{1}{2} \\, \\arctan\\left(-\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{{t'}}{4 \\, m}\\right) e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} - \\sqrt{2} e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} \\sinh\\left(\\frac{{t'}}{4 \\, m}\\right)\\right)} \\sqrt{-2 \\, m + {r'}}}{2 \\, \\sqrt{m}}\\right) \\\\ {\\theta} &amp; = &amp; {\\theta} \\\\ {\\varphi} &amp; = &amp; {\\varphi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠e096805a-2273-4861-82f7-e7e266b086f1s︠
SDIV_to_CP = KS_to_CP.restrict(regIV) * SDIV_to_KS
print SDIV_to_CP
SDIV_to_CP.display()
︡dcf09750-3f95-4dcd-80cd-48091d5f7644︡︡{"stdout":"coordinate change from chart (R_IV, (tp, rp, th, ph)) to chart (R_IV, (T1, X1, th, ph))\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} {\\tilde{T}} &amp; = &amp; -\\frac{1}{2} \\, \\arctan\\left(\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{{t'}}{4 \\, m}\\right) e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} + \\sqrt{2} e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} \\sinh\\left(\\frac{{t'}}{4 \\, m}\\right)\\right)} \\sqrt{2 \\, m - {r'}}}{2 \\, \\sqrt{m}}\\right) + \\frac{1}{2} \\, \\arctan\\left(-\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{{t'}}{4 \\, m}\\right) e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} - \\sqrt{2} e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} \\sinh\\left(\\frac{{t'}}{4 \\, m}\\right)\\right)} \\sqrt{2 \\, m - {r'}}}{2 \\, \\sqrt{m}}\\right) \\\\ {\\tilde{X}} &amp; = &amp; -\\frac{1}{2} \\, \\arctan\\left(\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{{t'}}{4 \\, m}\\right) e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} + \\sqrt{2} e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} \\sinh\\left(\\frac{{t'}}{4 \\, m}\\right)\\right)} \\sqrt{2 \\, m - {r'}}}{2 \\, \\sqrt{m}}\\right) - \\frac{1}{2} \\, \\arctan\\left(-\\frac{{\\left(\\sqrt{2} \\cosh\\left(\\frac{{t'}}{4 \\, m}\\right) e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} - \\sqrt{2} e^{\\left(\\frac{{r'}}{4 \\, m}\\right)} \\sinh\\left(\\frac{{t'}}{4 \\, m}\\right)\\right)} \\sqrt{2 \\, m - {r'}}}{2 \\, \\sqrt{m}}\\right) \\\\ {\\theta} &amp; = &amp; {\\theta} \\\\ {\\varphi} &amp; = &amp; {\\varphi} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠ca94ca33-c7e5-408a-a3d5-5afa18c223e1s︠
graphSDIII = XSDIII.plot(XCP, ranges={tp:(-16,16), rp:(2.001,12)}, fixed_coords={th:pi/2,ph:0}, ambient_coords=(X1,T1), nb_values=25, style={tp:'--', rp:'-'}, parameters={m:1})
show(graphSDIII)
︡788f6cbf-4645-4af4-be20-19f666d8cc44︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"5eea8849-2c39-4ae3-b206-c72011e1f9c7","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/5268/tmp_npB510.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠b7e54a82-3541-45d4-8d04-01e8e7b46832i︠
%html
<p>The final Carter-Penrose diagram of Schwarzschild spacetime:</p>

︡00b2e4cb-3f3e-44a3-8cbe-8e0448d9c249︡︡{"done":true,"html":"<p>The final Carter-Penrose diagram of Schwarzschild spacetime:</p>"}
︠b53fdef4-f109-49f6-8625-640d15c5a2e2s︠
graphSDIV = XSDIV.plot(XCP, ranges={tp:(-16,16), rp:(0.001,1.999)}, fixed_coords={th:pi/2,ph:0}, ambient_coords=(X1,T1), nb_values=25, style={tp:'--', rp:'-'}, color='green', parameters={m:1})
show(graphSDI+graphSDII+graphSDIII+graphSDIV, axes_labels=graphSDI.axes_labels())
︡acd68555-4de4-4d1f-a68d-4bf06430217d︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"8ea6a250-c621-4d4e-b195-c0d74fc8d709","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/5268/tmp_xskADj.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠af15291f-acba-4361-8611-4d79410720ecs︠

︡4c39fe49-5c0b-43d7-b9c1-7cca3b8708b2︡︡{"done":true}










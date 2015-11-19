︠8d205418-218d-4705-9127-7539783b1b61sa︠
%auto
typeset_mode(True, display=False)
︡6230dd88-95ff-44da-a59b-525614e39239︡︡{"auto":true}︡{"done":true}
︠862c8c28-bf8c-45e5-8a3f-19a7fedf70f6i︠
%html
<h1 style="text-align: center;">Sphere $\mathbb{S}^2$</h1>
<p>This worksheet demonstrates <span id="cell_outer_0">a few capabilities of</span>&nbsp; <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.8) on the example of the 2-dimensional sphere.<a href="http://wiki.sagemath.org/days64"><br /></a></p>
<p><em><span style="color: #008080;">The whole worksheet file can be downloaded from</span> <a href="http://sagemanifolds.obspm.fr/examples/sws/SM_sphere_S2.sws">here</a>.</em></p>
<h2>$\mathbb{S}^2$ as a 2-dimensional differentiable manifold</h2>
<p>We start by declaring $\mathbb{S}^2$ as a differentiable manifold of dimension 2 over $\mathbb{R}$:</p>

︡fc86220e-7024-45c4-8c50-bd7e272b0635︡︡{"done":true,"html":"<h1 style=\"text-align: center;\">Sphere $\\mathbb{S}^2$</h1>\n<p>This worksheet demonstrates <span id=\"cell_outer_0\">a few capabilities of</span>&nbsp; <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.8) on the example of the 2-dimensional sphere.<a href=\"http://wiki.sagemath.org/days64\"><br /></a></p>\n<p><em><span style=\"color: #008080;\">The whole worksheet file can be downloaded from</span> <a href=\"http://sagemanifolds.obspm.fr/examples/sws/SM_sphere_S2.sws\">here</a>.</em></p>\n<h2>$\\mathbb{S}^2$ as a 2-dimensional differentiable manifold</h2>\n<p>We start by declaring $\\mathbb{S}^2$ as a differentiable manifold of dimension 2 over $\\mathbb{R}$:</p>"}
︠ffa2bc19-d388-4f4b-af90-8287de53a75cs︠
S2 = Manifold(2, 'S^2', latex_name=r'\mathbb{S}^2', start_index=1)
︡4d8a603f-8dff-499c-ad9d-ccc190913cbb︡︡{"done":true}
︠dbeb270b-9483-4be1-b91f-cad9e9871f8bi︠
%html
<p>The first argument, 2, is the dimension of the manifold, while the second argument is the symbol used to label the manifold.</p>
<p>The argument <span style="font-family: courier new,courier;">start_index</span> sets the index range to be used on the manifold for labelling components w.r.t. a basis or a frame: <span style="font-family: courier new,courier;">start_index=1</span> corresponds to $\{1,2\}$; the default value is <span style="font-family: courier new,courier;">start_index=0</span> and yields to $\{0,1\}$.</p>

︡d9b1fb3c-c050-4d54-803c-4cba282d7a2c︡︡{"done":true,"html":"<p>The first argument, 2, is the dimension of the manifold, while the second argument is the symbol used to label the manifold.</p>\n<p>The argument <span style=\"font-family: courier new,courier;\">start_index</span> sets the index range to be used on the manifold for labelling components w.r.t. a basis or a frame: <span style=\"font-family: courier new,courier;\">start_index=1</span> corresponds to $\\{1,2\\}$; the default value is <span style=\"font-family: courier new,courier;\">start_index=0</span> and yields to $\\{0,1\\}$.</p>"}
︠0f118149-dfc2-4e7b-9c0e-0033238c1b25s︠
print S2
︡cba86da5-eb0c-42d2-9a0f-4d779613a779︡︡{"stdout":"2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠84fcd56d-9224-46a6-a10d-5d99078471fds︠
S2
︡bdc2ea22-049f-436c-8c72-1a2262553bbb︡︡{"html":"<div>$\\mathbb{S}^2$</div>","done":false}︡{"done":true}
︠2344a12f-a8bf-4924-8e63-36f0641c3878i︠
%html
<p>The manifold is a Sage <span style="font-family: courier new,courier;">Parent</span> object:</p>

︡7328a410-610f-45d6-ae52-67b75f5946ab︡︡{"done":true,"html":"<p>The manifold is a Sage <span style=\"font-family: courier new,courier;\">Parent</span> object:</p>"}
︠80383391-c4b7-4f53-b14e-d9afe869f575s︠
isinstance(S2, Parent)
︡73250e67-843c-4540-b0bb-9cefb160c0ba︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠47954dc1-dd5c-49c0-90d6-dbabd98d8747s︠
S2.category()
︡59622a0e-b8ef-4027-ad1b-30ee6a1e6144︡︡{"html":"<div>$\\mathbf{Sets}$</div>","done":false}︡{"done":true}
︠e940ec9e-0b39-420b-a653-c6f7f675efc3i︠
%html
<h2>Coordinate charts on $\mathbb{S}^2$</h2>
<p>The sphere cannot be covered by a single chart. At least two charts are necessary, for instance the charts associated with the stereographic projections from the North pole and the South pole respectively. Let us introduce the open subsets covered by these two charts: \[ U := \mathbb{S}^2\setminus\{N\}, \]&nbsp; \[ V := \mathbb{S}^2\setminus\{S\}, \] where $N$ is a point of $\mathbb{S}^2$, which we shall call the <em>North pole</em>, and $S$ is the point of $U$ of stereographic coordinates $(0,0)$, which we call the <em>South pole</em>:</p>

︡0e11c7f4-4378-4d84-ac2d-8594daa40911︡︡{"done":true,"html":"<h2>Coordinate charts on $\\mathbb{S}^2$</h2>\n<p>The sphere cannot be covered by a single chart. At least two charts are necessary, for instance the charts associated with the stereographic projections from the North pole and the South pole respectively. Let us introduce the open subsets covered by these two charts: \\[ U := \\mathbb{S}^2\\setminus\\{N\\}, \\]&nbsp; \\[ V := \\mathbb{S}^2\\setminus\\{S\\}, \\] where $N$ is a point of $\\mathbb{S}^2$, which we shall call the <em>North pole</em>, and $S$ is the point of $U$ of stereographic coordinates $(0,0)$, which we call the <em>South pole</em>:</p>"}
︠8c013996-5a9f-4695-91c8-862b70f37c5bs︠
U = S2.open_subset('U') ; print U
︡b4beef19-72bd-4be6-9df1-ffb3b5464336︡︡{"stdout":"open subset 'U' of the 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠2bd47f07-53df-4f13-87f5-5ff6f618e7b5s︠
V = S2.open_subset('V') ; print V
︡c69bb8e3-f6d9-470f-8ef3-97205f4fc84f︡︡{"stdout":"open subset 'V' of the 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠1a9d465c-a080-451f-91ed-e024142e6aa1i︠
%html
<p>We declare that $\mathbb{S}^2 = U \cup V$:</p>

︡e0bb3deb-100f-42f4-923e-155c8060da68︡︡{"done":true,"html":"<p>We declare that $\\mathbb{S}^2 = U \\cup V$:</p>"}
︠ad80b297-0832-4af9-9bd4-d5a2321fcb65s︠
S2.declare_union(U, V)
︡e1322307-8d97-4cf3-ba64-c1d5cccad404︡︡{"done":true}
︠7c972f75-ad72-4fe4-83e1-a7548e44766bi︠
%html
<p>Then we declare the stereographic chart on $U$, denoting by $(x,y)$ the coordinates resulting from the stereographic projection from the North pole:</p>

︡30ce4d21-ea90-443f-b6c8-4fcdf705dcbb︡︡{"done":true,"html":"<p>Then we declare the stereographic chart on $U$, denoting by $(x,y)$ the coordinates resulting from the stereographic projection from the North pole:</p>"}
︠e193bab8-9bc9-4423-abbb-ed4cd892d751s︠
stereoN.<x,y> = U.chart()
︡57e77f62-c7ba-42b0-acad-08ec6a2cf211︡︡{"done":true}
︠c9837113-dd19-4ffc-b8ff-c7491525196ds︠
stereoN
︡475478d8-c922-4c13-83c8-1207f7f5ecb6︡︡{"html":"<div>$\\left(U,(x, y)\\right)$</div>","done":false}︡{"done":true}
︠65a81bc2-1ecd-4448-91f4-f9e975b54e68s︠
y is stereoN[2]
︡42c396cb-4443-411d-9ceb-a71d00d9a3a1︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠55eadc07-f9ba-40c4-b267-3a73739d78c7i︠
%html
<p>Similarly, we introduce on $V$ the coordinates $(x',y')$ corresponding to the stereographic projection from the South pole:</p>

︡8e684fbe-5e0b-4026-8832-14dbbc937516︡︡{"done":true,"html":"<p>Similarly, we introduce on $V$ the coordinates $(x',y')$ corresponding to the stereographic projection from the South pole:</p>"}
︠b3377bc5-4dc9-453f-8bc2-12591fb5918es︠
stereoS.<xp,yp> = V.chart(r"xp:x' yp:y'")
︡3c8081df-7ff6-4128-9512-de469fa2ee35︡︡{"done":true}
︠c8a3a9a2-bf3a-445b-8474-397781ec7f8fs︠
stereoS
︡da52ae80-c0b5-4977-b830-efbfaa4a96ac︡︡{"html":"<div>$\\left(V,({x'}, {y'})\\right)$</div>","done":false}︡{"done":true}
︠7d09bd0f-e160-4400-ae1c-37d8d42380b8i︠
%html
<p>At this stage, the user's atlas on the manifold has two charts:</p>

︡955edb1c-56d8-4e57-bef6-16d1b206bb36︡︡{"done":true,"html":"<p>At this stage, the user's atlas on the manifold has two charts:</p>"}
︠f8079eab-67e6-4f1d-b0b2-67832f489bafs︠
S2.atlas()
︡87dc8757-43b6-462e-8926-4cc8e25d19db︡︡{"html":"<div>[$\\left(U,(x, y)\\right)$, $\\left(V,({x'}, {y'})\\right)$]</div>","done":false}︡{"done":true}
︠9f47e37d-abc9-48bb-80c2-b9e0687a1148i︠
%html
<p>We have to specify the <strong>transition map</strong> between the charts 'stereoN' = $(U,(x,y))$ and 'stereoS' = $(V,(x',y'))$; it is given by the standard inversion formulas:</p>

︡b37e14d0-77ff-48ac-9bed-7a96511ed313︡︡{"done":true,"html":"<p>We have to specify the <strong>transition map</strong> between the charts 'stereoN' = $(U,(x,y))$ and 'stereoS' = $(V,(x',y'))$; it is given by the standard inversion formulas:</p>"}
︠a2e575f0-7e37-498a-9b32-817a3b7b3977s︠
stereoN_to_S = stereoN.transition_map(stereoS, (x/(x^2+y^2), y/(x^2+y^2)), intersection_name='W',
                                      restrictions1= x^2+y^2!=0, restrictions2= xp^2+xp^2!=0)
︡c6b2a887-cd44-4085-a800-1d7449cd0e8d︡︡{"done":true}
︠f2201f23-8edb-4b86-8d59-acc224282b8bs︠
stereoN_to_S.display()
︡74118893-c24b-44a0-b844-893e0727ce00︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} {x'} &amp; = &amp; \\frac{x}{x^{2} + y^{2}} \\\\ {y'} &amp; = &amp; \\frac{y}{x^{2} + y^{2}} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠24256800-a0dc-4451-a921-fea5e22a8a6ci︠
%html
<p>In the above declaration, 'W' is the name given to the chart-overlap subset: \[ W := U\cap V, \] the condition $x^2+y^2 \not=0$&nbsp; defines $W$ as a subset of $U$, and the condition $x'^2+y'^2\not=0$ defines $W$ as a subset of $V$.</p>

<p>The inverse coordinate transformation is computed by means of the method <span style="font-family: courier new,courier;">inverse()</span>:</p>

︡b0580b97-e6e5-4170-8186-bab739a4a0c0︡︡{"done":true,"html":"<p>In the above declaration, 'W' is the name given to the chart-overlap subset: \\[ W := U\\cap V, \\] the condition $x^2+y^2 \\not=0$&nbsp; defines $W$ as a subset of $U$, and the condition $x'^2+y'^2\\not=0$ defines $W$ as a subset of $V$.</p>\n\n<p>The inverse coordinate transformation is computed by means of the method <span style=\"font-family: courier new,courier;\">inverse()</span>:</p>"}
︠54ee6499-ca03-46b2-b19f-89d8b07b4265s︠
stereoS_to_N = stereoN_to_S.inverse()
stereoS_to_N.display()
︡445c0e9b-a822-495d-994c-253183a03d92︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} x &amp; = &amp; \\frac{{x'}}{{x'}^{2} + {y'}^{2}} \\\\ y &amp; = &amp; \\frac{{y'}}{{x'}^{2} + {y'}^{2}} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠9e2beaf1-82b4-48bb-9b1c-73f29d9b0448i︠
%html
<p>In the present case, the situation is of course perfectly symmetric regarding the coordinates $(x,y)$ and $(x',y')$.</p>
<p>At this stage, the user's atlas has four charts:</p>

︡7c314058-e7b9-46d0-af84-5567dc0b0c6c︡︡{"done":true,"html":"<p>In the present case, the situation is of course perfectly symmetric regarding the coordinates $(x,y)$ and $(x',y')$.</p>\n<p>At this stage, the user's atlas has four charts:</p>"}
︠fc0c8d35-b808-4d3d-b823-363b4a3557d6s︠
S2.atlas()
︡e224177d-7791-4721-9304-7ac65cc4995e︡︡{"html":"<div>[$\\left(U,(x, y)\\right)$, $\\left(V,({x'}, {y'})\\right)$, $\\left(W,(x, y)\\right)$, $\\left(W,({x'}, {y'})\\right)$]</div>","done":false}︡{"done":true}
︠d0ac768e-f1cc-4ed3-8576-284817b10b05i︠
%html
<p>Let us store $W = U\cap V$ into a Python variable for future use:</p>

︡365e3be8-4600-4258-80ac-9876ad399097︡︡{"done":true,"html":"<p>Let us store $W = U\\cap V$ into a Python variable for future use:</p>"}
︠bf83eaa5-a11a-46a3-8457-39ae45240c91s︠
W = U.intersection(V)
︡63408587-f45d-455b-9e2f-bf17d903164a︡︡{"done":true}
︠0c8dc60b-e365-42ea-be89-114dc66738d6i︠
%html
<p>Similarly we store the charts $(W,(x,y))$ (the restriction of&nbsp; $(U,(x,y))$ to $W$) and $(W,(x',y'))$ (the restriction of $(V,(x',y'))$ to $W$) into Python variables:</p>

︡b88cd8b3-70fb-4192-a5a4-c25dfe40ab7b︡︡{"done":true,"html":"<p>Similarly we store the charts $(W,(x,y))$ (the restriction of&nbsp; $(U,(x,y))$ to $W$) and $(W,(x',y'))$ (the restriction of $(V,(x',y'))$ to $W$) into Python variables:</p>"}
︠76ac7233-4a8c-4d80-b435-5c21dedc8506s︠
stereoN_W = stereoN.restrict(W)
stereoN_W
︡02fe0540-e2f6-4c40-a788-037ea0140a5a︡︡{"html":"<div>$\\left(W,(x, y)\\right)$</div>","done":false}︡{"done":true}
︠d37cdf27-b69d-49d7-b8a6-d5a6ccbf092bs︠
stereoS_W = stereoS.restrict(W)
stereoS_W
︡da69047c-613e-4e4b-b4e4-e57cf4212dc9︡︡{"html":"<div>$\\left(W,({x'}, {y'})\\right)$</div>","done":false}︡{"done":true}
︠9e0fb2f5-ee9b-4a1a-abe1-5ee4cf625252i︠
%html
<p>We may plot the chart $(W, (x',y'))$ in terms of itself, as a grid:</p>

︡0c72a3ee-696a-4c0a-96c1-4f03f95461f7︡︡{"done":true,"html":"<p>We may plot the chart $(W, (x',y'))$ in terms of itself, as a grid:</p>"}
︠754c0589-4180-4ea8-95ee-337806904dc4s︠
stereoS_W.plot()
︡0718b2ff-44b5-4cb3-9bdc-51442a0f49e0︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"f9ebf9c3-d8be-4679-8236-f35e649c3945","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/30455/tmp_u_eANz.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠28577092-c536-457d-8043-572e9c3307eai︠
%html
<p>More interestingly, let us plot the stereographic chart $(x',y')$ in terms of the stereographic chart $(x,y)$ on the domain $W$ where both systems overlap (we split the plot in four parts to avoid the singularity at $(x',y')=(0,0)$):</p>

︡55c568cf-9163-4a6a-b41d-2ae8c5547d93︡︡{"done":true,"html":"<p>More interestingly, let us plot the stereographic chart $(x',y')$ in terms of the stereographic chart $(x,y)$ on the domain $W$ where both systems overlap (we split the plot in four parts to avoid the singularity at $(x',y')=(0,0)$):</p>"}
︠db9f9d93-5cfc-4e94-acf0-fa9c2be2e9b2s︠
graphSN1 = stereoS_W.plot(stereoN, ranges={xp:[-6,-0.02], yp:[-6,-0.02]})
graphSN2 = stereoS_W.plot(stereoN, ranges={xp:[-6,-0.02], yp:[0.02,6]})
graphSN3 = stereoS_W.plot(stereoN, ranges={xp:[0.02,6], yp:[-6,-0.02]})
graphSN4 = stereoS_W.plot(stereoN, ranges={xp:[0.02,6], yp:[0.02,6]})
show(graphSN1+graphSN2+graphSN3+graphSN4,
     xmin=-1.5, xmax=1.5, ymin=-1.5, ymax=1.5)
︡3fdf2b22-933f-4324-b687-8655861f5797︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"542ce2e2-ba11-40fb-811c-2bc2bf7c0485","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/30455/tmp_XwfUWR.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠62bf2447-ef8c-4b65-ac0c-a6e56d9722c2i︠
%html
<h3>Spherical coordinates</h3>
<p>The standard spherical (or polar) coordinates $(\theta,\phi)$ are defined on the open domain $A\subset W \subset \mathbb{S}^2$ that is the complement of the "origin meridian"; since the latter is the half-circle defined by $y=0$ and $x\geq 0$, we declare:</p>

︡2cce4cc5-ad3c-4d93-a9c2-fba401add515︡︡{"done":true,"html":"<h3>Spherical coordinates</h3>\n<p>The standard spherical (or polar) coordinates $(\\theta,\\phi)$ are defined on the open domain $A\\subset W \\subset \\mathbb{S}^2$ that is the complement of the \"origin meridian\"; since the latter is the half-circle defined by $y=0$ and $x\\geq 0$, we declare:</p>"}
︠309dfade-97e1-4c7b-913c-bec792ee9fc9s︠
A = W.open_subset('A', coord_def={stereoN_W: (y!=0, x<0)})
print A
︡9474866f-07a0-49a6-acd1-2a75c2c27026︡︡{"stdout":"open subset 'A' of the 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠bbfea1f1-42ee-42d2-b70d-e41c45a30e84i︠
%html
<p>The restriction of the stereographic chart from the North pole to $A$ is</p>

︡ef854617-9f93-49dc-91a4-1ad422e90337︡︡{"done":true,"html":"<p>The restriction of the stereographic chart from the North pole to $A$ is</p>"}
︠43d0e9cc-f752-4143-baf0-2bcdab76b3ccs︠
stereoN_A = stereoN_W.restrict(A)
stereoN_A
︡e3923260-30da-4f60-8647-4af55d6323b6︡︡{"html":"<div>$\\left(A,(x, y)\\right)$</div>","done":false}︡{"done":true}
︠bf174006-50c4-4d8c-9598-d862f05a0ed4i︠
%html
<p>We then declare the chart $(A,(\theta,\phi))$ by specifying the intervals $(0,\pi)$ and $(0,2\pi)$ spanned by respectively $\theta$ and $\phi$:</p>

︡fa3e3efe-6f72-4109-80a6-97a14a5a5ff5︡︡{"done":true,"html":"<p>We then declare the chart $(A,(\\theta,\\phi))$ by specifying the intervals $(0,\\pi)$ and $(0,2\\pi)$ spanned by respectively $\\theta$ and $\\phi$:</p>"}
︠1c5024f1-0ba5-45f1-9d25-2ad7f20a9c00s︠
spher.<th,ph> = A.chart(r'th:(0,pi):\theta ph:(0,2*pi):\phi') ; spher
︡558fd9d9-74c9-4e3a-af64-ebb5653d7008︡︡{"html":"<div>$\\left(A,({\\theta}, {\\phi})\\right)$</div>","done":false}︡{"done":true}
︠cc5fcde4-73f8-4565-9712-c31c3c6002e7i︠
%html
<p>The specification of the spherical coordinates is completed by providing the transition map with the stereographic chart $(A,(x,y))$:</p>

︡5adb5717-8b32-49fd-9beb-0923bcac0c16︡︡{"done":true,"html":"<p>The specification of the spherical coordinates is completed by providing the transition map with the stereographic chart $(A,(x,y))$:</p>"}
︠b2679cdd-2132-458a-9877-740af53253d2s︠
spher_to_stereoN = spher.transition_map(stereoN_A, (sin(th)*cos(ph)/(1-cos(th)),
                                                    sin(th)*sin(ph)/(1-cos(th))) )
spher_to_stereoN.display()
︡f5e8ff28-a6bf-471e-a7aa-827b512ea72c︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} x &amp; = &amp; -\\frac{\\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)}{\\cos\\left({\\theta}\\right) - 1} \\\\ y &amp; = &amp; -\\frac{\\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)}{\\cos\\left({\\theta}\\right) - 1} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠a5507754-d319-432c-ac4e-967c9613414ai︠
%html
<p><span id="cell_outer_194">We also provide the inverse transition map:</span></p>

︡6d1ff194-aec6-4f7b-8362-626404ebe7d1︡︡{"done":true,"html":"<p><span id=\"cell_outer_194\">We also provide the inverse transition map:</span></p>"}
︠52e5bff4-d75f-450f-a7a0-8accb1a0b46bs︠
spher_to_stereoN.set_inverse(2*atan(1/sqrt(x^2+y^2)), atan2(-y,-x)+pi)
︡ef412dcf-25d0-49cc-8caa-2404911fc917︡︡{"stdout":"Check of the inverse coordinate transformation:","done":false}︡{"stdout":"\n   th == ","done":false}︡{"stdout":"2*arctan(sqrt(-cos(th) + 1)/sqrt(cos(th) + 1))\n   ph == ","done":false}︡{"stdout":"pi + arctan2(sin(ph)*sin(th)/(cos(th) - 1), cos(ph)*sin(th)/(cos(th) - 1))\n   x == ","done":false}︡{"stdout":"x\n   y == ","done":false}︡{"stdout":"y\n","done":false}︡{"done":true}
︠a6e521d5-b860-42eb-bf36-4298ece685fai︠
%html
<p><span id="cell_outer_228">The check is passed, up to some lack of simplification in the functions atan and atan2.</span></p>
<p><span><br />The user atlas of $\mathbb{S}^2$ is now</span></p>

︡eb3d61dd-6bad-48c7-babb-d191d95e2f14︡︡{"done":true,"html":"<p><span id=\"cell_outer_228\">The check is passed, up to some lack of simplification in the functions atan and atan2.</span></p>\n<p><span><br />The user atlas of $\\mathbb{S}^2$ is now</span></p>"}
︠3f0777e2-acd5-4761-ab8e-96329b3688fas︠
S2.atlas()
︡592b564d-ac3e-4639-ad74-7b194a02f3ea︡︡{"html":"<div>[$\\left(U,(x, y)\\right)$, $\\left(V,({x'}, {y'})\\right)$, $\\left(W,(x, y)\\right)$, $\\left(W,({x'}, {y'})\\right)$, $\\left(A,(x, y)\\right)$, $\\left(A,({\\theta}, {\\phi})\\right)$]</div>","done":false}︡{"done":true}
︠9139607b-dfbb-4c92-8fa8-475757427182i︠
%html
<p>Let us draw the grid of spherical coordinates $(\theta,\phi)$ in terms of stereographic coordinates from the North pole $(x,y)$:</p>

︡32b897a6-876d-4a3b-86b4-e80c60c04be2︡︡{"done":true,"html":"<p>Let us draw the grid of spherical coordinates $(\\theta,\\phi)$ in terms of stereographic coordinates from the North pole $(x,y)$:</p>"}
︠4f645d24-b9e2-45f2-8c1b-6f28cef219dds︠
spher.plot(stereoN, nb_values=15, ranges={th: (pi/8,pi)})
︡94a78cb0-da1b-4686-bdcb-819eaf8d6621︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"e8b90693-3400-42aa-9dfa-e04e0b52b2fe","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/30455/tmp_sS9u2i.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠a2eb5070-5436-476e-ad85-fa7efbce0056i︠
%html
<p>Conversly, we may represent the grid of the stereographic coordinates $(x,y)$ restricted to $A$ in terms of the spherical coordinates $(\theta,\phi)$. We limit ourselves to one quarter (cf. the argument<span style="font-family: courier new,courier;"> ranges</span>):</p>

︡2beddac4-7486-40c1-af39-59f78d4f5cac︡︡{"done":true,"html":"<p>Conversly, we may represent the grid of the stereographic coordinates $(x,y)$ restricted to $A$ in terms of the spherical coordinates $(\\theta,\\phi)$. We limit ourselves to one quarter (cf. the argument<span style=\"font-family: courier new,courier;\"> ranges</span>):</p>"}
︠9dddcd8f-9537-4170-9d8c-8d1cab310417s︠
stereoN_A.plot(spher, ranges={x: (0.01,8), y: (0.01,8)}, nb_values=20, plot_points=200)
︡f875cb6d-5b32-456c-a0e7-8320dc3e53b6︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"c0b52d52-6550-4caf-bf4a-1da72ea570b7","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/30455/tmp_I25cvK.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠4c1ac003-f56c-4b87-bd6d-406d01c07838i︠
%html
<h2>Points on $\mathbb{S}^2$</h2>
<p>We declare the <strong>North pole</strong> (resp. the <strong>South pole</strong>) as the point of coordinates $(0,0)$ in the chart $(V,(x',y'))$ (resp. in the chart $(U,(x,y))$):</p>

︡19cc2bfa-fe04-49b9-89a9-6d0e60a6afc4︡︡{"done":true,"html":"<h2>Points on $\\mathbb{S}^2$</h2>\n<p>We declare the <strong>North pole</strong> (resp. the <strong>South pole</strong>) as the point of coordinates $(0,0)$ in the chart $(V,(x',y'))$ (resp. in the chart $(U,(x,y))$):</p>"}
︠f8beacc5-25d2-4ffb-a19e-8da1a71dacacs︠
N = V.point((0,0), chart=stereoS, name='N') ; print N
S = U.point((0,0), chart=stereoN, name='S') ; print S
︡e7ed0501-4249-4e76-a255-119949fe1a12︡︡{"stdout":"point 'N' on 2-dimensional manifold 'S^2'\n","done":false}︡{"stdout":"point 'S' on 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠947466e2-d53e-4bc7-b1f9-37f154c08355i︠
%html
<p>Since points are Sage <span style="font-family: courier new,courier;">Element</span>'s, the corresponding (facade) <span style="font-family: courier new,courier;">Parent</span> being the manifold subsets, an equivalent writing of the above declarations is</p>

︡ce31bb13-f507-4460-8daa-588cc29228c6︡︡{"done":true,"html":"<p>Since points are Sage <span style=\"font-family: courier new,courier;\">Element</span>'s, the corresponding (facade) <span style=\"font-family: courier new,courier;\">Parent</span> being the manifold subsets, an equivalent writing of the above declarations is</p>"}
︠9a43e728-db86-4ec5-a407-62f028991be4s︠
N = V((0,0), chart=stereoS, name='N') ; print N
S = U((0,0), chart=stereoN, name='S') ; print S
︡087e5a7c-ce02-4c48-864e-e5c10e309de8︡︡{"stdout":"point 'N' on 2-dimensional manifold 'S^2'\n","done":false}︡{"stdout":"point 'S' on 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠7c1617da-a853-4eeb-b8b5-561007dbc32ci︠
%html
<p>Moreover, since stereoS in the default chart on $V$ and stereoN is the default one on $U$, their mentions can be omitted, so that the above can be shortened to</p>

︡90f48f04-1dae-4960-a9cd-06ad861b3549︡︡{"done":true,"html":"<p>Moreover, since stereoS in the default chart on $V$ and stereoN is the default one on $U$, their mentions can be omitted, so that the above can be shortened to</p>"}
︠2111e11d-ebce-4425-9e62-63fb16af2d7bs︠
N = V((0,0), name='N') ; print N
S = U((0,0), name='S') ; print S
︡818eb21e-a9c3-4878-a0c4-c2de71ab2d20︡︡{"stdout":"point 'N' on 2-dimensional manifold 'S^2'\n","done":false}︡{"stdout":"point 'S' on 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠81864f2c-e944-4cdb-82e5-48b9236efcc0s︠
N.parent()
︡e5b31664-f431-4168-bd48-a21b9176ebc3︡︡{"html":"<div>$\\mathbb{S}^2$</div>","done":false}︡{"done":true}
︠916e8cdd-c36b-4f40-8816-27d48e72ab9es︠
S.parent()
︡053488e5-fce7-4223-83c1-89b02cc4786f︡︡{"html":"<div>$\\mathbb{S}^2$</div>","done":false}︡{"done":true}
︠b4810f2c-305e-4d6f-8cc2-d89e02f647a1i︠
%html
<p>We have of course</p>

︡6f4c5116-af5d-4348-b2bc-87e6c1cc2124︡︡{"done":true,"html":"<p>We have of course</p>"}
︠2615194f-f249-4754-bb14-22cddfd40c8bs︠
N in V
︡84a70ac2-3861-4575-9a7a-a768ad808e08︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠2fd2716c-685c-46c7-bca3-f3a6aed34c06s︠
N in S2
︡05ea59d7-12fc-4056-8738-104db2b8c0ca︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠826ad590-88c6-492a-b717-cc199fd74ad3s︠
N in U
︡ae5fab53-60f8-4a01-8fa8-69da3cf16d42︡︡{"html":"<div>$\\mathrm{False}$</div>","done":false}︡{"done":true}
︠1b6fb9b6-eccb-417e-aece-68c684869295s︠
N in A
︡40034b36-70de-4b09-92ad-e4c7dcf9983d︡︡{"html":"<div>$\\mathrm{False}$</div>","done":false}︡{"done":true}
︠7d7cf598-cd66-4b6a-8303-32e9c167189ei︠
%html
<p>Let us introduce some point at the equator:</p>

︡cc0a2bfb-939a-4f49-89ad-75c6556a0822︡︡{"done":true,"html":"<p>Let us introduce some point at the equator:</p>"}
︠3e1c2334-07b9-4a60-8075-c02c5640dd26s︠
E = S2((0,1), chart=stereoN, name='E')
︡e6f1c4d6-7eba-4eb7-bd02-c4cac7cb8147︡︡{"done":true}
︠bc45742d-913e-4e60-b1f0-97dd9ceecaeai︠
%html
<p>The point $E$ is in the open subset $A$:</p>

︡d624663c-9ae6-463d-96f2-b465a90bf3b8︡︡{"done":true,"html":"<p>The point $E$ is in the open subset $A$:</p>"}
︠743d4da0-2ff7-4df3-ae57-e7f617eff871s︠
E in A
︡8276ac59-9632-41d5-8e2a-79fd2a676a4f︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠6e94f9c1-f6a4-474e-8b22-fb2d75f5762ei︠
%html
<p>We may then ask for its spherical coordinates $(\theta,\phi)$:</p>

︡92b3b352-97c1-424d-b8ad-ca958de2e057︡︡{"done":true,"html":"<p>We may then ask for its spherical coordinates $(\\theta,\\phi)$:</p>"}
︠4be547c8-fb66-4f3a-a890-ece9684c327cs︠
E.coord(spher)
︡52c1e016-8c78-460f-a6ed-0cf4e34cf099︡︡{"html":"<div>($\\frac{1}{2} \\, \\pi$, $\\frac{1}{2} \\, \\pi$)</div>","done":false}︡{"done":true}
︠c3dbc472-a296-43e1-98c8-7c04050b9290i︠
%html
<p>which is not possible for the point $N$:</p>

︡e3c60050-3036-4f3d-ab8f-08c424dbe0b3︡︡{"done":true,"html":"<p>which is not possible for the point $N$:</p>"}
︠51a7e930-a3dc-4000-924d-f543015481a1s︠
N.coord(spher)
︡288921b5-b529-4594-89f7-ff5cc1b968f4︡︡{"done":false,"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/geometry/manifolds/point.py\", line 341, in coord\n    \"of \" + str(chart))\nValueError: The point does not belong to the domain of chart (A, (th, ph))\n"}︡{"done":true}
︠b0283524-4e77-419a-b109-17a82dc571bai︠
%html
<h2>Mappings between manifolds: the embedding of $\mathbb{S}^2$ into $\mathbb{R}^3$</h2>
<p>Let us first declare $\mathbb{R}^3$ as a 3-dimensional manifold covered by a single chart (the so-called<strong> Cartesian coordinates</strong>):</p>

︡9a35d498-a6b4-4c30-887d-99192a80500e︡︡{"done":true,"html":"<h2>Mappings between manifolds: the embedding of $\\mathbb{S}^2$ into $\\mathbb{R}^3$</h2>\n<p>Let us first declare $\\mathbb{R}^3$ as a 3-dimensional manifold covered by a single chart (the so-called<strong> Cartesian coordinates</strong>):</p>"}
︠707f467d-881f-4099-8237-cd013daa9eb8s︠
R3 = Manifold(3, 'R^3', r'\mathbb{R}^3', start_index=1)
cart.<X,Y,Z> = R3.chart() ; cart
︡3235755d-5e6e-4286-8791-3b09009fd334︡︡{"html":"<div>$\\left(\\mathbb{R}^3,(X, Y, Z)\\right)$</div>","done":false}︡{"done":true}
︠cd5d1708-f62d-49b1-8b51-7e56fbe96ba6i︠
%html
<p>The embedding of the sphere is defined as a differential mapping $\Phi: \mathbb{S}^2 \rightarrow \mathbb{R}^3$:</p>

︡a4ff38f7-e026-4fb1-9bb7-cb03fe5a58f3︡︡{"done":true,"html":"<p>The embedding of the sphere is defined as a differential mapping $\\Phi: \\mathbb{S}^2 \\rightarrow \\mathbb{R}^3$:</p>"}
︠2bafb76a-c9cc-4ebd-8263-76d883b362d1s︠
Phi = S2.diff_mapping(R3, {(stereoN, cart): [2*x/(1+x^2+y^2), 2*y/(1+x^2+y^2),
                                             (x^2+y^2-1)/(1+x^2+y^2)],
                           (stereoS, cart): [2*xp/(1+xp^2+yp^2), 2*yp/(1+xp^2+yp^2),
                                             (1-xp^2-yp^2)/(1+xp^2+yp^2)]},
                      name='Phi', latex_name=r'\Phi')
︡968dddc0-c4c1-4366-91d2-7488a396f15e︡︡{"done":true}
︠cc651f90-af6a-4e92-af6f-953877ab0256s︠
Phi.display()
︡c1944fef-662f-4005-96dc-f3df23314675︡︡{"html":"<div>$\\begin{array}{llcl} \\Phi:&amp; \\mathbb{S}^2 &amp; \\longrightarrow &amp; \\mathbb{R}^3 \\\\ \\mbox{on}\\ U : &amp; \\left(x, y\\right) &amp; \\longmapsto &amp; \\left(X, Y, Z\\right) = \\left(\\frac{2 \\, x}{x^{2} + y^{2} + 1}, \\frac{2 \\, y}{x^{2} + y^{2} + 1}, \\frac{x^{2} + y^{2} - 1}{x^{2} + y^{2} + 1}\\right) \\\\ \\mbox{on}\\ V : &amp; \\left({x'}, {y'}\\right) &amp; \\longmapsto &amp; \\left(X, Y, Z\\right) = \\left(\\frac{2 \\, {x'}}{{x'}^{2} + {y'}^{2} + 1}, \\frac{2 \\, {y'}}{{x'}^{2} + {y'}^{2} + 1}, -\\frac{{x'}^{2} + {y'}^{2} - 1}{{x'}^{2} + {y'}^{2} + 1}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠310fb05e-9757-4191-9e23-7513d9fb0cecs︠
Phi.parent()
︡4b9a7198-7a9b-4399-ba68-581f88e6cc49︡︡{"html":"<div>$\\mathrm{Hom}\\left(\\mathbb{S}^2,\\mathbb{R}^3\\right)$</div>","done":false}︡{"done":true}
︠7d2a23b9-417f-4db7-aef5-18e06fe65f07s︠
print Phi.parent()
︡9cd5462a-5e49-4c5c-becd-2028608ce361︡︡{"stdout":"Set of Morphisms from 2-dimensional manifold 'S^2' to 3-dimensional manifold 'R^3' in Category of sets\n","done":false}︡{"done":true}
︠b5f43538-0942-4cf4-94b5-a93abdf0a12cs︠
Phi.parent() is Hom(S2, R3)
︡3163022a-cf90-4b46-9807-eee695bdca71︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠8aa9f7f9-5550-4366-9ec9-1d47238ab278i︠
%html
<p>$\Phi$ maps points of $\mathbb{S}^2$ to points of $\mathbb{R}^3$:</p>

︡3ca004c6-8a46-4094-ab13-7be19aaab0f6︡︡{"done":true,"html":"<p>$\\Phi$ maps points of $\\mathbb{S}^2$ to points of $\\mathbb{R}^3$:</p>"}
︠c0a029d5-b662-4ded-872c-810b68346f22s︠
N1 = Phi(N) ; print N1 ; N1 ; N1.coord()
︡b2641d6a-2f3a-493c-8796-6a2c0975eab5︡︡{"stdout":"point 'Phi(N)' on 3-dimensional manifold 'R^3'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\Phi\\left(N\\right)$</div>","done":false}︡{"html":"<div>($0$, $0$, $1$)</div>","done":false}︡{"done":true}
︠023d877e-b75e-4185-9764-903f93629044s︠
S1 = Phi(S) ; print S1 ; S1 ; S1.coord()
︡df18c700-986b-4e3a-8846-e9104c52ca0e︡︡{"stdout":"point 'Phi(S)' on 3-dimensional manifold 'R^3'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\Phi\\left(S\\right)$</div>","done":false}︡{"html":"<div>($0$, $0$, $-1$)</div>","done":false}︡{"done":true}
︠0d969fba-b9e6-499c-bc02-364f09a76d9cs︠
E1 = Phi(E) ; print E1 ; E1 ; E1.coord()
︡83b85a87-d722-4d40-9574-c00e3c2ee3cb︡︡{"stdout":"point 'Phi(E)' on 3-dimensional manifold 'R^3'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\Phi\\left(E\\right)$</div>","done":false}︡{"html":"<div>($0$, $1$, $0$)</div>","done":false}︡{"done":true}
︠32b5b00d-838c-4ee2-94d0-421131b1f294i︠
%html
<p>$\Phi$ has been defined in terms of the stereographic charts $(U,(x,y))$ and $(V,(x',y'))$, but we may ask its expression in terms of spherical coordinates. The latter is then computed by means of the transition map $(A,(x,y))\rightarrow (A,(\theta,\phi))$:</p>

︡66467114-c6a7-43d0-b047-95681490b08d︡︡{"done":true,"html":"<p>$\\Phi$ has been defined in terms of the stereographic charts $(U,(x,y))$ and $(V,(x',y'))$, but we may ask its expression in terms of spherical coordinates. The latter is then computed by means of the transition map $(A,(x,y))\\rightarrow (A,(\\theta,\\phi))$:</p>"}
︠96deddf2-f98c-4fbc-a1a8-5a000d5243a2s︠
Phi.expr(stereoN_A, cart)
︡2bcfc3c0-7e12-4cf6-84a3-c1515698cb24︡︡{"html":"<div>($\\frac{2 \\, x}{x^{2} + y^{2} + 1}$, $\\frac{2 \\, y}{x^{2} + y^{2} + 1}$, $\\frac{x^{2} + y^{2} - 1}{x^{2} + y^{2} + 1}$)</div>","done":false}︡{"done":true}
︠85e83190-9754-4dc7-affa-fad18307d342s︠
Phi.expr(spher, cart)
︡396b5f36-96d0-42c6-9202-c1c763124ad7︡︡{"html":"<div>($\\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)$, $\\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)$, $\\cos\\left({\\theta}\\right)$)</div>","done":false}︡{"done":true}
︠f5fd7da6-b2cb-47ca-94d6-9afe2cfc19a9s︠
Phi.display(spher, cart)
︡c429460b-8f77-4a4b-a303-963a586e6cc0︡︡{"html":"<div>$\\begin{array}{llcl} \\Phi:&amp; \\mathbb{S}^2 &amp; \\longrightarrow &amp; \\mathbb{R}^3 \\\\ \\mbox{on}\\ A : &amp; \\left({\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; \\left(X, Y, Z\\right) = \\left(\\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), \\cos\\left({\\theta}\\right)\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠77cfc728-23e6-45ba-9ebc-bcd6754585d3i︠
%html
<p>Let us use $\Phi$ to draw the grid of spherical coordinates $(\theta,\phi)$ in terms of the Cartesian coordinates $(X,Y,Z)$ of $\mathbb{R}^3$:</p>

︡6b0330c0-581e-4f2a-9c0c-7c17536021ff︡︡{"done":true,"html":"<p>Let us use $\\Phi$ to draw the grid of spherical coordinates $(\\theta,\\phi)$ in terms of the Cartesian coordinates $(X,Y,Z)$ of $\\mathbb{R}^3$:</p>"}
︠5fde5f7e-efc2-4c77-bfbf-68e8ba2ae766s︠
graph_spher = spher.plot(chart=cart, mapping=Phi, nb_values=11, color='blue')
show(graph_spher)
︡fb67ada8-47fa-4870-9dee-9606db24900b︡︡{"done":false,"file":{"uuid":"8e62b94a-3dde-46e8-8621-944a52fa075d","filename":"8e62b94a-3dde-46e8-8621-944a52fa075d.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠0ec2de0d-882c-447a-a601-5cd19c8ea7c2i︠
%html
<p>For future use, let us store a version without any label on the axes:</p>

︡13586c18-b8cb-4a0a-90e7-2d3cbdd50dd1︡︡{"done":true,"html":"<p>For future use, let us store a version without any label on the axes:</p>"}
︠2d8c1958-1068-43a2-ba78-7351aa4d63eds︠
graph_spher = spher.plot(chart=cart, mapping=Phi, nb_values=11, color='blue', label_axes=False)
︡66c6661f-05d8-432b-85fc-e54c9d2767b8︡︡{"done":true}
︠4eb7af69-d9d1-479c-9b43-e57ac53e79c9i︠
%html
<p>We may also use the embedding $\Phi$ to display the stereographic coordinate grid in terms of the Cartesian coordinates in $\mathbb{R}^3$. First for the stereographic coordinates from the North pole:</p>

︡e51d8fc5-4f26-42b7-9a15-73bc9134ecca︡︡{"done":true,"html":"<p>We may also use the embedding $\\Phi$ to display the stereographic coordinate grid in terms of the Cartesian coordinates in $\\mathbb{R}^3$. First for the stereographic coordinates from the North pole:</p>"}
︠d46357f3-2d3d-46bf-ba1a-498b91d82b2cs︠
graph_stereoN = stereoN.plot(chart=cart, mapping=Phi, nb_values=25)
show(graph_stereoN)
︡0cd78216-d32b-48d0-8837-ef2111b39e06︡︡{"done":false,"file":{"uuid":"3c608cc0-4e90-452e-87e6-b6d7a0dfe747","filename":"3c608cc0-4e90-452e-87e6-b6d7a0dfe747.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠dcefd972-8ed0-42a6-902d-04f9843a782ci︠
%html
<p>and then have a view with the stereographic coordinates from the South pole superposed (in green):</p>

︡afd5f6d1-a638-48e2-ad81-eb7e9a95c2de︡︡{"done":true,"html":"<p>and then have a view with the stereographic coordinates from the South pole superposed (in green):</p>"}
︠9356d797-b391-4cf6-ad5c-95562d494d10s︠
graph_stereoS = stereoS.plot(chart=cart, mapping=Phi, nb_values=25, color='green')
show(graph_stereoN + graph_stereoS)
︡2edb356a-d670-4ea7-bfa4-73532659bd94︡︡{"done":false,"file":{"uuid":"34fc68d3-48c9-4fc7-a076-f0f7152fe6de","filename":"34fc68d3-48c9-4fc7-a076-f0f7152fe6de.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠28d40ca3-22a7-4453-924b-b8ef0e82e7f1i︠
%html
<p>We may also add the two poles to the graphic:</p>

︡7bb30a09-9b5a-4a4c-92a8-1d5abde96b7f︡︡{"done":true,"html":"<p>We may also add the two poles to the graphic:</p>"}
︠6ff8e17f-b70c-45c5-ba88-3420be129376s︠
pointN = N.plot(chart=cart, mapping=Phi, color='red', label_offset=0.05)
pointS = S.plot(chart=cart, mapping=Phi, color='green', label_offset=0.05)
show(graph_stereoN + graph_stereoS + pointN + pointS)
︡cd179e76-0ccd-459b-ad14-4125397d88f6︡︡{"done":false,"file":{"uuid":"7227b7cf-41f7-4f7b-a481-971fac988dba","filename":"7227b7cf-41f7-4f7b-a481-971fac988dba.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠84422dc2-9854-4e42-b8ab-1f0707540225i︠
%html
<h2>Tangent spaces</h2>
<p>The tangent space to the manifold $\mathbb{S}^2$ at the point $N$ is</p>

︡e72e2de6-2eef-4d88-bedd-dfac256319ef︡︡{"done":true,"html":"<h2>Tangent spaces</h2>\n<p>The tangent space to the manifold $\\mathbb{S}^2$ at the point $N$ is</p>"}
︠8022358b-f46d-4086-b268-e0419c7191ads︠
T_N = N.tangent_space()
print T_N ; T_N
︡3b5fec97-49c8-4e4c-a7dc-b719a89bef22︡︡{"stdout":"tangent space at point 'N' on 2-dimensional manifold 'S^2'\n","done":false}︡{"html":"<div>$T_{N}\\,\\mathbb{S}^2$</div>","done":false}︡{"done":true}
︠56fadcbd-1898-42a6-b066-a77cd1701270i︠
%html
<p>$T_N \mathbb{S}^2$ is a vector space over $\mathbb{R}$ (represented here by Sage's symbolic ring SR):</p>

︡94a40db9-bf3c-41c9-925a-01a43e48937a︡︡{"done":true,"html":"<p>$T_N \\mathbb{S}^2$ is a vector space over $\\mathbb{R}$ (represented here by Sage's symbolic ring SR):</p>"}
︠cedd884f-1125-4773-a2d9-9ed6f5945f4cs︠
T_N.category()
︡10420d91-1aa0-49eb-8de9-0a0a24917270︡︡{"html":"<div>$\\mathbf{VectorSpaces}_{\\text{SR}}$</div>","done":false}︡{"done":true}
︠efb77b80-5c4d-4f2c-90a9-a52373fd95e2i︠
%html
<p>Its dimension equals the manifold's dimension:</p>

︡c4d5b206-6091-44d1-88b9-0eaf8090680d︡︡{"done":true,"html":"<p>Its dimension equals the manifold's dimension:</p>"}
︠6c46a109-f1c8-4906-8994-649ab3c88339s︠
dim(T_N)
︡2160fb46-defd-496e-b389-e959b1007cb1︡︡{"html":"<div>$2$</div>","done":false}︡{"done":true}
︠c18923e6-6c1e-4e97-90a7-8505583654f9s︠
dim(T_N) == dim(S2)
︡35fc4d72-21f1-4c6d-acfe-2beaf8f95f7e︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠f15044d5-d895-4ca6-8def-c7f03f3cdfd6i︠
%html
<p>$T_N \mathbb{S}^2$ is endowed with a basis inherited from the coordinate frame defined around $N$, namely the frame associated with the chart $(V,(x',y'))$:</p>

︡8da3d41c-54da-4aa7-b281-3e918f62b6e7︡︡{"done":true,"html":"<p>$T_N \\mathbb{S}^2$ is endowed with a basis inherited from the coordinate frame defined around $N$, namely the frame associated with the chart $(V,(x',y'))$:</p>"}
︠44796341-fc74-4dda-a207-87e8dfa612acs︠
T_N.bases()
︡1c3e5890-1ea8-4dce-ba43-e4259767f8ec︡︡{"html":"<div>[$\\left(\\frac{\\partial}{\\partial {x'} },\\frac{\\partial}{\\partial {y'} }\\right)$]</div>","done":false}︡{"done":true}
︠2b8b757d-361d-4623-a80d-a0e3433e7129i︠
%html
<p>$(V,(x',y'))$ is the only chart defined so far around the point $N$. If various charts have been defined around a point, then the tangent space at this point is automatically endowed with the bases inherited from the coordinate frames associated to all these charts. For instance, for the equator point $E$:</p>

︡bc4e3d46-93c2-430f-a9a4-6c7292b3266b︡︡{"done":true,"html":"<p>$(V,(x',y'))$ is the only chart defined so far around the point $N$. If various charts have been defined around a point, then the tangent space at this point is automatically endowed with the bases inherited from the coordinate frames associated to all these charts. For instance, for the equator point $E$:</p>"}
︠b468b74b-960f-4714-a810-802f65e6ef42s︠
T_E = E.tangent_space()
print T_E ; T_E
︡fa10f5b8-1197-42ff-9488-b288321f474d︡︡{"stdout":"tangent space at point 'E' on 2-dimensional manifold 'S^2'\n","done":false}︡{"html":"<div>$T_{E}\\,\\mathbb{S}^2$</div>","done":false}︡{"done":true}
︠76e658ff-bb4e-4f8e-b73b-2f7f8a5eec49s︠
T_E.bases()
︡1f6b736d-f987-4706-a03d-feb8565bb0ee︡︡{"html":"<div>[$\\left(\\frac{\\partial}{\\partial x },\\frac{\\partial}{\\partial y }\\right)$, $\\left(\\frac{\\partial}{\\partial {x'} },\\frac{\\partial}{\\partial {y'} }\\right)$, $\\left(\\frac{\\partial}{\\partial {\\theta} },\\frac{\\partial}{\\partial {\\phi} }\\right)$]</div>","done":false}︡{"done":true}
︠009b6846-870f-4043-837f-373598f58fb6s︠
T_E.default_basis()
︡5b4b7eee-b4e5-48f9-8bda-831d0012f810︡︡{"html":"<div>$\\left(\\frac{\\partial}{\\partial x },\\frac{\\partial}{\\partial y }\\right)$</div>","done":false}︡{"done":true}
︠66f29d7c-3838-49a3-af86-2292e86fcd0ci︠
%html
<p>An element of $T_E\mathbb{S}^2$:</p>

︡87a998ec-8fd8-4383-a051-6d0529eac278︡︡{"done":true,"html":"<p>An element of $T_E\\mathbb{S}^2$:</p>"}
︠79a531fa-26a6-459e-bd03-e746512ab7b1s︠
v = T_E((-3, 2), name='v')
print v
︡d1de6972-4304-466d-be6e-1c44798975a7︡︡{"stdout":"tangent vector v at point 'E' on 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠57e825f4-8a7a-448e-b07e-ac4f105c141ds︠
v in T_E
︡d2491fbe-4070-42ea-8394-446e0681787a︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠a99233b5-4148-4020-b6b9-3e6f430ae9dbs︠
v.parent()
︡aad32919-005d-4187-a097-c717bfdc8bcb︡︡{"html":"<div>$T_{E}\\,\\mathbb{S}^2$</div>","done":false}︡{"done":true}
︠74d4871b-ae7a-435d-aaf6-bd1ab5e3c6b3s︠
v.display()
︡f4f7979e-0b56-498a-b734-7d2e7e644cfa︡︡{"html":"<div>$v = -3 \\frac{\\partial}{\\partial x } + 2 \\frac{\\partial}{\\partial y }$</div>","done":false}︡{"done":true}
︠73df7d8f-b72d-4399-92c0-b9af05f30f41s︠
v.display(T_E.bases()[1])
︡fc17cd92-c2ef-4e56-9fb7-d08d797d149b︡︡{"html":"<div>$v = -3 \\frac{\\partial}{\\partial {x'} } -2 \\frac{\\partial}{\\partial {y'} }$</div>","done":false}︡{"done":true}
︠74ff8769-8a49-4542-9667-ca5267b633e0s︠
v.display(T_E.bases()[2])
︡3285590b-059f-4616-8764-c272a546f874︡︡{"html":"<div>$v = -2 \\frac{\\partial}{\\partial {\\theta} } + 3 \\frac{\\partial}{\\partial {\\phi} }$</div>","done":false}︡{"done":true}
︠9461ae75-71a6-4dc9-a5f4-9c27d0f09488i︠
%html
<h3>Differential of a smooth mapping</h3>
<p>The differential of the mapping $\Phi$ at the point $E$ is</p>

︡e5e5f9a1-2084-4de8-8d3f-81c387a49666︡︡{"done":true,"html":"<h3>Differential of a smooth mapping</h3>\n<p>The differential of the mapping $\\Phi$ at the point $E$ is</p>"}
︠1c8db4d0-ce97-4073-91dd-2ff822f69126s︠
dPhi_E = Phi.differential(E)
print dPhi_E ; dPhi_E
︡339c9e78-a3c8-4ead-9c1d-0ddfcb7037f2︡︡{"stdout":"Generic morphism:\n  From: tangent space at point 'E' on 2-dimensional manifold 'S^2'\n  To:   tangent space at point 'Phi(E)' on 3-dimensional manifold 'R^3'\n","done":false}︡{"html":"<div>$\\mathrm{d}\\Phi_{E}$</div>","done":false}︡{"done":true}
︠d71d0699-a24c-4246-93a9-37fb41ca9fe7s︠
dPhi_E.domain()
︡974aad16-831b-4930-aa73-a179b6b04c81︡︡{"html":"<div>$T_{E}\\,\\mathbb{S}^2$</div>","done":false}︡{"done":true}
︠36bddcf3-ef0c-400d-ac21-b7597b611290s︠
dPhi_E.codomain()
︡5fd81b76-833c-4171-8650-a5c1cb527921︡︡{"html":"<div>$T_{\\Phi\\left(E\\right)}\\,\\mathbb{R}^3$</div>","done":false}︡{"done":true}
︠4c9c97d7-437d-48c9-9804-4e3b840fed97s︠
dPhi_E.parent()
︡be7ae297-f94d-4629-8841-b782ae7d8ad4︡︡{"html":"<div>$\\mathrm{Hom}\\left(T_{E}\\,\\mathbb{S}^2,T_{\\Phi\\left(E\\right)}\\,\\mathbb{R}^3\\right)$</div>","done":false}︡{"done":true}
︠7dfc178b-2476-4481-874e-2a1b3ea403edi︠
%html
<p>The image by $\mathrm{d}\Phi_E$ of the vector $v\in T_E\mathbb{S}^2$ introduced above is</p>

︡317b721c-592e-473d-a168-cae5e5d812c9︡︡{"done":true,"html":"<p>The image by $\\mathrm{d}\\Phi_E$ of the vector $v\\in T_E\\mathbb{S}^2$ introduced above is</p>"}
︠6b1a6e4e-9cd8-4c22-a00a-41c71dbdf58es︠
dPhi_E(v)
︡003b9a71-56a8-4dbe-8e4c-8c6c45a09914︡︡{"html":"<div>$\\mathrm{d}\\Phi_{E}\\left(v\\right)$</div>","done":false}︡{"done":true}
︠37e71aad-c053-4a4e-a1be-5b50e18e3986s︠
print dPhi_E(v)
︡10abf032-09c8-4e4e-9580-1cd4e4d4a61b︡︡{"stdout":"tangent vector dPhi_E(v) at point 'Phi(E)' on 3-dimensional manifold 'R^3'\n","done":false}︡{"done":true}
︠1dd3726d-ebde-4397-b83d-4f60366a46e8s︠
dPhi_E(v) in Phi(E).tangent_space()
︡b46adbdd-5527-4f9d-afc3-51dcfbd81e55︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠4707b47a-895c-4e36-b3c9-6cb8ebdf8544s︠
dPhi_E(v).display()
︡0aaac2ff-6a2b-4f3a-a1d5-b7a83dcce64e︡︡{"html":"<div>$\\mathrm{d}\\Phi_{E}\\left(v\\right) = -3 \\frac{\\partial}{\\partial X } + 2 \\frac{\\partial}{\\partial Z }$</div>","done":false}︡{"done":true}
︠290cc971-d9de-4987-a992-39bff2a17edfi︠
%html
<h2>Algebra of scalar fields</h2>
<p>The set $C^\infty(\mathbb{S}^2)$ of all smooth functions $\mathbb{S}^2\rightarrow \mathbb{R}$ has naturally the structure of a commutative algebra over $\mathbb{R}$. $C^\infty(\mathbb{S}^2)$ is obtained via the method <span style="font-family: courier new,courier;">scalar_field_algebra()</span> applied to the manifold $\mathbb{S}^2$:</p>

︡8064acc7-10a3-415a-911e-1d339c80781c︡︡{"done":true,"html":"<h2>Algebra of scalar fields</h2>\n<p>The set $C^\\infty(\\mathbb{S}^2)$ of all smooth functions $\\mathbb{S}^2\\rightarrow \\mathbb{R}$ has naturally the structure of a commutative algebra over $\\mathbb{R}$. $C^\\infty(\\mathbb{S}^2)$ is obtained via the method <span style=\"font-family: courier new,courier;\">scalar_field_algebra()</span> applied to the manifold $\\mathbb{S}^2$:</p>"}
︠a6e98a37-8b5f-4afb-99f4-d64bae13fedas︠
CS = S2.scalar_field_algebra() ; CS
︡9a1a7e0c-ee48-45b4-bdf3-811adabc2690︡︡{"html":"<div>$C^\\infty(\\mathbb{S}^2)$</div>","done":false}︡{"done":true}
︠d55883f4-b180-434b-b056-c114360b411ei︠
%html
<p>Since the algebra internal product is the pointwise multiplication, it is clearly commutative, so that $C^\infty(\mathbb{S}^2)$ belongs to Sage's category of commutative algebras:</p>

︡315e39c5-4843-484d-95d3-02eb720ed3ca︡︡{"done":true,"html":"<p>Since the algebra internal product is the pointwise multiplication, it is clearly commutative, so that $C^\\infty(\\mathbb{S}^2)$ belongs to Sage's category of commutative algebras:</p>"}
︠20821998-9083-4618-b1fa-fe3e25a6c056s︠
CS.category()
︡337dcf52-b5c5-48e1-a725-a0f6393159b7︡︡{"html":"<div>$\\mathbf{CommutativeAlgebras}_{\\text{SR}}$</div>","done":false}︡{"done":true}
︠e755bb18-3832-4667-a711-b86c82b469eci︠
%html
<p>The base ring of the algebra $C^\infty(\mathbb{S}^2)$ is the field $\mathbb{R}$, which is represented here by Sage's Symbolic Ring (SR):</p>

︡482d9fe0-4969-4efd-a65d-a4223e61c9df︡︡{"done":true,"html":"<p>The base ring of the algebra $C^\\infty(\\mathbb{S}^2)$ is the field $\\mathbb{R}$, which is represented here by Sage's Symbolic Ring (SR):</p>"}
︠1719e925-81a2-4f4b-bdbb-a322dce36a9es︠
CS.base_ring()
︡986835b7-72ed-4706-8be4-913b2b734110︡︡{"html":"<div>$\\text{SR}$</div>","done":false}︡{"done":true}
︠66c2bdd5-995f-43d5-95d4-7b61cf5205a5i︠
%html
<p>Elements of $C^\infty(\mathbb{S}^2)$ are of course (smooth) scalar fields:</p>

︡209d75d1-5311-4adb-93d1-36258637ded2︡︡{"done":true,"html":"<p>Elements of $C^\\infty(\\mathbb{S}^2)$ are of course (smooth) scalar fields:</p>"}
︠00bbf0d7-94a9-436a-9f19-7e1a6b89e300s︠
print CS.an_element()
︡ab80d0e4-8196-4e34-bc09-eb0c030a7b87︡︡{"stdout":"scalar field on the 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠5b32cbc3-1b79-4135-92f2-4efa8b493650i︠
%html
<p>This example element is the constant scalar field that takes the value 2:</p>

︡3dbead40-284b-4770-b0f3-45a2b48535f3︡︡{"done":true,"html":"<p>This example element is the constant scalar field that takes the value 2:</p>"}
︠246b74b5-2e32-40aa-96e3-93baa595259fs︠
CS.an_element().display()
︡852d370d-3555-429f-b2f6-91132de23d27︡︡{"html":"<div>$\\begin{array}{llcl} &amp; \\mathbb{S}^2 &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ \\mbox{on}\\ U : &amp; \\left(x, y\\right) &amp; \\longmapsto &amp; 2 \\\\ \\mbox{on}\\ V : &amp; \\left({x'}, {y'}\\right) &amp; \\longmapsto &amp; 2 \\\\ \\mbox{on}\\ A : &amp; \\left({\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; 2 \\end{array}$</div>","done":false}︡{"done":true}
︠4b2cdc5f-4763-4ec3-86a8-321ce48e4ddfi︠
%html
<p>A specific element is the zero one:</p>

︡07b49c58-4590-421d-9057-3cbf3248b0e4︡︡{"done":true,"html":"<p>A specific element is the zero one:</p>"}
︠892806cf-a1ef-4f08-8401-cff221abd7b4s︠
f = CS.zero()
print f
︡94907b65-5685-468c-8c89-afee5f707c02︡︡{"stdout":"scalar field 'zero' on the 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠bf095f9d-a6b8-4415-9b44-9c26c8c5cd08i︠
%html
<p>Scalar fields map points of $\mathbb{S}^2$ to real numbers:</p>

︡42cc1c0e-8cc7-4d5a-8b58-0774d09bf15b︡︡{"done":true,"html":"<p>Scalar fields map points of $\\mathbb{S}^2$ to real numbers:</p>"}
︠725b1d01-f18f-4fd0-bb29-66b08e3f6e08s︠
f(N), f(E), f(S)
︡f121257f-424d-418b-94a3-1f7df2df8e34︡︡{"html":"<div>($0$, $0$, $0$)</div>","done":false}︡{"done":true}
︠b19699d9-d833-4b4a-aa2a-33a2eca7ac92s︠
f.display()
︡026bdc8b-fd68-459f-9f1c-bad45e97f4c5︡︡{"html":"<div>$\\begin{array}{llcl} 0:&amp; \\mathbb{S}^2 &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ \\mbox{on}\\ U : &amp; \\left(x, y\\right) &amp; \\longmapsto &amp; 0 \\\\ \\mbox{on}\\ V : &amp; \\left({x'}, {y'}\\right) &amp; \\longmapsto &amp; 0 \\\\ \\mbox{on}\\ A : &amp; \\left({\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; 0 \\end{array}$</div>","done":false}︡{"done":true}
︠12306d14-e182-42e6-83ae-bdde20ca976ei︠
%html
<p>Another specific element is the algebra unit element, i.e. the constant scalar field 1:</p>

︡f2853ca7-255f-410f-b764-a880722ee52b︡︡{"done":true,"html":"<p>Another specific element is the algebra unit element, i.e. the constant scalar field 1:</p>"}
︠ec0cdd78-5bfe-41e6-bf68-6e7c8a660f6ds︠
f = CS.one()
print f
︡bb33e326-94df-4f93-b462-5f729b70008f︡︡{"stdout":"scalar field on the 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠bb9f6689-e62c-4fc8-bb23-5fe36f570b77s︠
f(N), f(E), f(S)
︡8cd74eee-f9e1-4d8c-a3a2-a0142e7e0a68︡︡{"html":"<div>($1$, $1$, $1$)</div>","done":false}︡{"done":true}
︠83697fe7-6bdb-4e8c-92f3-e33ca0ec5a19s︠
f.display()
︡3a4a2e00-ad38-46a8-aa75-e3b2717b5c6a︡︡{"html":"<div>$\\begin{array}{llcl} &amp; \\mathbb{S}^2 &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ \\mbox{on}\\ U : &amp; \\left(x, y\\right) &amp; \\longmapsto &amp; 1 \\\\ \\mbox{on}\\ V : &amp; \\left({x'}, {y'}\\right) &amp; \\longmapsto &amp; 1 \\\\ \\mbox{on}\\ A : &amp; \\left({\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; 1 \\end{array}$</div>","done":false}︡{"done":true}
︠42956f24-a32c-46cf-a90f-83c3c16a03dei︠
%html
<p>Let us define a scalar field by its coordinate expression in the two stereographic charts:</p>

︡146aef77-f9c2-4176-97c5-1e835ed87299︡︡{"done":true,"html":"<p>Let us define a scalar field by its coordinate expression in the two stereographic charts:</p>"}
︠d9dd44e7-5ed6-4910-ba9d-2a4c4381a070s︠
f = CS({stereoN: pi - 2*atan(x^2+y^2), stereoS: 2*atan(xp^2+yp^2)})
f.display()
︡275e5851-8dc8-48e0-b789-a4b0e760d217︡︡{"html":"<div>$\\begin{array}{llcl} &amp; \\mathbb{S}^2 &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ \\mbox{on}\\ U : &amp; \\left(x, y\\right) &amp; \\longmapsto &amp; \\pi - 2 \\, \\arctan\\left(x^{2} + y^{2}\\right) \\\\ \\mbox{on}\\ V : &amp; \\left({x'}, {y'}\\right) &amp; \\longmapsto &amp; 2 \\, \\arctan\\left({x'}^{2} + {y'}^{2}\\right) \\\\ \\mbox{on}\\ A : &amp; \\left({\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; \\pi + 2 \\, \\arctan\\left(\\frac{\\cos\\left({\\theta}\\right) + 1}{\\cos\\left({\\theta}\\right) - 1}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠16ac5807-a695-47f0-8465-44f2e969e703i︠
%html
<p>Instead of using <span style="font-family: courier new,courier;">CS()</span> (i.e. the Parent __call__ function), we may invoke the <span style="font-family: courier new,courier;">scalar_field</span> method on the manifold to create $f$; this allows to pass the name of the scalar field:</p>

︡d99d9c17-cb57-43b6-9563-c82c4f46f001︡︡{"done":true,"html":"<p>Instead of using <span style=\"font-family: courier new,courier;\">CS()</span> (i.e. the Parent __call__ function), we may invoke the <span style=\"font-family: courier new,courier;\">scalar_field</span> method on the manifold to create $f$; this allows to pass the name of the scalar field:</p>"}
︠275da819-b5d1-4679-b710-13ceec8e6bbcs︠
f = S2.scalar_field({stereoN: pi - 2*atan(x^2+y^2), stereoS: 2*atan(xp^2+yp^2)}, name='f')
f.display()
︡0e57b052-057e-468e-8d30-44c0380642f6︡︡{"html":"<div>$\\begin{array}{llcl} f:&amp; \\mathbb{S}^2 &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ \\mbox{on}\\ U : &amp; \\left(x, y\\right) &amp; \\longmapsto &amp; \\pi - 2 \\, \\arctan\\left(x^{2} + y^{2}\\right) \\\\ \\mbox{on}\\ V : &amp; \\left({x'}, {y'}\\right) &amp; \\longmapsto &amp; 2 \\, \\arctan\\left({x'}^{2} + {y'}^{2}\\right) \\\\ \\mbox{on}\\ A : &amp; \\left({\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; \\pi + 2 \\, \\arctan\\left(\\frac{\\cos\\left({\\theta}\\right) + 1}{\\cos\\left({\\theta}\\right) - 1}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠3fd85546-1df4-489a-abc2-4f825b62a261s︠
f.parent()
︡95568684-642e-4bda-908a-c1a28b2faa38︡︡{"html":"<div>$C^\\infty(\\mathbb{S}^2)$</div>","done":false}︡{"done":true}
︠ab193174-0abd-4d20-91d2-86dad344ce2fi︠
%html
<p>Internally, the various coordinate expressions of the scalar field are stored in the dictionary <span style="font-family: courier new,courier;">_express</span>, whose keys are the charts:</p>

︡380a98c0-7621-4b02-b587-24c2191766b0︡︡{"done":true,"html":"<p>Internally, the various coordinate expressions of the scalar field are stored in the dictionary <span style=\"font-family: courier new,courier;\">_express</span>, whose keys are the charts:</p>"}
︠dfaeb158-9bbd-442d-aba6-18487496dbd0s︠
f._express
︡d9c37e86-d517-4dcc-9b5d-b2680e037b81︡︡{"html":"<div>$\\left\\{\\left(A,(x, y)\\right) : \\pi - 2 \\, \\arctan\\left(x^{2} + y^{2}\\right), \\left(A,({\\theta}, {\\phi})\\right) : \\pi + 2 \\, \\arctan\\left(\\frac{\\cos\\left({\\theta}\\right) + 1}{\\cos\\left({\\theta}\\right) - 1}\\right), \\left(U,(x, y)\\right) : \\pi - 2 \\, \\arctan\\left(x^{2} + y^{2}\\right), \\left(V,({x'}, {y'})\\right) : 2 \\, \\arctan\\left({x'}^{2} + {y'}^{2}\\right)\\right\\}$</div>","done":false}︡{"done":true}
︠7d426da8-9338-4820-aa48-ffe56cdeadb6i︠
%html
<p>The expression in a specific chart is recovered by passing the chart as the argument of the method <span style="font-family: courier new,courier;">display()</span>:</p>

︡d274133b-f104-4522-a38a-ee77ebdd75c1︡︡{"done":true,"html":"<p>The expression in a specific chart is recovered by passing the chart as the argument of the method <span style=\"font-family: courier new,courier;\">display()</span>:</p>"}
︠1dd70bfa-bfd0-4d42-b686-08fe3534bf64s︠
f.display(stereoS)
︡03aeb466-d575-4923-820b-00a3514e1ba9︡︡{"html":"<div>$\\begin{array}{llcl} f:&amp; \\mathbb{S}^2 &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ \\mbox{on}\\ V : &amp; \\left({x'}, {y'}\\right) &amp; \\longmapsto &amp; 2 \\, \\arctan\\left({x'}^{2} + {y'}^{2}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠14177ec5-f038-4b41-846b-6bcb6da4f104i︠
%html
<p>Scalar fields map the manifold's points to real numbers:</p>

︡d4b978be-9448-487e-bb5e-5bca8c4a73b7︡︡{"done":true,"html":"<p>Scalar fields map the manifold's points to real numbers:</p>"}
︠19d489e5-e574-493f-a08c-98e58065efc3s︠
f(N)
︡90476b97-fff7-4fe0-ad1c-8eaacdcd55e6︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠27ffcd0d-ad73-435c-b71f-a69515834606s︠
f(E)
︡686c4348-b9f3-4730-a03b-9efda7db6f60︡︡{"html":"<div>$\\frac{1}{2} \\, \\pi$</div>","done":false}︡{"done":true}
︠b1c2ecbf-9d71-4ebc-a6ad-3964912e582ds︠
f(S)
︡8913ccfe-01e5-4a98-9e88-e10192bd9f1a︡︡{"html":"<div>$\\pi$</div>","done":false}︡{"done":true}
︠7b3e2b2a-dd73-4d9e-8c31-6ad81df65f09i︠
%html
<p>We may define the restrictions of $f$ to the open subsets $U$ and $V$:</p>

︡d9d69de0-579b-4b42-adf1-79116c3812db︡︡{"done":true,"html":"<p>We may define the restrictions of $f$ to the open subsets $U$ and $V$:</p>"}
︠25bdcd3c-54e2-4d96-b83e-06ad9e8623ces︠
fU = f.restrict(U)
fU.display()
︡1491702f-ef20-4c8c-b02a-6b8aeefddd13︡︡{"html":"<div>$\\begin{array}{llcl} f:&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y\\right) &amp; \\longmapsto &amp; \\pi - 2 \\, \\arctan\\left(x^{2} + y^{2}\\right) \\\\ \\mbox{on}\\ W : &amp; \\left({x'}, {y'}\\right) &amp; \\longmapsto &amp; 2 \\, \\arctan\\left({x'}^{2} + {y'}^{2}\\right) \\\\ \\mbox{on}\\ A : &amp; \\left({\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; \\pi + 2 \\, \\arctan\\left(\\frac{\\cos\\left({\\theta}\\right) + 1}{\\cos\\left({\\theta}\\right) - 1}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠090ead7c-5cec-4bb9-94f6-74cd42226179s︠
fV = f.restrict(V)
fV.display()
︡3637a9f3-0dfe-4375-bbbd-0dc7a789eb66︡︡{"html":"<div>$\\begin{array}{llcl} f:&amp; V &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left({x'}, {y'}\\right) &amp; \\longmapsto &amp; 2 \\, \\arctan\\left({x'}^{2} + {y'}^{2}\\right) \\\\ \\mbox{on}\\ W : &amp; \\left(x, y\\right) &amp; \\longmapsto &amp; \\pi - 2 \\, \\arctan\\left(x^{2} + y^{2}\\right) \\\\ \\mbox{on}\\ A : &amp; \\left({\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; \\pi + 2 \\, \\arctan\\left(\\frac{\\cos\\left({\\theta}\\right) + 1}{\\cos\\left({\\theta}\\right) - 1}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠96ee1538-af06-4948-ae99-def685a47c1as︠
fU(E), fU(S)
︡7c3b4ce2-76df-47bd-842e-c53561f6ca80︡︡{"html":"<div>($\\frac{1}{2} \\, \\pi$, $\\pi$)</div>","done":false}︡{"done":true}
︠ef53e53d-4a0d-416e-b2cb-ac17f2130bebs︠
fU.parent()
︡cf6c47a0-b8a2-46da-8415-c0c42f217451︡︡{"html":"<div>$C^\\infty(U)$</div>","done":false}︡{"done":true}
︠6a8f83fa-f14d-47e2-85e0-2cf209b26bb6s︠
fV.parent()
︡81792773-e03a-48a4-9476-a4486b17fa4e︡︡{"html":"<div>$C^\\infty(V)$</div>","done":false}︡{"done":true}
︠07543d0f-b9a8-4e5c-b601-f78afab4c93fs︠
CU = U.scalar_field_algebra()
fU.parent() is CU
︡51f52b2b-86a5-4f6c-a031-d277c51c30af︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠ef787239-59c7-4976-903a-b07bfca7c799i︠
%html
<p>A scalar field on $\mathbb{S}^2$ can be coerced to a scalar field on $U$, the coercion being simply the restriction:</p>

︡5f22a3de-c671-4f07-8c21-9cdec72e8dfc︡︡{"done":true,"html":"<p>A scalar field on $\\mathbb{S}^2$ can be coerced to a scalar field on $U$, the coercion being simply the restriction:</p>"}
︠9250ca9d-58b6-40cf-892b-4b5240a3843as︠
CU.has_coerce_map_from(CS)
︡2765baf4-ef28-46dd-a78e-ee64b94f27f0︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠92674966-1b30-498b-b5b9-e12e869cf6c9s︠
fU == CU(f)
︡1c0b343f-665e-419d-b4cd-9376933acd3d︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠b37dbd31-54f9-48e3-bf51-451ce8fdd523i︠
%html
<p>The arithmetic of scalar fields:</p>

︡262bbf88-5324-4217-9257-115acb02d6fc︡︡{"done":true,"html":"<p>The arithmetic of scalar fields:</p>"}
︠359fe5d8-2e10-4c8f-92a7-89ff0d38caf3s︠
g = f*f - 2*f
g.display()
︡bf534c67-baf1-4f17-9c51-e4fe101e3e5a︡︡{"html":"<div>$\\begin{array}{llcl} &amp; \\mathbb{S}^2 &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ \\mbox{on}\\ U : &amp; \\left(x, y\\right) &amp; \\longmapsto &amp; -2 \\, \\pi + \\pi^{2} - 4 \\, {\\left(\\pi - 1\\right)} \\arctan\\left(x^{2} + y^{2}\\right) + 4 \\, \\arctan\\left(x^{2} + y^{2}\\right)^{2} \\\\ \\mbox{on}\\ V : &amp; \\left({x'}, {y'}\\right) &amp; \\longmapsto &amp; 4 \\, \\arctan\\left({x'}^{2} + {y'}^{2}\\right)^{2} - 4 \\, \\arctan\\left({x'}^{2} + {y'}^{2}\\right) \\\\ \\mbox{on}\\ A : &amp; \\left({\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; -2 \\, \\pi + \\pi^{2} + 4 \\, {\\left(\\pi - 1\\right)} \\arctan\\left(\\frac{\\cos\\left({\\theta}\\right) + 1}{\\cos\\left({\\theta}\\right) - 1}\\right) + 4 \\, \\arctan\\left(\\frac{\\cos\\left({\\theta}\\right) + 1}{\\cos\\left({\\theta}\\right) - 1}\\right)^{2} \\end{array}$</div>","done":false}︡{"done":true}
︠3c07b739-713b-41a2-a0ea-b29cd1b7e403i︠
%html
<h2>Module of vector fields</h2>
<p>The set $\mathcal{X}(\mathbb{S}^2)$ of all smooth vector fields on $\mathbb{S}^2$ is a module over the algebra (ring) $C^\infty(\mathbb{S}^2)$. It is obtained by the method <span style="font-family: courier new,courier;">vector_field_module()</span>:</p>

︡6f66beef-378d-44c0-8e38-fe7f181a27ef︡︡{"done":true,"html":"<h2>Module of vector fields</h2>\n<p>The set $\\mathcal{X}(\\mathbb{S}^2)$ of all smooth vector fields on $\\mathbb{S}^2$ is a module over the algebra (ring) $C^\\infty(\\mathbb{S}^2)$. It is obtained by the method <span style=\"font-family: courier new,courier;\">vector_field_module()</span>:</p>"}
︠24baaa3d-8a75-4227-8136-6824b0685f28s︠
XS = S2.vector_field_module()
XS
︡cdbb0ffd-9718-4978-be0c-1052db445cf2︡︡{"html":"<div>$\\mathcal{X}\\left(\\mathbb{S}^2\\right)$</div>","done":false}︡{"done":true}
︠7d401e10-7ea5-4501-9267-2ae7535d0108s︠
print XS
︡de1d5590-fc06-4e5f-a53b-5a31bb28b327︡︡{"stdout":"module X(S^2) of vector fields on the 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠66025976-1a74-4c1e-994e-0867b47bcaa7s︠
XS.base_ring()
︡3678e757-5ac5-4486-b15a-31d23947c6c9︡︡{"html":"<div>$C^\\infty(\\mathbb{S}^2)$</div>","done":false}︡{"done":true}
︠d7f3b952-4b84-44a5-a5ed-9b78e553146es︠
XS.category()
︡2efaa001-83f1-4c42-bf33-67810afe39e8︡︡{"html":"<div>$\\mathbf{Modules}_{C^\\infty(\\mathbb{S}^2)}$</div>","done":false}︡{"done":true}
︠916e2531-b9cc-4754-a613-973dbe3f4029i︠
%html
<p>$\mathcal{X}(\mathbb{S}^2)$ is not a free module:</p>

︡83e4006b-1875-4b37-b28e-f28be4e27090︡︡{"done":true,"html":"<p>$\\mathcal{X}(\\mathbb{S}^2)$ is not a free module:</p>"}
︠b6dce541-b588-4da2-a667-f1d61f307294s︠
isinstance(XS, FiniteRankFreeModule)
︡9d542dd6-1441-4c3f-9cf3-c9c9ec2c73d9︡︡{"html":"<div>$\\mathrm{False}$</div>","done":false}︡{"done":true}
︠ba7f5f4e-4254-4d25-80b4-910a67a7ec7ai︠
%html
<p>because $\mathbb{S}^2$ is not a parallelizable manifold:</p>

︡7dce1674-cdb2-41cf-9a95-ebc2f308fee6︡︡{"done":true,"html":"<p>because $\\mathbb{S}^2$ is not a parallelizable manifold:</p>"}
︠8f369e77-d8b1-4012-95d6-5597d6cf8e84s︠
S2.is_manifestly_parallelizable()
︡54084796-1206-4090-b9c4-0aae1be5b57d︡︡{"html":"<div>$\\mathrm{False}$</div>","done":false}︡{"done":true}
︠27ee4609-1600-4db0-b7fc-5d81c4e9adc6i︠
%html
<p>On the contrary, the set $\mathcal{X}(U)$ of smooth vector fields on $U$ is a free module:</p>

︡6d669c9a-84ed-4d5a-9129-8df9acbc30ee︡︡{"done":true,"html":"<p>On the contrary, the set $\\mathcal{X}(U)$ of smooth vector fields on $U$ is a free module:</p>"}
︠a5169feb-8332-4eb7-8098-1a927c7780ebs︠
XU = U.vector_field_module()
isinstance(XU, FiniteRankFreeModule)
︡9026eb96-3a49-40ef-b8ce-ab9e2a508ef5︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠39b4ceb4-a3ce-4897-ae7f-201dff0ba723i︠
%html
<p>because $U$ is parallelizable:</p>

︡6c31a4f6-39eb-4cc3-921f-f8086ec15a3d︡︡{"done":true,"html":"<p>because $U$ is parallelizable:</p>"}
︠1a881c06-d3d4-41dc-a2c2-88ce00af6b46s︠
U.is_manifestly_parallelizable()
︡a137cf82-f067-4fd2-b5f6-84bf5e3e64ea︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠3a3374c6-6a81-4c99-9785-4af25ed73490i︠
%html
<p>Due to the introduction of the stereographic coordinates $(x,y)$ on $U$, a basis has already been defined on the free module $\mathcal{X}(U)$, namely the coordinate basis $(\partial/\partial x, \partial/\partial y)$:</p>

︡00ec274b-9176-4c13-87dd-315445cd80e7︡︡{"done":true,"html":"<p>Due to the introduction of the stereographic coordinates $(x,y)$ on $U$, a basis has already been defined on the free module $\\mathcal{X}(U)$, namely the coordinate basis $(\\partial/\\partial x, \\partial/\\partial y)$:</p>"}
︠0c43920d-3dcc-4a62-abd3-1566d9754546s︠
XU.print_bases()
︡c8622cd4-8392-4791-9ea0-3a00e00f88f2︡︡{"stdout":"Bases defined on the free module X(U) of vector fields on the open subset 'U' of the 2-dimensional manifold 'S^2':\n - (U, (d/dx,d/dy)) (default basis)\n","done":false}︡{"done":true}
︠ead120a0-827d-4f02-8502-fc8dc3245579s︠
XU.default_basis()
︡e4795069-732b-418b-8195-f6ff63326818︡︡{"html":"<div>$\\left(U ,\\left(\\frac{\\partial}{\\partial x },\\frac{\\partial}{\\partial y }\\right)\\right)$</div>","done":false}︡{"done":true}
︠2c15f96d-07dd-4099-8094-fc89b01cf245i︠
%html
<p>Similarly</p>

︡49fd06cc-4005-41dc-a46e-8295e119a049︡︡{"done":true,"html":"<p>Similarly</p>"}
︠1a9b8276-901d-44c7-9aff-011dced55fa9s︠
XV = V.vector_field_module()
XV.default_basis()
︡8c52a932-8d66-4ec9-b687-175abd621269︡︡{"html":"<div>$\\left(V ,\\left(\\frac{\\partial}{\\partial {x'} },\\frac{\\partial}{\\partial {y'} }\\right)\\right)$</div>","done":false}︡{"done":true}
︠0c0ada3d-8ce5-4c66-b6c3-99f7d941d4f9s︠
eU = XU.default_basis()
eV = XV.default_basis()
︡a074a3b4-7a9e-49fe-bfec-4c4e901e34d6︡︡{"done":true}
︠5c6d2bde-823f-4705-8602-9e8633bbd99ei︠
%html
<p>From the point of view of the open set $U$, eU is also the default vector frame:</p>

︡b7270b78-bac3-42cc-8b0a-c9e8e8282942︡︡{"done":true,"html":"<p>From the point of view of the open set $U$, eU is also the default vector frame:</p>"}
︠d35b8a47-3249-43b6-92b5-bbe1b2222153s︠
eU is U.default_frame()
︡22a8b0b6-2520-4f68-923e-1b5fc222528a︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠675fd214-f6fd-475a-889f-c2b57869369ci︠
%html
<p>It is also the default vector frame on $\mathbb{S}^2$ (although not defined on the whole $\mathbb{S}^2$), for it is the first vector frame defined on an open subset of $\mathbb{S}^2$:</p>

︡538f1a9e-a1b2-4344-b76a-b1fd2ef63427︡︡{"done":true,"html":"<p>It is also the default vector frame on $\\mathbb{S}^2$ (although not defined on the whole $\\mathbb{S}^2$), for it is the first vector frame defined on an open subset of $\\mathbb{S}^2$:</p>"}
︠5511094d-b35c-415c-984f-6ce3ec1de788s︠
eU is S2.default_frame()
︡ccfbe453-26cc-4227-9fba-b325ec920806︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠c311c411-1a50-47aa-951a-50a595d180abs︠
eV is V.default_frame()
︡d1867b4f-ebe0-4aec-a9b9-d443c57c9146︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠d83643ff-1998-4931-aade-0c13fa8d0157i︠
%html
<p>Let us introduce a vector field on $\mathbb{S}^2$:</p>

︡4cff22ee-2253-4a5d-8593-384c69741420︡︡{"done":true,"html":"<p>Let us introduce a vector field on $\\mathbb{S}^2$:</p>"}
︠89b84fbe-2c9d-4741-a308-2a7766f168d8s︠
v = S2.vector_field(name='v')
v[eU,:] = [1, -2]
v.display(eU)
︡0a093946-fdc9-4002-9f19-146d9ca38abe︡︡{"html":"<div>$v = \\frac{\\partial}{\\partial x } -2 \\frac{\\partial}{\\partial y }$</div>","done":false}︡{"done":true}
︠ea37742a-1d64-43d5-802e-d767495b0cb5s︠
v.parent()
︡bc6e8c53-ecc2-471c-be5e-c6321abedd8b︡︡{"html":"<div>$\\mathcal{X}\\left(\\mathbb{S}^2\\right)$</div>","done":false}︡{"done":true}
︠c1591461-09f8-4b0f-b808-150a346c92ces︠
stereoSW = stereoS.restrict(W)
eSW = stereoSW.frame()
eSW
︡74efd3bb-a0fe-44af-8d8f-98994a40b0c5︡︡{"html":"<div>$\\left(W ,\\left(\\frac{\\partial}{\\partial {x'} },\\frac{\\partial}{\\partial {y'} }\\right)\\right)$</div>","done":false}︡{"done":true}
︠7ef3e343-b7ef-4975-8328-f0b784431656s︠
vW = v.restrict(W)
vW.display()
︡9b30a153-f4a8-421b-a32f-ab3389435c9a︡︡{"html":"<div>$v = \\frac{\\partial}{\\partial x } -2 \\frac{\\partial}{\\partial y }$</div>","done":false}︡{"done":true}
︠3ea27304-6d1a-471b-9a42-0a8c5473175ds︠
vW.parent()
︡413e6ff6-e183-4821-ab48-981d32f8834a︡︡{"html":"<div>$\\mathcal{X}\\left(W\\right)$</div>","done":false}︡{"done":true}
︠9dd9118d-df45-48af-b93a-d6734f180de7s︠
print vW.parent()
︡51922c54-1429-4c72-b4b2-83b1e86b3772︡︡{"stdout":"free module X(W) of vector fields on the open subset 'W' of the 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠1d87e699-da34-46c5-81c5-8de368b17890s︠
vW.display(eSW)
︡16f21439-87e1-4065-b86b-617bdd4c2b6d︡︡{"html":"<div>$v = \\left( -\\frac{x^{2} - 4 \\, x y - y^{2}}{x^{4} + 2 \\, x^{2} y^{2} + y^{4}} \\right) \\frac{\\partial}{\\partial {x'} } + \\left( -\\frac{2 \\, {\\left(x^{2} + x y - y^{2}\\right)}}{x^{4} + 2 \\, x^{2} y^{2} + y^{4}} \\right) \\frac{\\partial}{\\partial {y'} }$</div>","done":false}︡{"done":true}
︠fd888910-3811-43fd-ada7-cd27150ab4eds︠
vW.display(eSW, stereoSW)
︡70aeaa87-bed6-4399-80ad-a08a5d8dc2f4︡︡{"html":"<div>$v = \\left( -{x'}^{2} + 4 \\, {x'} {y'} + {y'}^{2} \\right) \\frac{\\partial}{\\partial {x'} } + \\left( -2 \\, {x'}^{2} - 2 \\, {x'} {y'} + 2 \\, {y'}^{2} \\right) \\frac{\\partial}{\\partial {y'} }$</div>","done":false}︡{"done":true}
︠80177f6c-d4b2-431e-bf4c-3b9e845802c3i︠
%html
<p>We extend the definition of $v$ to $V$ thanks to the above expression:</p>

︡962908e0-a958-4507-8499-6c9ce4042b8d︡︡{"done":true,"html":"<p>We extend the definition of $v$ to $V$ thanks to the above expression:</p>"}
︠3bac63d5-e7eb-46e6-b11b-8ce3fa68cd05s︠
v.add_comp_by_continuation(eV, W, chart=stereoS)
︡6fea451a-6638-4dce-9a11-10e1f1e10cde︡︡{"done":true}
︠f10d7739-ebfd-431a-bf08-3495c7fadbf2s︠
v.display(eV)
︡7f5a8ff2-74a7-4aa6-8687-f20d72d9a582︡︡{"html":"<div>$v = \\left( -{x'}^{2} + 4 \\, {x'} {y'} + {y'}^{2} \\right) \\frac{\\partial}{\\partial {x'} } + \\left( -2 \\, {x'}^{2} - 2 \\, {x'} {y'} + 2 \\, {y'}^{2} \\right) \\frac{\\partial}{\\partial {y'} }$</div>","done":false}︡{"done":true}
︠fa1ba151-fef2-4460-869f-36661273e79bi︠
%html
<p>At this stage, the vector field $v$ is defined on the whole manifold $\mathbb{S}^2$; it has expressions in each of the two frames eU and eV which cover $\mathbb{S}^2$:</p>

︡80edeb1f-95eb-49dd-b89b-0b4261e25a99︡︡{"done":true,"html":"<p>At this stage, the vector field $v$ is defined on the whole manifold $\\mathbb{S}^2$; it has expressions in each of the two frames eU and eV which cover $\\mathbb{S}^2$:</p>"}
︠7a15695c-f1db-4e1d-bc1a-53ef14dde21ds︠
print v
v.display(eU)
︡4dd8e4f8-0e47-4144-9721-d73fbc3f058e︡︡{"stdout":"vector field 'v' on the 2-dimensional manifold 'S^2'\n","done":false}︡{"html":"<div>$v = \\frac{\\partial}{\\partial x } -2 \\frac{\\partial}{\\partial y }$</div>","done":false}︡{"done":true}
︠2bb651b2-121c-48fb-8df0-2b8ff308c7f5s︠
v.display(eV)
︡e1021a57-f5f7-4b0f-b257-294436a03c3e︡︡{"html":"<div>$v = \\left( -{x'}^{2} + 4 \\, {x'} {y'} + {y'}^{2} \\right) \\frac{\\partial}{\\partial {x'} } + \\left( -2 \\, {x'}^{2} - 2 \\, {x'} {y'} + 2 \\, {y'}^{2} \\right) \\frac{\\partial}{\\partial {y'} }$</div>","done":false}︡{"done":true}
︠298fc71f-380d-4e3f-b72a-ad40c996a8b6i︠
%html
<p>According to the hairy ball theorem, $v$ has to vanish somewhere. This occurs at the North pole:</p>

︡8e3f0901-760e-4949-87b0-fa73cf5e5264︡︡{"done":true,"html":"<p>According to the hairy ball theorem, $v$ has to vanish somewhere. This occurs at the North pole:</p>"}
︠bc1c945f-fd87-4c37-a5cd-c47b21f31b7as︠
vN = v.at(N)
print vN
︡22263a2a-6237-4092-8e43-e9c8bffd4dce︡︡{"stdout":"tangent vector v at point 'N' on 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠cb6e2074-deab-4f51-9dd9-5e863d0834e0s︠
vN.display()
︡b08103ca-6bd3-45c7-9f6a-2ba408c52770︡︡{"html":"<div>$v = 0$</div>","done":false}︡{"done":true}
︠e9500284-70a8-49db-9b60-7b6eb7de74a5i︠
%html
<p>$v|_N$ is the zero vector of the tangent vector space $T_N\mathbb{S}^2$:</p>

︡169a4f5e-802c-46c7-b11e-8e945dabc03e︡︡{"done":true,"html":"<p>$v|_N$ is the zero vector of the tangent vector space $T_N\\mathbb{S}^2$:</p>"}
︠10beaff3-3315-4d74-b1b2-8b5e2b6ad486s︠
vN.parent()
︡256a5f6d-cf6d-4884-a499-29d7ad64e942︡︡{"html":"<div>$T_{N}\\,\\mathbb{S}^2$</div>","done":false}︡{"done":true}
︠a453e23c-a1ac-40ec-8929-a85b8e43eadds︠
vN.parent() is N.tangent_space()
︡c30ca5ea-7acf-4ba7-91a3-03981405ff02︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠f36df45e-b78e-41c8-8911-dd29b14c5ed7s︠
vN == N.tangent_space().zero()
︡d79c86a4-b9fe-4b35-911b-3154211ddf5e︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠187d27ab-ee5a-48d6-860f-eacb7948e27ai︠
%html
<p>On the contrary, $v$ is non-zero at the South pole:</p>

︡24e63c95-6547-4b9e-8a05-11076bcce58f︡︡{"done":true,"html":"<p>On the contrary, $v$ is non-zero at the South pole:</p>"}
︠982d76f6-aedd-4a10-aad2-47e2d33e247es︠
vS = v.at(S)
print vS
︡0e2c78ca-d95b-4ea6-b2e4-b8bf92d867a8︡︡{"stdout":"tangent vector v at point 'S' on 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠ff0b15d0-850e-48c6-8167-3c543a9443dds︠
vS.display()
︡d2fcf5c9-6342-4e45-b9de-439c62f4eff6︡︡{"html":"<div>$v = \\frac{\\partial}{\\partial x } -2 \\frac{\\partial}{\\partial y }$</div>","done":false}︡{"done":true}
︠38448507-698c-4800-b185-aa8fd39b3165s︠
vS.parent()
︡e29b71cb-6349-4a01-8100-e4978d286996︡︡{"html":"<div>$T_{S}\\,\\mathbb{S}^2$</div>","done":false}︡{"done":true}
︠6eb591f5-8cec-48d4-9123-86a637c441bas︠
vS.parent() is S.tangent_space()
︡c0d268bf-7bcd-48f6-91aa-f362e5d76679︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠8731c551-8b0a-47a1-8c3b-7d595f3947bas︠
vS != S.tangent_space().zero()
︡826dd045-14c8-4f37-a9b4-b60ef33db925︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠8371a32e-6d3a-4586-b18b-f93d88d3ede4i︠
%html
<p>Let us plot the vector field $v$ is terms of the stereographic chart $(U,(x,y))$, with the South pole $S$ superposed:</p>

︡7b0917a3-cbaa-4b43-836d-ec3a57947719︡︡{"done":true,"html":"<p>Let us plot the vector field $v$ is terms of the stereographic chart $(U,(x,y))$, with the South pole $S$ superposed:</p>"}
︠67d9429e-78ef-4b18-8878-d866cdd93236r︠
v.plot(chart=stereoN, chart_domain=stereoN, max_value=4, nb_values=5, 
       scale=0.5, aspect_ratio=1) + \
 S.plot(stereoN, size=30, label_offset=0.2)
︡31e5d3cd-48cc-4273-a1d7-11edfa3cbe74︡
︠11e05c96-3463-4f1b-ab6e-96842a10bd5ei︠
%html
<p>The vector field appears homogeneous because its components w.r.t. the frame $\left(\frac{\partial}{\partial x}, \frac{\partial}{\partial y}\right)$ are constant:</p>

︡78c8e04f-7bdc-4cfb-bfc6-b728a86c1128︡︡{"done":true,"html":"<p>The vector field appears homogeneous because its components w.r.t. the frame $\\left(\\frac{\\partial}{\\partial x}, \\frac{\\partial}{\\partial y}\\right)$ are constant:</p>"}
︠99ec0dbb-6943-4a67-8d46-a1f7461668a0r︠
v.display(stereoN.frame())
︡f7938d0c-5cee-4ac1-a682-1c58c6c02d1c︡
︠91b994ca-6791-4f15-9ae1-1bd47e17067bi︠
%html
<p>On the contrary, once drawn in terms of the stereographic chart $(V, (x',y'))$, $v$ does no longer appears homogeneous:</p>

︡b4350ce4-7aa7-4522-958c-7fa3f29e1222︡︡{"done":true,"html":"<p>On the contrary, once drawn in terms of the stereographic chart $(V, (x',y'))$, $v$ does no longer appears homogeneous:</p>"}
︠37e637af-8b9d-414c-a92c-7855a98b61bar︠
v.plot(chart=stereoS, chart_domain=stereoS, max_value=4, scale=0.02, aspect_ratio=1) + \
 N.plot(chart=stereoS, size=30, label_offset=0.2)
︡13b31a43-08fe-4f31-bc1b-67f5816cf7fc︡
︠f78cd24a-04e4-4096-84d1-ae97193fe700i︠
%html
<p>Finally, a 3D view of the vector field $v$ is obtained via the embedding $\Phi$:</p>

︡d37e06e8-99c1-4c58-a95a-9adf5c927c08︡︡{"done":true,"html":"<p>Finally, a 3D view of the vector field $v$ is obtained via the embedding $\\Phi$:</p>"}
︠000217b6-bb49-4905-af26-1b40fadcee71s︠
graph_v = v.plot(chart=cart, mapping=Phi, chart_domain=spher, nb_values=11, scale=0.2)
show(graph_v + graph_spher, aspect_ratio=1)
︡6a41f7f6-c0b5-46e0-9884-910fb7eb8d46︡︡{"done":false,"stderr":"Error in lines 1-1\n"}︡{"done":false,"stderr":"Traceback (most recent call last):\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/geometry/manifolds/vectorfield.py\", line 528, in plot\n    **extra_options)\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/geometry/manifolds/tangentspace.py\", line 284, in plot\n    eff_vector = mapping.differential(self._point)._call_(self)\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/tensor/modules/free_module_morphism.py\", line 882, in _call_\n    \"of {} by {}\".format(element,self))\nValueError: no common basis found to evaluate the image of tangent vector v at point on 2-dimensional manifold 'S^2' by Generic morphism:\n  From: tangent space at point on 2-dimensional manifold 'S^2'\n  To:   tangent space at point on 3-dimensional manifold 'R^3'\n"}︡{"done":true}
︠cc97ed9e-7952-4b9a-867f-67083177e68ei︠
%html
<p>Similarly, let us draw the first vector field of the stereographic frame from the North pole, namely $\frac{\partial}{\partial x}$:</p>

︡ef369267-bbdd-4ab9-85c7-8d91df1e19ea︡︡{"done":true,"html":"<p>Similarly, let us draw the first vector field of the stereographic frame from the North pole, namely $\\frac{\\partial}{\\partial x}$:</p>"}
︠d08041f8-d1f6-49da-b7bb-79507802e1e4r︠
ex = stereoN.frame()[1]
ex
︡b869736b-2f83-4222-b891-46d994c784fa︡
︠7afafbbd-7fe4-4fb8-9c6c-4fae9e457d39s︠
graph_ex = ex.plot(chart=cart, mapping=Phi, chart_domain=spher,
                   nb_values=11, scale=0.4, width=1)
show(graph_ex + graph_spher, aspect_ratio=1)
︡dd0993c2-5cfa-43e2-b8b8-0467e288c13a︡︡{"done":false,"stderr":"Error in lines 1-2\nTraceback (most recent call last):\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nNameError: name 'ex' is not defined\n"}︡{"done":true}
︠c7105ac8-487e-47ae-bf5e-e968925bc926i︠
%html
<p>For the second vector field of the stereographic frame from the North pole, namely $\frac{\partial}{\partial y}$, we get</p>

︡2d0dc373-92f6-458b-8f50-244df092434c︡︡{"done":true,"html":"<p>For the second vector field of the stereographic frame from the North pole, namely $\\frac{\\partial}{\\partial y}$, we get</p>"}
︠895c0a4f-7dda-4529-bf80-86fe5c260185r︠
ey = stereoN.frame()[2]
ey
︡b27d21a4-b93b-467a-8ba4-d757e0e33fb6︡
︠9acbfae9-6e00-4d2a-8aae-b069d2478718r︠
graph_ey = ey.plot(chart=cart, mapping=Phi, chart_domain=spher,
                   nb_values=11, scale=0.4, width=1, color='red', 
                   label_axes=False)
show(graph_ey + graph_spher, aspect_ratio=1)
︡4c8e36fd-c04f-493a-a2d8-ec82820dc95a︡
︠c3a37747-99ff-4dd0-a66e-1117b31793a7i︠
%html
<p>We may superpose the two graphs, to get a 3D view of the frame associated with the stereographic coordinates from the North pole:</p>

︡d9dfc35e-db69-4d7c-8e31-87e3d8e1a9cf︡︡{"done":true,"html":"<p>We may superpose the two graphs, to get a 3D view of the frame associated with the stereographic coordinates from the North pole:</p>"}
︠bdae2a13-e412-4fba-b919-0dbd459320e0s︠
show(graph_ex + graph_ey + graph_spher + 
     N.plot(cart, mapping=Phi, label_offset=0.05) + 
     S.plot(cart, mapping=Phi, label_offset=0.05),
     aspect_ratio=1)
︡9e0f4b3c-2e00-481e-867b-1041a03bc69a︡︡{"done":false,"stderr":"Error in lines 1-4\nTraceback (most recent call last):\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 2, in <module>\nNameError: name 'graph_ex' is not defined\n"}︡{"done":true}
︠f2173a7a-a3a6-4fb6-8e7f-c595bdcfb1c3i︠
%html
<p>A Tachyon view of the same frame:</p>

︡b1798747-43b2-4ae3-9c32-efc59f343e9d︡︡{"done":true,"html":"<p>A Tachyon view of the same frame:</p>"}
︠07da8527-3121-4ce5-b9fb-a26655922836r︠
show(graph_ex + graph_ey + graph_spher + 
     N.plot(cart, mapping=Phi, label_offset=0.05, size=5) + 
     S.plot(cart, mapping=Phi, label_offset=0.05, size=5) + 
     sphere(opacity=0.5),
     aspect_ratio=1, viewer='tachyon', figsize=10)
︡aa5dda9e-7c40-46b9-b5a8-642bd0e474da︡
︠02c95c4f-b178-4d4a-b00c-85e3f4a82e3ei︠
%html
<h3>Vector fields acting on scalar fields</h3>
<p>$v$ and $f$ are both fields defined on the whole sphere (respectively a vector field and a scalar field). By the very definition of a vector field, $v$ acts on $f$:</p>

︡c7d7001f-da53-40d1-a44f-676576dc5299︡︡{"done":true,"html":"<h3>Vector fields acting on scalar fields</h3>\n<p>$v$ and $f$ are both fields defined on the whole sphere (respectively a vector field and a scalar field). By the very definition of a vector field, $v$ acts on $f$:</p>"}
︠7091405e-e6e0-4ae1-a4c3-539b7570cbbdr︠
vf = v(f)
print vf
vf.display()
︡ab800427-8d54-4ff8-b679-738105226368︡
︠e02bb0d9-3a91-41ef-a890-8adc11ac3075i︠
%html
<p>Values of $v(f)$ at the North pole, at the equator point $E$ and at the South pole:</p>

︡bebd7c46-5f52-4d4c-9f65-f643dbb5ddda︡︡{"done":true,"html":"<p>Values of $v(f)$ at the North pole, at the equator point $E$ and at the South pole:</p>"}
︠ae5b6a72-063f-455a-bfbe-776678a7c79dr︠
vf(N)
︡e24354d5-3c1e-4797-af45-47abf8ed0fe9︡
︠158036c2-4f1e-40d3-a89e-df84209a6852s︠
vf(E)
︡19d163a9-9a3f-4fcd-8869-807bc68990a3︡︡{"done":false,"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nNameError: name 'vf' is not defined\n"}︡{"done":true}
︠f6ac3b2d-4b4b-4a5d-a496-2f94a59ce063r︠
vf(S)
︡3a7bb4b4-7082-4681-9745-eb756e4b0e99︡
︠4500bc65-c16b-469e-abc4-6e78d77afab5i︠
%html
<h2>1-forms</h2>
<p>A 1-form on $\mathbb{S}^2$ is a field of linear forms on the tangent spaces. For instance it can the differential of a scalar field:</p>

︡02fba505-cae9-4f5b-aeaf-c96755e9749a︡︡{"done":true,"html":"<h2>1-forms</h2>\n<p>A 1-form on $\\mathbb{S}^2$ is a field of linear forms on the tangent spaces. For instance it can the differential of a scalar field:</p>"}
︠6ce1f53d-5669-42c2-a089-e6a8b9bd6665r︠
df = f.differential() ; print df
︡20ee3e49-7ecb-471b-b7e7-4204eb35007c︡
︠aab1288b-47dc-449b-b2fe-fc03f67560ffs︠
df.display()
︡d70ae44d-be80-40a2-93a6-09b193ddf9ae︡︡{"done":false,"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nNameError: name 'df' is not defined\n"}︡{"done":true}
︠12b921b6-9a2f-442e-84bb-04ab8e6c5bc9s︠
print df.parent()
︡1d2e03b5-0364-4795-baaf-4a8dcf02904f︡︡{"done":false,"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nNameError: name 'df' is not defined\n"}︡{"done":true}
︠28517adf-0057-4fdd-b261-a5b3be4fe88es︠
df.parent()
︡83f259cc-2dfd-4259-b53d-182155abb948︡︡{"done":false,"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nNameError: name 'df' is not defined\n"}︡{"done":true}
︠1d4061e5-a3dd-4749-bd4d-67f37d3ed879i︠
%html
<p><span id="cell_outer_146">The 1-form acting on a vector field:</span></p>

︡f865aed5-2a88-4cfb-90cb-2c3b5d47ece5︡︡{"done":true,"html":"<p><span id=\"cell_outer_146\">The 1-form acting on a vector field:</span></p>"}
︠fe9ce6a5-29d1-4378-9963-00025a109f80s︠
print df(v) ; df(v).display()
︡b706293b-9fd5-453b-82f1-f75a6cb28823︡︡{"done":false,"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nNameError: name 'df' is not defined\n"}︡{"done":true}
︠a26af5cd-94f8-49fe-95ee-55eb73a24df4i︠
%html
<p>Let us check the identity $\mathrm{d}f(v) = v(f)$:</p>

︡b4c77009-f23d-409d-b94d-2802baed408d︡︡{"done":true,"html":"<p>Let us check the identity $\\mathrm{d}f(v) = v(f)$:</p>"}
︠f7462198-846c-490c-99b5-ee723e5d39e6s︠
df(v) == v(f)
︡3c5f642d-059a-45d1-a545-aa22816f9084︡︡{"done":false,"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nNameError: name 'df' is not defined\n"}︡{"done":true}
︠47246e0d-d406-4729-9d64-8580796055a9i︠
%html
<p>Similarly, we have $\mathcal{L}_v f = v(f)$:</p>

︡a5a1620b-b324-464c-bff3-f60067aca9ad︡︡{"done":true,"html":"<p>Similarly, we have $\\mathcal{L}_v f = v(f)$:</p>"}
︠d012493c-f5cc-4580-97d9-5ae3f74bd090s︠
f.lie_der(v) == v(f)
︡c92063c2-88bf-458e-9e6c-eb3f9865f0f8︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠611aa175-e92d-406e-bcfc-5bfef4e508b7i︠
%html
<h2>Curves in $\mathbb{S}^2$</h2>
<p>In order to define curves in $\mathbb{S}^2$, we first introduce the field of real numbers $\mathbb{R}$ as a 1-dimensional smooth manifold with a canonical coordinate chart:</p>

︡5e70c05a-21d9-41e1-98f1-75501df5563f︡︡{"done":true,"html":"<h2>Curves in $\\mathbb{S}^2$</h2>\n<p>In order to define curves in $\\mathbb{S}^2$, we first introduce the field of real numbers $\\mathbb{R}$ as a 1-dimensional smooth manifold with a canonical coordinate chart:</p>"}
︠f6624320-b8f8-4a7d-b4ed-8fbe4f41d3c5s︠
R.<t> = RealLine() ; print R
︡b0cb1ec0-3545-4200-99e6-ef4837c32ead︡︡{"stdout":"field R of real numbers","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠6daac9b6-03aa-482a-83c4-899908f65e9bs︠
isinstance(R, Manifold)
︡930dd767-a717-432e-966a-0235700d8b42︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠5f2c6d49-1d2f-4270-ae5d-f0ec4a7c214cs︠
dim(R)
︡add8aa70-27d7-48d4-8b37-e13aa5736ec3︡︡{"html":"<div>$1$</div>","done":false}︡{"done":true}
︠54114586-30c3-497a-8311-2834d971cb1bs︠
R.atlas()
︡f49d84ce-6330-4405-80eb-c091570aea43︡︡{"html":"<div>[$\\left(\\RR,(t)\\right)$]</div>","done":false}︡{"done":true}
︠58f007d8-dbd3-42d9-9143-5cc78109440fi︠
%html
<p>Let us define a <strong>loxodrome of the sphere</strong> in terms of its parametric equation with respect to the chart <span style="font-family: courier new,courier;">spher</span> = $(A,(\theta,\phi))$</p>

︡788f99d6-9a7c-46c1-83f3-3de9de516fbd︡︡{"done":true,"html":"<p>Let us define a <strong>loxodrome of the sphere</strong> in terms of its parametric equation with respect to the chart <span style=\"font-family: courier new,courier;\">spher</span> = $(A,(\\theta,\\phi))$</p>"}
︠37b85d39-dc7d-4187-b4e1-8248d13b7d3cs︠
c = S2.curve({spher: [2*atan(exp(-t/10)), t]}, (t, -oo, +oo), name='c')
︡5ab3734f-5a32-4972-a5f3-8d2d608b5023︡︡{"done":true}
︠286e5ac7-375e-464d-b187-adbdec33998bi︠
%html
<p>Curves in $\mathbb{S}^2$ are considered as morphisms from the manifold $\mathbb{R}$ to the manifold $\mathbb{S}^2$:</p>

︡7a6d95dc-6d14-44eb-9d1c-df89753c567f︡︡{"done":true,"html":"<p>Curves in $\\mathbb{S}^2$ are considered as morphisms from the manifold $\\mathbb{R}$ to the manifold $\\mathbb{S}^2$:</p>"}
︠6822b499-870d-40db-9361-c0a337675623s︠
c.parent()
︡e5075336-6e5a-4e15-ac43-f2073b2315d1︡︡{"html":"<div>$\\mathrm{Hom}\\left(\\RR,\\mathbb{S}^2\\right)$</div>","done":false}︡{"done":true}
︠8902fb23-6c55-4867-8857-406accf4f8c8s︠
c.display()
︡ab4e35a9-d3bd-4c2c-aa42-41d8030b8ea5︡︡{"html":"<div>$\\begin{array}{llcl} c:&amp; \\RR &amp; \\longrightarrow &amp; \\mathbb{S}^2 \\\\ &amp; t &amp; \\longmapsto &amp; \\left(x, y\\right) = \\left(\\cos\\left(t\\right) e^{\\left(\\frac{1}{10} \\, t\\right)}, e^{\\left(\\frac{1}{10} \\, t\\right)} \\sin\\left(t\\right)\\right) \\\\ &amp; t &amp; \\longmapsto &amp; \\left({\\theta}, {\\phi}\\right) = \\left(2 \\, \\arctan\\left(e^{\\left(-\\frac{1}{10} \\, t\\right)}\\right), t\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠b49b1a56-025e-4d0a-9429-ffdeb8b4e7abi︠
%html
<p>The curve $c$ can be plotted in terms of stereographic coordinates $(x,y)$:</p>

︡8465fc5c-593d-4942-964b-aeba8c76d9a6︡︡{"done":true,"html":"<p>The curve $c$ can be plotted in terms of stereographic coordinates $(x,y)$:</p>"}
︠49b17464-affc-4cd0-b1bd-ab6137ed0cb6s︠
c.plot(chart=stereoN, aspect_ratio=1)
︡1133554f-44f6-4468-ab20-662eb02429a0︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"925ad0b6-04be-4717-ab87-5469ed35f19a","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/30455/tmp_vZ4pme.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠c6a8c1fc-6750-48e5-80bb-22585275fbcei︠
%html
<p>We recover the well-known fact that the graph of a loxodrome in terms of stereographic coordinates is a <strong>logarithmic spiral</strong>.</p>
<p>Thanks to the embedding $\Phi$, we may also plot $c$ in terms of the Cartesian coordinates of $\mathbb{R}^3$:</p>

︡cd2478ee-8e45-44bd-9ff0-a8f46df7c6cd︡︡{"done":true,"html":"<p>We recover the well-known fact that the graph of a loxodrome in terms of stereographic coordinates is a <strong>logarithmic spiral</strong>.</p>\n<p>Thanks to the embedding $\\Phi$, we may also plot $c$ in terms of the Cartesian coordinates of $\\mathbb{R}^3$:</p>"}
︠ea334b39-db83-4dc1-a30c-70bb576185b6s︠
graph_c = c.plot(mapping=Phi, max_value=40, plot_points=200, thickness=2)
show(graph_spher + graph_c)
︡22537e13-4271-499e-a52c-c63d5a0cc65b︡︡{"done":false,"file":{"uuid":"ad9ddf4d-4882-4439-b874-5f38066ff69b","filename":"ad9ddf4d-4882-4439-b874-5f38066ff69b.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠b7657b98-6884-49bb-9a6a-c65506fb9eafi︠
%html
<p>The <strong>tangent vector field</strong> (or <strong>velocity vector</strong>) to the curve $c$ is</p>

︡95733d0e-15c7-4bcb-9df7-3b3fdd6c37f7︡︡{"done":true,"html":"<p>The <strong>tangent vector field</strong> (or <strong>velocity vector</strong>) to the curve $c$ is</p>"}
︠2171ccf9-e3a3-4dc5-825f-98bccd011d07s︠
vc = c.tangent_vector_field()
vc
︡8909300c-a71b-4233-8644-8e60adca7a05︡︡{"html":"<div>${c'}$</div>","done":false}︡{"done":true}
︠e4fa1347-6068-40ac-a30a-f30b7e0a6303i︠
%html
<p>$c'$ is a vector field <em>along</em> $\mathbb{R}$ taking its values in tangent spaces to $\mathbb{S}^2$:</p>

︡4061d605-fa9a-44dc-8406-16826439c3d6︡︡{"done":true,"html":"<p>$c'$ is a vector field <em>along</em> $\\mathbb{R}$ taking its values in tangent spaces to $\\mathbb{S}^2$:</p>"}
︠abaca02e-202a-4cdf-85da-5d7f63529ecds︠
print vc
︡e4c028e5-cd70-4a28-bf70-48c2c2b36e8d︡︡{"stdout":"vector field 'c'' along the field R of real numbers with values on the 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠7cf2a5b9-331a-46f5-a57a-9f711af27c90i︠
%html
<p>The set of vector fields along $\mathbb{R}$ taking their values on $\mathbb{S}^2$ via the differential mapping $c: \mathbb{R} \rightarrow \mathbb{S}^2$ is denoted by $\mathcal{X}(\mathbb{R},c)$; it is a module over the algebra $C^\infty(\mathbb{R})$:</p>

︡80c6ae99-5684-4b3d-8ff4-358e2c6cfea3︡︡{"done":true,"html":"<p>The set of vector fields along $\\mathbb{R}$ taking their values on $\\mathbb{S}^2$ via the differential mapping $c: \\mathbb{R} \\rightarrow \\mathbb{S}^2$ is denoted by $\\mathcal{X}(\\mathbb{R},c)$; it is a module over the algebra $C^\\infty(\\mathbb{R})$:</p>"}
︠b497a78b-64d1-4caf-bda1-d99782ebf5b3s︠
vc.parent()
︡f0954769-b9d4-40ad-b8a6-b74e5a8d3f0e︡︡{"html":"<div>$\\mathcal{X}\\left(\\RR,c\\right)$</div>","done":false}︡{"done":true}
︠f8e4b4a3-9743-4d0d-9bb6-1ba44b946f70s︠
vc.parent().category()
︡680a6dcd-ea4c-4038-b550-b0caf2603e97︡︡{"html":"<div>$\\mathbf{Modules}_{C^\\infty(\\RR)}$</div>","done":false}︡{"done":true}
︠52b59c6e-d187-4102-babb-92dd983c30dbs︠
vc.parent().base_ring()
︡e2723198-5482-469e-88bd-2953b76559b4︡︡{"html":"<div>$C^\\infty(\\RR)$</div>","done":false}︡{"done":true}
︠dbdc6ae0-4ddb-4af3-ae8e-229b8413e1a4i︠
%html
<p>A coordinate view of $c'$:</p>

︡24014836-cafa-4522-82fc-62012d98f948︡︡{"done":true,"html":"<p>A coordinate view of $c'$:</p>"}
︠0a0c9967-a92a-4183-a3a4-44db708775d0s︠
vc.display()
︡025400a5-bebf-4610-9a3c-8b8a911ee58b︡︡{"html":"<div>${c'} = \\left( \\frac{1}{10} \\, \\cos\\left(t\\right) e^{\\left(\\frac{1}{10} \\, t\\right)} - e^{\\left(\\frac{1}{10} \\, t\\right)} \\sin\\left(t\\right) \\right) \\frac{\\partial}{\\partial x } + \\left( \\cos\\left(t\\right) e^{\\left(\\frac{1}{10} \\, t\\right)} + \\frac{1}{10} \\, e^{\\left(\\frac{1}{10} \\, t\\right)} \\sin\\left(t\\right) \\right) \\frac{\\partial}{\\partial y }$</div>","done":false}︡{"done":true}
︠6f195e17-67ce-436e-98d4-b21e48a9f91ai︠
%html
<p>Let us plot the vector field $c'$ in terms of the stereographic chart $(U,(x,y))$:</p>

︡be3e1da0-4ec7-4371-a222-0d522eb80200︡︡{"done":true,"html":"<p>Let us plot the vector field $c'$ in terms of the stereographic chart $(U,(x,y))$:</p>"}
︠403ca29e-fd34-4ceb-a586-52dfabcb717cs︠
show(vc.plot(chart=stereoN, nb_values=30, scale=0.5, color='red') +
     c.plot(chart=stereoN), aspect_ratio=1)
︡def0b0fb-be89-4700-a5b9-9eeefdaec5af︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"90a65db1-7f40-42d2-86c7-6c9618c499ef","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/27865/tmp_y7ACrW.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}︡{"once":false,"done":false,"file":{"show":true,"uuid":"90a65db1-7f40-42d2-86c7-6c9618c499ef","filename":"/projects/d0bf849e-0437-4f4f-9d61-c23a0d3474ae/.sage/temp/compute4-us/30455/tmp_wS49L8.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠20e825a8-5e70-4bb5-b58e-cd7a5b79b307i︠
%html
<p>A 3D view of $c'$ is obtained via the embedding $\Phi$:</p>

︡824765e2-e559-4946-907e-b551d18e42e0︡︡{"done":true,"html":"<p>A 3D view of $c'$ is obtained via the embedding $\\Phi$:</p>"}
︠2bb72a8d-e277-484f-9df8-61eed72a3b82s︠
graph_vc = vc.plot(chart=cart, mapping=Phi, ranges={t: (-20, 20)}, nb_values=30, 
                   scale=0.5, color='red', label_axes=False)
show(graph_vc + graph_spher + graph_c, aspect_ratio=1)
︡10e80065-4ef2-455b-9d9b-b87136020254︡︡{"done":false,"stderr":"Error in lines 1-2\n"}︡{"done":false,"stderr":"Traceback (most recent call last):\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 2, in <module>\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/geometry/manifolds/vectorfield.py\", line 528, in plot\n    **extra_options)\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/geometry/manifolds/tangentspace.py\", line 284, in plot\n    eff_vector = mapping.differential(self._point)._call_(self)\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/tensor/modules/free_module_morphism.py\", line 882, in _call_\n    \"of {} by {}\".format(element,self))\nValueError: no common basis found to evaluate the image of tangent vector c' at point on 2-dimensional manifold 'S^2' by Generic morphism:\n  From: tangent space at point on 2-dimensional manifold 'S^2'\n  To:   tangent space at point on 3-dimensional manifold 'R^3'\n"}︡{"done":true}︡{"done":false,"stderr":"Error in lines 1-2\n"}︡{"done":false,"stderr":"Traceback (most recent call last):\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 2, in <module>\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/geometry/manifolds/vectorfield.py\", line 528, in plot\n    **extra_options)\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/geometry/manifolds/tangentspace.py\", line 308, in plot\n    vcomp = eff_vector.comp(basis=basis)[:]\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/tensor/modules/free_module_tensor.py\", line 1050, in components\n    \"the components in the {}\".format(basis))\nValueError: no basis could be found for computing the components in the Basis (d/dX,d/dY,d/dZ) on the tangent space at point on 3-dimensional manifold 'R^3'\n"}︡{"done":true}
︠07910728-04e9-4919-895a-17e3d6dd6104i︠
%html
<h2>Riemannian metric on $\mathbb{S}^2$</h2>
<p>The standard metric on $\mathbb{S}^2$ is that induced by the Euclidean metric of $\mathbb{R}^3$. Let us start by defining the latter:</p>

︡dabdad68-3a1c-43c6-a99e-d18bf5f200ab︡︡{"done":true,"html":"<h2>Riemannian metric on $\\mathbb{S}^2$</h2>\n<p>The standard metric on $\\mathbb{S}^2$ is that induced by the Euclidean metric of $\\mathbb{R}^3$. Let us start by defining the latter:</p>"}
︠0da78d1e-abe3-44ae-bb98-abd2077fd398s︠
h = R3.riemann_metric('h')
h[1,1], h[2,2], h[3, 3] = 1, 1, 1
h.display()
︡9ca3ed81-690c-49e5-9204-f093dc219231︡︡{"html":"<div>$h = \\mathrm{d} X\\otimes \\mathrm{d} X+\\mathrm{d} Y\\otimes \\mathrm{d} Y+\\mathrm{d} Z\\otimes \\mathrm{d} Z$</div>","done":false}︡{"done":true}︡{"html":"<div>$h = \\mathrm{d} X\\otimes \\mathrm{d} X+\\mathrm{d} Y\\otimes \\mathrm{d} Y+\\mathrm{d} Z\\otimes \\mathrm{d} Z$</div>","done":false}︡{"done":true}
︠98af038e-95b2-4f08-92be-fa4b6e2ee4a5i︠
%html
<p>The metric $g$ on $\mathbb{S}^2$ is the pullback of $h$ associated with the embedding $\Phi$:</p>

︡d150e62e-24d3-4b25-83df-4224e50cf1af︡︡{"done":true,"html":"<p>The metric $g$ on $\\mathbb{S}^2$ is the pullback of $h$ associated with the embedding $\\Phi$:</p>"}
︠68f44ae9-897f-45dc-bcd4-c99a1d348ba6s︠
g = S2.riemann_metric('g')
g.set( Phi.pullback(h) )
print g
︡b64224e3-49b2-4faa-b5fd-155447a7d1b0︡︡{"stdout":"Riemannian metric 'g' on the 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠38e4335f-a6df-4d82-9aed-b5b6b11d61b7i︠
%html
<p>Note that we could have defined $g$ intrinsically, i.e. by providing its components in the two frames stereoN and stereoS, as we did for the metric $h$ on $\mathbb{R}^3$. Instead, we have chosen to get it as the pullback of $h$, as an example of pullback associated with some differential map.&nbsp;</p>
<p>The metric is a symmetric tensor field of type (0,2):</p>

︡2e77e86d-424d-4eb8-b194-7744360ef494︡︡{"done":true,"html":"<p>Note that we could have defined $g$ intrinsically, i.e. by providing its components in the two frames stereoN and stereoS, as we did for the metric $h$ on $\\mathbb{R}^3$. Instead, we have chosen to get it as the pullback of $h$, as an example of pullback associated with some differential map.&nbsp;</p>\n<p>The metric is a symmetric tensor field of type (0,2):</p>"}
︠218c2cca-883c-45c1-8a34-d9dab473dd16s︠
print g.parent()
︡08ece149-7c85-43c9-a541-6e221d6693fa︡︡{"stdout":"module T^(0,2)(S^2) of type-(0,2) tensors fields on the 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠329aeb0e-bb55-43bd-9e49-8c034a6e9130s︠
g.tensor_type()
︡e31efda3-db90-4ea4-b4a6-e1fc8e66c35b︡︡{"html":"<div>($0$, $2$)</div>","done":false}︡{"done":true}
︠d01d40a5-518e-4c64-ad40-103f06594e20s︠
g.symmetries()
︡d1e2a23f-3fe0-4006-8ca6-a40c5fa7d4df︡︡{"stdout":"symmetry: (0, 1);  no antisymmetry\n","done":false}︡{"done":true}
︠3ac6a66f-1e09-437f-b20e-6f58f3f9ea00i︠
%html
<p>The expression of the metric in terms of the default frame on $\mathbb{S}^2$ (stereoN):</p>

︡193d41d2-b432-4674-bb2b-5ebae90a422d︡︡{"done":true,"html":"<p>The expression of the metric in terms of the default frame on $\\mathbb{S}^2$ (stereoN):</p>"}
︠9ae60ead-d504-4921-9fd3-76b298b8b162s︠
g.display()
︡ed0dbf7f-81e9-4887-99d1-1a9ac2729226︡︡{"html":"<div>$g = \\left( \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\mathrm{d} x\\otimes \\mathrm{d} x + \\left( \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\mathrm{d} y\\otimes \\mathrm{d} y$</div>","done":false}︡{"done":true}
︠787e5b12-0789-4b1e-bfd6-980a2c7f340ei︠
%html
<p>We may factorize the metric components:</p>

︡40a8892c-997e-4d13-a2c6-a74ab655c246︡︡{"done":true,"html":"<p>We may factorize the metric components:</p>"}
︠95f85761-115b-41d2-ac7d-0faa57399deas︠
g[1,1].factor() ; g[2,2].factor()
︡fa2f29d6-e4d2-4f15-b378-63905b4ab201︡︡{"html":"<div>$\\frac{4}{{\\left(x^{2} + y^{2} + 1\\right)}^{2}}$</div>","done":false}︡{"html":"<div>$\\frac{4}{{\\left(x^{2} + y^{2} + 1\\right)}^{2}}$</div>","done":false}︡{"done":true}
︠98c4a8d0-9ad2-48d2-ac46-1a62d00d2235s︠
g.display()
︡7800ba12-d2a1-4163-a4fc-6931b6169e0f︡︡{"html":"<div>$g = \\frac{4}{{\\left(x^{2} + y^{2} + 1\\right)}^{2}} \\mathrm{d} x\\otimes \\mathrm{d} x + \\frac{4}{{\\left(x^{2} + y^{2} + 1\\right)}^{2}} \\mathrm{d} y\\otimes \\mathrm{d} y$</div>","done":false}︡{"done":true}
︠af2fd222-2184-4035-87d9-fd62900ff1afi︠
%html
<p>A matrix view of the components of $g$ in the manifold's default frame:</p>

︡ea4381b0-2b1b-4d01-a42d-c9e452a1fd7f︡︡{"done":true,"html":"<p>A matrix view of the components of $g$ in the manifold's default frame:</p>"}
︠5debab2b-793b-40ee-ba49-eaaa35d84eaas︠
g[:]
︡cd674c74-3e92-458e-87ba-327467aa8788︡︡{"html":"<div>$\\left(\\begin{array}{rr}\n\\frac{4}{{\\left(x^{2} + y^{2} + 1\\right)}^{2}} &amp; 0 \\\\\n0 &amp; \\frac{4}{{\\left(x^{2} + y^{2} + 1\\right)}^{2}}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠9a2fa18a-3ffc-4ad4-ab13-ff8eea610172i︠
%html
<p>Display in terms of the vector frame $(V, (\partial_{x'}, \partial_{y'}))$:</p>

︡a3cfb4f7-3321-40c6-974d-afabc78631a7︡︡{"done":true,"html":"<p>Display in terms of the vector frame $(V, (\\partial_{x'}, \\partial_{y'}))$:</p>"}
︠a00750d4-1373-4223-bb40-4fc733775cbbs︠
g.display(stereoS.frame())
︡2766ba5c-fbaf-41f9-8788-ccd891bdaf97︡︡{"html":"<div>$g = \\left( \\frac{4}{{x'}^{4} + {y'}^{4} + 2 \\, {\\left({x'}^{2} + 1\\right)} {y'}^{2} + 2 \\, {x'}^{2} + 1} \\right) \\mathrm{d} {x'}\\otimes \\mathrm{d} {x'} + \\left( \\frac{4}{{x'}^{4} + {y'}^{4} + 2 \\, {\\left({x'}^{2} + 1\\right)} {y'}^{2} + 2 \\, {x'}^{2} + 1} \\right) \\mathrm{d} {y'}\\otimes \\mathrm{d} {y'}$</div>","done":false}︡{"done":true}
︠0275230b-0bd7-440b-9a4f-25a4d777c955s︠
g.display(spher.frame(), chart=spher)
︡c203fe3b-3252-4d1e-8b7a-4bc178c53e31︡︡{"html":"<div>$g = \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠0af3ca1e-c167-4206-b657-4e0e4c8166f7i︠
%html
<p><span id="cell_outer_169">The metric acts on vector field pairs, resulting in a scalar field:</span></p>

︡0ee246d7-c5fc-4acd-ace5-992b67617372︡︡{"done":true,"html":"<p><span id=\"cell_outer_169\">The metric acts on vector field pairs, resulting in a scalar field:</span></p>"}
︠9ebe46a1-2393-47e1-a868-d018117ed68es︠
print g(v,v)
︡d744f729-b1df-4e51-bc90-096507830cc3︡︡{"stdout":"scalar field 'g(v,v)' on the 2-dimensional manifold 'S^2'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠6afb8cb6-54a5-46d3-9378-153eaeaed79cs︠
g(v,v).parent()
︡778d34a8-b478-40f4-9a29-f1b7dc0abb74︡︡{"html":"<div>$C^\\infty(\\mathbb{S}^2)$</div>","done":false}︡{"done":true}
︠70a34447-aee0-42f1-acef-29127770a3d3s︠
g(v,v).display()
︡4515f927-9702-4373-86f0-e73120a3d08d︡︡{"html":"<div>$\\begin{array}{llcl} g\\left(v,v\\right):&amp; \\mathbb{S}^2 &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ \\mbox{on}\\ U : &amp; \\left(x, y\\right) &amp; \\longmapsto &amp; \\frac{20}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\\\ \\mbox{on}\\ V : &amp; \\left({x'}, {y'}\\right) &amp; \\longmapsto &amp; \\frac{20 \\, {\\left({x'}^{4} + 2 \\, {x'}^{2} {y'}^{2} + {y'}^{4}\\right)}}{{x'}^{4} + {y'}^{4} + 2 \\, {\\left({x'}^{2} + 1\\right)} {y'}^{2} + 2 \\, {x'}^{2} + 1} \\\\ \\mbox{on}\\ A : &amp; \\left({\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; -\\frac{5 \\, {\\left(\\cos\\left({\\theta}\\right)^{4} - 4 \\, \\cos\\left({\\theta}\\right)^{3} + 6 \\, \\cos\\left({\\theta}\\right)^{2} - 4 \\, \\cos\\left({\\theta}\\right) + 1\\right)}}{\\sin\\left({\\theta}\\right)^{2} + 2 \\, \\cos\\left({\\theta}\\right) - 2} \\end{array}$</div>","done":false}︡{"done":true}
︠0af47d45-3226-4df7-8bad-023db51beb2di︠
%html
<p>The <strong>Levi-Civitation connection</strong> associated with the metric $g$:</p>

︡eeec2768-8994-478e-8809-f88021db777e︡︡{"done":true,"html":"<p>The <strong>Levi-Civitation connection</strong> associated with the metric $g$:</p>"}
︠a529d4f4-bcb7-44bd-8319-7cd19085c966s︠
nab = g.connection()
print nab
nab
︡a84f4c66-c923-4fc5-a682-0d9a720456cb︡︡{"stdout":"Levi-Civita connection 'nabla_g' associated with the Riemannian metric 'g' on the 2-dimensional manifold 'S^2'\n","done":false}︡{"html":"<div>$\\nabla_{g}$</div>","done":false}︡{"done":true}
︠992d65fa-5298-4e66-9d9b-aa5fb7ea0123i︠
%html
<p>As a test, we verify that $\nabla_g$ acting on $g$ results in zero:</p>

︡8c6023df-085a-411c-a362-d139e9f3efa7︡︡{"done":true,"html":"<p>As a test, we verify that $\\nabla_g$ acting on $g$ results in zero:</p>"}
︠95e8edf8-95b6-4375-9869-c3ca91acc1efs︠
nab(g).display()
︡aeed7744-b985-4ede-a439-b724c7c1d3dd︡︡{"html":"<div>$\\nabla_{g} g = 0$</div>","done":false}︡{"done":true}
︠59fdcb26-dcef-4618-98ee-f06bbea6bf7bi︠
%html
<p>The nonzero Christoffel symbols of $g$ (skipping those that can be deduced by symmetry on the last two indices) w.r.t. two charts:</p>

︡0e8f8230-67f9-4629-a79a-1f38b74d20ea︡︡{"done":true,"html":"<p>The nonzero Christoffel symbols of $g$ (skipping those that can be deduced by symmetry on the last two indices) w.r.t. two charts:</p>"}
︠34aa556d-1581-43d6-908c-9a2872845a4fs︠
g.christoffel_symbols_display(chart=stereoN)
︡37cb3119-1481-4795-a79a-2fcc0ff4befc︡︡{"html":"<div>$\\begin{array}{lcl} \\Gamma_{ \\phantom{\\, x } \\, x \\, x }^{ \\, x \\phantom{\\, x } \\phantom{\\, x } } &amp; = &amp; -\\frac{2 \\, x}{x^{2} + y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, x } \\, x \\, y }^{ \\, x \\phantom{\\, x } \\phantom{\\, y } } &amp; = &amp; -\\frac{2 \\, y}{x^{2} + y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, x } \\, y \\, y }^{ \\, x \\phantom{\\, y } \\phantom{\\, y } } &amp; = &amp; \\frac{2 \\, x}{x^{2} + y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, y } \\, x \\, x }^{ \\, y \\phantom{\\, x } \\phantom{\\, x } } &amp; = &amp; \\frac{2 \\, y}{x^{2} + y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, y } \\, x \\, y }^{ \\, y \\phantom{\\, x } \\phantom{\\, y } } &amp; = &amp; -\\frac{2 \\, x}{x^{2} + y^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, y } \\, y \\, y }^{ \\, y \\phantom{\\, y } \\phantom{\\, y } } &amp; = &amp; -\\frac{2 \\, y}{x^{2} + y^{2} + 1} \\end{array}$</div>","done":false}︡{"done":true}
︠5ae6b804-c2fa-4522-b667-191941ff443bs︠
g.christoffel_symbols_display(chart=spher)
︡35f38085-9d6b-4ca2-aaa4-5e0f6914b9ea︡︡{"html":"<div>$\\begin{array}{lcl} \\Gamma_{ \\phantom{\\, {\\theta} } \\, {\\phi} \\, {\\phi} }^{ \\, {\\theta} \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right) \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, {\\theta} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{\\cos\\left({\\theta}\\right)}{\\sin\\left({\\theta}\\right)} \\end{array}$</div>","done":false}︡{"done":true}
︠f4c41eec-8253-4175-979a-2143aab6fc2ei︠
%html
<p>$\nabla_g$ acting on the vector field $v$:</p>

︡c2af863d-8aca-42f7-ac59-2a75625f6566︡︡{"done":true,"html":"<p>$\\nabla_g$ acting on the vector field $v$:</p>"}
︠bc78f362-2138-4a2e-a45b-a01caabbf15fs︠
print nab(v)
︡36d68e34-094c-4625-a1a0-b891f8b1e7dd︡︡{"stdout":"tensor field 'nabla_g v' of type (1,1) on the 2-dimensional manifold 'S^2'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠152beedf-71ac-4a0a-86ec-92c66dcc402fs︠
nab(v).display(stereoN.frame())
︡02c8e54f-b4c7-4a78-8642-f3d7ccc7555a︡︡{"html":"<div>$\\nabla_{g} v = \\left( -\\frac{2 \\, {\\left(x - 2 \\, y\\right)}}{x^{2} + y^{2} + 1} \\right) \\frac{\\partial}{\\partial x }\\otimes \\mathrm{d} x + \\left( -\\frac{2 \\, {\\left(2 \\, x + y\\right)}}{x^{2} + y^{2} + 1} \\right) \\frac{\\partial}{\\partial x }\\otimes \\mathrm{d} y + \\left( \\frac{2 \\, {\\left(2 \\, x + y\\right)}}{x^{2} + y^{2} + 1} \\right) \\frac{\\partial}{\\partial y }\\otimes \\mathrm{d} x + \\left( -\\frac{2 \\, {\\left(x - 2 \\, y\\right)}}{x^{2} + y^{2} + 1} \\right) \\frac{\\partial}{\\partial y }\\otimes \\mathrm{d} y$</div>","done":false}︡{"done":true}
︠c2fe686d-5b24-4586-a9bc-464d59049e55i︠
%html
<h2>Curvature</h2>
<p>The Riemann tensor associated with the metric $g$:</p>

︡9e7626ae-8de4-4e7b-8004-d3f56dbaa66f︡︡{"done":true,"html":"<h2>Curvature</h2>\n<p>The Riemann tensor associated with the metric $g$:</p>"}
︠1585fea7-eae2-4132-a201-3996d3ed0c8as︠
Riem = g.riemann()
print Riem
Riem.display()
︡903b7500-8932-4427-afee-e623531585ca︡︡{"stdout":"tensor field 'Riem(g)' of type (1,3) on the 2-dimensional manifold 'S^2'\n","done":false}︡{"html":"<div>$\\mathrm{Riem}\\left(g\\right) = \\left( \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\frac{\\partial}{\\partial x }\\otimes \\mathrm{d} y\\otimes \\mathrm{d} x\\otimes \\mathrm{d} y + \\left( -\\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\frac{\\partial}{\\partial x }\\otimes \\mathrm{d} y\\otimes \\mathrm{d} y\\otimes \\mathrm{d} x + \\left( -\\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\frac{\\partial}{\\partial y }\\otimes \\mathrm{d} x\\otimes \\mathrm{d} x\\otimes \\mathrm{d} y + \\left( \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\frac{\\partial}{\\partial y }\\otimes \\mathrm{d} x\\otimes \\mathrm{d} y\\otimes \\mathrm{d} x$</div>","done":false}︡{"done":true}
︠2e890c71-c1ac-44f8-b4a7-d6fbe20e4605i︠
%html
<p>The components of the Riemann tensor in the default frame on $\mathbb{S}^2$:</p>

︡4530de5f-3e49-4234-bf1d-0e2555a6d4cd︡︡{"done":true,"html":"<p>The components of the Riemann tensor in the default frame on $\\mathbb{S}^2$:</p>"}
︠5b574048-33d1-4361-b3d1-cfb4f0364f9fs︠
Riem.display_comp()
︡1bf5dd89-c4c0-411a-abc4-f1995d1298e7︡︡{"html":"<div>$\\begin{array}{lcl} \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, x } \\, y \\, x \\, y }^{ \\, x \\phantom{\\, y } \\phantom{\\, x } \\phantom{\\, y } } &amp; = &amp; \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, x } \\, y \\, y \\, x }^{ \\, x \\phantom{\\, y } \\phantom{\\, y } \\phantom{\\, x } } &amp; = &amp; -\\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, y } \\, x \\, x \\, y }^{ \\, y \\phantom{\\, x } \\phantom{\\, x } \\phantom{\\, y } } &amp; = &amp; -\\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, y } \\, x \\, y \\, x }^{ \\, y \\phantom{\\, x } \\phantom{\\, y } \\phantom{\\, x } } &amp; = &amp; \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\end{array}$</div>","done":false}︡{"done":true}
︠05aa964b-23bf-4798-8a14-224437cff353i︠
%html
<p>The components in the frame associated with spherical coordinates:</p>

︡e3b40476-f98f-43ce-98b3-9b63207646be︡︡{"done":true,"html":"<p>The components in the frame associated with spherical coordinates:</p>"}
︠2905cd77-15c4-4d99-865c-61b2ab2fae58s︠
Riem.display_comp(spher.frame(), chart=spher)
︡b4837292-765a-4891-ae76-808c99354e56︡︡{"html":"<div>$\\begin{array}{lcl} \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\theta} } \\, {\\phi} \\, {\\theta} \\, {\\phi} }^{ \\, {\\theta} \\phantom{\\, {\\phi} } \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\sin\\left({\\theta}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\theta} } \\, {\\phi} \\, {\\phi} \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } \\phantom{\\, {\\theta} } } &amp; = &amp; -\\sin\\left({\\theta}\\right)^{2} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\phi} } \\, {\\theta} \\, {\\theta} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{\\cos\\left({\\theta}\\right)^{2} - 1}{\\sin\\left({\\theta}\\right)^{2}} \\\\ \\mathrm{Riem}\\left(g\\right)_{ \\phantom{\\, {\\phi} } \\, {\\theta} \\, {\\phi} \\, {\\theta} }^{ \\, {\\phi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } \\phantom{\\, {\\theta} } } &amp; = &amp; 1 \\end{array}$</div>","done":false}︡{"done":true}
︠89d128a1-3724-449a-9caa-4121598aae9es︠
print Riem.parent()
︡9a618340-4c59-4809-844c-4e35f356d44a︡︡{"stdout":"module T^(1,3)(S^2) of type-(1,3) tensors fields on the 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠e6b1dbe0-756e-4289-bbed-e0a883e0db03s︠
Riem.symmetries()
︡78e475c5-2e63-4061-8ae8-73fe4983be8d︡︡{"stdout":"no symmetry;  antisymmetry: (2, 3)\n","done":false}︡{"done":true}
︠7d907be1-fa36-4ae6-a546-8e24090517a7i︠
%html
<p>The Riemann tensor associated with the Euclidean metric $h$ on $\mathbb{R}^3$:</p>

︡204e8c45-8ad7-424d-9ef1-e56eafc5bec7︡︡{"done":true,"html":"<p>The Riemann tensor associated with the Euclidean metric $h$ on $\\mathbb{R}^3$:</p>"}
︠5ab88dd4-a825-4e8f-a415-17179caef2ces︠
h.riemann().display()
︡7b0b9c7a-2d41-4afb-b805-3206e0205c7c︡︡{"html":"<div>$\\mathrm{Riem}\\left(h\\right) = 0$</div>","done":false}︡{"done":true}
︠b8c8202e-fd94-4f32-87dc-87c9e23de264i︠
%html
<p>The Ricci tensor and the Ricci scalar:</p>

︡bf51e1df-7706-4639-89bf-9d5324718a48︡︡{"done":true,"html":"<p>The Ricci tensor and the Ricci scalar:</p>"}
︠df7dadc3-fc54-45bf-8c9a-840f1c59b527s︠
Ric = g.ricci()
Ric.display()
︡1bb6b4a7-56a8-44dc-8d48-7fcc67ea1b7f︡︡{"html":"<div>$\\mathrm{Ric}\\left(g\\right) = \\left( \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\mathrm{d} x\\otimes \\mathrm{d} x + \\left( \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\mathrm{d} y\\otimes \\mathrm{d} y$</div>","done":false}︡{"done":true}
︠96d933e7-aba6-4d09-943b-1d27a0b7083ds︠
R = g.ricci_scalar()
R.display()
︡c6b6ef90-3a4d-478f-a766-82c3df03d7fb︡︡{"html":"<div>$\\begin{array}{llcl} \\mathrm{r}\\left(g\\right):&amp; \\mathbb{S}^2 &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ \\mbox{on}\\ U : &amp; \\left(x, y\\right) &amp; \\longmapsto &amp; 2 \\\\ \\mbox{on}\\ V : &amp; \\left({x'}, {y'}\\right) &amp; \\longmapsto &amp; 2 \\\\ \\mbox{on}\\ A : &amp; \\left({\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; 2 \\end{array}$</div>","done":false}︡{"done":true}
︠462436f4-e6b2-484a-9f8a-b20954c1b115i︠
%html
<p><span id="cell_outer_160">Hence we recover the fact that $(\mathbb{S}^2,g)$ </span><span id="cell_outer_160">is a Riemannian manifold of constant positive curvature.</span></p>
<p>In dimension 2, the Riemann curvature tensor is entirely determined by the Ricci scalar $R$ according to</p>
<p>$R^i_{\ \, jlk} = \frac{R}{2} \left( \delta^i_{\ \, k} g_{jl} - \delta^i_{\ \, l} g_{jk} \right)$</p>
<p>Let us check this formula here, under the form $R^i_{\ \, jlk} = -R g_{j[k} \delta^i_{\ \, l]}$:</p>

︡c2ed8d15-94e9-40b4-a512-f27019e0f9bb︡︡{"done":true,"html":"<p><span id=\"cell_outer_160\">Hence we recover the fact that $(\\mathbb{S}^2,g)$ </span><span id=\"cell_outer_160\">is a Riemannian manifold of constant positive curvature.</span></p>\n<p>In dimension 2, the Riemann curvature tensor is entirely determined by the Ricci scalar $R$ according to</p>\n<p>$R^i_{\\ \\, jlk} = \\frac{R}{2} \\left( \\delta^i_{\\ \\, k} g_{jl} - \\delta^i_{\\ \\, l} g_{jk} \\right)$</p>\n<p>Let us check this formula here, under the form $R^i_{\\ \\, jlk} = -R g_{j[k} \\delta^i_{\\ \\, l]}$:</p>"}
︠25cc3479-dcd2-4c39-93b9-fc2423adf95fs︠
delta = S2.tangent_identity_field()
Riem == - R*(g*delta).antisymmetrize(2,3)
︡b09669c7-1447-4314-8aa0-6f33490159b7︡︡{"html":"<div>$\\mathrm{False}$</div>","done":false}︡{"done":true}
︠898fac03-2b96-4649-90e7-6e8e6798299fi︠
%html
<p>Similarly the relation $\mathrm{Ric} = (R/2)\; g$ must hold:</p>

︡0aa494d9-b557-4789-a037-058d3f1b47f1︡︡{"done":true,"html":"<p>Similarly the relation $\\mathrm{Ric} = (R/2)\\; g$ must hold:</p>"}
︠5df081b8-359d-4b6f-8918-d0b92b01dfc1s︠
Ric == (R/2)*g
︡b0248bb6-8d35-4d49-b522-dbdb6e1a9e01︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠cbe4308e-9c23-4817-b53f-64f603673497i︠
%html
<p>The <strong>Levi-Civita tensor</strong> associated with $g$:</p>

︡9153fc4d-1d65-4139-b103-c82266e11791︡︡{"done":true,"html":"<p>The <strong>Levi-Civita tensor</strong> associated with $g$:</p>"}
︠0f9b0452-2e1b-4b4d-be2c-4dede02b2c54s︠
eps = g.volume_form()
print eps
eps.display()
︡c926b945-5822-46c4-97ed-a61449d52c8b︡︡{"stdout":"2-form 'eps_g' on the 2-dimensional manifold 'S^2'\n","done":false}︡{"html":"<div>$\\epsilon_{g} = \\left( \\frac{4}{x^{4} + y^{4} + 2 \\, {\\left(x^{2} + 1\\right)} y^{2} + 2 \\, x^{2} + 1} \\right) \\mathrm{d} x\\wedge \\mathrm{d} y$</div>","done":false}︡{"done":true}
︠12212668-296e-484d-8ac4-61e6ff99959es︠
eps.display(spher.frame(), chart=spher)
︡dd550f5b-449a-4b2d-a0f9-8b2c263c1925︡︡{"html":"<div>$\\epsilon_{g} = \\sin\\left({\\theta}\\right) \\mathrm{d} {\\theta}\\wedge \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠c6818348-7bf4-4bb0-b404-d4e66da1f5e7i︠
%html
<p>The exterior derivative of the 2-form $\epsilon_g$:</p>

︡c6ac1194-3947-45ac-9970-5ebf9847abdc︡︡{"done":true,"html":"<p>The exterior derivative of the 2-form $\\epsilon_g$:</p>"}
︠52025e93-f4e7-40cd-bb86-46afb8bddf56s︠
print eps.exterior_der()
︡977b82de-df01-435e-b510-e470a5456b82︡︡{"stdout":"3-form 'deps_g' on the 2-dimensional manifold 'S^2'\n","done":false}︡{"done":true}
︠b2ebaf25-1c8b-4ccb-b3d3-38da90b4cc89i︠
%html
<p>Of course, since $\mathbb{S}^2$ has dimension 2, all 3-forms vanish identically:</p>

︡9e9730f7-173c-4b3b-8fc5-c5b3d30ae3a1︡︡{"done":true,"html":"<p>Of course, since $\\mathbb{S}^2$ has dimension 2, all 3-forms vanish identically:</p>"}
︠4a32641f-2d22-4600-b9d6-b0f3eb055030s︠
eps.exterior_der().display()
︡6fccb41f-0a0f-47f8-89af-943038140e83︡︡{"html":"<div>$\\mathrm{d}\\epsilon_{g} = 0$</div>","done":false}︡{"done":true}
︠11aac831-9886-44cb-a183-cbb74b52fcd3i︠
%html
<h2>Non-holonomic frames</h2>
<p>Up to know, all the vector frames introduced on $\mathbb{S}^2$ have been coordinate frames. Let us introduce a non-coordinate frame on the open subset $A$. To ease the notations, we change first the default chart and default frame on $A$ to the spherical coordinate ones:</p>

︡d555706e-c5a2-4c89-a38d-947ab05248c1︡︡{"done":true,"html":"<h2>Non-holonomic frames</h2>\n<p>Up to know, all the vector frames introduced on $\\mathbb{S}^2$ have been coordinate frames. Let us introduce a non-coordinate frame on the open subset $A$. To ease the notations, we change first the default chart and default frame on $A$ to the spherical coordinate ones:</p>"}
︠55066bf0-58f6-460c-ae68-372602e54856s︠
A.default_chart()
︡cc7295a7-8a7c-4267-b165-a86277f52aec︡︡{"html":"<div>$\\left(A,(x, y)\\right)$</div>","done":false}︡{"done":true}
︠69e18340-4ce7-4962-afa7-8f7b66059c9as︠
A.default_frame()
︡8310bf9d-f0e8-4917-a074-fa26fa22ea90︡︡{"html":"<div>$\\left(A ,\\left(\\frac{\\partial}{\\partial x },\\frac{\\partial}{\\partial y }\\right)\\right)$</div>","done":false}︡{"done":true}
︠55e444b7-4c03-4af6-b743-148cb94ce32fs︠
A.set_default_chart(spher)
A.set_default_frame(spher.frame())
A.default_chart()
︡978f1e3e-ae2a-45cd-8385-cce3f3dae88c︡︡{"html":"<div>$\\left(A,({\\theta}, {\\phi})\\right)$</div>","done":false}︡{"done":true}
︠944dd59b-2115-482e-a0f7-5b51680b6d42s︠
A.default_frame()
︡1f0f6ea7-21ee-440c-801e-7e883c5e0777︡︡{"html":"<div>$\\left(A ,\\left(\\frac{\\partial}{\\partial {\\theta} },\\frac{\\partial}{\\partial {\\phi} }\\right)\\right)$</div>","done":false}︡{"done":true}
︠e4fb5b2a-bf2e-4cc1-a7e6-3aa396d1077di︠
%html
<p>We define the new frame $e$ by relating it the coordinate frame $\left(\frac{\partial}{\partial\theta}, \frac{\partial}{\partial\phi}\right)$ via a field of tangent-space automorphisms:</p>

︡7f116ba4-2be4-4d21-83ae-c03722250c06︡︡{"done":true,"html":"<p>We define the new frame $e$ by relating it the coordinate frame $\\left(\\frac{\\partial}{\\partial\\theta}, \\frac{\\partial}{\\partial\\phi}\\right)$ via a field of tangent-space automorphisms:</p>"}
︠8adaafbb-252b-46ee-884a-394e23709dd0s︠
a = A.automorphism_field()
a[1,1], a[2,2] = 1, 1/sin(th)
a.display()
︡1725a02e-390d-4c84-b584-0bfefcd6ff19︡︡{"html":"<div>$\\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\theta} + \\frac{1}{\\sin\\left({\\theta}\\right)} \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠f2ef9128-b8c0-4444-b822-449266a04706s︠
a[:]
︡96767709-1c7b-4274-a43b-050ebcf96383︡︡{"html":"<div>$\\left(\\begin{array}{rr}\n1 &amp; 0 \\\\\n0 &amp; \\frac{1}{\\sin\\left({\\theta}\\right)}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠849ddb53-6079-46fb-8222-ee7b74114b88s︠
e = spher.frame().new_frame(a, 'e')
print e ; e
︡5ed2ae34-9ae0-4d20-834c-a41238730091︡︡{"stdout":"vector frame (A, (e_1,e_2))\n","done":false}︡{"html":"<div>$\\left(A, \\left(e_1,e_2\\right)\\right)$</div>","done":false}︡{"done":true}
︠f390d6a0-1b1e-4750-ac37-3f02ed50a085s︠
e[1].display()
︡525f2222-7e76-48b2-94f5-aac7181ce7e7︡︡{"html":"<div>$e_1 = \\frac{\\partial}{\\partial {\\theta} }$</div>","done":false}︡{"done":true}
︠3c7dffff-e037-412c-a2f3-2aadc4f7df7as︠
e[2].display()
︡f8466ce0-477d-41a0-b402-4bc392163f84︡︡{"html":"<div>$e_2 = \\frac{1}{\\sin\\left({\\theta}\\right)} \\frac{\\partial}{\\partial {\\phi} }$</div>","done":false}︡{"done":true}
︠779eb4e7-e6c4-4435-bad8-c2c2de433227s︠
A.frames()
︡a9cd3d3a-9bef-490c-8b2a-6466d93a8ffe︡︡{"html":"<div>[$\\left(A ,\\left(\\frac{\\partial}{\\partial x },\\frac{\\partial}{\\partial y }\\right)\\right)$, $\\left(A ,\\left(\\frac{\\partial}{\\partial {\\theta} },\\frac{\\partial}{\\partial {\\phi} }\\right)\\right)$, $\\left(A, \\left(e_1,e_2\\right)\\right)$]</div>","done":false}︡{"done":true}
︠6b0c2806-003a-4c26-9c9e-0676b24f0c8ci︠
%html
<p>The new frame is an orthonormal frame for the metric $g$:</p>

︡441b95a0-e3ac-414a-b920-5078eadfdb03︡︡{"done":true,"html":"<p>The new frame is an orthonormal frame for the metric $g$:</p>"}
︠4fa83555-5793-44cb-8229-d1be945e5865s︠
g(e[1],e[1]).expr()
︡2887cd28-4f91-48b7-a617-88cb167f92c3︡︡{"html":"<div>$1$</div>","done":false}︡{"done":true}
︠07d505fe-d0b6-46d9-a9c9-8d2700f74cf7s︠
g(e[1],e[2]).expr()
︡0a81ce09-c9ad-4d29-8aa4-3f0c9b5d3b1c︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠fa2fc83c-b244-4197-86e7-c32c9e29eeb8s︠
g(e[2],e[2]).expr()
︡1102b8fb-0222-430e-8887-ae783a8620be︡︡{"html":"<div>$1$</div>","done":false}︡{"done":true}
︠984c163b-28e5-46a0-91b5-f9093fdfbb25s︠
g[e,:]
︡c7f442f2-c9c3-4ccc-ba31-76f8f6e8ea0a︡︡{"html":"<div>$\\left(\\begin{array}{rr}\n1 &amp; 0 \\\\\n0 &amp; 1\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠135c9db1-91b8-4989-aa6c-e04e542cfdd5s︠
g.display(e)
︡7bee4213-734d-4aec-8b19-6b255a69969b︡︡{"html":"<div>$g = e^1\\otimes e^1+e^2\\otimes e^2$</div>","done":false}︡{"done":true}
︠98367eaf-558f-4771-b4cf-3ef2baf8ba29s︠
eps.display(e)
︡920aac10-e0a0-4a4a-96e3-cef8875e4336︡︡{"html":"<div>$\\epsilon_{g} = e^1\\wedge e^2$</div>","done":false}︡{"done":true}
︠b06da76b-7f00-4691-99d1-4805cf3cb572i︠
%html
<p>It is non-holonomic: its structure coefficients are not identically zero:</p>

︡81afbcfd-7e60-4d31-ad27-8ee0db9d05e6︡︡{"done":true,"html":"<p>It is non-holonomic: its structure coefficients are not identically zero:</p>"}
︠b33346ad-9f4e-4e1a-80a0-c9037a2de622s︠
e.structure_coef()[:]
︡60515e20-38ba-4177-85d7-7da16b6705e9︡︡{"html":"<div>[[[$0$, $0$], [$0$, $0$]], [[$0$, $-\\frac{\\cos\\left({\\theta}\\right)}{\\sin\\left({\\theta}\\right)}$], [$\\frac{\\cos\\left({\\theta}\\right)}{\\sin\\left({\\theta}\\right)}$, $0$]]]</div>","done":false}︡{"done":true}
︠992d511c-b715-4af0-8c3e-99466cb11d8as︠
e[2].lie_der(e[1]).display(e)
︡0cd9ac8b-36d2-457d-b211-dd640e685d7e︡︡{"html":"<div>$-\\frac{\\cos\\left({\\theta}\\right)}{\\sin\\left({\\theta}\\right)} e_2$</div>","done":false}︡{"done":true}
︠e1a05739-e368-4667-b967-04b02aa19968i︠
%html
<p>while we have of course</p>

︡86e3efe7-56e5-4aea-9683-70a3ba5ad5cc︡︡{"done":true,"html":"<p>while we have of course</p>"}
︠41c53f9a-dfc5-40dc-9bf9-9ccbe15f3bfbs︠
spher.frame().structure_coef()[:]
︡7d8292ea-81ad-43fe-a9b8-2631a1d45641︡︡{"html":"<div>[[[$0$, $0$], [$0$, $0$]], [[$0$, $0$], [$0$, $0$]]]</div>","done":false}︡{"done":true}
︠6c70e426-aed6-4524-a511-e26f379bb4bfs︠

︡01858de5-04e7-4aa6-a96b-815273cce4ea︡︡{"done":true}
︠9ee4c4b0-aad7-443b-9176-2f73076f8dafr︠

︡852b24c5-35aa-45be-afc4-f152680b0cf1︡










︠b239ad87-fcaf-436a-a590-3be9ff11573eas︠
%auto
typeset_mode(True, display=False)
︡b9e80e25-13d3-444c-9eb7-9983337218a8︡︡{"auto":true}︡{"done":true}
︠cdeab3f1-e4e4-405a-8283-b4368b9e57d2i︠
%html
<h1 style="text-align: center;">SageManifolds tutorial</h1>
<p>This worksheet provides a short introduction to <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.8).</p>
<p>It is released under the GNU General Public License version 3.</p>
<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>
<p><em><span style="color: #008080;">The corresponding worksheet file can be downloaded from</span> <a href="http://sagemanifolds.obspm.fr/doc/sws/SM_tutorial.sws">here</a>.</em></p>
<p>&nbsp;</p>
<h2>Defining a manifold</h2>
<p>The following assumes that the SageManifolds package is installed on your computer (see the <a href="http://sagemanifolds.obspm.fr/download.html">download and installation instructions</a> if not).</p>
<p>As an example let us define a differentiable manifold of dimension 3 over $\mathbb{R}$:</p>

︡be9b3b4a-cd00-4a51-90d5-99fd4b384fc4︡︡{"done":true,"html":"<h1 style=\"text-align: center;\">SageManifolds tutorial</h1>\n<p>This worksheet provides a short introduction to <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.8).</p>\n<p>It is released under the GNU General Public License version 3.</p>\n<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>\n<p><em><span style=\"color: #008080;\">The corresponding worksheet file can be downloaded from</span> <a href=\"http://sagemanifolds.obspm.fr/doc/sws/SM_tutorial.sws\">here</a>.</em></p>\n<p>&nbsp;</p>\n<h2>Defining a manifold</h2>\n<p>The following assumes that the SageManifolds package is installed on your computer (see the <a href=\"http://sagemanifolds.obspm.fr/download.html\">download and installation instructions</a> if not).</p>\n<p>As an example let us define a differentiable manifold of dimension 3 over $\\mathbb{R}$:</p>"}
︠9ad61099-879a-49c5-a935-3cf8f4ca4638si︠
M = Manifold(3, 'M', r'\mathcal{M}', start_index=1)
︡28a5d5fe-8267-4bb3-93c1-7241589a4eb8︡︡{"done":true}
︠cacb8712-43e7-4399-b0b3-59b537e1d78ei︠
%html
<ul>
<li>The first argument, <span style="color: #993300;">3</span>, is the manifold dimension. In SageManifolds, it can be any positive integer.</li>
<li>The second argument, <span style="color: #993300;">'M'</span>, is a string defining the manifold's name; it may be different from the symbol set on the left-hand side of the = sign (here M): the latter is a mere Python variable name that refers to the manifold object in the computer memory, while<span style="color: #993300;"> 'M'</span> identifies the manifold.</li>
<li>The third argument, <span style="color: #993300;">r'\mathcal{M}'</span>, is a string defining the LaTeX symbol to represent the manifold. Note the letter 'r' in front on the first quote: it indicates that the string is a <em>raw</em> one, so that the backslash character in \mathcal is considered as an ordinary character (otherwise, the backslash is used to escape some special characters).</li>
<li>The fourth argument, <span style="color: #993300;">start_index=1</span>, defines the range of indices to be used for tensor components on the manifold: setting it to 1 means that indices will range in $\{1,2,3\}$. The default value is start_index=0.</li>
</ul>
<p>If we ask for M, the LaTeX symbol is returned (provided the worksheet's Typeset box is selected):</p>

︡b828f8cc-a4e8-4f62-8bf1-1bc76dec695c︡︡{"done":true,"html":"<ul>\n<li>The first argument, <span style=\"color: #993300;\">3</span>, is the manifold dimension. In SageManifolds, it can be any positive integer.</li>\n<li>The second argument, <span style=\"color: #993300;\">'M'</span>, is a string defining the manifold's name; it may be different from the symbol set on the left-hand side of the = sign (here M): the latter is a mere Python variable name that refers to the manifold object in the computer memory, while<span style=\"color: #993300;\"> 'M'</span> identifies the manifold.</li>\n<li>The third argument, <span style=\"color: #993300;\">r'\\mathcal{M}'</span>, is a string defining the LaTeX symbol to represent the manifold. Note the letter 'r' in front on the first quote: it indicates that the string is a <em>raw</em> one, so that the backslash character in \\mathcal is considered as an ordinary character (otherwise, the backslash is used to escape some special characters).</li>\n<li>The fourth argument, <span style=\"color: #993300;\">start_index=1</span>, defines the range of indices to be used for tensor components on the manifold: setting it to 1 means that indices will range in $\\{1,2,3\\}$. The default value is start_index=0.</li>\n</ul>\n<p>If we ask for M, the LaTeX symbol is returned (provided the worksheet's Typeset box is selected):</p>"}
︠5974d532-7c7a-4994-beb0-daead5c9b1e8s︠
M
︡88a3af8a-3ee6-4c9a-a78b-c4ac235059db︡︡{"html":"<div>$\\mathcal{M}$</div>","done":false}︡{"done":true}
︠a4a3a951-3317-4bcd-a06a-4e6636779d47i︠
%html
<p>If we use the command <span style="font-family: courier new,courier;">print</span> instead, we get a short description of the object:</p>

︡074d7b77-0d7b-43fd-8816-f5b4e78297ee︡︡{"done":true,"html":"<p>If we use the command <span style=\"font-family: courier new,courier;\">print</span> instead, we get a short description of the object:</p>"}
︠d6c5c22e-3dc6-4941-9337-2766a2b2e1d6s︠
print M
︡264d1d4d-261b-4991-bbe4-5f714b4ed85b︡︡{"stdout":"3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠e664fbe2-81e5-4b58-af8f-a1ed117a9debi︠
%html
<p>Via the command <span style="font-family: courier new,courier;">type</span>, we get the type of the Python object corresponding to M (here the Python class <span style="font-family: courier new,courier;">Manifold_with_category</span>):</p>

︡742bad64-11a6-4f68-a602-fe27c853bde0︡︡{"done":true,"html":"<p>Via the command <span style=\"font-family: courier new,courier;\">type</span>, we get the type of the Python object corresponding to M (here the Python class <span style=\"font-family: courier new,courier;\">Manifold_with_category</span>):</p>"}
︠2f3612ac-38d9-47fb-8721-bd1fdfc03005s︠
type(M)
︡187b9b10-1d8a-42c0-b3ba-41c669cbdeaa︡︡{"stdout":"<class 'sage.geometry.manifolds.manifold.Manifold_with_category'>\n","done":false}︡{"done":true}
︠4592498f-110d-4536-bcd9-dccc4d632ebei︠
%html
<p>The indices on the manifold are generated by the method <span style="font-family: courier new,courier;">irange()</span>, to be used in loops:</p>

︡8e9f87ac-384c-47d5-bf18-6a76853919dd︡︡{"done":true,"html":"<p>The indices on the manifold are generated by the method <span style=\"font-family: courier new,courier;\">irange()</span>, to be used in loops:</p>"}
︠23b74003-0ed6-4be1-9714-73ec362d0b60s︠
for i in M.irange():
    print i,
︡2479be7f-4059-4b71-a25a-636d050c80c9︡︡{"stdout":"1 2 3","done":false}︡{"done":true}
︠7743a638-07d0-46da-86f5-0aba39121356i︠
%html
<p>If the parameter<span style="font-family: courier new,courier;"> start_index</span> had not been specified, the default range of the indices would have been $\{0,1,2\}$ instead:</p>

︡cec5d53a-602c-4c8b-ac76-baea199d5093︡︡{"done":true,"html":"<p>If the parameter<span style=\"font-family: courier new,courier;\"> start_index</span> had not been specified, the default range of the indices would have been $\\{0,1,2\\}$ instead:</p>"}
︠265ba4f0-33e6-4c9d-b359-048f4d6b28c6s︠
M0 = Manifold(3, 'M', r'\mathcal{M}')
for i in M0.irange():
    print i,
︡d6cd8a7b-64e7-47d5-81d7-49e588c2581c︡︡{"stdout":"0 1 2","done":false}︡{"done":true}
︠75003083-f337-4b33-a828-727a6c84c97ei︠
%html
<h2>Defining a chart on the manifold</h2>
<p>Let us assume that the manifold $\mathcal{M}$ can be covered by a single chart (other cases are discussed below); the chart is declared as follows:</p>

︡395befa7-4e75-40ef-ba5c-c2d19be0d7d3︡︡{"done":true,"html":"<h2>Defining a chart on the manifold</h2>\n<p>Let us assume that the manifold $\\mathcal{M}$ can be covered by a single chart (other cases are discussed below); the chart is declared as follows:</p>"}
︠6b27b492-2737-4e94-81c7-f956a1cc1478s︠
X.<x,y,z> = M.chart()
︡53549e18-28d5-47f8-b69c-ca1ef7325242︡︡{"done":true}
︠22d1e55c-21a8-45f2-b24b-546b3e561aaai︠
%html
<p><span id="cell_outer_15">The writing .&lt;x,y,z&gt; in the left-hand side means that the Python variables x, y and z are set to the three coordinates of the chart. This allows one to refer subsequently to the coordinates by their names.</span></p>
<p>In this example, the function <span style="font-family: courier new,courier;">chart()</span> has no arguments, which implies that the coordinate symbols will be 'x', 'y' and 'z' (i.e. exactly the characters set in the &lt;...&gt; operator) and that each coordinate range is $(-\infty,+\infty)$. For other cases, an argument must be passed to <span style="font-family: courier new,courier;">chart()</span>&nbsp; to specify the coordinate symbols and range, as well as the LaTeX symbols of the coordinates if the latter are different from the coordinate names (an example will be provided below).</p>
<p><span id="cell_outer_15"><br /></span></p>

︡da5432ff-4a7d-44c3-9d0c-0ac638226579︡︡{"done":true,"html":"<p><span id=\"cell_outer_15\">The writing .&lt;x,y,z&gt; in the left-hand side means that the Python variables x, y and z are set to the three coordinates of the chart. This allows one to refer subsequently to the coordinates by their names.</span></p>\n<p>In this example, the function <span style=\"font-family: courier new,courier;\">chart()</span> has no arguments, which implies that the coordinate symbols will be 'x', 'y' and 'z' (i.e. exactly the characters set in the &lt;...&gt; operator) and that each coordinate range is $(-\\infty,+\\infty)$. For other cases, an argument must be passed to <span style=\"font-family: courier new,courier;\">chart()</span>&nbsp; to specify the coordinate symbols and range, as well as the LaTeX symbols of the coordinates if the latter are different from the coordinate names (an example will be provided below).</p>\n<p><span id=\"cell_outer_15\"><br /></span></p>"}
︠8f06ad58-df17-4e4a-bc60-dbeb413fb854s︠
print X
︡0c1ae94c-d7d6-499b-a80f-f89b60458e22︡︡{"stdout":"chart (M, (x, y, z))\n","done":false}︡{"done":true}
︠9eae1e0c-5901-4728-9191-ccc86374957bi︠
%html
<p>The chart is displayed as a pair formed by the open set covered by it (here the whole manifold) and the coordinate names:</p>

︡a100737e-67f4-4e0e-a193-11b9ba664655︡︡{"done":true,"html":"<p>The chart is displayed as a pair formed by the open set covered by it (here the whole manifold) and the coordinate names:</p>"}
︠2232bcb2-7fce-4cd3-8d61-102ac52bbe56s︠
X
︡9f2bff13-4798-47b3-a00d-0455cf9bf2a1︡︡{"html":"<div>$\\left(\\mathcal{M},(x, y, z)\\right)$</div>","done":false}︡{"done":true}
︠9b0f6425-54b0-4056-a1b5-2267178caea7i︠
%html
<p>The coordinates can be accessed individually, by means of their indices, following the convention defined by <span style="font-family: courier new,courier;">start_index=1</span> in the manifold's definition:</p>

︡d9bf58bb-dde0-4d54-b921-f587e9715d71︡︡{"done":true,"html":"<p>The coordinates can be accessed individually, by means of their indices, following the convention defined by <span style=\"font-family: courier new,courier;\">start_index=1</span> in the manifold's definition:</p>"}
︠cc0afe32-d160-47bb-aeda-b0daf1ab9f92s︠
X[1]
︡35384efe-eb9e-4749-9fe0-4332df5005ae︡︡{"html":"<div>$x$</div>","done":false}︡{"done":true}
︠08290993-5918-461e-b4fa-cd7a709f8086s︠
X[2]
︡2fcb76a6-9b28-4222-abe5-f59879cc7ab1︡︡{"html":"<div>$y$</div>","done":false}︡{"done":true}
︠6de6cb5b-faea-4fab-b35b-422497c6b806s︠
X[3]
︡308630b6-aff9-417b-9a83-bf3fca87cf09︡︡{"html":"<div>$z$</div>","done":false}︡{"done":true}
︠31007f45-00ee-4bc8-a008-06e5ea9d0a89i︠
%html
<p>The full set of coordinates is obtained by means of the operator [:]:</p>

︡5b2733b0-f4b5-4049-a107-b8350bbe2d3a︡︡{"done":true,"html":"<p>The full set of coordinates is obtained by means of the operator [:]:</p>"}
︠48db4cae-c81d-4e1d-92a9-ae09f878b498s︠
X[:]
︡61f86e28-1f2b-4bef-939e-f7d45a71a374︡︡{"html":"<div>($x$, $y$, $z$)</div>","done":false}︡{"done":true}
︠1e73509c-d1b9-48e0-9a97-9c96323fa75ei︠
%html
<p>Thanks to the operator &lt;x,y,z&gt; in the chart declaration, each coordinate can be accessed directly via its name:</p>

︡a7d1f2c3-acf7-42d3-a818-3fdb2c90d27a︡︡{"done":true,"html":"<p>Thanks to the operator &lt;x,y,z&gt; in the chart declaration, each coordinate can be accessed directly via its name:</p>"}
︠af49aee3-58c5-41cc-a7ac-048ed515f59cs︠
z is X[3]
︡6b82b2a4-1430-463d-bdb2-af482ab0174f︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠f55ab7e4-748d-4c5e-80d3-61ada83e2514i︠
%html
<p>Coordinates are Sage symbolic expressions:</p>

︡30c963f2-c5ac-4677-9d20-aaf44c180254︡︡{"done":true,"html":"<p>Coordinates are Sage symbolic expressions:</p>"}
︠85cf5f0b-0cd8-412c-907e-4622fa258316s︠
type(z)
︡59630093-bf12-49f1-9375-3c5e843a0894︡︡{"stdout":"<type 'sage.symbolic.expression.Expression'>\n","done":false}︡{"done":true}
︠5269dbb0-ddb3-4ac8-8cec-cd202938df95i︠
%html
<h3>Functions of the chart coordinates</h3>
<p>Real-valued functions of the chart coordinates (mathematically speaking, <em>functions defined on the chart codomain</em>) are formed via the method <span style="font-family: courier new,courier;">function()</span> acting on the chart:</p>

︡c75dd954-3268-4133-b16e-b7b99838606f︡︡{"done":true,"html":"<h3>Functions of the chart coordinates</h3>\n<p>Real-valued functions of the chart coordinates (mathematically speaking, <em>functions defined on the chart codomain</em>) are formed via the method <span style=\"font-family: courier new,courier;\">function()</span> acting on the chart:</p>"}
︠afeef508-383e-4473-b64b-fa09e188f2e1s︠
f = X.function(x+y^2+z^3) ; f
︡7c14e570-e3f5-450a-942e-4dafcb79b4ab︡︡{"html":"<div>$z^{3} + y^{2} + x$</div>","done":false}︡{"done":true}
︠76a719cf-639a-4941-9bea-ab285fa9fdeds︠
f.display()
︡ad04c803-631d-407a-90e8-4895e41450ee︡︡{"html":"<div>$\\left(x, y, z\\right) \\mapsto z^{3} + y^{2} + x$</div>","done":false}︡{"done":true}
︠202007b6-aa75-4a41-a582-ec8cb9408bcbs︠
f(1,2,3)
︡cae69724-c442-4e4f-9a2c-44b6303d8ea5︡︡{"html":"<div>$32$</div>","done":false}︡{"done":true}
︠04a2a741-05bb-4435-a9e9-44b96b89204ai︠
%html
<p>They belong to SageManifolds class <span style="font-family: courier new,courier;">FunctionChart</span>:</p>

︡587ad0eb-5e20-4c61-a2eb-804902e10ada︡︡{"done":true,"html":"<p>They belong to SageManifolds class <span style=\"font-family: courier new,courier;\">FunctionChart</span>:</p>"}
︠bee06e9d-d061-4194-93c0-0f2bd1afefb8s︠
type(f)
︡a447a757-e206-4dc8-a92e-62a406a04471︡︡{"stdout":"<class 'sage.geometry.manifolds.chart.FunctionChart'>\n","done":false}︡{"done":true}
︠d235de8e-a27d-4da1-9f11-4bfceae28543i︠
%html
<p>and differ from Sage standard symbolic functions by automatic simplifications in all operations. For instance, adding the two symbolic functions</p>

︡c6ccbd4d-9701-4799-9912-a8a8603df377︡︡{"done":true,"html":"<p>and differ from Sage standard symbolic functions by automatic simplifications in all operations. For instance, adding the two symbolic functions</p>"}
︠ef1362ec-9962-4a3c-a9a1-e749dc828b42s︠
f0(x,y,z) = cos(x)^2 ; g0(x,y,z) = sin(x)^2
︡27d1d8ca-ce65-4328-ac3a-bca6ee18b819︡︡{"done":true}
︠0a625372-ca0c-4cd7-85ba-f35b14d499b0i︠
%html
<p>results in</p>

︡94339f1b-6d74-48d3-842b-fd915201877f︡︡{"done":true,"html":"<p>results in</p>"}
︠0b3badba-d5ce-4657-bb21-5347cbbfcb86s︠
f0 + g0
︡2d97d2c0-d149-4645-9310-cd022521ba86︡︡{"html":"<div>$\\left( x, y, z \\right) \\ {\\mapsto} \\ \\cos\\left(x\\right)^{2} + \\sin\\left(x\\right)^{2}$</div>","done":false}︡{"done":true}
︠9281df60-da2d-4ad0-a461-389649ef1c03i︠
%html
<p>while the sum of the corresponding <span style="font-family: courier new,courier;">FunctionChart</span> functions is automatically simplified:</p>

︡e86af1af-c377-4b88-a8f3-267188b8a149︡︡{"done":true,"html":"<p>while the sum of the corresponding <span style=\"font-family: courier new,courier;\">FunctionChart</span> functions is automatically simplified:</p>"}
︠d341d206-8d8d-454b-a633-c91b7109b157s︠
f1 = X.function(cos(x)^2) ; g1 = X.function(sin(x)^2)
f1 + g1
︡33a74b89-0f33-4d1b-a4e0-3ff373b9dfe6︡︡{"html":"<div>$1$</div>","done":false}︡{"done":true}
︠151124d1-116d-4d20-b712-1d8128cc5328i︠
%html
<p>To get the same output with symbolic functions, one has to call the method <span style="font-family: courier new,courier;">simplify_trig()</span>:</p>

︡715030fd-c5dc-4d8c-99b3-09282e4cbaa2︡︡{"done":true,"html":"<p>To get the same output with symbolic functions, one has to call the method <span style=\"font-family: courier new,courier;\">simplify_trig()</span>:</p>"}
︠c8864dc4-678c-4d37-8d1e-04def4f6a347s︠
(f0 + g0).simplify_trig()
︡1fa1cc1a-9ec5-4ee2-9f3f-bb1305b699a1︡︡{"html":"<div>$\\left( x, y, z \\right) \\ {\\mapsto} \\ 1$</div>","done":false}︡{"done":true}
︠8ee7e9f4-51f1-4c48-b2bc-fe7f550c255ci︠
%html
<p>Another difference regards the display; if we ask for the symbolic function f0, we get:</p>

︡db126ec2-51d9-4564-8267-a0bcdc52c525︡︡{"done":true,"html":"<p>Another difference regards the display; if we ask for the symbolic function f0, we get:</p>"}
︠6a15149d-5fc3-4e52-923a-403be15e8e2as︠
f0
︡31d4bd94-2b3f-4227-9179-e3826db0f9c2︡︡{"html":"<div>$\\left( x, y, z \\right) \\ {\\mapsto} \\ \\cos\\left(x\\right)^{2}$</div>","done":false}︡{"done":true}
︠596e7845-265c-4f9f-b719-6b65103e67aei︠
%html
<p>while if we ask for the chart function f1, we get only the coordinate expression:</p>

︡dc9b038a-c3da-4708-b77e-18530adccb9f︡︡{"done":true,"html":"<p>while if we ask for the chart function f1, we get only the coordinate expression:</p>"}
︠b0dc8b96-4dd6-48af-a613-3d1ae759d9ces︠
f1
︡f8439266-fb4f-45a6-9563-58ebe540ff03︡︡{"html":"<div>$\\cos\\left(x\\right)^{2}$</div>","done":false}︡{"done":true}
︠0eb8a7df-6863-4edc-ac87-3e2deef657e5i︠
%html
<p>To get an output similar to that of f0, one should call the method <span style="font-family: courier new,courier;">display()</span>:</p>

︡cbc8071d-d080-4116-a895-a8b30a802481︡︡{"done":true,"html":"<p>To get an output similar to that of f0, one should call the method <span style=\"font-family: courier new,courier;\">display()</span>:</p>"}
︠38c5a959-3350-4d42-a5da-2dab040a5b78s︠
f1.display()
︡f77d5183-f875-4315-af5a-568d4521259e︡︡{"html":"<div>$\\left(x, y, z\\right) \\mapsto \\cos\\left(x\\right)^{2}$</div>","done":false}︡{"done":true}
︠c87404bb-cd30-4e11-a217-5861bb532d6di︠
%html
<p>Note that the method <span style="font-family: courier new,courier;">expr()</span> returns the corresponding Sage symbolic expression:</p>

︡476a46df-ccee-40d2-9ff5-059de8d6000f︡︡{"done":true,"html":"<p>Note that the method <span style=\"font-family: courier new,courier;\">expr()</span> returns the corresponding Sage symbolic expression:</p>"}
︠a85190b3-f0ab-4857-b973-b49e69c4bfd4s︠
f1.expr()
︡93b9f8ae-fd7f-4f74-8741-5a8e0856b702︡︡{"html":"<div>$\\cos\\left(x\\right)^{2}$</div>","done":false}︡{"done":true}
︠e0b5fe63-ce10-42cb-9975-be320c4c1315s︠
type(f1.expr())
︡78b6af35-31a4-402d-9ab0-e5e6aeaea200︡︡{"stdout":"<type 'sage.symbolic.expression.Expression'>\n","done":false}︡{"done":true}
︠a7663761-743b-4511-aacb-143f4af0011ai︠
%html
<h2>Introducing a second chart on the manifold</h2>
<p>Let us first consider an open subset of $\mathcal{M}$, for instance the complement $U$ of the region defined by $\{y=0, x\geq 0\}$ (note that (y!=0, x&lt;0) stands for $y\not=0$ OR $x&lt;0$; the condition $y\not=0$ AND $x&lt;0$ would have been written [y!=0, x&lt;0] instead):</p>

︡09863b0b-8c08-40de-a796-239d528229e0︡︡{"done":true,"html":"<h2>Introducing a second chart on the manifold</h2>\n<p>Let us first consider an open subset of $\\mathcal{M}$, for instance the complement $U$ of the region defined by $\\{y=0, x\\geq 0\\}$ (note that (y!=0, x&lt;0) stands for $y\\not=0$ OR $x&lt;0$; the condition $y\\not=0$ AND $x&lt;0$ would have been written [y!=0, x&lt;0] instead):</p>"}
︠559f1141-41a2-46ec-b64e-2d11d8511cfas︠
U = M.open_subset('U', coord_def={X: (y!=0, x<0)})
︡cf9b5199-0b73-4de0-b129-05a61c374eb7︡︡{"done":true}
︠b00a0a5c-ac5b-4fa8-8a1a-f4610b6d92ddi︠
%html
<p>Let us call X_U the restriction of the chart X to the open subset $U$:</p>

︡d995a041-57db-4b0c-95bc-d2b375067d9a︡︡{"done":true,"html":"<p>Let us call X_U the restriction of the chart X to the open subset $U$:</p>"}
︠1ea60cfd-3a77-4676-a6b7-59932f80641bs︠
X_U = X.restrict(U) ; X_U
︡c9a80ba1-2a6e-4894-a580-2c1f641cf527︡︡{"html":"<div>$\\left(U,(x, y, z)\\right)$</div>","done":false}︡{"done":true}
︠e76281cc-6947-419f-a814-5e0d87a74990i︠
%html
<p>We introduce another chart on $U$, with spherical-type coordinates $(r,\theta,\phi)$:</p>

︡2ba3e346-e253-4c87-b8b6-039b96e744af︡︡{"done":true,"html":"<p>We introduce another chart on $U$, with spherical-type coordinates $(r,\\theta,\\phi)$:</p>"}
︠f98412c9-09bd-4fd1-9362-392101e3b322s︠
Y.<r,th,ph> = U.chart(r'r:(0,+oo) th:(0,pi):\theta ph:(0,2*pi):\phi') ; Y
︡6b06ca69-6d7d-4044-ad7d-49a8c02e05c6︡︡{"html":"<div>$\\left(U,(r, {\\theta}, {\\phi})\\right)$</div>","done":false}︡{"done":true}
︠d67913e8-7a97-4328-bc28-bcf0aa1399dci︠
%html
<p>The function <span style="font-family: courier new,courier;">chart()</span> has now some argument; it is a string, which contains specific LaTeX symbols, hence the prefix 'r' to it (for <em>raw</em> string). It also contains the coordinate ranges, since they are different from the default value, which is $(-\infty, +\infty)$. For a given coordinate, the various fields are separated by the character ':' and a space character separates the coordinates. Note that for $r$, there is only two fields, since the LaTeX symbol has not to be specified. The LaTeX symbols are used for the outputs:</p>

︡efe51328-3f45-4213-9ecc-ea1d7bdb8f28︡︡{"done":true,"html":"<p>The function <span style=\"font-family: courier new,courier;\">chart()</span> has now some argument; it is a string, which contains specific LaTeX symbols, hence the prefix 'r' to it (for <em>raw</em> string). It also contains the coordinate ranges, since they are different from the default value, which is $(-\\infty, +\\infty)$. For a given coordinate, the various fields are separated by the character ':' and a space character separates the coordinates. Note that for $r$, there is only two fields, since the LaTeX symbol has not to be specified. The LaTeX symbols are used for the outputs:</p>"}
︠cfeb27cc-49a3-477d-854b-58262454fd9as︠
th, ph
︡9bd8f811-210e-4bf0-b9f1-fb55d3ea0b16︡︡{"html":"<div>(${\\theta}$, ${\\phi}$)</div>","done":false}︡{"done":true}
︠38703181-7faa-490f-bfc6-6197c3ec9854s︠
Y[2], Y[3]
︡9f037cc5-8ce9-41cf-9359-9a735ae96eb8︡︡{"html":"<div>(${\\theta}$, ${\\phi}$)</div>","done":false}︡{"done":true}
︠d0568a1e-3ca5-4e9d-8f72-786c3bf9f1b5i︠
%html
<p>The declared coordinate ranges are now known to Sage, as we may check by means of the command <span style="font-family: courier new,courier; font-size: small;">assumptions()</span>:</p>

︡860caac2-aa10-4f64-8591-8a7dde49185d︡︡{"done":true,"html":"<p>The declared coordinate ranges are now known to Sage, as we may check by means of the command <span style=\"font-family: courier new,courier; font-size: small;\">assumptions()</span>:</p>"}
︠d5136124-65e7-4de4-936e-b3b7af7f6797s︠
assumptions()
︡7b81bba2-0b1d-4dbb-b537-05b84f84fc1a︡︡{"html":"<div>[$\\text{\\texttt{x{ }is{ }real}}$, $\\text{\\texttt{y{ }is{ }real}}$, $\\text{\\texttt{z{ }is{ }real}}$, $\\text{\\texttt{r{ }is{ }real}}$, $r &gt; 0$, $\\text{\\texttt{th{ }is{ }real}}$, ${\\theta} &gt; 0$, ${\\theta} &lt; \\pi$, $\\text{\\texttt{ph{ }is{ }real}}$, ${\\phi} &gt; 0$, ${\\phi} &lt; 2 \\, \\pi$]</div>","done":false}︡{"done":true}
︠c5474afe-1ceb-4c69-8d63-53f90881dabei︠
%html
<p>They are used in simplifications:</p>

︡97dc1283-4224-4edd-9aae-bc878c4385da︡︡{"done":true,"html":"<p>They are used in simplifications:</p>"}
︠49e86a98-3a4c-4524-ad07-75f33deb1ec1s︠
simplify(abs(r))
︡502433d5-c038-4286-bdea-70674b614fe6︡︡{"html":"<div>$r$</div>","done":false}︡{"done":true}
︠2149b64e-4803-4ddc-8592-4f042133b187s︠
simplify(abs(x)) # no simplification occurs since x can take any value in R
︡4219aec2-1f99-4dfd-8192-abe8c563e792︡︡{"html":"<div>${\\left| x \\right|}$</div>","done":false}︡{"done":true}
︠e71c727f-e1dd-4e3a-875b-c0d89b709c20i︠
%html
<p>After having been declared, the chart Y can be fully specified by its relation to the chart X_U, via a transition map:</p>

︡d803bda2-002b-402b-a4aa-2e72858539bf︡︡{"done":true,"html":"<p>After having been declared, the chart Y can be fully specified by its relation to the chart X_U, via a transition map:</p>"}
︠5d5c73bc-69e9-4579-9e76-62111bdf26a0s︠
transit_Y_to_X = Y.transition_map(X_U, [r*sin(th)*cos(ph), r*sin(th)*sin(ph), r*cos(th)])
︡fb08ef9b-b746-411c-876a-d509a2f3d8a6︡︡{"done":true}
︠ec5d7e5e-d23e-4bb5-8a75-a747e9c234d5s︠
transit_Y_to_X
︡1daaa2e4-04e6-41d4-ae21-44b7d1312c50︡︡{"html":"<div>$\\left(U,(r, {\\theta}, {\\phi})\\right) \\rightarrow \\left(U,(x, y, z)\\right)$</div>","done":false}︡{"done":true}
︠739b9a48-f568-4dc6-bf9f-aa420bf63d47s︠
transit_Y_to_X.display()
︡70acf5e8-a52a-4bac-94af-a4043987f14e︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} x &amp; = &amp; r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\\\ y &amp; = &amp; r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\\\ z &amp; = &amp; r \\cos\\left({\\theta}\\right) \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠81478218-ee48-43f5-a067-44f2cf26c4f4i︠
%html
<p>The inverse of the transition map can be specified by means of the method <span style="font-family: courier new,courier;">set_inverse()</span>:</p>

︡7ef4388e-6195-47c4-bda7-a07055b24b35︡︡{"done":true,"html":"<p>The inverse of the transition map can be specified by means of the method <span style=\"font-family: courier new,courier;\">set_inverse()</span>:</p>"}
︠30a47d3a-032a-4740-860d-3c094f566b7as︠
transit_Y_to_X.set_inverse(sqrt(x^2+y^2+z^2), atan2(sqrt(x^2+y^2),z), atan2(y, x))
transit_Y_to_X.inverse().display()
︡544de7d0-4173-4604-9e88-84e4fa6a3633︡︡{"stdout":"Check of the inverse coordinate transformation:","done":false}︡{"stdout":"\n   r == ","done":false}︡{"stdout":"r\n   th == ","done":false}︡{"stdout":"arctan2(r*sin(th), r*cos(th))\n   ph == ","done":false}︡{"stdout":"arctan2(r*sin(ph)*sin(th), r*cos(ph)*sin(th))\n   x == ","done":false}︡{"stdout":"x\n   y == ","done":false}︡{"stdout":"y\n   z == ","done":false}︡{"stdout":"z\n","done":false}︡{"html":"<div>$\\left\\{\\begin{array}{lcl} r &amp; = &amp; \\sqrt{x^{2} + y^{2} + z^{2}} \\\\ {\\theta} &amp; = &amp; \\arctan\\left(\\sqrt{x^{2} + y^{2}}, z\\right) \\\\ {\\phi} &amp; = &amp; \\arctan\\left(y, x\\right) \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠c2e659e5-13ac-4531-983d-f8340ccc5fa3i︠
%html
<p>The check is passed, although some simplifications related to the arctan2 function are not performed.</p>
<p>At this stage, the manifold's <strong>atlas</strong> (the "user atlas", not the maximal atlas!) contains three charts:</p>

︡fde748b8-efdb-4d92-b76b-43df9624ddbe︡︡{"done":true,"html":"<p>The check is passed, although some simplifications related to the arctan2 function are not performed.</p>\n<p>At this stage, the manifold's <strong>atlas</strong> (the \"user atlas\", not the maximal atlas!) contains three charts:</p>"}
︠b93444d2-f094-44e5-8295-3bef9bfb072ds︠
M.atlas()
︡e00125ba-ac1c-4aff-a35e-5b4b8e782572︡︡{"html":"<div>[$\\left(\\mathcal{M},(x, y, z)\\right)$, $\\left(U,(x, y, z)\\right)$, $\\left(U,(r, {\\theta}, {\\phi})\\right)$]</div>","done":false}︡{"done":true}
︠3ae9d7a8-e47e-4c4c-8f1a-047d86c56321i︠
%html
<p>The first chart defined on the manifold is considered as the manifold's default chart (it can be changed by the method <span style="font-family: courier new,courier;">set_default_chart()</span>):</p>

︡54c2c384-3503-41f3-a556-805fd6b8dccd︡︡{"done":true,"html":"<p>The first chart defined on the manifold is considered as the manifold's default chart (it can be changed by the method <span style=\"font-family: courier new,courier;\">set_default_chart()</span>):</p>"}
︠6e9e04e6-79c9-4d33-8f62-320e65b797abs︠
M.default_chart()
︡eaaef19d-4739-4afb-b0f2-6657656af3df︡︡{"html":"<div>$\\left(\\mathcal{M},(x, y, z)\\right)$</div>","done":false}︡{"done":true}
︠28131412-dad0-4e92-836d-da18f658f466i︠
%html
<p>Each open subset has its own atlas:</p>

︡6a2bcb32-1dd2-45fc-8f18-452e0b84cb7b︡︡{"done":true,"html":"<p>Each open subset has its own atlas:</p>"}
︠dc39bd79-0cf9-4f9a-a3f0-41e4a1a6e3dbs︠
U.atlas()
︡f1c3d06d-e747-42ae-8aed-07c9e580dbed︡︡{"html":"<div>[$\\left(U,(x, y, z)\\right)$, $\\left(U,(r, {\\theta}, {\\phi})\\right)$]</div>","done":false}︡{"done":true}
︠2734c5dd-44ed-4600-ba6f-200469430c3cs︠
U.default_chart()
︡90fe504e-0247-4486-8fcd-e11d6c21b53c︡︡{"html":"<div>$\\left(U,(x, y, z)\\right)$</div>","done":false}︡{"done":true}
︠d0d93a1d-89fb-438f-a5ad-7eb25fc1b2d6i︠
%html
<p>We can draw the chart $Y$ in terms of the chart $X$: the plot shows lines of constant coordinates from the $Y$ chart in a "Cartesian frame" based on the $X$ coordinates:</p>

︡40b2e269-bba9-4e8e-a08b-030ed6cc1cce︡︡{"done":true,"html":"<p>We can draw the chart $Y$ in terms of the chart $X$: the plot shows lines of constant coordinates from the $Y$ chart in a \"Cartesian frame\" based on the $X$ coordinates:</p>"}
︠81f7b0a7-aa6c-4dbf-9e73-c82c4844541fs︠
Y.plot(X)
︡2d002718-48c6-40aa-ac9a-6490fc10761f︡︡{"done":false,"file":{"uuid":"a37018b7-355d-4856-92bf-2e1d8367e2bf","filename":"a37018b7-355d-4856-92bf-2e1d8367e2bf.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠bda40007-62c4-4943-baab-0d417295b60ci︠
%html
<p>The command plot() allows for many options, to control the number of coordinate lines to be drawn, their style and color, as well as the coordinate ranges:</p>

︡db241a50-03ba-49cb-960d-fb2e477e90f3︡︡{"done":true,"html":"<p>The command plot() allows for many options, to control the number of coordinate lines to be drawn, their style and color, as well as the coordinate ranges:</p>"}
︠5cc4c9e3-43a8-4990-9d89-a206fdf7d7d7s︠
graph = Y.plot(X, ranges={r:(1,2), th:(0,pi/2)}, nb_values=4, color={r:'blue', th:'green', ph:'red'})
show(graph, aspect_ratio=1)
︡0a27df7e-3be6-4d7b-a858-24aab294f611︡︡{"done":false,"file":{"uuid":"ec83fe16-a149-484f-898e-3cf8162fcb7b","filename":"ec83fe16-a149-484f-898e-3cf8162fcb7b.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠c702309b-7bf6-409c-b811-761429629921i︠
%html
<p>Conversly, the chart $X|_{U}$ can be plotted in terms of the chart $Y$ (this is not possible for the whole chart $X$ since its domain is larger than that of chart $Y$):</p>

︡562c6839-3252-4902-9278-903baefbc01a︡︡{"done":true,"html":"<p>Conversly, the chart $X|_{U}$ can be plotted in terms of the chart $Y$ (this is not possible for the whole chart $X$ since its domain is larger than that of chart $Y$):</p>"}
︠38737723-3021-446b-89a2-ee200673268es︠
X_U.plot(Y)
︡47a6f637-919c-4b74-9510-c1fcf7b96352︡︡{"done":false,"file":{"uuid":"29e55d4f-87da-4608-86dd-aafb8d5b0991","filename":"29e55d4f-87da-4608-86dd-aafb8d5b0991.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠952c9e65-4fb3-4cd9-b657-b347fb52e9f4i︠
%html
<h2>Points on the manifold</h2>
<p>A point on $\mathcal{M}$ is defined by its coordinates in a given chart:</p>

︡ba7aea90-0a78-4fb9-a938-f1e9e4cc3bb9︡︡{"done":true,"html":"<h2>Points on the manifold</h2>\n<p>A point on $\\mathcal{M}$ is defined by its coordinates in a given chart:</p>"}
︠498833b4-b6d8-481c-93ef-e8517434ac06s︠
p = M.point((1,2,-1), X, name='p') ; print p ; p
︡7d64b2ff-99ff-4009-bf82-c616ae9384df︡︡{"stdout":"point 'p' on 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$p$</div>","done":false}︡{"done":true}
︠a41b27a0-c998-42bb-af4f-a159f895e414i︠
%html
<p>Since $X=(\mathcal{M}, (x,y,z))$ is the manifold's default chart, its name can be omitted:</p>

︡22f8611f-24fc-45d9-ba70-48719438fc2f︡︡{"done":true,"html":"<p>Since $X=(\\mathcal{M}, (x,y,z))$ is the manifold's default chart, its name can be omitted:</p>"}
︠a39a3bd6-3013-4a9f-a579-ea004d91718ds︠
p = M.point((1,2,-1), name='p') ; print p ; p
︡5bae03ae-e824-42e8-a11a-b41a99f709c1︡︡{"stdout":"point 'p' on 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$p$</div>","done":false}︡{"done":true}
︠c954cc3e-e96d-42b7-ab6c-58a8a1fce1c1i︠
%html
<p>Of course, $p$ belongs to $\mathcal{M}$:</p>

︡37a938b5-7ba2-40c3-bf08-d68feb17a727︡︡{"done":true,"html":"<p>Of course, $p$ belongs to $\\mathcal{M}$:</p>"}
︠ccd77682-847e-4451-b98f-a3d933950876s︠
p in M
︡8c4adf86-985f-47c1-86ff-66ba4a9d0a30︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠fcd98a83-02c6-42ff-9fac-00101ef9e71bi︠
%html
<p>It is also in $U$:</p>

︡e9848e49-c680-40a6-8358-610940386ae0︡︡{"done":true,"html":"<p>It is also in $U$:</p>"}
︠9a69d7f1-fb79-451d-8af3-ed81ac814abfs︠
p in U
︡89592849-d29d-41d0-b81d-cc80463b985d︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠054300df-d91d-46af-a0b8-bdb06be996eei︠
%html
<p>Indeed the coordinates of $p$ have $y\not=0$:</p>

︡6db75923-bb62-4d37-9544-5cf3799b3224︡︡{"done":true,"html":"<p>Indeed the coordinates of $p$ have $y\\not=0$:</p>"}
︠cc1957ee-7878-46fa-b2a1-395bb805cc29s︠
p.coord(X)
︡b1c9abec-6e8c-460b-8e73-ca2282ccffb0︡︡{"html":"<div>($1$, $2$, $-1$)</div>","done":false}︡{"done":true}
︠0667141c-a247-439e-a5ac-6d7e1e778527i︠
%html
<p>Note in passing that since $X$ is the default chart on $\mathcal{M}$, its name can be omitted in the arguments of coord():</p>

︡3ccec839-9567-40d0-9c33-38bba7217cba︡︡{"done":true,"html":"<p>Note in passing that since $X$ is the default chart on $\\mathcal{M}$, its name can be omitted in the arguments of coord():</p>"}
︠2769fbfb-a20f-4074-b09e-890761797120s︠
p.coord()
︡08b4be7c-4591-4f80-bbdc-62b4c84dccf2︡︡{"html":"<div>($1$, $2$, $-1$)</div>","done":false}︡{"done":true}
︠70fd4ab8-91af-460a-82c1-2001db81f2c0i︠
%html
<p>The coordinates of $p$ can also be obtained by letting the chart acting of the point (from the very definition of a chart!):</p>

︡bbbaefa4-a7f2-4bde-b4b1-593d8f8069d0︡︡{"done":true,"html":"<p>The coordinates of $p$ can also be obtained by letting the chart acting of the point (from the very definition of a chart!):</p>"}
︠0c15dbdc-a887-4942-b0f3-9e328180a541s︠
X(p)
︡aab693e5-67cd-47f8-8802-765bee5515f4︡︡{"html":"<div>($1$, $2$, $-1$)</div>","done":false}︡{"done":true}
︠2c5ec646-a9e9-44b2-aa04-fb960044ca2ei︠
%html
<p>Let $q$ be a point with $y = 0$ and $x \geq 0$:</p>

︡7c0b41d2-582a-4c63-b57b-a4d3f724b562︡︡{"done":true,"html":"<p>Let $q$ be a point with $y = 0$ and $x \\geq 0$:</p>"}
︠047dffdf-dfcd-4f5a-9de4-1090ddae2dc2s︠
q = M.point((1,0,2), name='q')
︡9e1068ba-c3a9-434b-a117-aebe28837f20︡︡{"done":true}
︠cbf21a00-b03d-4852-8f0c-69cea726fa98i︠
%html
<p>This time, the point does not belong to $U$:</p>

︡05d16cf3-9cf0-4acc-af7c-83e9db646b9f︡︡{"done":true,"html":"<p>This time, the point does not belong to $U$:</p>"}
︠d14f8cd1-81fe-487a-9d68-9d5d931844dbs︠
q in U
︡cb6ef562-2a25-4160-abf4-55894c780d36︡︡{"html":"<div>$\\mathrm{False}$</div>","done":false}︡{"done":true}
︠3edd53fd-211d-4f4d-bf3d-8f17a6ce4ee5i︠
%html
<p>Accordingly, we cannot ask for the coordinates of $q$ in the chart $Y=(U, (r,\theta,\phi))$:</p>

︡4701bf91-ce1e-41a1-8e29-d6d7daf505da︡︡{"done":true,"html":"<p>Accordingly, we cannot ask for the coordinates of $q$ in the chart $Y=(U, (r,\\theta,\\phi))$:</p>"}
︠7fa4b373-29e5-4e73-8024-8830e8bc0fb4s︠
q.coord(Y)
︡262b7764-2de8-4307-acb9-5a60442a4401︡︡{"done":false,"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/geometry/manifolds/point.py\", line 341, in coord\n    \"of \" + str(chart))\nValueError: The point does not belong to the domain of chart (U, (r, th, ph))\n"}︡{"done":true}
︠1d517477-44ef-415b-a3d4-aa217cf6369ei︠
%html
<p>but we can for point $p$:</p>

︡cbc3a34a-ce64-43f5-9f16-f80f53dc51c6︡︡{"done":true,"html":"<p>but we can for point $p$:</p>"}
︠690034b2-272b-4b1b-a136-34c6dfa214b6s︠
p.coord(Y)
︡fa2fde27-9fba-4a39-a09f-52e7b331edbf︡︡{"html":"<div>($\\sqrt{3} \\sqrt{2}$, $\\pi - \\arctan\\left(\\sqrt{5}\\right)$, $\\arctan\\left(2\\right)$)</div>","done":false}︡{"done":true}
︠16f412b7-df64-4795-9e0f-ad9dc47d3672s︠
Y(p)
︡c9792b1d-1940-47c3-910a-5c8e2eb5df12︡︡{"html":"<div>($\\sqrt{3} \\sqrt{2}$, $\\pi - \\arctan\\left(\\sqrt{5}\\right)$, $\\arctan\\left(2\\right)$)</div>","done":false}︡{"done":true}
︠de87b512-2894-4aeb-9365-9bb1bd6500d9i︠
%html
<p>Points can be compared:</p>

︡6d997649-b7a9-4132-a315-7da28bf85521︡︡{"done":true,"html":"<p>Points can be compared:</p>"}
︠14060e3d-89ae-4003-b929-aca7783303f4s︠
q == p
︡457c90e6-4d7d-4eb6-8cc9-1b427292ba22︡︡{"html":"<div>$\\mathrm{False}$</div>","done":false}︡{"done":true}
︠a190d334-32a3-4455-9d56-845c4e3c3696s︠
p1 = U.point((sqrt(6), pi-atan(sqrt(5)), atan(2)), Y)
p1 == p
︡de8c6c37-232f-4ebe-9e25-0a0d7d4cad17︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠ff67cc5a-bb1f-4bdc-b69a-892140cda14ai︠
%html
<p>In Sage's terminology, points are <strong>elements</strong>, whose <strong>parents</strong> are the manifold on which they have been defined:</p>

︡167d237d-5881-4f3c-aa32-443b061e7eb8︡︡{"done":true,"html":"<p>In Sage's terminology, points are <strong>elements</strong>, whose <strong>parents</strong> are the manifold on which they have been defined:</p>"}
︠57503e04-49f0-4578-9edf-297141d64fd3s︠
p.parent()
︡397756eb-fce4-4f81-bec5-4f985ca9805a︡︡{"html":"<div>$\\mathcal{M}$</div>","done":false}︡{"done":true}
︠d2d7f8ee-9ced-455e-99e6-1794752b064es︠
q.parent()
︡ca6237d4-09af-4115-a3db-45522a956819︡︡{"html":"<div>$\\mathcal{M}$</div>","done":false}︡{"done":true}
︠3c443394-ef55-4baf-9c8d-02352140fb55s︠
p1.parent()
︡f6296b0a-444b-4fd1-befa-a7d2a41e0b5e︡︡{"html":"<div>$\\mathcal{M}$</div>","done":false}︡{"done":true}
︠5d8497eb-1597-43e0-8962-e82949e33657i︠
%html
<h2>Scalar fields</h2>
<p>A scalar field is a differentiable mapping $U\subset \mathcal{M} \longrightarrow \mathbb{R}$, where $U$ is an open subset of $\mathcal{M}$.</p>
<p>The scalar field is defined by its expressions in terms of charts covering its domain (in general more than one chart is necessary to cover all the domain):</p>

︡9222f493-9487-499b-b704-ba9084efc37a︡︡{"done":true,"html":"<h2>Scalar fields</h2>\n<p>A scalar field is a differentiable mapping $U\\subset \\mathcal{M} \\longrightarrow \\mathbb{R}$, where $U$ is an open subset of $\\mathcal{M}$.</p>\n<p>The scalar field is defined by its expressions in terms of charts covering its domain (in general more than one chart is necessary to cover all the domain):</p>"}
︠69035756-9941-4186-8204-744961e2bf7es︠
f = U.scalar_field({X_U: x+y^2+z^3}, name='f') ; print f
︡7b6333ab-3fa1-4691-bd2a-4a4e81c94b51︡︡{"stdout":"scalar field 'f' on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠8dfb8a56-f3e7-48e4-ba3a-17d257d4aaaai︠
%html
<p>The coordinate expressions of the scalar field are passed as a Python dictionary, with the charts as keys, hence the writing <span style="font-family: courier new,courier;">{X_U: x+y^2+z^3}</span>.</p>
<p>Since in the present case, there is only one chart in the dictionary, an alternative writing is</p>

︡d135ecf8-2a0f-4699-a597-0330523878b3︡︡{"done":true,"html":"<p>The coordinate expressions of the scalar field are passed as a Python dictionary, with the charts as keys, hence the writing <span style=\"font-family: courier new,courier;\">{X_U: x+y^2+z^3}</span>.</p>\n<p>Since in the present case, there is only one chart in the dictionary, an alternative writing is</p>"}
︠502482c4-a4ea-4567-a806-95a261de3fcds︠
f = U.scalar_field(x+y^2+z^3, chart=X_U, name='f') ; print f
︡534065d0-ad4d-4720-8462-89a3066f3ae4︡︡{"stdout":"scalar field 'f' on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠045bd2f6-9fa8-406e-bb52-de568dd22182i︠
%html
<p>Since X_U is the domain's default chart, it can be omitted in the above declaration:</p>

︡d802591a-99c0-4886-9ae2-05035dbbb7c1︡︡{"done":true,"html":"<p>Since X_U is the domain's default chart, it can be omitted in the above declaration:</p>"}
︠63f4cf0a-db13-4745-95b0-0bebe903c8bes︠
f = U.scalar_field(x+y^2+z^3, name='f') ; print f
︡a90c35e1-9d06-468c-9b35-e78f18486832︡︡{"stdout":"scalar field 'f' on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠942ee39c-93da-4bf5-b145-e288f267c9a1i︠
%html
<p>As a mapping $U\subset\mathcal{M}\longrightarrow\mathbb{R} $, a scalar field acts on points, not on coordinates:</p>

︡677dcf33-06e0-440a-b71b-dbf1112e135e︡︡{"done":true,"html":"<p>As a mapping $U\\subset\\mathcal{M}\\longrightarrow\\mathbb{R} $, a scalar field acts on points, not on coordinates:</p>"}
︠991a6d36-57c4-47ca-ba6e-61be3f9c0e0ds︠
f(p)
︡b2c2dcc3-264c-41d8-be5e-456fd62c0255︡︡{"html":"<div>$4$</div>","done":false}︡{"done":true}
︠0326815d-ba4b-43c7-8e88-964bc3a1373ei︠
%html
<p>The expression of the scalar field in terms of the coordinates $(x,y,z)$:</p>

︡89f75986-d279-40f9-93ff-8ea7a090dfad︡︡{"done":true,"html":"<p>The expression of the scalar field in terms of the coordinates $(x,y,z)$:</p>"}
︠684b9bbd-16fd-4890-9d8b-6c41521a1f78s︠
f.display(X_U)
︡04e78a81-daee-4805-ae60-46fbc1aaa2ed︡︡{"html":"<div>$\\begin{array}{llcl} f:&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; z^{3} + y^{2} + x \\end{array}$</div>","done":false}︡{"done":true}
︠416c6e28-fc64-4dea-88ef-de64bbeec72bi︠
%html
<p>If the method <span style="font-family: courier new,courier;">display()</span> is used without any argument, it displays the coordinate expression of the scalar field in all the charts defined on the domain (except for <em>subcharts</em>, i.e. the restrictions of some chart to a subdomain):</p>

︡9b91bbcf-ad0d-44f3-b176-f91f41412a5a︡︡{"done":true,"html":"<p>If the method <span style=\"font-family: courier new,courier;\">display()</span> is used without any argument, it displays the coordinate expression of the scalar field in all the charts defined on the domain (except for <em>subcharts</em>, i.e. the restrictions of some chart to a subdomain):</p>"}
︠7c49be27-cf92-45a5-99b4-6f97401cd0e6s︠
f.display()
︡796e627d-7245-40d4-ac95-7c90e8b1d4cd︡︡{"html":"<div>$\\begin{array}{llcl} f:&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; z^{3} + y^{2} + x \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; r^{3} \\cos\\left({\\theta}\\right)^{3} + r^{2} \\sin\\left({\\phi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} + r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠3f5819cd-2edf-490b-baad-eed9e8c4be9di︠
%html
<p>Note that the expression of the scalar field in terms of the coordinates $(r,\theta,\phi)$ has not been provided by the user: it has been automatically computed via the change-of-coordinate formula declared above in the transition map. </p>

︡29fabc5b-0f93-4807-9241-6b6122cd61a7︡︡{"done":true,"html":"<p>Note that the expression of the scalar field in terms of the coordinates $(r,\\theta,\\phi)$ has not been provided by the user: it has been automatically computed via the change-of-coordinate formula declared above in the transition map. </p>"}
︠7365e7bf-d8dc-491f-8f42-42e95a64cc0cs︠
f.display(Y)
︡c65ff8a9-c2d6-49f0-a526-6ae9281ecc25︡︡{"html":"<div>$\\begin{array}{llcl} f:&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; r^{3} \\cos\\left({\\theta}\\right)^{3} + r^{2} \\sin\\left({\\phi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} + r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠35d9713d-dfb3-49a5-b44a-f1a2192796d7i︠
%html
<p>In each chart, the scalar field is represented by a function of the chart coordinates (an object of the type <span style="font-family: courier new,courier;">FunctionChart</span> described above), which is accessible via the method <span style="font-family: courier new,courier;">function_chart()</span>:</p>

︡65725614-563e-4840-9ce1-3cb03d9de69f︡︡{"done":true,"html":"<p>In each chart, the scalar field is represented by a function of the chart coordinates (an object of the type <span style=\"font-family: courier new,courier;\">FunctionChart</span> described above), which is accessible via the method <span style=\"font-family: courier new,courier;\">function_chart()</span>:</p>"}
︠e6256b98-c685-42fa-ad50-662578867819s︠
f.function_chart(X_U)
︡3fe9ab2e-591f-4d07-ad3d-bbef8017ca78︡︡{"html":"<div>$z^{3} + y^{2} + x$</div>","done":false}︡{"done":true}
︠5d8d9ea9-876a-4571-a147-c3ae44116a02s︠
f.function_chart(X_U).display()
︡eb75f741-194e-4785-9193-851e2376f345︡︡{"html":"<div>$\\left(x, y, z\\right) \\mapsto z^{3} + y^{2} + x$</div>","done":false}︡{"done":true}
︠2ba46486-1c3f-4b07-b2c0-bd5c29ef2c62s︠
f.function_chart(Y)
︡e1ce4f62-e924-4551-bce9-66cae5b7f4ef︡︡{"html":"<div>$r^{3} \\cos\\left({\\theta}\\right)^{3} + r^{2} \\sin\\left({\\phi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} + r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)$</div>","done":false}︡{"done":true}
︠b0f79934-fb18-4609-a34b-0bf02530c557s︠
f.function_chart(Y).display()
︡477b6e50-7b51-4780-9584-e1f91f74c394︡︡{"html":"<div>$\\left(r, {\\theta}, {\\phi}\\right) \\mapsto r^{3} \\cos\\left({\\theta}\\right)^{3} + r^{2} \\sin\\left({\\phi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} + r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)$</div>","done":false}︡{"done":true}
︠8089b057-e4ce-4702-a58f-311ac366ead0i︠
%html
<p>The "raw" symbolic expression is returned by the method <span style="font-family: courier new,courier;">expr()</span>:</p>

︡e363ccbb-6332-4a46-9b2f-f83669933f92︡︡{"done":true,"html":"<p>The \"raw\" symbolic expression is returned by the method <span style=\"font-family: courier new,courier;\">expr()</span>:</p>"}
︠ce986779-77f2-4dda-9ab6-5f6c57d13236s︠
f.expr(X_U)
︡28f2362c-18ee-4d85-bedd-8e956c34a7c3︡︡{"html":"<div>$z^{3} + y^{2} + x$</div>","done":false}︡{"done":true}
︠7745e2a6-bd9a-48a3-b5a3-af6f68685875s︠
f.expr(Y)
︡9c71ff45-f541-4fde-becb-ffae6c1cd8b9︡︡{"html":"<div>$r^{3} \\cos\\left({\\theta}\\right)^{3} + r^{2} \\sin\\left({\\phi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} + r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)$</div>","done":false}︡{"done":true}
︠a04b8f72-8c4e-4282-9fa8-7f37a6c415bfs︠
f.expr(Y) is f.function_chart(Y).expr()
︡de0a656e-c87f-4cf0-8d23-bb2ab3f42943︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠e26e30f1-cf57-4843-bac9-8b62084fb6abi︠
%html
<p>A scalar field can also be defined by some unspecified function of the coordinates:</p>

︡c7946a6a-13f2-4f4a-8cdb-85bc777984fc︡︡{"done":true,"html":"<p>A scalar field can also be defined by some unspecified function of the coordinates:</p>"}
︠f466129b-1972-4612-8898-a7058afdb9afs︠
h = U.scalar_field(function('H', x, y, z), name='h') ; print h
︡252e4e8b-7385-4c19-a74f-907b995c4477︡︡{"stdout":"scalar field 'h' on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠73c9bad5-8dbb-4f2f-ad42-53f6ffd62b40s︠
h.display()
︡96dcf13a-f3de-47e6-8961-f34818151638︡︡{"html":"<div>$\\begin{array}{llcl} h:&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; H\\left(x, y, z\\right) \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; H\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\cos\\left({\\theta}\\right)\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠03bd585b-7314-40e3-95ad-270495e6274es︠
h.display(Y)
︡2967b12b-e323-4bd1-b32c-3bbfca67abfe︡︡{"html":"<div>$\\begin{array}{llcl} h:&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; H\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\cos\\left({\\theta}\\right)\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠b0fbcd5a-0718-4f14-96f5-9b699757c7a4s︠
h(p) # remember that p is the point of coordinates (1,2,-1) in the chart X_U
︡08fe3098-3168-4c44-b337-aa294b2a12b2︡︡{"html":"<div>$H\\left(1, 2, -1\\right)$</div>","done":false}︡{"done":true}
︠1979512c-24d1-46d0-9a93-6fcf6cecc856i︠
%html
<p>The parent of $f$ is the set $C^\infty(U)$ of all smooth scalar fields on $U$, which is a commutative algebra over $\mathbb{R}$:</p>

︡6378e5b9-795d-4b9b-a1e3-818650a426a2︡︡{"done":true,"html":"<p>The parent of $f$ is the set $C^\\infty(U)$ of all smooth scalar fields on $U$, which is a commutative algebra over $\\mathbb{R}$:</p>"}
︠35d1ef9f-7f4a-4ee1-b5e3-001a15fa9d67s︠
CU = f.parent() ; CU
︡7560d918-b126-4916-83af-435384d12194︡︡{"html":"<div>$C^\\infty(U)$</div>","done":false}︡{"done":true}
︠5ef893b4-2727-4cae-81eb-8afc19269d2as︠
print CU
︡10f78361-ebe4-4d61-9c1c-ba96092d0203︡︡{"stdout":"algebra of scalar fields on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠670db276-63ed-4062-b300-e28ffef9e491s︠
CU.category()
︡75beebdf-025f-419f-8213-49e256e0d718︡︡{"html":"<div>$\\mathbf{CommutativeAlgebras}_{\\text{SR}}$</div>","done":false}︡{"done":true}
︠f218bee3-c527-4b6a-aa32-756775c55826i︠
%html
<div id="insert_new_cell_before91" class="insert_new_cell">&nbsp;</div>
<div id="cell_text_91" class="text_cell">
<p>The base ring of the algebra is the field $\mathbb{R}$, which is represented by Sage's Symbolic Ring (SR):</p>
</div>
<div id="insert_new_cell_before86" class="insert_new_cell">&nbsp;</div>

︡76a4358d-cb0b-4608-b051-709542f98960︡︡{"done":true,"html":"<div id=\"insert_new_cell_before91\" class=\"insert_new_cell\">&nbsp;</div>\n<div id=\"cell_text_91\" class=\"text_cell\">\n<p>The base ring of the algebra is the field $\\mathbb{R}$, which is represented by Sage's Symbolic Ring (SR):</p>\n</div>\n<div id=\"insert_new_cell_before86\" class=\"insert_new_cell\">&nbsp;</div>"}
︠af1a369d-ae2e-4c24-93ea-9fe6d7fc4dc7s︠
CU.base_ring()
︡685f790f-ef8c-42b4-bab7-3d794ca5a065︡︡{"html":"<div>$\\text{SR}$</div>","done":false}︡{"done":true}
︠482a2036-4650-4caa-913e-28b6d74f2fefi︠
%html
<p>Arithmetic operations on scalar fields are defined <span id="cell_outer_92"><span id="cell_outer_91"><span id="cell_outer_92">through the algebra structure:</span></span></span></p>

︡c61742fa-c198-4ca1-ae24-7b9aef2bc5fc︡︡{"done":true,"html":"<p>Arithmetic operations on scalar fields are defined <span id=\"cell_outer_92\"><span id=\"cell_outer_91\"><span id=\"cell_outer_92\">through the algebra structure:</span></span></span></p>"}
︠a94be8c6-1c05-435d-8771-0dbd73b7b114s︠
s = f + 2*h ; print s
︡50b3751d-50a7-4776-b54a-e62013686aac︡︡{"stdout":"scalar field on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠44a130ac-b203-4bb9-92de-c98f780b5e52s︠
s.display()
︡8c0b9a52-90d4-4887-8848-e76b6d134c07︡︡{"html":"<div>$\\begin{array}{llcl} &amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; z^{3} + y^{2} + x + 2 \\, H\\left(x, y, z\\right) \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; r^{3} \\cos\\left({\\theta}\\right)^{3} + r^{2} \\sin\\left({\\phi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} + r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) + 2 \\, H\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\cos\\left({\\theta}\\right)\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠8774a623-9421-4db8-b1b8-0654754e02aai︠
%html
<h2>Tangent spaces</h2>
<p>The tangent vector space to the manifold at point $p$ is obtained as follows:</p>

︡96b0f07e-b7b4-4937-ba13-066970aaab90︡︡{"done":true,"html":"<h2>Tangent spaces</h2>\n<p>The tangent vector space to the manifold at point $p$ is obtained as follows:</p>"}
︠e6e117f8-fb8c-4f85-938d-7f54800d131bs︠
Tp = p.tangent_space() ; Tp
︡588f4c69-16cf-46ad-b53d-80d14e3b3f0c︡︡{"html":"<div>$T_{p}\\,\\mathcal{M}$</div>","done":false}︡{"done":true}
︠614c2f8e-0298-41ab-adc7-262e19ab9f8ds︠
print Tp
︡e41170c4-0225-48c6-a92a-5ca2512d6f58︡︡{"stdout":"tangent space at point 'p' on 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠54a28be5-17f7-4716-91a2-78059706325di︠
%html
<p>$T_p\, \mathcal{M}$ is a 2-dimensional vector space over $\mathbb{R}$ (represented here by Sage Symbolic Ring (SR)) :</p>

︡51525781-9de6-48ee-98fc-b5ad8c97e911︡︡{"done":true,"html":"<p>$T_p\\, \\mathcal{M}$ is a 2-dimensional vector space over $\\mathbb{R}$ (represented here by Sage Symbolic Ring (SR)) :</p>"}
︠bdd11192-8232-4fcc-b818-240033c91b05s︠
Tp.category()
︡3a09b67f-d955-4412-ae82-44cb7b89512f︡︡{"html":"<div>$\\mathbf{VectorSpaces}_{\\text{SR}}$</div>","done":false}︡{"done":true}
︠88988395-f9f1-4557-bdfc-61174b81d5b3s︠
Tp.dim()
︡27478f0f-d897-4a33-810c-30f94093a785︡︡{"html":"<div>$3$</div>","done":false}︡{"done":true}
︠555553fc-bb6e-4e0b-850c-05823556922di︠
%html
<p>$T_p\, \mathcal{M}$ is automatically endowed with vector bases deduced from the vector frames defined around the point:</p>

︡66ce2299-7f92-4c5f-a8b4-0359691d687b︡︡{"done":true,"html":"<p>$T_p\\, \\mathcal{M}$ is automatically endowed with vector bases deduced from the vector frames defined around the point:</p>"}
︠2f94d774-6c18-4edc-a2f4-4cfd6b87ac17s︠
Tp.bases()
︡039c3cef-1d1f-4fde-a729-789343eb89f1︡︡{"html":"<div>[$\\left(\\frac{\\partial}{\\partial x },\\frac{\\partial}{\\partial y },\\frac{\\partial}{\\partial z }\\right)$, $\\left(\\frac{\\partial}{\\partial r },\\frac{\\partial}{\\partial {\\theta} },\\frac{\\partial}{\\partial {\\phi} }\\right)$]</div>","done":false}︡{"done":true}
︠7b4a58e8-26b5-4128-9482-b9427ff42feai︠
%html
<p>For the tangent space at the point $q$, on the contrary, there is only one pre-defined basis, since $q$ is not in the domain $U$ of the frame associated with coordinates $(r,\theta,\phi)$:</p>

︡cced461d-9c77-40b1-91c6-b04e531f635c︡︡{"done":true,"html":"<p>For the tangent space at the point $q$, on the contrary, there is only one pre-defined basis, since $q$ is not in the domain $U$ of the frame associated with coordinates $(r,\\theta,\\phi)$:</p>"}
︠74226716-bb76-47d5-bdfa-34d48bec0c44s︠
Tq = q.tangent_space()
Tq.bases()
︡9f2b3063-1be5-4476-9ea8-50f5f846191f︡︡{"html":"<div>[$\\left(\\frac{\\partial}{\\partial x },\\frac{\\partial}{\\partial y },\\frac{\\partial}{\\partial z }\\right)$]</div>","done":false}︡{"done":true}
︠c7170eed-2c9a-4939-a18c-d582707c1517i︠
%html
<p>A random element:</p>

︡bd6e8b16-9769-4f57-912f-6c411ba4ef25︡︡{"done":true,"html":"<p>A random element:</p>"}
︠40521dc4-d9a1-4ede-aada-a4a6c3f7ba35s︠
v = Tp.an_element() ; print v
︡06460d49-c652-4138-89c5-79774c75e4e7︡︡{"stdout":"tangent vector at point 'p' on 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠ef5202fe-7cb3-4545-920a-9959e7c6474fs︠
v.display()
︡b6176b63-4738-44ac-89b1-2b26cac65166︡︡{"html":"<div>$\\frac{\\partial}{\\partial x } + 2 \\frac{\\partial}{\\partial y } + 3 \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"done":true}
︠5970545f-5eec-40d6-bcc1-ee42a7fde542s︠
u = Tq.an_element() ; print u
︡13aecc1e-8d53-4618-9d27-557ca351bc4c︡︡{"stdout":"tangent vector at point 'q' on 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠9c653220-8dee-4491-ba8d-83e3f06e34e4s︠
u.display()
︡a4edda8b-2557-4feb-811b-0583c9615bff︡︡{"html":"<div>$\\frac{\\partial}{\\partial x } + 2 \\frac{\\partial}{\\partial y } + 3 \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"done":true}
︠0e5b85d7-5a0e-4a84-b2f6-5fd3566c750ai︠
%html
<p>Note that, despite what the above simplified writing may suggest (the mention of the point $p$ or $q$ is omitted in the basis vectors), $u$ and $v$ are different vectors, for they belong to different vector spaces:</p>

︡0b7e9c89-94e4-41e9-b9d8-e2d0f59cb0c0︡︡{"done":true,"html":"<p>Note that, despite what the above simplified writing may suggest (the mention of the point $p$ or $q$ is omitted in the basis vectors), $u$ and $v$ are different vectors, for they belong to different vector spaces:</p>"}
︠9c3db090-a91e-49fe-a06d-f18b80b7652ds︠
v.parent()
︡47a401aa-ca07-43b9-aa21-297d01c489fd︡︡{"html":"<div>$T_{p}\\,\\mathcal{M}$</div>","done":false}︡{"done":true}
︠51ce87bf-bc53-4f4b-b9cc-5c15254556c9s︠
u.parent()
︡8340f741-22a1-4233-9a4e-ca6cb6c3f433︡︡{"html":"<div>$T_{q}\\,\\mathcal{M}$</div>","done":false}︡{"done":true}
︠c4a0351b-d773-4d0d-877e-81118986e458i︠
%html
<p>In particular, it is not possible to add $u$ and $v$:</p>

︡732a978e-157c-4b33-aa25-d8b47709373a︡︡{"done":true,"html":"<p>In particular, it is not possible to add $u$ and $v$:</p>"}
︠f350ee40-04e8-41fd-bd34-c6fba642a948s︠
s = u + v
︡bc0b96ae-aaba-48ae-af48-bca4a7b170aa︡︡{"done":false,"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"sage/structure/element.pyx\", line 1365, in sage.structure.element.ModuleElement.__add__ (/projects/sage/sage-6.9/src/build/cythonized/sage/structure/element.c:11960)\n    return coercion_model.bin_op(left, right, add)\n  File \"sage/structure/coerce.pyx\", line 1070, in sage.structure.coerce.CoercionModel_cache_maps.bin_op (/projects/sage/sage-6.9/src/build/cythonized/sage/structure/coerce.c:9739)\n    raise TypeError(arith_error_message(x,y,op))\nTypeError: unsupported operand parent(s) for '+': 'tangent space at point 'q' on 3-dimensional manifold 'M'' and 'tangent space at point 'p' on 3-dimensional manifold 'M''\n"}︡{"done":true}
︠1e7fcc07-0ce9-4ae9-b327-9c1fa159d092i︠
%html
<h2>Vector Fields</h2>
<p>Each chart defines a vector frame on the chart domain: the so-called <strong>coordinate basis</strong>:</p>

︡78d40f80-348b-415f-b2e7-fc90a8f7bf5a︡︡{"done":true,"html":"<h2>Vector Fields</h2>\n<p>Each chart defines a vector frame on the chart domain: the so-called <strong>coordinate basis</strong>:</p>"}
︠1f18223f-3a9a-4db4-8607-d5945dd020des︠
X.frame()
︡c2973171-8821-47f1-9873-e30947390931︡︡{"html":"<div>$\\left(\\mathcal{M} ,\\left(\\frac{\\partial}{\\partial x },\\frac{\\partial}{\\partial y },\\frac{\\partial}{\\partial z }\\right)\\right)$</div>","done":false}︡{"done":true}
︠64295d63-ac53-4605-83a4-c1ab971ddb92s︠
X.frame().domain()  # this frame is defined on the whole manifold
︡eadf2c12-d3a9-4fb9-9e65-419e512fb19b︡︡{"html":"<div>$\\mathcal{M}$</div>","done":false}︡{"done":true}
︠cf9f35ee-8c91-49cd-9a36-a0cd5f6e4198s︠
Y.frame()
︡c89e033b-e9e0-42d3-8235-468cf1fa8d9a︡︡{"html":"<div>$\\left(U ,\\left(\\frac{\\partial}{\\partial r },\\frac{\\partial}{\\partial {\\theta} },\\frac{\\partial}{\\partial {\\phi} }\\right)\\right)$</div>","done":false}︡{"done":true}
︠75cae9e4-e98e-4c38-827d-4a3c2fb26671s︠
Y.frame().domain() # this frame is defined only on U
︡d3bfdfb3-f929-4c59-b03f-3e68e8375730︡︡{"html":"<div>$U$</div>","done":false}︡{"done":true}
︠b583bd34-169a-4742-a90f-e05b74c2c69ci︠
%html
<p>The list of frames defined on a given open subset is <span>returned by the method <span style="font-family: courier new,courier;">frames()</span></span>:</p>

︡33968ee2-1d7e-46c8-8086-44c452950a58︡︡{"done":true,"html":"<p>The list of frames defined on a given open subset is <span>returned by the method <span style=\"font-family: courier new,courier;\">frames()</span></span>:</p>"}
︠1059d39b-9aa9-4c67-8d34-73bfe3ac1e79s︠
M.frames()
︡43d12752-a96b-425a-9005-ec37e0875b64︡︡{"html":"<div>[$\\left(\\mathcal{M} ,\\left(\\frac{\\partial}{\\partial x },\\frac{\\partial}{\\partial y },\\frac{\\partial}{\\partial z }\\right)\\right)$, $\\left(U ,\\left(\\frac{\\partial}{\\partial x },\\frac{\\partial}{\\partial y },\\frac{\\partial}{\\partial z }\\right)\\right)$, $\\left(U ,\\left(\\frac{\\partial}{\\partial r },\\frac{\\partial}{\\partial {\\theta} },\\frac{\\partial}{\\partial {\\phi} }\\right)\\right)$]</div>","done":false}︡{"done":true}
︠92857ef5-0c62-43ba-9b67-3550dc723031s︠
U.frames()
︡8e3297bb-e156-4256-80db-25d124d9927a︡︡{"html":"<div>[$\\left(U ,\\left(\\frac{\\partial}{\\partial x },\\frac{\\partial}{\\partial y },\\frac{\\partial}{\\partial z }\\right)\\right)$, $\\left(U ,\\left(\\frac{\\partial}{\\partial r },\\frac{\\partial}{\\partial {\\theta} },\\frac{\\partial}{\\partial {\\phi} }\\right)\\right)$]</div>","done":false}︡{"done":true}
︠6a18f3c6-f620-47c2-abcb-b7c0e3628aads︠
M.default_frame()
︡7e8d4d5c-d80f-4953-8e84-7866759b98aa︡︡{"html":"<div>$\\left(\\mathcal{M} ,\\left(\\frac{\\partial}{\\partial x },\\frac{\\partial}{\\partial y },\\frac{\\partial}{\\partial z }\\right)\\right)$</div>","done":false}︡{"done":true}
︠259dd043-388f-442a-8bb9-b45b4aae591ci︠
%html
<p>Unless otherwise specified (via the command <span style="font-family: courier new,courier;">set_default_frame()</span>), the default frame is that associated with the default chart:</p>

︡f7fd3a82-f24f-4c29-8cde-d082b077383b︡︡{"done":true,"html":"<p>Unless otherwise specified (via the command <span style=\"font-family: courier new,courier;\">set_default_frame()</span>), the default frame is that associated with the default chart:</p>"}
︠3829147c-c075-4ffe-a4cd-f62c01aabe84s︠
M.default_frame() is M.default_chart().frame()
︡b5a54154-31d1-49fd-b505-e362beef8d01︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠5d9f9b41-c3ba-4e7f-894c-042ed52105c0s︠
U.default_frame() is U.default_chart().frame()
︡42ff1323-93b1-4990-bd2e-56c91adbda4c︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠543331b4-07ab-4aa6-aaa9-afaa1b30d6f1i︠
%html
<p>Individual elements of a frame can be accessed by means of their indices:</p>

︡06441bdf-cabe-481a-ab7e-ede791c18291︡︡{"done":true,"html":"<p>Individual elements of a frame can be accessed by means of their indices:</p>"}
︠e4a28517-138a-4794-8db7-c2e62bebaa4bs︠
e = U.default_frame() ; e2 = e[2] ; e2
︡f2df27ec-777f-4314-ad52-2265029dbd07︡︡{"html":"<div>$\\frac{\\partial}{\\partial y }$</div>","done":false}︡{"done":true}
︠d017ce3b-c5bd-4f22-b136-1a5b292a58f9s︠
print e2
︡33246907-b10a-47b1-b208-1a16e7dda520︡︡{"stdout":"vector field 'd/dy' on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠1f449e40-265e-46b9-a3c3-97f898b12c95i︠
%html
<p><span id="cell_outer_109">We may define a new vector field as follows:</span></p>

︡6a86a239-a9d3-43df-804e-98712a5065dd︡︡{"done":true,"html":"<p><span id=\"cell_outer_109\">We may define a new vector field as follows:</span></p>"}
︠4f999c8d-998b-4506-b193-4d13b3bcbd08s︠
v = e[2] + 2*x*e[3] ; print v
︡ba61b0fc-b055-4f1e-a9b9-767050484814︡︡{"stdout":"vector field on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠29d26594-ef19-41ee-8a57-243036526eads︠
v.display()
︡66e55e10-6983-4c12-af8b-51d0f1e2dfeb︡︡{"html":"<div>$\\frac{\\partial}{\\partial y } + 2 \\, x \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"done":true}
︠6dab9375-fd19-4320-be22-ac40f1680b0ei︠
%html
<p>A vector field can be defined by its components with respect to a given vector frame. When the latter is not specified, the open set's default frame is of course assumed:</p>

︡f79548a9-8b47-4cf1-b657-3ee5bbdcad92︡︡{"done":true,"html":"<p>A vector field can be defined by its components with respect to a given vector frame. When the latter is not specified, the open set's default frame is of course assumed:</p>"}
︠49f874cd-a6a5-4832-80a8-1ca1f9b71542s︠
v = U.vector_field(name='v') # vector field defined on the open set U
v[1] = 1+y
v[2] = -x
v[3] = x*y*z
v.display()
︡a9b8892a-a2f8-4522-b55f-8f025f17fbd0︡︡{"html":"<div>$v = \\left( y + 1 \\right) \\frac{\\partial}{\\partial x } -x \\frac{\\partial}{\\partial y } + x y z \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"done":true}
︠24d2331d-4f5a-4326-bfc0-8f55c451d2f3i︠
%html
<p>Vector fields on $U$ are Sage <em>element</em> objects, whose <em>parent</em> is the set $\mathcal{X}(U)$ of vector fields defined on $U$:</p>

︡6d743779-6cfa-44e1-a5fa-2c9df191ecf9︡︡{"done":true,"html":"<p>Vector fields on $U$ are Sage <em>element</em> objects, whose <em>parent</em> is the set $\\mathcal{X}(U)$ of vector fields defined on $U$:</p>"}
︠76044b89-7499-400f-8e04-71705eb86c70s︠
v.parent()
︡7f31be47-5f80-4bc4-a333-c9ea41967482︡︡{"html":"<div>$\\mathcal{X}\\left(U\\right)$</div>","done":false}︡{"done":true}
︠df3118c6-8a8e-4f13-bb80-b7ca21943c31i︠
%html
<p>The set $\mathcal{X}(U)$ is a module over the commutative algebra $C^\infty(U)$ of scalar fields on $U$:</p>

︡2bb4455d-aa1b-4844-b80d-af07f028a093︡︡{"done":true,"html":"<p>The set $\\mathcal{X}(U)$ is a module over the commutative algebra $C^\\infty(U)$ of scalar fields on $U$:</p>"}
︠7296404e-eab1-4604-9459-a32f207bd60ds︠
print v.parent()
︡72cfd650-3b69-4c9e-9627-84ac2d9c1d0b︡︡{"stdout":"free module X(U) of vector fields on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠60b32e80-130d-4e6c-b412-a582305a9965s︠
print v.parent().category()
︡87e147e3-da7d-43e9-ae4a-856e99449ff3︡︡{"stdout":"Category of modules over algebra of scalar fields on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠38fa55c6-fd1a-4d0c-877d-0f7cdc8e5f68s︠
v.parent().base_ring()
︡8575ac63-dfcb-4b62-a68d-e50c8cac29aa︡︡{"html":"<div>$C^\\infty(U)$</div>","done":false}︡{"done":true}
︠5b7d08b6-b8f3-4e98-b769-74b77d80eaafi︠
%html
<p>A vector field acts on scalar fields:</p>

︡e73d49da-a371-4098-abe8-2a4768291e69︡︡{"done":true,"html":"<p>A vector field acts on scalar fields:</p>"}
︠7db8af20-e34e-4a70-93f3-3e0f4e4eb379s︠
f.display()
︡80be631f-820f-4c7b-814e-7991b3afa529︡︡{"html":"<div>$\\begin{array}{llcl} f:&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; z^{3} + y^{2} + x \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; r^{3} \\cos\\left({\\theta}\\right)^{3} + r^{2} \\sin\\left({\\phi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} + r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠8e3b0cb8-fc63-469e-b865-a984032a4d7fs︠
s = v(f) ; print s
︡fa15a628-2806-4959-8f78-f6c66f6fb0eb︡︡{"stdout":"scalar field 'v(f)' on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠862bd1eb-d6e2-41ec-a931-a9e550735f81s︠
s.display()
︡485b1881-3244-46ea-8955-7de7b424427f︡︡{"html":"<div>$\\begin{array}{llcl} v\\left(f\\right):&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; 3 \\, x y z^{3} - {\\left(2 \\, x - 1\\right)} y + 1 \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; -3 \\, r^{5} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{5} \\sin\\left({\\phi}\\right) + 3 \\, r^{5} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{3} \\sin\\left({\\phi}\\right) - 2 \\, r^{2} \\cos\\left({\\phi}\\right) \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{2} + r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) + 1 \\end{array}$</div>","done":false}︡{"done":true}
︠75400b00-e768-4bc6-9004-c7cfeab466d8s︠
e[3].display()
︡0b415a3b-5d4e-4e24-8b09-964a6a722200︡︡{"html":"<div>$\\frac{\\partial}{\\partial z } = \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"done":true}
︠42a33194-fe4b-494e-8a5f-88838aa5f741s︠
e[3](f).display()
︡db19f3e6-fc50-4e85-8456-e3a7e6593366︡︡{"html":"<div>$\\begin{array}{llcl} \\frac{\\partial}{\\partial z } \\left( f \\right) : &amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; 3 \\, z^{2} \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; 3 \\, r^{2} \\cos\\left({\\theta}\\right)^{2} \\end{array}$</div>","done":false}︡{"done":true}
︠b78cf6da-d243-43f5-b85d-492d316bac80i︠
%html
<p>Unset components are assumed to be zero:</p>

︡6a23a9e1-744b-4ab1-bf38-481ae18753f2︡︡{"done":true,"html":"<p>Unset components are assumed to be zero:</p>"}
︠c7fb6ac5-eed1-499d-8b0c-afbe6eefe339s︠
w = U.vector_field(name='w')
w[2] = 3
w.display()
︡fad5e45b-b4ef-43e2-be22-c9cbd2279233︡︡{"html":"<div>$w = 3 \\frac{\\partial}{\\partial y }$</div>","done":false}︡{"done":true}
︠0e87a384-b8fa-4ec3-804d-60fe66d3037fi︠
%html
<p>A vector field on $U$ can be expanded in the vector frame associated with the chart $(r,\theta,\phi)$:</p>

︡04f60ab8-ecf2-4734-8685-f6ba0dd9ec16︡︡{"done":true,"html":"<p>A vector field on $U$ can be expanded in the vector frame associated with the chart $(r,\\theta,\\phi)$:</p>"}
︠603e8358-f481-4449-b9be-69261dcb6489s︠
v.display(Y.frame())
︡b3ea5aa3-5a29-4478-be11-4ab1bf3bd7d3︡︡{"html":"<div>$v = \\left( \\frac{x y z^{2} + x}{\\sqrt{x^{2} + y^{2} + z^{2}}} \\right) \\frac{\\partial}{\\partial r } + \\left( -\\frac{{\\left(x^{3} y + x y^{3} - x\\right)} \\sqrt{x^{2} + y^{2}} z}{x^{4} + 2 \\, x^{2} y^{2} + y^{4} + {\\left(x^{2} + y^{2}\\right)} z^{2}} \\right) \\frac{\\partial}{\\partial {\\theta} } + \\left( -\\frac{x^{2} + y^{2} + y}{x^{2} + y^{2}} \\right) \\frac{\\partial}{\\partial {\\phi} }$</div>","done":false}︡{"done":true}
︠1d42e10c-bc27-4d31-ab78-7a2be852992di︠
%html
<p>By default, the components are expressed in terms of the default coordinates $(x,y,z)$. To express them in terms of the coordinates $(r,\theta,\phi)$, one should add the corresponding chart as the second argument of the method <span style="font-family: courier new,courier;">display()</span>:</p>

︡1a49e0b5-14e9-4b62-ab88-905f0ed19916︡︡{"done":true,"html":"<p>By default, the components are expressed in terms of the default coordinates $(x,y,z)$. To express them in terms of the coordinates $(r,\\theta,\\phi)$, one should add the corresponding chart as the second argument of the method <span style=\"font-family: courier new,courier;\">display()</span>:</p>"}
︠1cebadaa-e7cb-4b9e-8534-94be5bcf55a6s︠
v.display(Y.frame(), Y)
︡cd733111-bca3-4273-a94f-e33cec64c9b9︡︡{"html":"<div>$v = \\left( r^{3} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{2} + \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\right) \\frac{\\partial}{\\partial r } + \\left( -\\frac{r^{3} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{3} - \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)}{r} \\right) \\frac{\\partial}{\\partial {\\theta} } + \\left( -\\frac{r \\sin\\left({\\theta}\\right) + \\sin\\left({\\phi}\\right)}{r \\sin\\left({\\theta}\\right)} \\right) \\frac{\\partial}{\\partial {\\phi} }$</div>","done":false}︡{"done":true}
︠087ba1c5-5d46-426f-97aa-48209da30ef9s︠
for i in M.irange(): e[i].display(Y.frame(), Y)
︡bde372a0-4032-4bc5-b235-c0f138e886a7︡︡{"html":"<div>$\\frac{\\partial}{\\partial x } = \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\frac{\\partial}{\\partial r } + \\frac{\\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)}{r} \\frac{\\partial}{\\partial {\\theta} } -\\frac{\\sin\\left({\\phi}\\right)}{r \\sin\\left({\\theta}\\right)} \\frac{\\partial}{\\partial {\\phi} }$</div>","done":false}︡{"html":"<div>$\\frac{\\partial}{\\partial y } = \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\frac{\\partial}{\\partial r } + \\frac{\\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right)}{r} \\frac{\\partial}{\\partial {\\theta} } + \\frac{\\cos\\left({\\phi}\\right)}{r \\sin\\left({\\theta}\\right)} \\frac{\\partial}{\\partial {\\phi} }$</div>","done":false}︡{"html":"<div>$\\frac{\\partial}{\\partial z } = \\cos\\left({\\theta}\\right) \\frac{\\partial}{\\partial r } -\\frac{\\sin\\left({\\theta}\\right)}{r} \\frac{\\partial}{\\partial {\\theta} }$</div>","done":false}︡{"done":true}
︠947b29f9-fb65-42df-b352-d98097d5350di︠
%html
<p>The components of a tensor field w.r.t. the default frame can also be obtained as a list, via the command <span style="font-family: courier new,courier;">[:]</span>:</p>

︡b0ec1a23-51ad-4194-952c-c64ff5c72e9d︡︡{"done":true,"html":"<p>The components of a tensor field w.r.t. the default frame can also be obtained as a list, via the command <span style=\"font-family: courier new,courier;\">[:]</span>:</p>"}
︠e8f59a30-fd36-493f-aadd-81e0dbebb484s︠
v[:]
︡4448efe1-24ad-44bb-b6a5-fc440bb7c8b3︡︡{"html":"<div>[$y + 1$, $-x$, $x y z$]</div>","done":false}︡{"done":true}
︠0f700fe9-2682-4d6e-8af3-7b32a75a23a7i︠
%html
<p>An alternative is to use the method <span style="font-family: courier new,courier;">display_comp()</span>:</p>

︡24d093a2-5cf4-41d8-9d27-7211b055d837︡︡{"done":true,"html":"<p>An alternative is to use the method <span style=\"font-family: courier new,courier;\">display_comp()</span>:</p>"}
︠dd1d6940-3510-4ae0-abc9-1164d122389ds︠
v.display_comp()
︡cc6fcdd8-8452-4a4d-b4cf-3d9f04711a86︡︡{"html":"<div>$\\begin{array}{lcl} v_{ \\phantom{\\, x } }^{ \\, x } &amp; = &amp; y + 1 \\\\ v_{ \\phantom{\\, y } }^{ \\, y } &amp; = &amp; -x \\\\ v_{ \\phantom{\\, z } }^{ \\, z } &amp; = &amp; x y z \\end{array}$</div>","done":false}︡{"done":true}
︠ca423d22-3ffe-4964-9dd8-baa1284add07i︠
%html
<p>To obtain the components w.r.t. to another frame, one may go through the method <span style="font-family: courier new,courier;">comp()</span> and specify the frame:</p>

︡a8b2dd4a-b437-46a6-923b-7611e5f6394a︡︡{"done":true,"html":"<p>To obtain the components w.r.t. to another frame, one may go through the method <span style=\"font-family: courier new,courier;\">comp()</span> and specify the frame:</p>"}
︠0dd59daf-ce78-4946-a631-df5053bad785s︠
v.comp(Y.frame())[:]
︡5ecd8365-a172-481d-9722-59dd816714f3︡︡{"html":"<div>[$\\frac{x y z^{2} + x}{\\sqrt{x^{2} + y^{2} + z^{2}}}$, $-\\frac{{\\left(x^{3} y + x y^{3} - x\\right)} \\sqrt{x^{2} + y^{2}} z}{x^{4} + 2 \\, x^{2} y^{2} + y^{4} + {\\left(x^{2} + y^{2}\\right)} z^{2}}$, $-\\frac{x^{2} + y^{2} + y}{x^{2} + y^{2}}$]</div>","done":false}︡{"done":true}
︠ada7a8ae-2d74-491f-ad52-c0a872f64bd7i︠
%html
<p>However a shortcut is to provide the frame as the first argument of the square brackets:</p>

︡24cf2a82-a082-4c04-af8b-b387e70e9372︡︡{"done":true,"html":"<p>However a shortcut is to provide the frame as the first argument of the square brackets:</p>"}
︠d2a317fe-ee6d-43ef-916f-34c7276a9973s︠
v[Y.frame(), :]
︡ab4e9d56-0edf-49b7-b9ba-2f203d863f86︡︡{"html":"<div>[$\\frac{x y z^{2} + x}{\\sqrt{x^{2} + y^{2} + z^{2}}}$, $-\\frac{{\\left(x^{3} y + x y^{3} - x\\right)} \\sqrt{x^{2} + y^{2}} z}{x^{4} + 2 \\, x^{2} y^{2} + y^{4} + {\\left(x^{2} + y^{2}\\right)} z^{2}}$, $-\\frac{x^{2} + y^{2} + y}{x^{2} + y^{2}}$]</div>","done":false}︡{"done":true}
︠66bb2dc4-6231-4d55-b899-919f782ffdb8s︠
v.display_comp(Y.frame())
︡bbd9ab8b-33e2-4e24-85f5-35231692adc2︡︡{"html":"<div>$\\begin{array}{lcl} v_{ \\phantom{\\, r } }^{ \\, r } &amp; = &amp; \\frac{x y z^{2} + x}{\\sqrt{x^{2} + y^{2} + z^{2}}} \\\\ v_{ \\phantom{\\, {\\theta} } }^{ \\, {\\theta} } &amp; = &amp; -\\frac{{\\left(x^{3} y + x y^{3} - x\\right)} \\sqrt{x^{2} + y^{2}} z}{x^{4} + 2 \\, x^{2} y^{2} + y^{4} + {\\left(x^{2} + y^{2}\\right)} z^{2}} \\\\ v_{ \\phantom{\\, {\\phi} } }^{ \\, {\\phi} } &amp; = &amp; -\\frac{x^{2} + y^{2} + y}{x^{2} + y^{2}} \\end{array}$</div>","done":false}︡{"done":true}
︠0baca25b-89d1-4062-8a85-d4b50b05fbdbi︠
%html
<p>Components are shown expressed in terms of the default's coordinates; to get them in terms of the coordinates $(r,\theta,\phi)$ instead, add the chart name as the last argument in the square brackets:</p>

︡fd277014-709c-4bec-a135-0944590e586d︡︡{"done":true,"html":"<p>Components are shown expressed in terms of the default's coordinates; to get them in terms of the coordinates $(r,\\theta,\\phi)$ instead, add the chart name as the last argument in the square brackets:</p>"}
︠ce774e5d-04c6-41e1-95c1-5c6e0470f647s︠
v[Y.frame(), :, Y]
︡aadaf102-874b-446a-af86-741e5dd59f77︡︡{"html":"<div>[$r^{3} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{2} + \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)$, $-\\frac{r^{3} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{3} - \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)}{r}$, $-\\frac{r \\sin\\left({\\theta}\\right) + \\sin\\left({\\phi}\\right)}{r \\sin\\left({\\theta}\\right)}$]</div>","done":false}︡{"done":true}
︠41c42662-b01d-480d-a725-45b3bfbbb665i︠
%html
<p>or specify the chart in <span style="font-family: courier new,courier;">display_comp()</span>:<span style="font-family: courier new,courier;"><br /></span></p>

︡ba5b02b6-2840-45da-a311-5f5f17f3e028︡︡{"done":true,"html":"<p>or specify the chart in <span style=\"font-family: courier new,courier;\">display_comp()</span>:<span style=\"font-family: courier new,courier;\"><br /></span></p>"}
︠c0eb8d36-208c-4f06-b0e8-0b3f64dd2b1cs︠
v.display_comp(Y.frame(), chart=Y)
︡f677cdfe-c986-4d39-9d04-3c7dbd25480b︡︡{"html":"<div>$\\begin{array}{lcl} v_{ \\phantom{\\, r } }^{ \\, r } &amp; = &amp; r^{3} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{2} + \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\\\ v_{ \\phantom{\\, {\\theta} } }^{ \\, {\\theta} } &amp; = &amp; -\\frac{r^{3} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{3} - \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)}{r} \\\\ v_{ \\phantom{\\, {\\phi} } }^{ \\, {\\phi} } &amp; = &amp; -\\frac{r \\sin\\left({\\theta}\\right) + \\sin\\left({\\phi}\\right)}{r \\sin\\left({\\theta}\\right)} \\end{array}$</div>","done":false}︡{"done":true}
︠049d3d05-215a-4e6c-a2fd-ba83499bcaa6i︠
%html
<p>To get some components of a vector as a scalar field, instead of a coordinate expression, use double square brackets:</p>

︡dff5a2f8-3805-4b40-b1b4-6f886de263a5︡︡{"done":true,"html":"<p>To get some components of a vector as a scalar field, instead of a coordinate expression, use double square brackets:</p>"}
︠cffc2620-80e7-4fed-9269-6218fb93baf4s︠
print v[[1]]
︡5f286bcf-ef1b-4be9-97af-3a323112726b︡︡{"stdout":"scalar field on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠c41da077-3f28-4c42-80a6-ab3b2c124accs︠
v[[1]].display()
︡1c65a74f-9cbf-4d4f-b3ed-f4b29858f590︡︡{"html":"<div>$\\begin{array}{llcl} &amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; y + 1 \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) + 1 \\end{array}$</div>","done":false}︡{"done":true}
︠73040b65-cbeb-4619-a442-1367e3593f8ds︠
v[[1]].expr(X_U)
︡343f93bf-5965-4771-aa83-0e462eacb86f︡︡{"html":"<div>$y + 1$</div>","done":false}︡{"done":true}
︠e4acc7e9-f4d9-415c-ab92-9beaaee5d85fi︠
%html
<p>A vector field can be defined with components being unspecified functions of the coordinates:</p>

︡c5e71eed-5da0-4b71-86c6-96c22d742bb6︡︡{"done":true,"html":"<p>A vector field can be defined with components being unspecified functions of the coordinates:</p>"}
︠ff2c2093-f5f3-4a4b-9403-9a2fbc07aff8s︠
u = U.vector_field(name='u')
u[:] = [function('u_x', x,y,z), function('u_y', x,y,z), function('u_z', x,y,z)]
u.display()
︡fcee5829-85e4-4b28-a02a-3bb0076d90ac︡︡{"html":"<div>$u = u_{x}\\left(x, y, z\\right) \\frac{\\partial}{\\partial x } + u_{y}\\left(x, y, z\\right) \\frac{\\partial}{\\partial y } + u_{z}\\left(x, y, z\\right) \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"done":true}
︠d0c48789-4125-4a88-9281-3a741bd708e3s︠
s = v + u ; s.set_name('s') ; s.display()
︡ed659a93-d8bc-4cbe-a097-f44fa2cae409︡︡{"html":"<div>$s = \\left( y + u_{x}\\left(x, y, z\\right) + 1 \\right) \\frac{\\partial}{\\partial x } + \\left( -x + u_{y}\\left(x, y, z\\right) \\right) \\frac{\\partial}{\\partial y } + \\left( x y z + u_{z}\\left(x, y, z\\right) \\right) \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"done":true}
︠27e7c708-07da-4aa6-88f6-5dd5d5cbe473i︠
%html
<h3>Values of vector fields at a given point</h3>
<p>The value of a vector field at some point of the manifold is obtained via the method <span style="font-family: courier new,courier;">at()</span>:</p>

︡7dc3ad3c-e659-429f-b3cc-96902f3cfc43︡︡{"done":true,"html":"<h3>Values of vector fields at a given point</h3>\n<p>The value of a vector field at some point of the manifold is obtained via the method <span style=\"font-family: courier new,courier;\">at()</span>:</p>"}
︠cf00880a-18c5-4a7c-b3df-b62a67110d36s︠
vp = v.at(p) ; print vp
︡db8af25f-118b-4a64-b2e3-19727c988194︡︡{"stdout":"tangent vector v at point 'p' on 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠41a0c19b-4e37-4e64-b9b6-8a431fffe22ds︠
vp.display()
︡579817b8-6736-45fe-8a43-008be6f84dd4︡︡{"html":"<div>$v = 3 \\frac{\\partial}{\\partial x } -\\frac{\\partial}{\\partial y } -2 \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"done":true}
︠5b275223-ad3e-4558-8c0d-09b02a864f0ei︠
%html
<p>Indeed, recall that, w.r.t. chart X_U=$(x,y,z)$,&nbsp; the coordinates of the point $p$ and the components of the vector field $v$ are</p>

︡70c1dacd-50ef-4e26-9505-ff34c70bbc2b︡︡{"done":true,"html":"<p>Indeed, recall that, w.r.t. chart X_U=$(x,y,z)$,&nbsp; the coordinates of the point $p$ and the components of the vector field $v$ are</p>"}
︠4199a7ee-bb74-40d6-865b-be86b63e35e8s︠
p.coord(X_U)
︡673df1cd-c8e4-47f9-aa07-66270faf01b5︡︡{"html":"<div>($1$, $2$, $-1$)</div>","done":false}︡{"done":true}
︠23ffd14b-b646-462b-978b-5396897e121ds︠
v.display(X_U.frame(), X_U)
︡262e9261-d75f-47d4-84fc-08a17bd32317︡︡{"html":"<div>$v = \\left( y + 1 \\right) \\frac{\\partial}{\\partial x } -x \\frac{\\partial}{\\partial y } + x y z \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"done":true}
︠2ea3afba-4a1d-4802-b056-4fd66ba3910ei︠
%html
<p>Note that to simplify the writing, the symbol used to denote the value of the vector field at point $p$ is the same as that of the vector field itself (namely $v$); this can be changed by the method <span style="font-family: courier new,courier;">set_name()</span>:</p>

︡d7da94ac-333e-4dc5-b305-25ad242f0b7f︡︡{"done":true,"html":"<p>Note that to simplify the writing, the symbol used to denote the value of the vector field at point $p$ is the same as that of the vector field itself (namely $v$); this can be changed by the method <span style=\"font-family: courier new,courier;\">set_name()</span>:</p>"}
︠6b67d147-0a22-4dba-974f-dc95d48c1d83s︠
vp.set_name(latex_name='v|_p')
vp.display()
︡8299155c-e2d0-4464-8363-86a304949748︡︡{"html":"<div>$v|_p = 3 \\frac{\\partial}{\\partial x } -\\frac{\\partial}{\\partial y } -2 \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"done":true}
︠41edccb9-e197-4186-8346-a3aed615d461i︠
%html
<p>Of course, $v|_p$ belongs to the tangent space at $p$:</p>

︡59c1d9d1-ced3-46a2-8051-cfa1456280d1︡︡{"done":true,"html":"<p>Of course, $v|_p$ belongs to the tangent space at $p$:</p>"}
︠d3c5188a-2502-4068-a493-62bfce21e19fs︠
vp.parent()
︡feae02b0-0182-4cf0-80c1-85e809512d2f︡︡{"html":"<div>$T_{p}\\,\\mathcal{M}$</div>","done":false}︡{"done":true}
︠a8ab3890-e859-469b-a96d-17736efae14as︠
vp in p.tangent_space()
︡235a9847-7473-4830-9df8-34ca13b96a48︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠3f11dbbc-fb6e-4f63-a96d-22e15f78fd1es︠
up = u.at(p) ; print up
︡1a15ce9e-4f0d-44de-9fc3-0e5b76f30a35︡︡{"stdout":"tangent vector u at point 'p' on 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠6394bcf3-66ba-4687-ab07-19d2d531b131s︠
up.display()
︡33dab60e-3630-4204-bf73-57b56156164b︡︡{"html":"<div>$u = u_{x}\\left(1, 2, -1\\right) \\frac{\\partial}{\\partial x } + u_{y}\\left(1, 2, -1\\right) \\frac{\\partial}{\\partial y } + u_{z}\\left(1, 2, -1\\right) \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"done":true}
︠7dec7ee7-b0b9-4fd9-93c7-d93fa823c5bdi︠
%html
<h2>1-forms</h2>
<p>A 1-form on $\mathcal{M}$ is a field of linear forms. For instance, it can be the <strong>differential of a scalar field</strong>:</p>

︡dc0409a9-5432-45a4-ace9-0c1dff968fbb︡︡{"done":true,"html":"<h2>1-forms</h2>\n<p>A 1-form on $\\mathcal{M}$ is a field of linear forms. For instance, it can be the <strong>differential of a scalar field</strong>:</p>"}
︠e65dc99c-a63e-4300-be78-f169d6c51c35s︠
df = f.differential() ; print df
︡57e21bda-714f-4805-8270-f35e81b2778e︡︡{"stdout":"1-form 'df' on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠6ec7bc4d-e745-4861-9fc2-cdf5eec3ce6fs︠
df.display()
︡7b3439be-5add-4647-be40-75c561db2a12︡︡{"html":"<div>$\\mathrm{d}f = \\mathrm{d} x + 2 \\, y \\mathrm{d} y + 3 \\, z^{2} \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠777bebb3-e530-4f8c-826c-62b798a05e46i︠
%html
<p>In the above writing, the 1-form is expanded over the basis $(\mathrm{d}x, \mathrm{d}y, \mathrm{d}z)$ associated with the chart $(x,y,z)$. This basis can be accessed via the member <span style="font-family: courier new,courier;">coframe</span>:</p>

︡9ccb804d-8273-4b10-95e2-c141eeec731f︡︡{"done":true,"html":"<p>In the above writing, the 1-form is expanded over the basis $(\\mathrm{d}x, \\mathrm{d}y, \\mathrm{d}z)$ associated with the chart $(x,y,z)$. This basis can be accessed via the member <span style=\"font-family: courier new,courier;\">coframe</span>:</p>"}
︠071e7b4c-8b16-4f28-bbe1-cbf691876bc1s︠
dX = X.coframe() ; dX
︡d8993cef-b5a0-41bc-a38d-4b3ddd7e55a3︡︡{"html":"<div>$\\left(\\mathcal{M} ,\\left(\\mathrm{d} x,\\mathrm{d} y,\\mathrm{d} z\\right)\\right)$</div>","done":false}︡{"done":true}
︠8ce72e88-b422-4eee-ba41-678b0ef39acci︠
%html
<p>The list of all coframes defined on a given manifold open subset is returned by the method <span style="font-family: courier new,courier;">coframes()</span>:</p>

︡8498b451-410a-4848-8d84-b3a6a9ec7610︡︡{"done":true,"html":"<p>The list of all coframes defined on a given manifold open subset is returned by the method <span style=\"font-family: courier new,courier;\">coframes()</span>:</p>"}
︠ff0954e7-8771-4b5b-b675-27219e3e7d38s︠
M.coframes()
︡0f473e60-2c74-4ac7-b932-df7f72eeb478︡︡{"html":"<div>[$\\left(\\mathcal{M} ,\\left(\\mathrm{d} x,\\mathrm{d} y,\\mathrm{d} z\\right)\\right)$, $\\left(U ,\\left(\\mathrm{d} x,\\mathrm{d} y,\\mathrm{d} z\\right)\\right)$, $\\left(U ,\\left(\\mathrm{d} r,\\mathrm{d} {\\theta},\\mathrm{d} {\\phi}\\right)\\right)$]</div>","done":false}︡{"done":true}
︠56f4bb57-2a97-4f42-8339-f2a4ad519508i︠
%html
<p>As for a vector field, the value of the differential form at some point on the manifold is obtained by the method <span style="font-family: courier new,courier;">at()</span>:</p>

︡97e7ef04-8d4b-4bab-9627-8d1651907f07︡︡{"done":true,"html":"<p>As for a vector field, the value of the differential form at some point on the manifold is obtained by the method <span style=\"font-family: courier new,courier;\">at()</span>:</p>"}
︠1f678271-c6d1-4fa8-8054-a74c61e3dafbs︠
dfp = df.at(p) ; print dfp
︡359a8785-9207-4d5f-8808-aeb661c82209︡︡{"stdout":"Linear form df on the tangent space at point 'p' on 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠136a8bdc-c34e-448d-8464-2875f9b26e5fs︠
dfp.display()
︡dcf5f0e4-cd48-4487-ba24-bea88b39c2e3︡︡{"html":"<div>$\\mathrm{d}f = \\mathrm{d} x + 4 \\mathrm{d} y + 3 \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠555b1e93-5aca-48b8-abb0-73bd31858f1fi︠
%html
<p>Recall that</p>

︡70750078-1fee-4543-899b-3f796c18e392︡︡{"done":true,"html":"<p>Recall that</p>"}
︠0f45b2fc-91c3-47b1-ace1-d1b4cc42abf3s︠
p.coord()
︡f753b109-a67d-408e-9fb2-13e169c91953︡︡{"html":"<div>($1$, $2$, $-1$)</div>","done":false}︡{"done":true}
︠0def4e5e-1c21-4a85-8fe1-e7530c91534ai︠
%html
<p>The linear form $\mathrm{d}f|_p$ belongs to the dual of the tangent vector space at $p$:</p>

︡92679c1e-b0ef-4a4f-b340-d62a4a5301c7︡︡{"done":true,"html":"<p>The linear form $\\mathrm{d}f|_p$ belongs to the dual of the tangent vector space at $p$:</p>"}
︠bf610105-f0a1-4a30-96bb-2dc999ea9e9es︠
dfp.parent()
︡1804cd08-6eec-4e20-a03b-3ca2c5324b41︡︡{"html":"<div>$T_{p}\\,\\mathcal{M}^*$</div>","done":false}︡{"done":true}
︠4b4339e1-2342-4cba-8a61-a4d87b408590s︠
dfp.parent() is p.tangent_space().dual()
︡53195a67-7420-4180-854a-4d6a8dafc711︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠d5a393e5-2216-4a6b-a77f-0dbca8f3f207i︠
%html
<p>As such, it is acting on vectors at $p$, yielding a real number:</p>

︡a2f0e4e7-2231-43de-acb0-89b89c4cf558︡︡{"done":true,"html":"<p>As such, it is acting on vectors at $p$, yielding a real number:</p>"}
︠c617a2d0-5f0b-42a5-8b4f-5354a069c02bs︠
print vp ; vp.display()
︡a6451967-903a-41a0-a12d-7a3855693820︡︡{"stdout":"tangent vector v at point 'p' on 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$v|_p = 3 \\frac{\\partial}{\\partial x } -\\frac{\\partial}{\\partial y } -2 \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"done":true}
︠92d967d6-a9a6-41cc-a1e2-b916c87d2a1es︠
dfp(vp)
︡2c430ef1-f670-4a62-bcf8-b9cd085a28ec︡︡{"html":"<div>$-7$</div>","done":false}︡{"done":true}
︠602680e6-15b4-4382-aa57-d814fab25a9es︠
print up ; up.display()
︡709d25b3-d8e4-4004-b16a-21f44c501387︡︡{"stdout":"tangent vector u at point 'p' on 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$u = u_{x}\\left(1, 2, -1\\right) \\frac{\\partial}{\\partial x } + u_{y}\\left(1, 2, -1\\right) \\frac{\\partial}{\\partial y } + u_{z}\\left(1, 2, -1\\right) \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"done":true}
︠98c9a2d0-5154-45f1-9fcc-4a5036a04080s︠
dfp(up)
︡b8a886c5-4fff-4280-a436-50120735442c︡︡{"html":"<div>$u_{x}\\left(1, 2, -1\\right) + 4 \\, u_{y}\\left(1, 2, -1\\right) + 3 \\, u_{z}\\left(1, 2, -1\\right)$</div>","done":false}︡{"done":true}
︠7b868ba3-c04d-4aa7-8c6e-695a9123565di︠
%html
<p>The differential 1-form of the unspecified scalar field $h$:</p>

︡8d29f777-6b68-489e-973a-2abb3b4577fb︡︡{"done":true,"html":"<p>The differential 1-form of the unspecified scalar field $h$:</p>"}
︠a9804882-586b-4ba0-8049-db1d9fb4f155s︠
h.display() ; dh = h.differential() ; dh.display()
︡b197b119-100c-4dea-9623-b33915fa8157︡︡{"html":"<div>$\\begin{array}{llcl} h:&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; H\\left(x, y, z\\right) \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; H\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\cos\\left({\\theta}\\right)\\right) \\end{array}$</div>","done":false}︡{"html":"<div>$\\mathrm{d}h = \\frac{\\partial\\,H}{\\partial x} \\mathrm{d} x + \\frac{\\partial\\,H}{\\partial y} \\mathrm{d} y + \\frac{\\partial\\,H}{\\partial z} \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠9c5b419d-9e8c-4148-91fb-ddbf4365cbd0i︠
%html
<p>A 1-form <span id="cell_outer_132">can also be defined from scratch:</span></p>

︡3d65565f-3b9c-49dc-b08a-7addd67e1cea︡︡{"done":true,"html":"<p>A 1-form <span id=\"cell_outer_132\">can also be defined from scratch:</span></p>"}
︠837a6ee9-7756-45ff-860c-a623714c66ebs︠
om = U.one_form('omega', r'\omega') ; print om
︡d5df3dd0-fbba-41c2-893b-3c002b273e90︡︡{"stdout":"1-form 'omega' on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠eb50457b-43b7-4db6-9974-56c562896101i︠
%html
<p>It can be specified by providing its components in a given coframe:</p>

︡af2ba825-100d-4c86-9bf2-f34b03fdb431︡︡{"done":true,"html":"<p>It can be specified by providing its components in a given coframe:</p>"}
︠5b2e4110-e2f3-44a4-89cd-071c9b5610a8s︠
om[:] = [x^2+y^2, z, x-z]    # components in the default coframe (dx,dy,dz)
om.display()
︡be6021aa-9342-4a51-ab4b-3a6ec0e99ffa︡︡{"html":"<div>$\\omega = \\left( x^{2} + y^{2} \\right) \\mathrm{d} x + z \\mathrm{d} y + \\left( x - z \\right) \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠e51813ee-f1ef-4b29-9685-959ed01cd571i︠
%html
<p>Of course, one may set the components in a frame different from the default one:</p>

︡dfe75692-0ca7-4ce8-b9a0-0c85e8b59bd5︡︡{"done":true,"html":"<p>Of course, one may set the components in a frame different from the default one:</p>"}
︠cc8162dd-9e2c-492d-8196-a0a008030bfes︠
om[Y.frame(), :, Y] = [r*sin(th)*cos(ph), 0, r*sin(th)*sin(ph)]
om.display(Y.frame(), Y)
︡91eeab69-18c2-41d2-9288-fa54c2b08963︡︡{"html":"<div>$\\omega = r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\mathrm{d} r + r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠ecafe641-a8ea-46d0-b5f5-45fa5af8cc52i︠
%html
<p>The components in the coframe $(\mathrm{d}x,\mathrm{d}y,\mathrm{d}z)$ are updated automatically:</p>

︡f328aeec-5390-4bea-9be4-3d0222f18234︡︡{"done":true,"html":"<p>The components in the coframe $(\\mathrm{d}x,\\mathrm{d}y,\\mathrm{d}z)$ are updated automatically:</p>"}
︠c95134ec-35a4-44b2-a2bb-a226e09907afs︠
om.display()
︡afc54b3c-70a0-466f-b07e-b51e34b3dd84︡︡{"html":"<div>$\\omega = \\left( \\frac{x^{4} + x^{2} y^{2} - \\sqrt{x^{2} + y^{2} + z^{2}} y^{2}}{\\sqrt{x^{2} + y^{2} + z^{2}} {\\left(x^{2} + y^{2}\\right)}} \\right) \\mathrm{d} x + \\left( \\frac{x^{3} y + x y^{3} + \\sqrt{x^{2} + y^{2} + z^{2}} x y}{\\sqrt{x^{2} + y^{2} + z^{2}} {\\left(x^{2} + y^{2}\\right)}} \\right) \\mathrm{d} y + \\left( \\frac{x z}{\\sqrt{x^{2} + y^{2} + z^{2}}} \\right) \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠5cca5eed-3a90-4ad5-bb87-5ac3b69b1926i︠
%html
<p>Let us revert to the values set previously:</p>

︡f59e9614-968c-4f11-b02b-9f2b2b61861f︡︡{"done":true,"html":"<p>Let us revert to the values set previously:</p>"}
︠772e57b8-a0fc-48f9-8bb2-57949287c818s︠
om[:] = [x^2+y^2, z, x-z]
om.display()
︡df8c7bda-37aa-42e9-b761-2c8e6596f4d0︡︡{"html":"<div>$\\omega = \\left( x^{2} + y^{2} \\right) \\mathrm{d} x + z \\mathrm{d} y + \\left( x - z \\right) \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠744b5edf-87e8-470e-aa5c-697bf9de919fi︠
%html
<p>This time, the components in the coframe $(\mathrm{d}r, \mathrm{d}\theta,\mathrm{d}\phi)$ are those that are updated:</p>

︡97da5448-df65-41a2-8741-739ee2388018︡︡{"done":true,"html":"<p>This time, the components in the coframe $(\\mathrm{d}r, \\mathrm{d}\\theta,\\mathrm{d}\\phi)$ are those that are updated:</p>"}
︠d7201736-3ab6-4b2a-8142-d500f169473bs︠
om.display(Y.frame(), Y)
︡f12a9c4e-2188-4b4a-9095-c1dff1ce5017︡︡{"html":"<div>$\\omega = \\left( r^{2} \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{3} + r {\\left(\\cos\\left({\\phi}\\right) + \\sin\\left({\\phi}\\right)\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right) - r \\cos\\left({\\theta}\\right)^{2} \\right) \\mathrm{d} r + \\left( r^{2} \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) + r^{2} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right) + {\\left(r^{3} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) - r^{2} \\cos\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)^{2} \\right) \\mathrm{d} {\\theta} + \\left( -r^{3} \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{3} + r^{2} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right) \\right) \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠bc7c6c08-7c70-4981-aade-6cbdbc6b8d45i︠
%html
<p>A 1-form acts on vector fields, resulting in a scalar field:</p>

︡983e7e9b-5141-46a7-9e81-805e91bd9f17︡︡{"done":true,"html":"<p>A 1-form acts on vector fields, resulting in a scalar field:</p>"}
︠e124d205-b130-4c96-b72f-9df2f1349679s︠
v.display() ; om.display() ; print om(v) ; om(v).display()
︡e763bf86-f7fe-405b-a539-783c61c5692a︡︡{"html":"<div>$v = \\left( y + 1 \\right) \\frac{\\partial}{\\partial x } -x \\frac{\\partial}{\\partial y } + x y z \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"html":"<div>$\\omega = \\left( x^{2} + y^{2} \\right) \\mathrm{d} x + z \\mathrm{d} y + \\left( x - z \\right) \\mathrm{d} z$</div>","done":false}︡{"stdout":"scalar field 'omega(v)' on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} \\omega\\left(v\\right):&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; -x y z^{2} + x^{2} y + y^{3} + x^{2} + y^{2} + {\\left(x^{2} y - x\\right)} z \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; -r^{2} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right) + {\\left(r^{4} \\cos\\left({\\phi}\\right)^{2} \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) + r^{3} \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)^{3} - {\\left(r^{4} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) - r^{2}\\right)} \\sin\\left({\\theta}\\right)^{2} \\end{array}$</div>","done":false}︡{"done":true}
︠7737530e-d8d2-4395-9119-6510ab258213s︠
df.display() ; print df(v) ; df(v).display()
︡49df6602-f985-436c-a6e6-878abc925c80︡︡{"html":"<div>$\\mathrm{d}f = \\mathrm{d} x + 2 \\, y \\mathrm{d} y + 3 \\, z^{2} \\mathrm{d} z$</div>","done":false}︡{"stdout":"scalar field 'df(v)' on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} \\mathrm{d}f\\left(v\\right):&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; 3 \\, x y z^{3} - {\\left(2 \\, x - 1\\right)} y + 1 \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) + {\\left(3 \\, r^{5} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{3} \\sin\\left({\\phi}\\right) - 2 \\, r^{2} \\cos\\left({\\phi}\\right) \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)^{2} + 1 \\end{array}$</div>","done":false}︡{"done":true}
︠2d77be9d-f15c-40e0-8de8-137c3f5cad38s︠
u.display() ; om(u).display()
︡113148ce-c59d-4c28-8157-ce8f7dc9bea4︡︡{"html":"<div>$u = u_{x}\\left(x, y, z\\right) \\frac{\\partial}{\\partial x } + u_{y}\\left(x, y, z\\right) \\frac{\\partial}{\\partial y } + u_{z}\\left(x, y, z\\right) \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"html":"<div>$\\begin{array}{llcl} \\omega\\left(u\\right):&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; x^{2} u_{x}\\left(x, y, z\\right) + y^{2} u_{x}\\left(x, y, z\\right) + z {\\left(u_{y}\\left(x, y, z\\right) - u_{z}\\left(x, y, z\\right)\\right)} + x u_{z}\\left(x, y, z\\right) \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; r^{2} \\sin\\left({\\theta}\\right)^{2} u_{x}\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\cos\\left({\\theta}\\right)\\right) + r \\cos\\left({\\theta}\\right) u_{y}\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\cos\\left({\\theta}\\right)\\right) + {\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) - r \\cos\\left({\\theta}\\right)\\right)} u_{z}\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\cos\\left({\\theta}\\right)\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠0e3b9c9b-8e9a-4df2-807b-390edc27104ei︠
%html
<p>In the case of a differential 1-form, the following identity holds:</p>

︡265289bd-a632-44af-9b10-b1bb2c176c56︡︡{"done":true,"html":"<p>In the case of a differential 1-form, the following identity holds:</p>"}
︠3648caee-fb1d-4240-a00d-c76280d4e606s︠
df(v) == v(f)
︡c288cd7a-4ece-4d71-bc10-9d12d8616210︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠fa0d8964-1750-4a75-9ef2-eb21e2862456i︠
%html
<p>1-forms are Sage <em>element</em> objects, whose <em>parent</em> is the set $\mathcal{T}^{(0,1)}(U)$ of all tensor fields of type (0,1) defined on $U$:</p>

︡2261e9ab-676f-4948-b4dc-1452c0642381︡︡{"done":true,"html":"<p>1-forms are Sage <em>element</em> objects, whose <em>parent</em> is the set $\\mathcal{T}^{(0,1)}(U)$ of all tensor fields of type (0,1) defined on $U$:</p>"}
︠685526f7-8f46-430b-b760-f14dc9832abbs︠
df.parent()
︡fca3088a-13b7-47fe-9d35-658257c82efc︡︡{"html":"<div>$\\Lambda^{1}\\left(U\\right)$</div>","done":false}︡{"done":true}
︠faa11ed4-b2ff-48d0-9885-c9cf270c1192s︠
print df.parent()
︡697db4c0-25e8-431e-8b7b-091ec8b9db33︡︡{"stdout":"Free module /\\^1(U) of 1-forms on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠a5b81526-1917-46ea-9dbc-7b177ae2fc17s︠
print om.parent()
︡73fbf316-e0b0-486f-a8a7-ff3da6126470︡︡{"stdout":"Free module /\\^1(U) of 1-forms on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠20728e2c-a511-4738-b5f5-4270d00a3729i︠
%html
<p>$\mathcal{T}^{(0,1)}(U)$ is actually the dual of the free module $\mathcal{X}(U)$:</p>

︡2bbf3bb7-7657-4920-ae52-b9d42012e203︡︡{"done":true,"html":"<p>$\\mathcal{T}^{(0,1)}(U)$ is actually the dual of the free module $\\mathcal{X}(U)$:</p>"}
︠4572f86b-c600-4f2d-ab61-b7263ddb52ces︠
df.parent() is v.parent().dual()
︡cb2317f6-260c-470f-b6df-8f981d02aa8a︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠6968dc5c-cd88-4e00-8e82-4995ab2a905ei︠
%html
<h2>Differential forms and exterior calculus</h2>
<p>The <strong>exterior product</strong> of two 1-forms is taken via the method <span style="font-family: courier new,courier;">wedge()</span> and results in a 2-form:</p>

︡6cf7ac81-2d65-4a43-985a-59bbba304577︡︡{"done":true,"html":"<h2>Differential forms and exterior calculus</h2>\n<p>The <strong>exterior product</strong> of two 1-forms is taken via the method <span style=\"font-family: courier new,courier;\">wedge()</span> and results in a 2-form:</p>"}
︠cdbcd466-322f-43b7-b910-7269ae86e20cs︠
a = om.wedge(df) ; print a ; a.display()
︡d3787221-4a47-463e-86b2-0c4598a7e5ed︡︡{"stdout":"2-form 'omega/\\df' on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\omega\\wedge \\mathrm{d}f = \\left( 2 \\, x^{2} y + 2 \\, y^{3} - z \\right) \\mathrm{d} x\\wedge \\mathrm{d} y + \\left( 3 \\, {\\left(x^{2} + y^{2}\\right)} z^{2} - x + z \\right) \\mathrm{d} x\\wedge \\mathrm{d} z + \\left( 3 \\, z^{3} - 2 \\, x y + 2 \\, y z \\right) \\mathrm{d} y\\wedge \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠5f81c511-f1c6-48c4-9c81-2c2ff5b2f461i︠
%html
<p>A matrix view of the components:</p>

︡7559bfc1-6ce6-4a2d-935c-da9719ac7b68︡︡{"done":true,"html":"<p>A matrix view of the components:</p>"}
︠ee024ba9-ad34-4b45-b06b-9fde68c852abs︠
a[:]
︡d584a816-676b-4b77-9467-36fc73ef6e88︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n0 &amp; 2 \\, x^{2} y + 2 \\, y^{3} - z &amp; 3 \\, {\\left(x^{2} + y^{2}\\right)} z^{2} - x + z \\\\\n-2 \\, x^{2} y - 2 \\, y^{3} + z &amp; 0 &amp; 3 \\, z^{3} - 2 \\, x y + 2 \\, y z \\\\\n-3 \\, {\\left(x^{2} + y^{2}\\right)} z^{2} + x - z &amp; -3 \\, z^{3} + 2 \\, x y - 2 \\, y z &amp; 0\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠c3d90005-9e91-438c-bd37-6a1c67840fa8i︠
%html
<p>Displaying only the non-vanishing components, skipping the redundant ones (i.e. those that can be deduced by antisymmetry):</p>

︡c1a9fc87-dcc3-4df5-b4e8-4399aad87fea︡︡{"done":true,"html":"<p>Displaying only the non-vanishing components, skipping the redundant ones (i.e. those that can be deduced by antisymmetry):</p>"}
︠fe5e0d33-25cb-4a79-9463-d150ad5f1020s︠
a.display_comp(only_nonredundant=True)
︡4a80426d-2b25-4615-a25f-40d39979942b︡︡{"html":"<div>$\\begin{array}{lcl} \\omega\\wedge \\mathrm{d}f_{ \\, x \\, y }^{ \\phantom{\\, x } \\phantom{\\, y } } &amp; = &amp; 2 \\, x^{2} y + 2 \\, y^{3} - z \\\\ \\omega\\wedge \\mathrm{d}f_{ \\, x \\, z }^{ \\phantom{\\, x } \\phantom{\\, z } } &amp; = &amp; 3 \\, {\\left(x^{2} + y^{2}\\right)} z^{2} - x + z \\\\ \\omega\\wedge \\mathrm{d}f_{ \\, y \\, z }^{ \\phantom{\\, y } \\phantom{\\, z } } &amp; = &amp; 3 \\, z^{3} - 2 \\, x y + 2 \\, y z \\end{array}$</div>","done":false}︡{"done":true}
︠4220972a-e9aa-4999-aef1-538e21e4974ai︠
%html
<p>The 2-form $\omega\wedge\mathrm{d}f$ can be expanded on the $(\mathrm{d}r,\mathrm{d}\theta,\mathrm{d}\phi)$ coframe:</p>

︡4e033815-13b4-4728-8aba-325154033d81︡︡{"done":true,"html":"<p>The 2-form $\\omega\\wedge\\mathrm{d}f$ can be expanded on the $(\\mathrm{d}r,\\mathrm{d}\\theta,\\mathrm{d}\\phi)$ coframe:</p>"}
︠90892827-1e73-4dda-b97b-0b99b3e5f144s︠
a.display(Y.frame(), Y)
︡7d8d44b8-4024-4517-a7c4-d2dd1c6e81c4︡︡{"html":"<div>$\\omega\\wedge \\mathrm{d}f = \\left( 3 \\, r^{5} \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{4} - {\\left(3 \\, r^{5} \\cos\\left({\\phi}\\right) - 3 \\, r^{4} \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) - 2 \\, r^{3} \\cos\\left({\\phi}\\right) \\sin\\left({\\phi}\\right)^{2}\\right)} \\sin\\left({\\theta}\\right)^{2} - {\\left(3 \\, r^{4} \\sin\\left({\\phi}\\right) + r^{2} \\cos\\left({\\phi}\\right)\\right)} \\cos\\left({\\theta}\\right) - {\\left(2 \\, r^{3} \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right)^{2} + {\\left(\\sin\\left({\\phi}\\right)^{2} - 1\\right)} r^{2}\\right)} \\sin\\left({\\theta}\\right) \\right) \\mathrm{d} r\\wedge \\mathrm{d} {\\theta} + \\left( 2 \\, r^{4} \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{5} + {\\left(3 \\, r^{5} \\cos\\left({\\theta}\\right)^{3} \\sin\\left({\\phi}\\right) + 2 \\, r^{3} \\cos\\left({\\phi}\\right)^{2} \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)^{3} - {\\left(2 \\, r^{3} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) + {\\left(\\cos\\left({\\phi}\\right) \\sin\\left({\\phi}\\right) + 1\\right)} r^{2} \\cos\\left({\\theta}\\right)\\right)} \\sin\\left({\\theta}\\right)^{2} - {\\left(3 \\, r^{4} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{4} - r^{2} \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right) \\right) \\mathrm{d} r\\wedge \\mathrm{d} {\\phi} + \\left( -r^{3} \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\theta}\\right) - {\\left(3 \\, r^{6} \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) + 2 \\, r^{4} \\cos\\left({\\phi}\\right)^{2} \\sin\\left({\\phi}\\right) - 2 \\, r^{5} \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)^{4} + {\\left(2 \\, r^{4} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) + r^{3} \\cos\\left({\\phi}\\right) \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)^{3} + {\\left(3 \\, r^{5} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{3} - r^{3} \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)^{2} \\right) \\mathrm{d} {\\theta}\\wedge \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠cf325e9e-f00b-447c-80ef-f21169d8fca7i︠
%html
<p>As a 2-form, $A:=\omega\wedge\mathrm{d}f$ can be applied to a pair of vectors and is antisymmetric:</p>

︡90d92980-6c9c-4ac9-b082-ec939c23be00︡︡{"done":true,"html":"<p>As a 2-form, $A:=\\omega\\wedge\\mathrm{d}f$ can be applied to a pair of vectors and is antisymmetric:</p>"}
︠f8b800d3-fcc6-4620-930f-49fb63db9ae0s︠
a.set_name('A')
print a(u,v) ; a(u,v).display()
︡ee857686-3798-41c2-b96b-1ad124d55a1a︡︡{"stdout":"scalar field 'A(u,v)' on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} A\\left(u,v\\right):&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; 3 \\, x y z^{4} u_{y}\\left(x, y, z\\right) - 2 \\, x^{2} y^{2} u_{y}\\left(x, y, z\\right) - 2 \\, y^{4} u_{y}\\left(x, y, z\\right) - 2 \\, {\\left(x u_{x}\\left(x, y, z\\right) + u_{y}\\left(x, y, z\\right)\\right)} y^{3} + 3 \\, {\\left(x^{3} y u_{x}\\left(x, y, z\\right) + x y^{3} u_{x}\\left(x, y, z\\right) + x u_{z}\\left(x, y, z\\right)\\right)} z^{3} - {\\left(3 \\, y^{3} u_{z}\\left(x, y, z\\right) - {\\left(2 \\, x u_{y}\\left(x, y, z\\right) - 3 \\, u_{z}\\left(x, y, z\\right)\\right)} y^{2} + 3 \\, x^{2} u_{z}\\left(x, y, z\\right) + {\\left(3 \\, x^{2} u_{z}\\left(x, y, z\\right) - x u_{x}\\left(x, y, z\\right)\\right)} y\\right)} z^{2} - {\\left(2 \\, x^{3} u_{x}\\left(x, y, z\\right) + 2 \\, x^{2} u_{y}\\left(x, y, z\\right) + {\\left(2 \\, x^{2} - x\\right)} u_{z}\\left(x, y, z\\right)\\right)} y - {\\left(2 \\, x^{2} y^{2} u_{y}\\left(x, y, z\\right) + {\\left(x^{2} u_{x}\\left(x, y, z\\right) - {\\left(2 \\, x - 1\\right)} u_{z}\\left(x, y, z\\right) - u_{y}\\left(x, y, z\\right)\\right)} y - x u_{x}\\left(x, y, z\\right) - u_{y}\\left(x, y, z\\right) + u_{z}\\left(x, y, z\\right)\\right)} z + x u_{z}\\left(x, y, z\\right) \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; {\\left(r^{4} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{2} + {\\left(\\sin\\left({\\phi}\\right)^{3} - \\sin\\left({\\phi}\\right)\\right)} r^{4} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)^{3} + r^{2} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right) + {\\left(3 \\, r^{7} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{3} \\sin\\left({\\phi}\\right) - 2 \\, r^{4} \\cos\\left({\\phi}\\right) \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)^{4}\\right)} u_{x}\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\cos\\left({\\theta}\\right)\\right) + {\\left(3 \\, r^{6} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{4} \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{2} + r^{2} \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) + 2 \\, {\\left({\\left(\\sin\\left({\\phi}\\right)^{4} - \\sin\\left({\\phi}\\right)^{2}\\right)} r^{5} \\cos\\left({\\theta}\\right) - r^{4} \\sin\\left({\\phi}\\right)^{2}\\right)} \\sin\\left({\\theta}\\right)^{4} + 2 \\, {\\left(r^{5} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right)^{2} - r^{3} \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)^{3} + r \\cos\\left({\\theta}\\right)\\right)} u_{y}\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\cos\\left({\\theta}\\right)\\right) - {\\left({\\left(3 \\, r^{5} \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) - 2 \\, {\\left(\\sin\\left({\\phi}\\right)^{3} - \\sin\\left({\\phi}\\right)\\right)} r^{3}\\right)} \\sin\\left({\\theta}\\right)^{3} + {\\left(3 \\, r^{4} \\cos\\left({\\theta}\\right)^{2} - 2 \\, r^{3} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) - r^{2} \\cos\\left({\\phi}\\right) \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)^{2} + r \\cos\\left({\\theta}\\right) - {\\left(3 \\, r^{4} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{3} - r^{2} \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) + r \\cos\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)\\right)} u_{z}\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\cos\\left({\\theta}\\right)\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠848d3ab3-0af7-4310-9bc2-70538c536555s︠
a(u,v) == - a(v,u)
︡10c63715-7930-4376-9f0a-f7c96448d978︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠00ba145c-0ac9-4fd2-8ba0-f2fde845fdbfs︠
a.symmetries()
︡bdc48081-6a2c-4bad-a4fb-2837eaa29251︡︡{"stdout":"no symmetry; antisymmetry: (0, 1)\n","done":false}︡{"done":true}
︠9e4c2d72-e4d1-4cb9-8e88-2b4a3bbe72d7i︠
%html
<p>The <strong>exterior derivative</strong>&nbsp; of a differential form is taken by invoking the function <span style="font-family: courier new,courier;">xder()</span>:</p>

︡4a52d8f3-3cd8-4f00-a6c0-d4561152343f︡︡{"done":true,"html":"<p>The <strong>exterior derivative</strong>&nbsp; of a differential form is taken by invoking the function <span style=\"font-family: courier new,courier;\">xder()</span>:</p>"}
︠a074dfe9-5720-42ad-9ddb-a063f2e4665fs︠
dom = xder(om) ; print dom ; dom.display()
︡7da96cf4-94e9-4a14-959e-f76d7b06136f︡︡{"stdout":"2-form 'domega' on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\mathrm{d}\\omega = -2 \\, y \\mathrm{d} x\\wedge \\mathrm{d} y +\\mathrm{d} x\\wedge \\mathrm{d} z -\\mathrm{d} y\\wedge \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠a5154c13-e069-476a-b46b-cf1a5ee04635s︠
da = xder(a) ; print da ; da.display()
︡7141fc6e-6d12-4d26-8320-9e7f90efa2f4︡︡{"stdout":"3-form 'dA' on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\mathrm{d}A = \\left( -6 \\, y z^{2} - 2 \\, y - 1 \\right) \\mathrm{d} x\\wedge \\mathrm{d} y\\wedge \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠90ba6530-ed70-4019-8e2a-7667ebb3e718i︠
%html
<p>The exterior derivative is nilpotent:</p>

︡66516c2d-e1c7-44e7-845c-fd7cc748675f︡︡{"done":true,"html":"<p>The exterior derivative is nilpotent:</p>"}
︠68e0b720-6502-41bb-8d23-4506ba147be5s︠
ddf = xder(df) ; ddf.display()
︡121e1eb1-5b14-4e07-8524-7649a7f2e23a︡︡{"html":"<div>$\\mathrm{d}\\mathrm{d}f = 0$</div>","done":false}︡{"done":true}
︠db7eaff6-4b86-4ad2-9487-9aaf5a905292s︠
ddom = xder(dom) ; ddom.display()
︡3b2939a4-1c50-4118-9efe-e32e54aca63f︡︡{"html":"<div>$\\mathrm{d}\\mathrm{d}\\omega = 0$</div>","done":false}︡{"done":true}
︠e5895fa4-66a7-4838-a773-3d1a03fb5062i︠
%html
<h2>Lie derivative</h2>
<p>The Lie derivative of any tensor field with respect to a vector field is computed by the method <span style="font-family: courier new,courier;">lie_der()</span>, with the vector field as argument:</p>

︡73167f5f-85ae-41f8-9580-3fa0468e2033︡︡{"done":true,"html":"<h2>Lie derivative</h2>\n<p>The Lie derivative of any tensor field with respect to a vector field is computed by the method <span style=\"font-family: courier new,courier;\">lie_der()</span>, with the vector field as argument:</p>"}
︠c595d077-2e76-4bcc-8ad9-814927510997s︠
lv_om = om.lie_der(v) ; print lv_om ; lv_om.display()
︡9d8c8cdb-8719-4da3-ac51-d7833cbe4e67︡︡{"stdout":"1-form on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\left( -y z^{2} + {\\left(x y - 1\\right)} z + 2 \\, x \\right) \\mathrm{d} x + \\left( -x z^{2} + x^{2} + y^{2} + {\\left(x^{2} + x y\\right)} z \\right) \\mathrm{d} y + \\left( -2 \\, x y z + {\\left(x^{2} + 1\\right)} y + 1 \\right) \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠dc3b671b-30de-45f6-8fda-a1f3e3ba9ad2s︠
lu_dh = dh.lie_der(u) ; print lu_dh ; lu_dh.display()
︡2b58e8f1-f2f8-4c48-a2cb-5b89f56e65e0︡︡{"stdout":"1-form on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\left( u_{x}\\left(x, y, z\\right) \\frac{\\partial^2\\,H}{\\partial x^2} + u_{y}\\left(x, y, z\\right) \\frac{\\partial^2\\,H}{\\partial x\\partial y} + u_{z}\\left(x, y, z\\right) \\frac{\\partial^2\\,H}{\\partial x\\partial z} + \\frac{\\partial\\,H}{\\partial x} \\frac{\\partial\\,u_{x}}{\\partial x} + \\frac{\\partial\\,H}{\\partial y} \\frac{\\partial\\,u_{y}}{\\partial x} + \\frac{\\partial\\,H}{\\partial z} \\frac{\\partial\\,u_{z}}{\\partial x} \\right) \\mathrm{d} x + \\left( u_{x}\\left(x, y, z\\right) \\frac{\\partial^2\\,H}{\\partial x\\partial y} + u_{y}\\left(x, y, z\\right) \\frac{\\partial^2\\,H}{\\partial y^2} + u_{z}\\left(x, y, z\\right) \\frac{\\partial^2\\,H}{\\partial y\\partial z} + \\frac{\\partial\\,H}{\\partial x} \\frac{\\partial\\,u_{x}}{\\partial y} + \\frac{\\partial\\,H}{\\partial y} \\frac{\\partial\\,u_{y}}{\\partial y} + \\frac{\\partial\\,H}{\\partial z} \\frac{\\partial\\,u_{z}}{\\partial y} \\right) \\mathrm{d} y + \\left( u_{x}\\left(x, y, z\\right) \\frac{\\partial^2\\,H}{\\partial x\\partial z} + u_{y}\\left(x, y, z\\right) \\frac{\\partial^2\\,H}{\\partial y\\partial z} + u_{z}\\left(x, y, z\\right) \\frac{\\partial^2\\,H}{\\partial z^2} + \\frac{\\partial\\,H}{\\partial x} \\frac{\\partial\\,u_{x}}{\\partial z} + \\frac{\\partial\\,H}{\\partial y} \\frac{\\partial\\,u_{y}}{\\partial z} + \\frac{\\partial\\,H}{\\partial z} \\frac{\\partial\\,u_{z}}{\\partial z} \\right) \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠41767099-b041-44f4-8deb-2906da912e00i︠
%html
<p>Let us check <strong>Cartan identity</strong> on the 1-form $\omega$:</p>
<p>$\mathcal{L}_v \omega = v\cdot \mathrm{d}\omega + \mathrm{d}\langle \omega, v\rangle$</p>
<p>and on the 2-form $A$:</p>
<p>$\mathcal{L}_v A = v\cdot \mathrm{d}A + \mathrm{d}(v\cdot A)$</p>

︡33261be4-6d21-410d-a54e-a3c4b9c1f50b︡︡{"done":true,"html":"<p>Let us check <strong>Cartan identity</strong> on the 1-form $\\omega$:</p>\n<p>$\\mathcal{L}_v \\omega = v\\cdot \\mathrm{d}\\omega + \\mathrm{d}\\langle \\omega, v\\rangle$</p>\n<p>and on the 2-form $A$:</p>\n<p>$\\mathcal{L}_v A = v\\cdot \\mathrm{d}A + \\mathrm{d}(v\\cdot A)$</p>"}
︠e9205808-6997-4ded-9afc-4aa275703dd0s︠
om.lie_der(v) == v.contract(xder(om)) + xder(om(v))
︡b667f588-0b1f-46f5-b30a-698240e7f288︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠a856ca54-2753-407f-9e35-dd11b12cffb3s︠
a.lie_der(v) == v.contract(xder(a)) + xder(v.contract(a))
︡e81c75d5-d5c0-42f4-824d-36dfd5f71ea0︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠31972d6a-19f7-4664-92aa-8743f866c24bi︠
%html
<p>The Lie derivative of a vector field along another one is the <strong>commutator</strong> of the two vectors fields:</p>

︡3fa8aeae-b2c6-4ab2-89c3-bdc8bdc8baf8︡︡{"done":true,"html":"<p>The Lie derivative of a vector field along another one is the <strong>commutator</strong> of the two vectors fields:</p>"}
︠4ec55a35-169e-44ac-ae61-fe813fa985cfs︠
v.lie_der(u)(f) == u(v(f)) - v(u(f))
︡d9c2577c-cad5-4fe7-b7b2-bf94949529ae︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠8e030167-4b0d-4804-891a-3282982f0b0fi︠
%html
<h2>Tensor fields of arbitrary rank</h2>
<p>Up to now, we have encountered tensor fields</p>
<ul>
<li>of type (0,0) (i.e. scalar fields),</li>
<li>of type (1,0) (i.e. vector fields),</li>
<li>of type (0,1) (i.e. 1-forms),</li>
<li>of type (0,2) and antisymmetric (i.e. 2-forms).</li>
</ul>
<p>More generally, tensor fields of any type $(p,q)$ can be introduced in SageManifolds. For instance a tensor field of type (1,2) on the open subset $U$ is declared as follows:</p>

︡6b42f3ad-a8d9-4de3-9600-37a62b3d98d0︡︡{"done":true,"html":"<h2>Tensor fields of arbitrary rank</h2>\n<p>Up to now, we have encountered tensor fields</p>\n<ul>\n<li>of type (0,0) (i.e. scalar fields),</li>\n<li>of type (1,0) (i.e. vector fields),</li>\n<li>of type (0,1) (i.e. 1-forms),</li>\n<li>of type (0,2) and antisymmetric (i.e. 2-forms).</li>\n</ul>\n<p>More generally, tensor fields of any type $(p,q)$ can be introduced in SageManifolds. For instance a tensor field of type (1,2) on the open subset $U$ is declared as follows:</p>"}
︠3a20fdd8-5d93-44ec-a8dc-e4f0f0790b7as︠
t = U.tensor_field(1, 2, name='T') ; print t
︡f208003c-51bd-4cf8-8eff-7413df8f52cb︡︡{"stdout":"tensor field 'T' of type (1,2) on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠20f1653c-ca54-46d9-84ff-aae74d33a75bi︠
%html
<p>As for vectors or 1-forms, the tensor's components with respect to the domain's default frame are set by means of square brackets:</p>

︡fdd7fb6c-c019-4eee-9c87-e04595d8a5e1︡︡{"done":true,"html":"<p>As for vectors or 1-forms, the tensor's components with respect to the domain's default frame are set by means of square brackets:</p>"}
︠cb5af8eb-abb3-48ce-9ff9-466e4ac28d36s︠
t[1,2,1] = 1 + x^2
t[3,2,1] = x*y*z
︡72414bc7-f1b0-49da-a651-761f9452fb77︡︡{"done":true}
︠249dbdea-e836-443a-ac2d-ef39079bddd6i︠
%html
<p>Unset components are zero:</p>

︡67596379-1da2-4e02-b020-1d671ddd3ad7︡︡{"done":true,"html":"<p>Unset components are zero:</p>"}
︠f9b11e12-0fdb-4426-a2ea-b6ea2b788da6s︠
t.display()
︡25d99353-4bff-4da9-8d20-6b4cf6b3d1bb︡︡{"html":"<div>$T = \\left( x^{2} + 1 \\right) \\frac{\\partial}{\\partial x }\\otimes \\mathrm{d} y\\otimes \\mathrm{d} x + x y z \\frac{\\partial}{\\partial z }\\otimes \\mathrm{d} y\\otimes \\mathrm{d} x$</div>","done":false}︡{"done":true}
︠1c58a395-9df5-4a67-93f8-d7682ad10939s︠
t[:]
︡8aa07a51-9a95-4461-ab97-50bc01178f6b︡︡{"html":"<div>[[[$0$, $0$, $0$], [$x^{2} + 1$, $0$, $0$], [$0$, $0$, $0$]], [[$0$, $0$, $0$], [$0$, $0$, $0$], [$0$, $0$, $0$]], [[$0$, $0$, $0$], [$x y z$, $0$, $0$], [$0$, $0$, $0$]]]</div>","done":false}︡{"done":true}
︠781b5296-4cc6-45bb-8d8f-89fdea4a83e5i︠
%html
<p>Display of the nonzero components:</p>

︡710c5a54-f4b6-4f52-ace6-800de1c520b2︡︡{"done":true,"html":"<p>Display of the nonzero components:</p>"}
︠3e83f60d-03a4-45b0-bacc-7da3de698f24s︠
t.display_comp()
︡50a1422a-2ff6-40c5-bcca-8d80a47971f7︡︡{"html":"<div>$\\begin{array}{lcl} T_{ \\phantom{\\, x } \\, y \\, x }^{ \\, x \\phantom{\\, y } \\phantom{\\, x } } &amp; = &amp; x^{2} + 1 \\\\ T_{ \\phantom{\\, z } \\, y \\, x }^{ \\, z \\phantom{\\, y } \\phantom{\\, x } } &amp; = &amp; x y z \\end{array}$</div>","done":false}︡{"done":true}
︠eb8b09f5-ec9c-4d1f-b31e-a02c17ae8b45i︠
%html
<p>Double square brackets return the component (still w.r.t. the default frame) as a scalar field, while single square brackets return the expression of this scalar field in terms of the domain's default coordinates:</p>

︡a8c9c0f9-b28e-437f-8e35-a5424df3da17︡︡{"done":true,"html":"<p>Double square brackets return the component (still w.r.t. the default frame) as a scalar field, while single square brackets return the expression of this scalar field in terms of the domain's default coordinates:</p>"}
︠959974bf-9d5c-4da2-b3ef-3e0bddd1be1bs︠
print t[[1,2,1]] ; t[[1,2,1]].display()
︡c0671986-dbcb-4844-be7e-7a43bce8a2cd︡︡{"stdout":"scalar field on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} &amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; x^{2} + 1 \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; r^{2} \\cos\\left({\\phi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} + 1 \\end{array}$</div>","done":false}︡{"done":true}
︠f2a6cd21-8a50-48bc-b266-e2ef10f6e3des︠
print t[1,2,1] ; t[1,2,1]
︡b9189d2c-405f-4193-9345-bdcec19a0ae9︡︡{"stdout":"x^2 + 1\n","done":false}︡{"html":"<div>$x^{2} + 1$</div>","done":false}︡{"done":true}
︠3034fe9c-9ce7-44e5-92ac-eb7c3ee6c211i︠
%html
<p>A tensor field of type (1,2) maps a 3-tuple (1-form, vector field, vector field) to a scalar field:</p>

︡bd345d02-b702-4458-b5af-103a8025f3fe︡︡{"done":true,"html":"<p>A tensor field of type (1,2) maps a 3-tuple (1-form, vector field, vector field) to a scalar field:</p>"}
︠f8185a4f-1fc4-4753-995a-1e6d185cb26es︠
print t(om, u, v) ; t(om, u, v).display()
︡7a1aef37-07b1-4836-bc8e-b035c14e782d︡︡{"stdout":"scalar field 'T(omega,u,v)' on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} T\\left(\\omega,u,v\\right):&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; {\\left(x^{2} + 1\\right)} y^{3} u_{y}\\left(x, y, z\\right) + {\\left(x^{2} + 1\\right)} y^{2} u_{y}\\left(x, y, z\\right) - {\\left(x y^{2} u_{y}\\left(x, y, z\\right) + x y u_{y}\\left(x, y, z\\right)\\right)} z^{2} + {\\left(x^{4} + x^{2}\\right)} y u_{y}\\left(x, y, z\\right) + {\\left(x^{2} y^{2} u_{y}\\left(x, y, z\\right) + x^{2} y u_{y}\\left(x, y, z\\right)\\right)} z + {\\left(x^{4} + x^{2}\\right)} u_{y}\\left(x, y, z\\right) \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; {\\left(r^{5} \\cos\\left({\\phi}\\right)^{2} \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{5} - {\\left({\\left(\\cos\\left({\\phi}\\right)^{4} - \\cos\\left({\\phi}\\right)^{2}\\right)} r^{5} \\cos\\left({\\theta}\\right) - r^{4} \\cos\\left({\\phi}\\right)^{2}\\right)} \\sin\\left({\\theta}\\right)^{4} + {\\left({\\left(\\cos\\left({\\phi}\\right)^{3} - \\cos\\left({\\phi}\\right)\\right)} r^{5} \\cos\\left({\\theta}\\right)^{2} + r^{4} \\cos\\left({\\phi}\\right)^{2} \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) + r^{3} \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)^{3} - {\\left(r^{4} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) - r^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}\\right)} u_{y}\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\cos\\left({\\theta}\\right)\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠a49c7506-0de4-40bc-b3eb-b4bb416507e7i︠
%html
<p>As for vectors and differential forms, the tensor components can be taken in any frame defined on the manifold:</p>

︡cf8c653c-cad0-499f-849e-ac80e3848f16︡︡{"done":true,"html":"<p>As for vectors and differential forms, the tensor components can be taken in any frame defined on the manifold:</p>"}
︠5148bf65-c257-43fd-abf9-a4b878f8a43fs︠
t[Y.frame(), 1,1,1, Y]
︡7976ba93-9da0-4b26-9c0a-67e19a93cd9c︡︡{"html":"<div>$r^{2} \\cos\\left({\\phi}\\right)^{4} \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{5} + {\\left(\\cos\\left({\\phi}\\right)^{4} - \\cos\\left({\\phi}\\right)^{2}\\right)} r^{3} \\sin\\left({\\theta}\\right)^{6} - {\\left(\\cos\\left({\\phi}\\right)^{4} - \\cos\\left({\\phi}\\right)^{2}\\right)} r^{3} \\sin\\left({\\theta}\\right)^{4} + \\cos\\left({\\phi}\\right)^{2} \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{3}$</div>","done":false}︡{"done":true}
︠8d9f7745-9fbd-4c23-addd-153962cd4c51i︠
%html
<h2>Tensor calculus</h2>
<p>The<strong> tensor product</strong> is denoted by *:</p>

︡72ff4cd9-d3cb-4473-990a-502f41dfa493︡︡{"done":true,"html":"<h2>Tensor calculus</h2>\n<p>The<strong> tensor product</strong> is denoted by *:</p>"}
︠86b76f4e-1b85-48fe-9a5a-f44deea02aa8s︠
v.tensor_type() ; a.tensor_type()
︡f2291d3f-9a13-40e9-b0b7-bc01dbe3e6cf︡︡{"html":"<div>($1$, $0$)</div>","done":false}︡{"html":"<div>($0$, $2$)</div>","done":false}︡{"done":true}
︠8bd05f85-de32-4368-b139-621344d5d35es︠
b = v*a ; print b ; b
︡4513418e-8aa5-4558-8fb7-d85f12dda303︡︡{"stdout":"tensor field 'v*A' of type (1,2) on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$v\\otimes A$</div>","done":false}︡{"done":true}
︠83c78afb-19cb-49b7-84e0-e0534fdbf2dei︠
%html
<p>The tensor product preserves the (anti)symmetries: since $A$ is a 2-form, it is antisymmetric with respect to its two arguments (positions 0 and 1); as a result, b is antisymmetric with respect to its last two arguments (positions 1 and 2):</p>

︡68f7052a-2330-4cd4-a610-92fecd2f52a9︡︡{"done":true,"html":"<p>The tensor product preserves the (anti)symmetries: since $A$ is a 2-form, it is antisymmetric with respect to its two arguments (positions 0 and 1); as a result, b is antisymmetric with respect to its last two arguments (positions 1 and 2):</p>"}
︠97fced17-1f49-449e-91c3-a13e624cdcafs︠
a.symmetries()
︡78143a78-00e6-479d-9088-6cbadcd6f05f︡︡{"stdout":"no symmetry; antisymmetry: (0, 1)\n","done":false}︡{"done":true}
︠02772967-2ce3-4cb0-834d-a8c7e618200es︠
b.symmetries()
︡7b51744e-ab27-4fb6-8b08-115d6692ea66︡︡{"stdout":"no symmetry; antisymmetry: (1, 2)\n","done":false}︡{"done":true}
︠f2e69fa9-110c-4b14-8ef7-aefbc80e03d8i︠
%html
<p>Standard<strong> tensor arithmetics</strong> is implemented:</p>

︡6589c29f-213f-4503-838d-28b81df17911︡︡{"done":true,"html":"<p>Standard<strong> tensor arithmetics</strong> is implemented:</p>"}
︠2bed6170-9e01-4dda-82d4-c2f300a3b2a5s︠
s = - t + 2*f* b ; print s
︡0e29b1db-549b-4a62-8f61-91a02742b961︡︡{"stdout":"tensor field of type (1,2) on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠b3c788a3-2301-4a2d-8f69-c49172c530afi︠
%html
<p><strong>Tensor contractions</strong> are dealt with by the methods <span style="font-family: courier new,courier;">trace()</span> and <span style="font-family: courier new,courier;">contract()</span>: for instance, let us contract the tensor $T$ w.r.t. its first two arguments (positions 0 and 1), i.e. let us form the tensor $c$ of components $c_i = T^k_{\ \, k i}$:</p>

︡9b4b538b-24a2-4c9e-b87c-9779eceda162︡︡{"done":true,"html":"<p><strong>Tensor contractions</strong> are dealt with by the methods <span style=\"font-family: courier new,courier;\">trace()</span> and <span style=\"font-family: courier new,courier;\">contract()</span>: for instance, let us contract the tensor $T$ w.r.t. its first two arguments (positions 0 and 1), i.e. let us form the tensor $c$ of components $c_i = T^k_{\\ \\, k i}$:</p>"}
︠76df2640-66b0-4d2a-88b5-cb7ae2a68bafs︠
c = t.trace(0,1)
print c
︡77c7f3df-7f4e-4ba8-9d7f-f62d95e160b1︡︡{"stdout":"1-form on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠b9393234-cd3a-4f40-bec5-3e526ad8dcadi︠
%html
<p>An alternative to the writing <span style="font-family: courier new,courier;">trace(0,1)</span> is to use the <strong>index notation</strong> to denote the contraction: the indices are given in a string inside the [] operator, with '^' in front of the contravariant indices and '_' in front of the covariant ones:</p>

︡298519db-e601-4900-8771-5cb7523ceacc︡︡{"done":true,"html":"<p>An alternative to the writing <span style=\"font-family: courier new,courier;\">trace(0,1)</span> is to use the <strong>index notation</strong> to denote the contraction: the indices are given in a string inside the [] operator, with '^' in front of the contravariant indices and '_' in front of the covariant ones:</p>"}
︠85545833-2773-45da-8a51-c8d2831d1dfbs︠
c1 = t['^k_ki']
print c1
c1 == c
︡efc4df97-c64c-420e-a20d-c73f1b412678︡︡{"stdout":"1-form on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠d42047b9-3882-4214-9769-3a2809d5afeai︠
%html
<p>The contraction is performed on the repeated index (here k); the letter denoting the remaining index (here i) is arbitrary:</p>

︡dc56652e-d362-499a-9317-5ece116c73a4︡︡{"done":true,"html":"<p>The contraction is performed on the repeated index (here k); the letter denoting the remaining index (here i) is arbitrary:</p>"}
︠a75e6ef6-5401-4dc5-ba33-50d452664cd7s︠
t['^k_kj'] == c
︡0ae17370-673c-4537-a25c-932cba2cc1fe︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠79941446-adf3-43a3-8816-cce0f498cb4as︠
t['^b_ba'] == c
︡444d231d-918a-49ea-b9c8-b7f2cdae3c11︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠a6aba202-f8eb-4b55-a5f3-1e861766ddb5i︠
%html
<p>It can even be replaced by a dot:</p>

︡f55d76e5-3e36-48a7-8dc1-a40d89890734︡︡{"done":true,"html":"<p>It can even be replaced by a dot:</p>"}
︠5fd3de9a-ab18-43ac-b984-058027c0ea21s︠
t['^k_k.'] == c
︡ffa34b39-228f-44b7-ac60-cdc0410e33df︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠4ee8ca8c-b8b5-4b66-a005-76b90e8c5b73i︠
%html
<p>LaTeX notations are allowed:</p>

︡a9029b9e-96d9-4f50-9b8d-12dd941a0e5d︡︡{"done":true,"html":"<p>LaTeX notations are allowed:</p>"}
︠80866545-96bb-4afd-98a1-867bdfaae525s︠
t['^{k}_{ki}'] == c
︡9dfebe80-59de-4afe-85b0-4a7b82a7b757︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠b25548fd-6698-47d0-931c-00f876dc9c1ai︠
%html
<p>The contraction $T^i_{\ j k} v^k$ of the tensor fields $T$ and $v$ is taken as follows (2 refers to the last index position of $T$ and 0 to the only index position of v):</p>

︡53ef268c-7983-42d1-950a-27773344054b︡︡{"done":true,"html":"<p>The contraction $T^i_{\\ j k} v^k$ of the tensor fields $T$ and $v$ is taken as follows (2 refers to the last index position of $T$ and 0 to the only index position of v):</p>"}
︠b64fb6dc-0a17-46a2-ac5b-00bf157dce82s︠
tv = t.contract(2, v, 0)
print tv
︡bf0124ea-4ff9-46cf-bd43-14377ee7b550︡︡{"stdout":"tensor field of type (1,1) on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠bf5cb16a-1ad0-4549-bddc-5550010a8d1ci︠
%html
<p>Since 2 corresponds to the last index position of $T$ and 0 to the first index position of $v$, a shortcut for the above is</p>

︡da080a42-3922-44d1-8301-f788fcd77710︡︡{"done":true,"html":"<p>Since 2 corresponds to the last index position of $T$ and 0 to the first index position of $v$, a shortcut for the above is</p>"}
︠b0a73b1f-38e9-4888-9054-6eb7f2fc1e4as︠
tv1 = t.contract(v)
print tv1
︡c890f9de-3713-45fd-a67f-4a97eaeb8ef3︡︡{"stdout":"tensor field of type (1,1) on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠ca3f7783-689e-4c5e-9d81-1ce4c698809cs︠
tv1 == tv
︡33c1c20f-c593-4eaa-9912-1e2fd49596ad︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠0c63059d-02ba-40fe-87cb-4d0503e65d22i︠
%html
<p>Instead of <span style="font-family: courier new,courier;">contract()</span>, the <strong>index notation</strong>, combined with the <strong>*</strong> operator, can be used to denote the contraction:</p>

︡c1476adb-6b29-4416-b6e6-9cea064a11be︡︡{"done":true,"html":"<p>Instead of <span style=\"font-family: courier new,courier;\">contract()</span>, the <strong>index notation</strong>, combined with the <strong>*</strong> operator, can be used to denote the contraction:</p>"}
︠1b282387-5d3b-471b-919e-97256358bba3s︠
t['^i_jk']*v['^k'] == tv
︡9fb5ea94-1192-4cc8-835c-630728be90d4︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠48379a9f-0b4e-4981-9f23-0a6ce1cbddffi︠
%html
<p>The non-repeated indices can be replaced by dots:</p>

︡42cbbd8f-68df-4857-ae05-9042afaed9bd︡︡{"done":true,"html":"<p>The non-repeated indices can be replaced by dots:</p>"}
︠8f6625b8-4da5-4888-8084-edf0510632dbs︠
t['^._.k']*v['^k'] == tv
︡c96583ad-4082-468d-91fb-3f7c597e5762︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠2488af32-a484-40d2-8832-9de3b307452ai︠
%html
<h2>Metric structures</h2>
<p>A <strong>Riemannian metric</strong> on the manifold $\mathcal{M}$ is declared as follows:</p>

︡9cffd833-31a0-475b-99e6-6dcb893f28fb︡︡{"done":true,"html":"<h2>Metric structures</h2>\n<p>A <strong>Riemannian metric</strong> on the manifold $\\mathcal{M}$ is declared as follows:</p>"}
︠9d5bf35b-20a9-44ec-83d5-0f1ef584a6f4s︠
g = M.riemann_metric('g')
print g
︡975c4f60-126d-4dbb-a03f-29cac8af8ffa︡︡{"stdout":"Riemannian metric 'g' on the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠44b554ec-1646-43d3-8216-dc3157f4054ei︠
%html
<p>It is a symmetric tensor field of type (0,2):</p>

︡ada03e88-f457-49fb-9883-a799e34b8c54︡︡{"done":true,"html":"<p>It is a symmetric tensor field of type (0,2):</p>"}
︠04210564-e32b-4268-9f19-be7681d0b2efs︠
g.parent()
︡025c51f5-7c9f-45a5-a228-5c4768a820b1︡︡{"html":"<div>$\\mathcal{T}^{(0,2)}\\left(\\mathcal{M}\\right)$</div>","done":false}︡{"done":true}
︠879bf727-74a7-41dd-aa82-2073b76ca26as︠
print g.parent()
︡1941142c-17db-4dcc-90bf-da3358502777︡︡{"stdout":"free module T^(0,2)(M) of type-(0,2) tensors fields on the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠0c8740e2-8310-4547-9377-9976c6d099cfs︠
g.symmetries()
︡800da029-fc65-4cbd-a3e2-5ca536b4c4ef︡︡{"stdout":"symmetry: (0, 1); no antisymmetry\n","done":false}︡{"done":true}
︠e3961b31-d633-4e4d-a300-d592dfbf10f2i︠
%html
<p>The metric is initialized by its components with respect to some vector frame. For instance, using the default frame of $\mathcal{M}$:</p>

︡36956fdc-f0ac-4d9a-b104-d6c3f1758f91︡︡{"done":true,"html":"<p>The metric is initialized by its components with respect to some vector frame. For instance, using the default frame of $\\mathcal{M}$:</p>"}
︠b1c02716-9417-4bfd-843c-80973251d05bs︠
g[1,1], g[2,2], g[3,3] = 1, 1, 1
g.display()
︡9c08052d-5071-4b44-96d4-79daecd8fc0e︡︡{"html":"<div>$g = \\mathrm{d} x\\otimes \\mathrm{d} x+\\mathrm{d} y\\otimes \\mathrm{d} y+\\mathrm{d} z\\otimes \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠08049c14-7c20-4a94-8031-ddbc5f9114a2i︠
%html
<p>The components w.r.t. another vector frame are obtained as for any tensor field:</p>

︡9ae05b0c-ac16-41a0-bbbe-3627bc4d9442︡︡{"done":true,"html":"<p>The components w.r.t. another vector frame are obtained as for any tensor field:</p>"}
︠baec1f49-d947-4c69-af41-42ee1f0d2113s︠
g.display(Y.frame(), Y)
︡32d6c770-0fa4-49ff-a006-3c80cef12db3︡︡{"html":"<div>$g = \\mathrm{d} r\\otimes \\mathrm{d} r + r^{2} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + r^{2} \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠f175d00d-7b2f-421e-82a3-0b626b8cc719i︠
%html
<p>Of course, the metric acts on vector pairs:</p>

︡deb520ac-17e2-4641-a79f-269aaa4a06c2︡︡{"done":true,"html":"<p>Of course, the metric acts on vector pairs:</p>"}
︠b0d53b67-83d4-4a06-b4d1-b5a7fa1f7ac9s︠
u.display() ; v.display(); print g(u,v) ; g(u,v).display()
︡ae2bc0bd-99d8-4e73-919d-9e97a8326d7f︡︡{"html":"<div>$u = u_{x}\\left(x, y, z\\right) \\frac{\\partial}{\\partial x } + u_{y}\\left(x, y, z\\right) \\frac{\\partial}{\\partial y } + u_{z}\\left(x, y, z\\right) \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"html":"<div>$v = \\left( y + 1 \\right) \\frac{\\partial}{\\partial x } -x \\frac{\\partial}{\\partial y } + x y z \\frac{\\partial}{\\partial z }$</div>","done":false}︡{"stdout":"scalar field 'g(u,v)' on the open subset 'U' of the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} g\\left(u,v\\right):&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; x y z u_{z}\\left(x, y, z\\right) + y u_{x}\\left(x, y, z\\right) - x u_{y}\\left(x, y, z\\right) + u_{x}\\left(x, y, z\\right) \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; r^{3} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{2} u_{z}\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\cos\\left({\\theta}\\right)\\right) - r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) u_{y}\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\cos\\left({\\theta}\\right)\\right) + {\\left(r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) + 1\\right)} u_{x}\\left(r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right), r \\cos\\left({\\theta}\\right)\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠41c098c1-8481-4748-975d-8a543b3c2c56i︠
%html
<p>The <strong>Levi-Civita connection</strong> associated to the metric $g$:</p>

︡e2a9da74-83b9-465c-ae61-23a4ead61a3a︡︡{"done":true,"html":"<p>The <strong>Levi-Civita connection</strong> associated to the metric $g$:</p>"}
︠1991f56b-abe9-437e-a0e5-c6091c62cdfas︠
nabla = g.connection() 
print nabla ; nabla
︡41f5591c-891d-4011-97b3-7b8f282f8def︡︡{"stdout":"Levi-Civita connection 'nabla_g' associated with the Riemannian metric 'g' on the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\nabla_{g}$</div>","done":false}︡{"done":true}
︠8173e250-3d98-475a-974e-5fb21cddeb27i︠
%html
<p>The Christoffel symbols with respect to the manifold's default coordinates:</p>

︡5f924d68-21a3-429c-a3c7-d5732a2a8267︡︡{"done":true,"html":"<p>The Christoffel symbols with respect to the manifold's default coordinates:</p>"}
︠917faa6d-4906-49ec-991e-a67a72a4fd5ds︠
nabla.coef()[:]
︡8f9f7857-5788-4e03-a135-5a0c48ec65fd︡︡{"html":"<div>[[[$0$, $0$, $0$], [$0$, $0$, $0$], [$0$, $0$, $0$]], [[$0$, $0$, $0$], [$0$, $0$, $0$], [$0$, $0$, $0$]], [[$0$, $0$, $0$], [$0$, $0$, $0$], [$0$, $0$, $0$]]]</div>","done":false}︡{"done":true}
︠cbcf8a55-4303-4b15-8018-b373930113e3i︠
%html
<p>The Christoffel symbols with respect to the coordinates $(r,\theta,\phi)$:</p>

︡e173ae67-b835-438b-853b-5043fe9dbbed︡︡{"done":true,"html":"<p>The Christoffel symbols with respect to the coordinates $(r,\\theta,\\phi)$:</p>"}
︠98141ea7-6af1-4da0-9062-fdf4261c02b9s︠
nabla.coef(Y.frame())[:, Y]
︡0e457a90-14c1-42ae-b1f9-c5fe2e5e7772︡︡{"html":"<div>[[[$0$, $0$, $0$], [$0$, $-r$, $0$], [$0$, $0$, $-r \\sin\\left({\\theta}\\right)^{2}$]], [[$0$, $\\frac{1}{r}$, $0$], [$\\frac{1}{r}$, $0$, $0$], [$0$, $0$, $-\\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)$]], [[$0$, $0$, $\\frac{1}{r}$], [$0$, $0$, $\\frac{\\cos\\left({\\theta}\\right)}{\\sin\\left({\\theta}\\right)}$], [$\\frac{1}{r}$, $\\frac{\\cos\\left({\\theta}\\right)}{\\sin\\left({\\theta}\\right)}$, $0$]]]</div>","done":false}︡{"done":true}
︠9df8190c-e422-4dfd-b45a-88083c9ca689i︠
%html
<p>A nice view is obtained via the method<span style="font-family: courier new,courier;"> display() (by default, only the nonzero connection coefficients are shown):<br /></span></p>

︡c72faf23-429b-4a6c-b64d-8205cf3380ec︡︡{"done":true,"html":"<p>A nice view is obtained via the method<span style=\"font-family: courier new,courier;\"> display() (by default, only the nonzero connection coefficients are shown):<br /></span></p>"}
︠dbf6cb3b-6471-4eec-b6ea-cc95466484d2s︠
nabla.display(frame=Y.frame(), chart=Y)
︡7fcb918d-1d90-44a2-9645-ceda01df2e2a︡︡{"html":"<div>$\\begin{array}{lcl} \\Gamma_{ \\phantom{\\, r } \\, {\\theta} \\, {\\theta} }^{ \\, r \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } } &amp; = &amp; -r \\\\ \\Gamma_{ \\phantom{\\, r } \\, {\\phi} \\, {\\phi} }^{ \\, r \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; -r \\sin\\left({\\theta}\\right)^{2} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, r \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, r } \\phantom{\\, {\\theta} } } &amp; = &amp; \\frac{1}{r} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, {\\theta} \\, r }^{ \\, {\\theta} \\phantom{\\, {\\theta} } \\phantom{\\, r } } &amp; = &amp; \\frac{1}{r} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, {\\phi} \\, {\\phi} }^{ \\, {\\theta} \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right) \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, r \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, r } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{1}{r} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, {\\theta} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{\\cos\\left({\\theta}\\right)}{\\sin\\left({\\theta}\\right)} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, {\\phi} \\, r }^{ \\, {\\phi} \\phantom{\\, {\\phi} } \\phantom{\\, r } } &amp; = &amp; \\frac{1}{r} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, {\\phi} \\, {\\theta} }^{ \\, {\\phi} \\phantom{\\, {\\phi} } \\phantom{\\, {\\theta} } } &amp; = &amp; \\frac{\\cos\\left({\\theta}\\right)}{\\sin\\left({\\theta}\\right)} \\end{array}$</div>","done":false}︡{"done":true}
︠f1284825-0d22-4b71-a0ba-211c7d85ffebi︠
%html
<p>The connection acting as a covariant derivative:</p>

︡bea1d9b8-16b8-4292-b28a-2f51c6ed5085︡︡{"done":true,"html":"<p>The connection acting as a covariant derivative:</p>"}
︠c5be84fe-5707-41ab-b94e-eb5b9c1acf24s︠
nab_v = nabla(v)
print nab_v ; nab_v.display()
︡de7a5f17-cbcf-4714-98f6-998288884d46︡︡{"stdout":"tensor field 'nabla_g v' of type (1,1) on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\nabla_{g} v = \\frac{\\partial}{\\partial x }\\otimes \\mathrm{d} y-\\frac{\\partial}{\\partial y }\\otimes \\mathrm{d} x + y z \\frac{\\partial}{\\partial z }\\otimes \\mathrm{d} x + x z \\frac{\\partial}{\\partial z }\\otimes \\mathrm{d} y + x y \\frac{\\partial}{\\partial z }\\otimes \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠7723ce64-f325-4ff8-a30c-f78300b9914ei︠
%html
<p>Being a Levi-Civita connection, $\nabla_g$ is torsion.free:</p>

︡c6c178f1-7d25-4e02-8fac-a58bbd972c34︡︡{"done":true,"html":"<p>Being a Levi-Civita connection, $\\nabla_g$ is torsion.free:</p>"}
︠23778a94-f0d1-4d5f-9001-0fdd00680989s︠
print nabla.torsion() ; nabla.torsion().display()
︡fb1efd90-cdae-4e05-b5a6-35b4b64129e9︡︡{"stdout":"tensor field of type (1,2) on the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠43f5ea31-2a45-4f07-94be-eaeecabef7b8i︠
%html
<p>In the present case, it is also flat:</p>

︡5aad82fe-a656-4b98-aa4e-adf6c66e80ab︡︡{"done":true,"html":"<p>In the present case, it is also flat:</p>"}
︠dfdfca5b-64ec-408c-809e-692780b7c919s︠
print nabla.riemann() ; nabla.riemann().display()
︡633ae123-0a8c-433a-8bb4-dd3c3b511409︡︡{"stdout":"tensor field 'Riem(g)' of type (1,3) on the 3-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\mathrm{Riem}\\left(g\\right) = 0$</div>","done":false}︡{"done":true}
︠ad8547e3-a0d7-443c-867b-f3f2e8bb0d75i︠
%html
<p>Let us consider a non-flat metric, by changing $g_{rr}$ to $1/(1+r^2)$:</p>

︡9b75096d-e58f-4dc7-a04a-c036d37e4081︡︡{"done":true,"html":"<p>Let us consider a non-flat metric, by changing $g_{rr}$ to $1/(1+r^2)$:</p>"}
︠c3ba7164-a626-469b-bdfc-52996cc5a9b7s︠
g[Y.frame(), 1,1, Y] = 1/(1+r^2)
g.display(Y.frame(), Y)
︡49d5f4ca-286e-43f2-8ed7-9823fe541f06︡︡{"html":"<div>$g = \\left( \\frac{1}{r^{2} + 1} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + r^{2} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + r^{2} \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠75b46217-4405-4ca9-92b1-d1a6ddfa5723i︠
%html
<p>For convenience, we change the default chart on the domain $U$ to Y=$(U,(r,\theta,\phi))$:</p>

︡2fd3f73e-4258-4e93-ac75-3df3631ee995︡︡{"done":true,"html":"<p>For convenience, we change the default chart on the domain $U$ to Y=$(U,(r,\\theta,\\phi))$:</p>"}
︠cf8ccc4a-a496-4bcc-a6cf-fb56310b1b8as︠
U.set_default_chart(Y)
︡9d952d68-173d-447d-8929-b5f702afc188︡︡{"done":true}
︠5ce42986-d5ac-4470-9b60-0778dede0b71i︠
%html
<p>In this way, we do not have to specify Y when asking for coordinate expressions in terms of $(r,\theta,\phi)$:</p>

︡b9fe5291-663c-4928-b2e7-7fdaae8809a0︡︡{"done":true,"html":"<p>In this way, we do not have to specify Y when asking for coordinate expressions in terms of $(r,\\theta,\\phi)$:</p>"}
︠9e73c46d-be39-4356-8e69-33334c7bf5f2s︠
g.display(Y.frame())
︡781b70f7-8dcc-4e2b-9fc9-824eff2432b9︡︡{"html":"<div>$g = \\left( \\frac{1}{r^{2} + 1} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + r^{2} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + r^{2} \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠507ed47a-1da1-4d6e-96ac-76eb8555331ai︠
%html
<p>We recognize the metric of the hyperbolic space $\mathbb{H}^3$. Its expression in terms of the chart $(U,(x,y,z))$ is</p>

︡5d974623-1b44-41bf-84e5-c023d4aca48f︡︡{"done":true,"html":"<p>We recognize the metric of the hyperbolic space $\\mathbb{H}^3$. Its expression in terms of the chart $(U,(x,y,z))$ is</p>"}
︠b0c761bd-9315-4307-8fb8-4c3bb06e2dbas︠
g.display(X_U.frame(), X_U)
︡63724edc-ea65-414a-b7c9-22ccdbfbfffe︡︡{"html":"<div>$g = \\left( \\frac{y^{2} + z^{2} + 1}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} x\\otimes \\mathrm{d} x + \\left( -\\frac{x y}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} x\\otimes \\mathrm{d} y + \\left( -\\frac{x z}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} x\\otimes \\mathrm{d} z + \\left( -\\frac{x y}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} y\\otimes \\mathrm{d} x + \\left( \\frac{x^{2} + z^{2} + 1}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} y\\otimes \\mathrm{d} y + \\left( -\\frac{y z}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} y\\otimes \\mathrm{d} z + \\left( -\\frac{x z}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} z\\otimes \\mathrm{d} x + \\left( -\\frac{y z}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} z\\otimes \\mathrm{d} y + \\left( \\frac{x^{2} + y^{2} + 1}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} z\\otimes \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠d1857de6-06b2-4bc4-a4f1-83bb7ac698d3i︠
%html
<p>A matrix view of the components may be more appropriate:</p>

︡650a277c-2ebf-49e8-9087-03185d7b8c3d︡︡{"done":true,"html":"<p>A matrix view of the components may be more appropriate:</p>"}
︠4fa75af8-0d7d-4ca3-823f-222dbba69b41s︠
g[X_U.frame(), :, X_U]
︡ec83ceba-5fcb-45fe-9d08-537ecadfe17a︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n\\frac{y^{2} + z^{2} + 1}{x^{2} + y^{2} + z^{2} + 1} &amp; -\\frac{x y}{x^{2} + y^{2} + z^{2} + 1} &amp; -\\frac{x z}{x^{2} + y^{2} + z^{2} + 1} \\\\\n-\\frac{x y}{x^{2} + y^{2} + z^{2} + 1} &amp; \\frac{x^{2} + z^{2} + 1}{x^{2} + y^{2} + z^{2} + 1} &amp; -\\frac{y z}{x^{2} + y^{2} + z^{2} + 1} \\\\\n-\\frac{x z}{x^{2} + y^{2} + z^{2} + 1} &amp; -\\frac{y z}{x^{2} + y^{2} + z^{2} + 1} &amp; \\frac{x^{2} + y^{2} + 1}{x^{2} + y^{2} + z^{2} + 1}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠0262c562-8dd8-4959-839a-7aaa9f7d8215i︠
%html
<p>We extend these components, a priori defined only on $U$, to the whole manifold $\mathcal{M}$, by demanding the same coordinate expressions in the frame associated to the chart X=$(\mathcal{M},(x,y,z))$:</p>

︡9dec611c-38a1-4a75-b582-789987883b89︡︡{"done":true,"html":"<p>We extend these components, a priori defined only on $U$, to the whole manifold $\\mathcal{M}$, by demanding the same coordinate expressions in the frame associated to the chart X=$(\\mathcal{M},(x,y,z))$:</p>"}
︠acfb7abd-12bb-4ba2-8004-b9a1fddb44fes︠
g.add_comp_by_continuation(X.frame(), U, X)
g.display()
︡b75a897d-c293-461e-b34e-4bca57552609︡︡{"html":"<div>$g = \\left( \\frac{y^{2} + z^{2} + 1}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} x\\otimes \\mathrm{d} x + \\left( -\\frac{x y}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} x\\otimes \\mathrm{d} y + \\left( -\\frac{x z}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} x\\otimes \\mathrm{d} z + \\left( -\\frac{x y}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} y\\otimes \\mathrm{d} x + \\left( \\frac{x^{2} + z^{2} + 1}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} y\\otimes \\mathrm{d} y + \\left( -\\frac{y z}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} y\\otimes \\mathrm{d} z + \\left( -\\frac{x z}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} z\\otimes \\mathrm{d} x + \\left( -\\frac{y z}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} z\\otimes \\mathrm{d} y + \\left( \\frac{x^{2} + y^{2} + 1}{x^{2} + y^{2} + z^{2} + 1} \\right) \\mathrm{d} z\\otimes \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠8b68922f-49f5-4266-b539-a52e021f5678i︠
%html
<p>The Levi-Civita connection is automatically recomputed, after the change in $g$:</p>

︡e2916ed8-7390-4390-9a78-aa63e79332cb︡︡{"done":true,"html":"<p>The Levi-Civita connection is automatically recomputed, after the change in $g$:</p>"}
︠0a3920a5-6533-45d8-aceb-96f40d96fc68s︠
nabla = g.connection()
︡902c130a-141c-42b7-b8eb-e8638c869d7d︡︡{"done":true}
︠135cc092-d5d6-4c3a-aed2-4342fe995aeei︠
%html
<p>In particular, the Christoffel symbols are different:</p>

︡16d455a5-a71b-4dee-b551-91a947d69138︡︡{"done":true,"html":"<p>In particular, the Christoffel symbols are different:</p>"}
︠2c81a460-a8d3-4add-b57b-1e3c98e7fcc2s︠
nabla.display(only_nonredundant=True)
︡4a4722b5-7f10-4225-b51c-f425b845394d︡︡{"html":"<div>$\\begin{array}{lcl} \\Gamma_{ \\phantom{\\, x } \\, x \\, x }^{ \\, x \\phantom{\\, x } \\phantom{\\, x } } &amp; = &amp; -\\frac{x y^{2} + x z^{2} + x}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, x } \\, x \\, y }^{ \\, x \\phantom{\\, x } \\phantom{\\, y } } &amp; = &amp; \\frac{x^{2} y}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, x } \\, x \\, z }^{ \\, x \\phantom{\\, x } \\phantom{\\, z } } &amp; = &amp; \\frac{x^{2} z}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, x } \\, y \\, y }^{ \\, x \\phantom{\\, y } \\phantom{\\, y } } &amp; = &amp; -\\frac{x^{3} + x z^{2} + x}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, x } \\, y \\, z }^{ \\, x \\phantom{\\, y } \\phantom{\\, z } } &amp; = &amp; \\frac{x y z}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, x } \\, z \\, z }^{ \\, x \\phantom{\\, z } \\phantom{\\, z } } &amp; = &amp; -\\frac{x^{3} + x y^{2} + x}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, y } \\, x \\, x }^{ \\, y \\phantom{\\, x } \\phantom{\\, x } } &amp; = &amp; -\\frac{y^{3} + y z^{2} + y}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, y } \\, x \\, y }^{ \\, y \\phantom{\\, x } \\phantom{\\, y } } &amp; = &amp; \\frac{x y^{2}}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, y } \\, x \\, z }^{ \\, y \\phantom{\\, x } \\phantom{\\, z } } &amp; = &amp; \\frac{x y z}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, y } \\, y \\, y }^{ \\, y \\phantom{\\, y } \\phantom{\\, y } } &amp; = &amp; -\\frac{y z^{2} + {\\left(x^{2} + 1\\right)} y}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, y } \\, y \\, z }^{ \\, y \\phantom{\\, y } \\phantom{\\, z } } &amp; = &amp; \\frac{y^{2} z}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, y } \\, z \\, z }^{ \\, y \\phantom{\\, z } \\phantom{\\, z } } &amp; = &amp; -\\frac{y^{3} + {\\left(x^{2} + 1\\right)} y}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, z } \\, x \\, x }^{ \\, z \\phantom{\\, x } \\phantom{\\, x } } &amp; = &amp; -\\frac{z^{3} + {\\left(y^{2} + 1\\right)} z}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, z } \\, x \\, y }^{ \\, z \\phantom{\\, x } \\phantom{\\, y } } &amp; = &amp; \\frac{x y z}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, z } \\, x \\, z }^{ \\, z \\phantom{\\, x } \\phantom{\\, z } } &amp; = &amp; \\frac{x z^{2}}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, z } \\, y \\, y }^{ \\, z \\phantom{\\, y } \\phantom{\\, y } } &amp; = &amp; -\\frac{z^{3} + {\\left(x^{2} + 1\\right)} z}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, z } \\, y \\, z }^{ \\, z \\phantom{\\, y } \\phantom{\\, z } } &amp; = &amp; \\frac{y z^{2}}{x^{2} + y^{2} + z^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, z } \\, z \\, z }^{ \\, z \\phantom{\\, z } \\phantom{\\, z } } &amp; = &amp; -\\frac{{\\left(x^{2} + y^{2} + 1\\right)} z}{x^{2} + y^{2} + z^{2} + 1} \\end{array}$</div>","done":false}︡{"done":true}
︠b7cfe1af-9afc-4a80-a6ff-55a97f94644cs︠
nabla.display(frame=Y.frame(), chart=Y, only_nonredundant=True)
︡075afbd3-46d9-4294-8669-76cb8f08ca38︡︡{"html":"<div>$\\begin{array}{lcl} \\Gamma_{ \\phantom{\\, r } \\, r \\, r }^{ \\, r \\phantom{\\, r } \\phantom{\\, r } } &amp; = &amp; -\\frac{r}{r^{2} + 1} \\\\ \\Gamma_{ \\phantom{\\, r } \\, {\\theta} \\, {\\theta} }^{ \\, r \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } } &amp; = &amp; -r^{3} - r \\\\ \\Gamma_{ \\phantom{\\, r } \\, {\\phi} \\, {\\phi} }^{ \\, r \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; -{\\left(r^{3} + r\\right)} \\sin\\left({\\theta}\\right)^{2} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, r \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, r } \\phantom{\\, {\\theta} } } &amp; = &amp; \\frac{1}{r} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, {\\phi} \\, {\\phi} }^{ \\, {\\theta} \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right) \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, r \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, r } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{1}{r} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, {\\theta} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{\\cos\\left({\\theta}\\right)}{\\sin\\left({\\theta}\\right)} \\end{array}$</div>","done":false}︡{"done":true}
︠10e85d74-6f81-4658-9810-c703e2194317i︠
%html
<p>The <strong>Riemann tensor</strong> is now</p>

︡cbc1d96b-c730-47e4-b1b8-2d51361562c4︡︡{"done":true,"html":"<p>The <strong>Riemann tensor</strong> is now</p>"}
︠11bf71e2-8ab6-4b1a-a0d3-e7024b918082s︠
Riem = nabla.riemann()
print Riem ; Riem.display(Y.frame())
︡802f808f-b5af-4325-ad1e-b192fc01c807︡︡{"stdout":"tensor field 'Riem(g)' of type (1,3) on the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\mathrm{Riem}\\left(g\\right) = -r^{2} \\frac{\\partial}{\\partial r }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} r\\otimes \\mathrm{d} {\\theta} + r^{2} \\frac{\\partial}{\\partial r }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} r -r^{2} \\sin\\left({\\theta}\\right)^{2} \\frac{\\partial}{\\partial r }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} r\\otimes \\mathrm{d} {\\phi} + r^{2} \\sin\\left({\\theta}\\right)^{2} \\frac{\\partial}{\\partial r }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} r + \\left( \\frac{1}{r^{2} + 1} \\right) \\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} r\\otimes \\mathrm{d} r\\otimes \\mathrm{d} {\\theta} + \\left( -\\frac{1}{r^{2} + 1} \\right) \\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} r\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} r -r^{2} \\sin\\left({\\theta}\\right)^{2} \\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\phi} + r^{2} \\sin\\left({\\theta}\\right)^{2} \\frac{\\partial}{\\partial {\\theta} }\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\theta} + \\left( \\frac{1}{r^{2} + 1} \\right) \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} r\\otimes \\mathrm{d} r\\otimes \\mathrm{d} {\\phi} + \\left( -\\frac{1}{r^{2} + 1} \\right) \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} r\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} r + r^{2} \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\phi} -r^{2} \\frac{\\partial}{\\partial {\\phi} }\\otimes \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\theta}$</div>","done":false}︡{"done":true}
︠60d3f64f-ad3a-4c85-9a0e-cc0fcff336bfi︠
%html
<p>Note that it can be accessed directely via the metric, without any explicit mention of the connection:</p>

︡3f9766d2-f9c7-4a94-bcfe-6816374d545f︡︡{"done":true,"html":"<p>Note that it can be accessed directely via the metric, without any explicit mention of the connection:</p>"}
︠a9b92f83-b2d3-4155-a29d-a382de8e3924s︠
g.riemann() is nabla.riemann()
︡7a447441-71dd-4ba9-b629-3b6cefb1c0ac︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠b109400e-9685-4459-951b-98509115a975i︠
%html
<p>The <strong>Ricci tensor</strong> is</p>

︡51943f88-752f-4ad9-b22a-d28b23d79a15︡︡{"done":true,"html":"<p>The <strong>Ricci tensor</strong> is</p>"}
︠cb6b9141-93cc-4a5f-8001-54ebc190ff71s︠
Ric = g.ricci()
print Ric ; Ric.display(Y.frame())
︡b7d09729-d9f8-49cd-8ac7-edd841ef7eb6︡︡{"stdout":"field of symmetric bilinear forms 'Ric(g)' on the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\mathrm{Ric}\\left(g\\right) = \\left( -\\frac{2}{r^{2} + 1} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r -2 \\, r^{2} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} -2 \\, r^{2} \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠855676a2-4626-45b7-b2de-0ea7953030adi︠
%html
<p>The<strong> Weyl tensor</strong> is:</p>

︡4add3c18-ad14-4962-ac9b-35fe1d764db9︡︡{"done":true,"html":"<p>The<strong> Weyl tensor</strong> is:</p>"}
︠8634ff12-8217-40ab-a758-900d263a9c18s︠
C = g.weyl()
print C ; C.display()
︡7d02d6da-37d5-4293-ab38-732e4c7de97a︡︡{"stdout":"tensor field 'C(g)' of type (1,3) on the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\mathrm{C}\\left(g\\right) = 0$</div>","done":false}︡{"done":true}
︠8b00a654-737a-4dee-a861-bd93038c15c8i︠
%html
<p>The Weyl tensor vanishes identically because the dimension of $\mathcal{M}$ is 3.</p>
<p>Finally, the <strong>Ricci scalar</strong> is </p>

︡ef7886b9-2897-490c-94b9-469a7b767100︡︡{"done":true,"html":"<p>The Weyl tensor vanishes identically because the dimension of $\\mathcal{M}$ is 3.</p>\n<p>Finally, the <strong>Ricci scalar</strong> is </p>"}
︠43d4a442-1800-47b8-8a9a-9e4d20dd4ce7s︠
R = g.ricci_scalar()
print R ; R.display()
︡e895f3fb-7a60-47be-82ee-de9be680d4ed︡︡{"stdout":"scalar field 'r(g)' on the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} \\mathrm{r}\\left(g\\right):&amp; \\mathcal{M} &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; -6 \\\\ \\mbox{on}\\ U : &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; -6 \\end{array}$</div>","done":false}︡{"done":true}
︠ba3ffdd8-027c-430b-8190-7b9c36b17606i︠
%html
<p>We recover the fact that $\mathbb{H}^3$ is a Riemannian manifold of constant negative curvature.</p>

<h2>Tensor transformations induced by a metric</h2>
<p>The most important tensor transformation induced by the metric $g$ is the so-called <strong>musical isomorphism</strong>, or <strong>index raising</strong> and<strong> index lowering</strong>:</p>

︡49cc508c-4f1f-4156-b53f-bc6019a2f043︡︡{"done":true,"html":"<p>We recover the fact that $\\mathbb{H}^3$ is a Riemannian manifold of constant negative curvature.</p>\n\n<h2>Tensor transformations induced by a metric</h2>\n<p>The most important tensor transformation induced by the metric $g$ is the so-called <strong>musical isomorphism</strong>, or <strong>index raising</strong> and<strong> index lowering</strong>:</p>"}
︠732ebf74-388c-4874-ab55-7ef1461f36f5s︠
print t
︡f6476f99-db13-42b6-8484-1ad3552f4dc4︡︡{"stdout":"tensor field 'T' of type (1,2) on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠ff9b8aca-e9da-423c-be72-86464cecc882s︠
t.display()
︡d9cb9a23-e938-4d2f-957d-eb91d4e78a4d︡︡{"html":"<div>$T = \\left( r^{2} \\cos\\left({\\phi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} + 1 \\right) \\frac{\\partial}{\\partial x }\\otimes \\mathrm{d} y\\otimes \\mathrm{d} x + r^{3} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{2} \\frac{\\partial}{\\partial z }\\otimes \\mathrm{d} y\\otimes \\mathrm{d} x$</div>","done":false}︡{"done":true}
︠d2a1a4a7-afa9-412b-98f4-5447d68862e0s︠
t.display(X_U.frame(), X_U)
︡3f9d1822-3be0-42a0-b2ef-338a7a9f92a6︡︡{"html":"<div>$T = \\left( x^{2} + 1 \\right) \\frac{\\partial}{\\partial x }\\otimes \\mathrm{d} y\\otimes \\mathrm{d} x + x y z \\frac{\\partial}{\\partial z }\\otimes \\mathrm{d} y\\otimes \\mathrm{d} x$</div>","done":false}︡{"done":true}
︠37d387cc-3e30-43c9-9814-5b32f76ad3cbi︠
%html
<p>Raising the last index of $T$ with $g$:</p>

︡27bcb89b-0e5a-4a45-be30-cc2cd4282f55︡︡{"done":true,"html":"<p>Raising the last index of $T$ with $g$:</p>"}
︠89e83860-f3f1-4580-991b-f113d14ae1a2s︠
s = t.up(g, 2)
print s
︡8675c2a0-9224-4d3c-ab6c-73a55f5a8524︡︡{"stdout":"tensor field of type (2,1) on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠a50d23fa-d070-45fc-ac34-8c4888533117i︠
%html
<p>Raising all the covariant indices of $T$ (i.e. those at the positions 1 and 2):</p>

︡0b39397f-0e5e-4b2a-b716-88501d541a56︡︡{"done":true,"html":"<p>Raising all the covariant indices of $T$ (i.e. those at the positions 1 and 2):</p>"}
︠b880edd0-6207-4f6c-9d1d-e2a685ae2df6s︠
s = t.up(g)
print s
︡81303aaa-5884-4d65-9d94-d3e4d3509fce︡︡{"stdout":"tensor field of type (3,0) on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠5d0e20e5-d3bd-443a-9146-bcc9d6a14f66s︠
s = t.down(g)
print s
︡5fe9dada-527b-4d5a-9d18-5652fbd239dc︡︡{"stdout":"tensor field of type (0,3) on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠67519935-7144-4496-b89d-bbadc444f927i︠
%html
<h2>Hodge duality</h2>
<p>The volume 3-form (Levi-Civita tensor) associated with the metric $g$ is</p>

︡c7ede082-7585-498e-a084-cae27c80b79d︡︡{"done":true,"html":"<h2>Hodge duality</h2>\n<p>The volume 3-form (Levi-Civita tensor) associated with the metric $g$ is</p>"}
︠65887ac0-f787-4dd1-b1ca-ff2016d9f08ds︠
epsilon = g.volume_form()
print epsilon ; epsilon.display()
︡d7e4c523-8e30-437c-8f68-d8382945f430︡︡{"stdout":"3-form 'eps_g' on the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\epsilon_{g} = \\left( \\frac{1}{\\sqrt{x^{2} + y^{2} + z^{2} + 1}} \\right) \\mathrm{d} x\\wedge \\mathrm{d} y\\wedge \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠2e024ed4-1a89-4369-b991-a919ab82e5ccs︠
epsilon.display(Y.frame())
︡daf2b146-671f-4059-b977-2099085fa791︡︡{"html":"<div>$\\epsilon_{g} = \\left( \\frac{r^{2} \\sin\\left({\\theta}\\right)}{\\sqrt{r^{2} + 1}} \\right) \\mathrm{d} r\\wedge \\mathrm{d} {\\theta}\\wedge \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠e8311d4c-c67d-4174-8445-3b733942b3fas︠
print f ; f.display()
︡d0a65d56-2936-419a-93ae-1af02f933b2d︡︡{"stdout":"scalar field 'f' on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} f:&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; z^{3} + y^{2} + x \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; r^{3} \\cos\\left({\\theta}\\right)^{3} + r^{2} \\sin\\left({\\phi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} + r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠32ca9a11-3fc2-4bcd-892c-f993d78723ecs︠
sf = f.hodge_star(g)
print sf ; sf.display()
︡90544dcf-ee7f-4693-b0f5-7014812cfbc0︡︡{"stdout":"3-form '*f' on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\star f = \\left( \\frac{r^{3} \\cos\\left({\\theta}\\right)^{3} + r^{2} \\sin\\left({\\phi}\\right)^{2} \\sin\\left({\\theta}\\right)^{2} + r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)}{\\sqrt{r^{2} + 1}} \\right) \\mathrm{d} x\\wedge \\mathrm{d} y\\wedge \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠926289b8-334a-47d4-9e1d-e14ef4c9f33ci︠
%html
<p>We check the classical formula $\star f = f\, \epsilon_g$, or, more precisely, $\star f = f\, \epsilon_g|_U$ (for $f$ is defined on $U$ only):</p>

︡809fcd3e-e60e-4771-b75d-2db4fe94d506︡︡{"done":true,"html":"<p>We check the classical formula $\\star f = f\\, \\epsilon_g$, or, more precisely, $\\star f = f\\, \\epsilon_g|_U$ (for $f$ is defined on $U$ only):</p>"}
︠b7246e2d-f9c8-4473-99b2-55d239cb3babs︠
sf == f * epsilon.restrict(U)
︡9c676497-4212-40e7-aa63-19d14d33a089︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠4536b844-bb99-43ad-8612-55237468e2f5i︠
%html
<p>The Hodge dual of a 1-form is a 2-form:</p>

︡b90a203c-9789-4b26-85d2-f8645168f2d8︡︡{"done":true,"html":"<p>The Hodge dual of a 1-form is a 2-form:</p>"}
︠fbebd271-9f81-4b65-8ede-78ffdb787d3es︠
print om ; om.display()
︡e37ee568-c698-45ee-afef-fd7276a8302a︡︡{"stdout":"1-form 'omega' on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\omega = r^{2} \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} x + r \\cos\\left({\\theta}\\right) \\mathrm{d} y + \\left( r \\cos\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) - r \\cos\\left({\\theta}\\right) \\right) \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠7400b54d-25bc-4ec8-954d-4fd75f166a23s︠
som = om.hodge_star(g)
print som ; som.display()
︡758cbbfc-95d9-4940-8aee-8cbe1cec485b︡︡{"stdout":"2-form '*omega' on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\star \\omega = \\left( \\frac{r^{4} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)^{3} - r^{3} \\cos\\left({\\theta}\\right)^{3} - r \\cos\\left({\\theta}\\right) + {\\left(r^{3} {\\left(\\cos\\left({\\phi}\\right) + \\sin\\left({\\phi}\\right)\\right)} \\cos\\left({\\theta}\\right)^{2} + r \\cos\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)}{\\sqrt{r^{2} + 1}} \\right) \\mathrm{d} x\\wedge \\mathrm{d} y + \\left( -\\frac{r^{4} \\cos\\left({\\phi}\\right) \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{4} - r^{3} \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right) + {\\left(\\cos\\left({\\phi}\\right) \\sin\\left({\\phi}\\right) + \\sin\\left({\\phi}\\right)^{2}\\right)} r^{3} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)^{2} + r \\cos\\left({\\theta}\\right)}{\\sqrt{r^{2} + 1}} \\right) \\mathrm{d} x\\wedge \\mathrm{d} z + \\left( \\frac{r^{4} \\cos\\left({\\phi}\\right)^{2} \\sin\\left({\\theta}\\right)^{4} - r^{3} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\theta}\\right) + {\\left({\\left(\\cos\\left({\\phi}\\right)^{2} + \\cos\\left({\\phi}\\right) \\sin\\left({\\phi}\\right)\\right)} r^{3} \\cos\\left({\\theta}\\right) + r^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{\\sqrt{r^{2} + 1}} \\right) \\mathrm{d} y\\wedge \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠be6a5f17-960b-452a-b308-1a4ccaf08509i︠
%html
<p>The Hodge dual of a 2-form is a 1-form:</p>

︡981a9711-2d11-4b43-b173-28952364309b︡︡{"done":true,"html":"<p>The Hodge dual of a 2-form is a 1-form:</p>"}
︠547381c1-023e-4e41-aa47-37ee551c5ac0s︠
print a
︡ee1e982e-0511-4d2a-b1a1-ef74603b990d︡︡{"stdout":"2-form 'A' on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠d2ae98b1-b60a-4f8a-8326-1d5a7a1775f5s︠
sa = a.hodge_star(g)
print sa ; sa.display()
︡eb736761-57f9-4d13-b273-72d9c02024db︡︡{"stdout":"1-form '*A' on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\star A = \\left( \\frac{3 \\, r^{5} \\cos\\left({\\theta}\\right)^{5} + 3 \\, r^{3} \\cos\\left({\\theta}\\right)^{3} + {\\left(3 \\, r^{6} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) - 2 \\, r^{5} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) - 2 \\, r^{4} \\cos\\left({\\phi}\\right) \\sin\\left({\\phi}\\right)^{3}\\right)} \\sin\\left({\\theta}\\right)^{4} + {\\left(2 \\, r^{4} \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right)^{3} + {\\left(\\sin\\left({\\phi}\\right)^{3} - \\sin\\left({\\phi}\\right)\\right)} r^{3}\\right)} \\sin\\left({\\theta}\\right)^{3} + {\\left(3 \\, r^{5} \\cos\\left({\\theta}\\right)^{3} \\sin\\left({\\phi}\\right)^{2} - 2 \\, r^{4} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) + r^{3} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) - 2 \\, r^{2} \\cos\\left({\\phi}\\right) \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)^{2} + {\\left(2 \\, r^{4} \\cos\\left({\\theta}\\right)^{3} \\sin\\left({\\phi}\\right) + r^{3} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{2} + 2 \\, r^{2} \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)}{\\sqrt{r^{2} + 1}} \\right) \\mathrm{d} x + \\left( -\\frac{r^{3} \\cos\\left({\\theta}\\right)^{3} - {\\left(3 \\, {\\left(\\sin\\left({\\phi}\\right)^{2} - 1\\right)} r^{6} \\cos\\left({\\theta}\\right)^{2} - 2 \\, r^{5} \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right)^{2} - 2 \\, {\\left(\\sin\\left({\\phi}\\right)^{4} - \\sin\\left({\\phi}\\right)^{2}\\right)} r^{4}\\right)} \\sin\\left({\\theta}\\right)^{4} + {\\left(2 \\, r^{4} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right)^{2} + {\\left(\\cos\\left({\\phi}\\right) \\sin\\left({\\phi}\\right)^{2} - \\cos\\left({\\phi}\\right)\\right)} r^{3}\\right)} \\sin\\left({\\theta}\\right)^{3} + {\\left(3 \\, r^{6} \\cos\\left({\\theta}\\right)^{4} + 3 \\, r^{5} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{3} \\sin\\left({\\phi}\\right) + 3 \\, r^{4} \\cos\\left({\\theta}\\right)^{2} - {\\left(\\sin\\left({\\phi}\\right)^{2} - 1\\right)} r^{3} \\cos\\left({\\theta}\\right)\\right)} \\sin\\left({\\theta}\\right)^{2} + r \\cos\\left({\\theta}\\right) - {\\left(r^{3} {\\left(\\cos\\left({\\phi}\\right) + \\sin\\left({\\phi}\\right)\\right)} \\cos\\left({\\theta}\\right)^{2} + r \\cos\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)}{\\sqrt{r^{2} + 1}} \\right) \\mathrm{d} y + \\left( \\frac{2 \\, r^{5} \\sin\\left({\\phi}\\right) \\sin\\left({\\theta}\\right)^{5} + {\\left(3 \\, r^{6} \\cos\\left({\\theta}\\right)^{3} \\sin\\left({\\phi}\\right) + 2 \\, r^{4} \\cos\\left({\\phi}\\right)^{2} \\cos\\left({\\theta}\\right) \\sin\\left({\\phi}\\right) + 2 \\, r^{3} \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)^{3} - {\\left(2 \\, r^{4} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) + {\\left(\\cos\\left({\\phi}\\right) \\sin\\left({\\phi}\\right) + 1\\right)} r^{3} \\cos\\left({\\theta}\\right)\\right)} \\sin\\left({\\theta}\\right)^{2} - r \\cos\\left({\\theta}\\right) - {\\left(3 \\, r^{5} \\cos\\left({\\phi}\\right) \\cos\\left({\\theta}\\right)^{4} - r^{3} \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right)}{\\sqrt{r^{2} + 1}} \\right) \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠28f3d87a-c329-4070-b1ed-99a934260516i︠
%html
<p>Finally, the Hodge dual of a 3-form is a 0-form:</p>

︡b4cce5f3-f290-4fab-ac44-fcb82d5fc087︡︡{"done":true,"html":"<p>Finally, the Hodge dual of a 3-form is a 0-form:</p>"}
︠cfb88882-2011-409c-89a3-d3fc3c03c0fes︠
print da ; da.display()
︡976b50d1-6ffb-468e-8a69-ff10ab450f85︡︡{"stdout":"3-form 'dA' on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\mathrm{d}A = \\left( -2 \\, {\\left(3 \\, r^{3} \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) + r \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right) - 1 \\right) \\mathrm{d} x\\wedge \\mathrm{d} y\\wedge \\mathrm{d} z$</div>","done":false}︡{"done":true}
︠90a63b30-0d45-4278-b7f9-afc3f07453dbs︠
sda = da.hodge_star(g)
print sda ; sda.display()
︡8f83341b-4e46-4242-8858-85cdb86e5ca6︡︡{"stdout":"scalar field '*dA' on the open subset 'U' of the 3-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} \\star \\mathrm{d}A:&amp; U &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, z\\right) &amp; \\longmapsto &amp; -{\\left(6 \\, y z^{2} + 2 \\, y + 1\\right)} \\sqrt{x^{2} + y^{2} + z^{2} + 1} \\\\ &amp; \\left(r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; -\\sqrt{r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2} \\sin\\left({\\theta}\\right)^{2} + 1} {\\left(2 \\, {\\left(3 \\, r^{3} \\cos\\left({\\theta}\\right)^{2} \\sin\\left({\\phi}\\right) + r \\sin\\left({\\phi}\\right)\\right)} \\sin\\left({\\theta}\\right) + 1\\right)} \\end{array}$</div>","done":false}︡{"done":true}
︠d100d792-04f4-4b0a-b8c1-2fb3005b95fai︠
%html
<p>In dimension 3 and for a Riemannian metric, the Hodge star is idempotent:</p>

︡995bd5ea-92b0-4eaa-b8b4-84f5c22e5f66︡︡{"done":true,"html":"<p>In dimension 3 and for a Riemannian metric, the Hodge star is idempotent:</p>"}
︠33f99e54-62d4-49dc-bc82-38a687632a9es︠
sf.hodge_star(g) == f
︡2ff916af-90b5-4d44-9b1b-d563cee9357c︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠f248c860-dcfe-4c52-acd1-2a82d4467a74s︠
som.hodge_star(g) == om
︡8d70d452-82c5-4105-acd4-6706ae2ac449︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠65e7a030-de29-43c5-b4db-4aa74fea41e1s︠
sa.hodge_star(g) == a
︡2eb741ec-8a53-43d8-b8a3-3e7eab41e6b2︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠587d645a-ee0c-4785-a89c-e6cf2b750fc5s︠
sda.hodge_star(g) == da
︡de134c10-05e0-46af-840b-d6e3e163cdae︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠c08514b3-0a75-46d3-ad10-cbebdfd26346i︠
%html
<h2>Getting help</h2>
<p><span>To get the list of functions (methods) that can be called on a object, type the name of the object, followed by a dot and the TAB key, e.g. </span></p>
<p><span><span style="font-family: courier new,courier;">sa.&lt;tab&gt;</span><br /></span></p>
<p><span id="cell_outer_269">To get information on an object or a method, use the question mark:</span></p>

︡8215884f-8894-45c9-b50c-d6278f0fad21︡︡{"done":true,"html":"<h2>Getting help</h2>\n<p><span>To get the list of functions (methods) that can be called on a object, type the name of the object, followed by a dot and the TAB key, e.g. </span></p>\n<p><span><span style=\"font-family: courier new,courier;\">sa.&lt;tab&gt;</span><br /></span></p>\n<p><span id=\"cell_outer_269\">To get information on an object or a method, use the question mark:</span></p>"}
︠132c4234-6c89-4208-8ecf-7db1f57641ebs︠
nabla?
︡5f9d7214-83fa-4dc9-8435-203b999a16cc︡︡{"code":{"source":"File: /projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/geometry/manifolds/connection.py\nSignature : nabla()\nDocstring :\nLevi-Civita connection on a pseudo-Riemannian manifold.\n\nGiven a differentiable manifold M endowed with a pseudo-Riemannian\nmetric g and denoting by mathcal{X}(M) the C^infty(M)-module of\nvector fields on M (cf. \"VectorFieldModule\"), the *Levi-Civita\nconnection associated with* g is the unique operator\n\n   begin{array}{cccc} nabla: & mathcal{X}(M) x\n   mathcal{X}(M) & longrightarrow &          mathcal{X}(M) \n   & (u,v) & longmapsto & nabla_u v end{array}\n\nthat\n\n* is bilinear when considering mathcal{X}(M) as a vector space\n  over RR\n\n* is C^infty(M)-linear w.r.t. the first argument: forall fin\n  C^infty(M), nabla_{fu} v = fnabla_u v\n\n* obeys Leibniz rule w.r.t. the second argument: forall fin\n  C^infty(M), nabla_u (f v) = df(u), v + f  nabla_u v\n\n* is torsion-free\n\n* is compatible with g: forall (u,v,w)in mathcal{X}(M)^3,\n  u(g(v,w)) = g(nabla_u v, w) + g(v, nabla_u w)\n\nThe Levi-Civita connection nabla gives birth to the *covariant\nderivative operator* acting on tensor fields, denoted by the same\nsymbol:\n\n   begin{array}{cccc} nabla: &  T^{(k,l)}(M) & longrightarrow &\n   T^{(k,l+1)}(M)         & t & longmapsto & nabla t\n   end{array}\n\nwhere T^{(k,l)}(M) stands for the C^infty(M)-module of tensor\nfields of type (k,l) on M (cf. \"TensorFieldModule\"), with the\nconvention T^{(0,0)}(M):=C^infty(M). For a vector field v,  the\ncovariant derivative nabla v is a type-(1,1) tensor field such\nthat\n\n   forall u inmathcal{X}(M),    nabla_u v = nabla v(., u)\n\nMore generally for any tensor field tin T^{(k,l)}(M), we have\n\n   forall u inmathcal{X}(M),    nabla_u t = nabla t(...,\n   u)\n\nNote: The above convention means that, in terms of index\n  notation, the \"derivation index\" in nabla t is the *last* one:\n\n     nabla_c t^{a_1... a_k}_{quadquad b_1... b_l} =\n     (nabla t)^{a_1... a_k}_{quadquad b_1... b_l c}\n\nINPUT:\n\n* \"metric\" -- the metric g defining the Levi-Civita connection,\n  as an instance of class \"Metric\"\n\n* \"name\" -- name given to the connection\n\n* \"latex_name\" -- (default: \"None\") LaTeX symbol to denote the\n  connection\n\n* \"init_coef\" -- (default: True) determines whether the\n  Chrsitoffel symbols are initialized (in the top charts on the\n  domain, i.e. disregarding the subcharts)\n\nEXAMPLES:\n\nLevi-Civita connection associated with the Euclidean metric on\nRR^3 expressed in spherical coordinates:\n\n   sage: Manifold._clear_cache_() # for doctests only\n   sage: forget() # for doctests only\n   sage: M = Manifold(3, 'R^3', start_index=1)\n   sage: c_spher.<r,th,ph> = M.chart(r'r:[0,+oo) th:[0,pi]:theta ph:[0,2*pi):phi')\n   sage: g = M.metric('g')\n   sage: g[1,1], g[2,2], g[3,3] = 1, r^2 , (r*sin(th))^2\n   sage: g.display()\n   g = dr*dr + r^2 dth*dth + r^2*sin(th)^2 dph*dph\n   sage: from sage.geometry.manifolds.connection import LeviCivitaConnection\n   sage: nab = LeviCivitaConnection(g, 'nabla', r'nabla') ; nab\n   Levi-Civita connection 'nabla' associated with the pseudo-Riemannian metric 'g' on the 3-dimensional manifold 'R^3'\n\nLet us check that the connection is compatible with the metric:\n\n   sage: Dg = nab(g) ; Dg\n   tensor field 'nabla g' of type (0,3) on the 3-dimensional manifold 'R^3'\n   sage: Dg == 0\n   True\n\nand that it is torsionless:\n\n   sage: nab.torsion() == 0\n   True\n   sage: sage.geometry.manifolds.connection.AffConnection.torsion(nab) == 0  # forces the computation of the torsion\n   True\n\nThe connection coefficients in the manifold's default frame are\nChristoffel symbols, since the default frame is a coordinate frame:\n\n   sage: M.default_frame()\n   coordinate frame (R^3, (d/dr,d/dth,d/dph))\n   sage: nab.coef()\n   3-indices components w.r.t. coordinate frame (R^3, (d/dr,d/dth,d/dph)), with symmetry on the index positions (1, 2)\n   sage: # note that the Christoffel symbols are symmetric with respect to their last two indices (positions (1,2))\n   sage: nab.coef()[:]\n   [[[0, 0, 0], [0, -r, 0], [0, 0, -r*sin(th)^2]],\n   [[0, 1/r, 0], [1/r, 0, 0], [0, 0, -cos(th)*sin(th)]],\n   [[0, 0, 1/r], [0, 0, cos(th)/sin(th)], [1/r, cos(th)/sin(th), 0]]]","mode":"text/x-rst","lineno":-1,"filename":null},"done":false}︡{"done":true}
︠f23e58d2-4386-49d3-bcd7-51920759706ds︠
g.ricci_scalar?
︡e6b3b9cc-496a-4261-8cd1-78f44730050d︡︡{"code":{"source":"File: /projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/geometry/manifolds/metric.py\nSignature : g.ricci_scalar(self, name=None, latex_name=None)\nDocstring :\nReturn the metric's Ricci scalar.\n\nThe Ricci scalar is the scalar field r defined from the Ricci\ntensor Ric and the metric tensor g by\n\n   r = g^{ij} Ric_{ij}\n\nINPUT:\n\n* \"name\" -- (default: \"None\") name given to the Ricci scalar; if\n  none, it is set to \"r(g)\", where \"g\" is the metric's name\n\n* \"latex_name\" -- (default: \"None\") LaTeX symbol to denote the\n  Ricci scalar; if none, it is set to \"r(g)\", where \"g\" is the\n  metric's name\n\nOUTPUT:\n\n* the Ricci scalar r, as an instance of \"ScalarField\"\n\nEXAMPLES:\n\nRicci scalar of the standard metric on the 2-sphere:\n\n   sage: Manifold._clear_cache_() # for doctests only\n   sage: M = Manifold(2, 'S^2', start_index=1)\n   sage: U = M.open_subset('U') # the complement of a meridian (domain of spherical coordinates)\n   sage: c_spher.<th,ph> = U.chart(r'th:(0,pi):theta ph:(0,2*pi):phi')\n   sage: a = var('a') # the sphere radius\n   sage: g = U.metric('g')\n   sage: g[1,1], g[2,2] = a^2, a^2*sin(th)^2\n   sage: g.display() # standard metric on the 2-sphere of radius a:\n   g = a^2 dth*dth + a^2*sin(th)^2 dph*dph\n   sage: g.ricci_scalar()\n   scalar field 'r(g)' on the open subset 'U' of the 2-dimensional manifold 'S^2'\n   sage: g.ricci_scalar().display() # The Ricci scalar is constant:\n   r(g): U --> R\n      (th, ph) |--> 2/a^2","mode":"text/x-rst","lineno":-1,"filename":null},"done":false}︡{"done":true}
︠be4ba565-4476-4f6d-a10e-4054a12a301fi︠
%html
<p>Using a double question mark leads directly to the <strong>Python</strong> <strong>source code</strong> (Sage and SageManifolds are <span style="color: #ff0000;"><strong>open source</strong></span>, aren't they ?)<span style="color: #ff0000;"><br /></span></p>

︡0a844bfc-be8a-4f50-b0e6-b3a724c2224b︡︡{"done":true,"html":"<p>Using a double question mark leads directly to the <strong>Python</strong> <strong>source code</strong> (Sage and SageManifolds are <span style=\"color: #ff0000;\"><strong>open source</strong></span>, aren't they ?)<span style=\"color: #ff0000;\"><br /></span></p>"}
︠a83e3c9d-24a7-4601-b357-b84f83e409bfs︠
g.ricci_scalar??
︡2378bbf3-10ae-4ed1-883e-c24009b0cf3e︡︡{"code":{"source":"   File: /projects/sage/sage-6.9/local/lib/python2.7/site-packages/sage/geometry/manifolds/metric.py\n   Source:\n       def ricci_scalar(self, name=None, latex_name=None):\n        r\"\"\"\n        Return the metric's Ricci scalar.\n\n        The Ricci scalar is the scalar field `r` defined from the Ricci tensor\n        `Ric` and the metric tensor `g` by\n\n        .. MATH::\n\n            r = g^{ij} Ric_{ij}\n\n        INPUT:\n\n        - ``name`` -- (default: ``None``) name given to the Ricci scalar;\n          if none, it is set to \"r(g)\", where \"g\" is the metric's name\n        - ``latex_name`` -- (default: ``None``) LaTeX symbol to denote the\n          Ricci scalar; if none, it is set to \"\\\\mathrm{r}(g)\", where \"g\"\n          is the metric's name\n\n        OUTPUT:\n\n        - the Ricci scalar `r`, as an instance of\n          :class:`~sage.geometry.manifolds.scalarfield.ScalarField`\n\n        EXAMPLES:\n\n        Ricci scalar of the standard metric on the 2-sphere::\n\n            sage: Manifold._clear_cache_() # for doctests only\n            sage: M = Manifold(2, 'S^2', start_index=1)\n            sage: U = M.open_subset('U') # the complement of a meridian (domain of spherical coordinates)\n            sage: c_spher.<th,ph> = U.chart(r'th:(0,pi):\\theta ph:(0,2*pi):\\phi')\n            sage: a = var('a') # the sphere radius\n            sage: g = U.metric('g')\n            sage: g[1,1], g[2,2] = a^2, a^2*sin(th)^2\n            sage: g.display() # standard metric on the 2-sphere of radius a:\n            g = a^2 dth*dth + a^2*sin(th)^2 dph*dph\n            sage: g.ricci_scalar()\n            scalar field 'r(g)' on the open subset 'U' of the 2-dimensional manifold 'S^2'\n            sage: g.ricci_scalar().display() # The Ricci scalar is constant:\n            r(g): U --> R\n               (th, ph) |--> 2/a^2\n\n        \"\"\"\n        if self._ricci_scalar is None:\n            manif = self._domain._manifold\n            ric = self.ricci()\n            ig = self.inverse()\n            frame = ig.common_basis(ric)\n            cric = ric._components[frame]\n            cig = ig._components[frame]\n            rsum1 = 0\n            for i in manif.irange():\n                rsum1 += cig[[i,i]] * cric[[i,i]]\n            rsum2 = 0\n            for i in manif.irange():\n                for j in manif.irange(start=i+1):\n                    rsum2 += cig[[i,j]] * cric[[i,j]]\n            self._ricci_scalar = rsum1 + 2*rsum2\n            if name is None:\n                self._ricci_scalar._name = \"r(\" + self._name + \")\"\n            else:\n                self._ricci_scalar._name = name\n            if latex_name is None:\n                self._ricci_scalar._latex_name = r\"\\mathrm{r}\\left(\" + \\\n                                                 self._latex_name + r\"\\right)\"\n            else:\n                self._ricci_scalar._latex_name = latex_name\n        return self._ricci_scalar\n","mode":"python","lineno":-1,"filename":null},"done":false}︡{"done":true}
︠01802668-01f9-44de-b537-3e28be472350i︠
%html
<h2>Going further</h2>
<p>Have a look at the <a href="http://sagemanifolds.obspm.fr/examples.html">examples on SageManifolds page</a>, especially the <a href="http://sagemanifolds.obspm.fr/examples/html/SM_sphere_S2.html">2-dimensional sphere example</a> for usage on a non-parallelizable manifold (each scalar field has to be defined in at least two coordinate charts, the module $\mathcal{X}(\mathcal{M})$ is no longer free and each tensor field has to be defined in at least two vector frames).</p>

︡1d1096db-ee4b-4748-a241-7dbbc6e6e1cb︡︡{"done":true,"html":"<h2>Going further</h2>\n<p>Have a look at the <a href=\"http://sagemanifolds.obspm.fr/examples.html\">examples on SageManifolds page</a>, especially the <a href=\"http://sagemanifolds.obspm.fr/examples/html/SM_sphere_S2.html\">2-dimensional sphere example</a> for usage on a non-parallelizable manifold (each scalar field has to be defined in at least two coordinate charts, the module $\\mathcal{X}(\\mathcal{M})$ is no longer free and each tensor field has to be defined in at least two vector frames).</p>"}
︠0f555c16-ec94-4067-bb79-9ae21d4a7238︠










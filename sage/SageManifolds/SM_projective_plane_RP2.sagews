︠635795ac-bf79-44ab-8d18-fe150a08b18aas︠
%auto
typeset_mode(True, display=False)
︡b12460b3-39da-46d8-a2c9-3edfce456fac︡︡{"auto":true}︡{"done":true}
︠812abd73-2bec-47b7-92ca-c012eddc00b8i︠
%html
<div id="cell_text_154" class="text_cell">
<h1 style="text-align: center;">Real projective plane $\mathbb{RP}^2$</h1>
<p>This worksheet demonstrates a few capabilities of <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.8) in computations regarding the real projective plane.</p>
<p>It is released under the GNU General Public License version 3.</p>
<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>
<p><em><span style="color: #008080;">The corresponding worksheet file can be downloaded from</span><span style="color: #ff6600;"><span style="color: #0000ff;"> <a href="http://sagemanifolds.obspm.fr/examples/sws/SM_projective_plane_RP2.sws"><span style="color: #0000ff;">here</span></a></span></span></em></p>
<p><em><span style="color: #ff6600;"><span style="color: #0000ff;"><span style="color: #0000ff;"><br /></span></span></span></em></p>
</div>
<h2>Constructing the manifold</h2>
<p>We start by declaring the real projective plane as a 2-dimensional differentiable manifold:</p>
<div id="insert_new_cell_before3" class="insert_new_cell">&nbsp;</div>

︡df1fee83-7fcb-420b-841d-3f389e260e22︡︡{"done":true,"html":"<div id=\"cell_text_154\" class=\"text_cell\">\n<h1 style=\"text-align: center;\">Real projective plane $\\mathbb{RP}^2$</h1>\n<p>This worksheet demonstrates a few capabilities of <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.8) in computations regarding the real projective plane.</p>\n<p>It is released under the GNU General Public License version 3.</p>\n<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>\n<p><em><span style=\"color: #008080;\">The corresponding worksheet file can be downloaded from</span><span style=\"color: #ff6600;\"><span style=\"color: #0000ff;\"> <a href=\"http://sagemanifolds.obspm.fr/examples/sws/SM_projective_plane_RP2.sws\"><span style=\"color: #0000ff;\">here</span></a></span></span></em></p>\n<p><em><span style=\"color: #ff6600;\"><span style=\"color: #0000ff;\"><span style=\"color: #0000ff;\"><br /></span></span></span></em></p>\n</div>\n<h2>Constructing the manifold</h2>\n<p>We start by declaring the real projective plane as a 2-dimensional differentiable manifold:</p>\n<div id=\"insert_new_cell_before3\" class=\"insert_new_cell\">&nbsp;</div>"}
︠66f64dc2-b550-4248-9a18-5bdca0508319s︠
RP2 = Manifold(2, 'RP^2', r'\mathbb{RP}^2') ; RP2
︡8b1c0f96-2cc5-4392-9eaf-ba1de2e32510︡︡{"html":"<div>$\\mathbb{RP}^2$</div>","done":false}︡{"done":true}
︠bd825344-4ea1-40de-a40d-87d1cbed2a38i︠
%html
<p>Then we provide $\mathbb{RP}^2$ with some atlas. A minimal atlas on $\mathbb{RP}^2$ must have at least three charts. Such an atlas is easy to infer from the common interpretation of $\mathbb{RP}^2$ as the set of lines of $\mathbb{R}^3$ passing through the origin $(x,y,z)=(0,0,0)$. Let $U_1$ be the subset of lines that are not contained in the plane $z=0$; this is an open set of $\mathbb{RP}^2$, so that we declare it as:</p>

︡c6bfef80-1dfe-49c7-bc2b-0abe0b2f187f︡︡{"done":true,"html":"<p>Then we provide $\\mathbb{RP}^2$ with some atlas. A minimal atlas on $\\mathbb{RP}^2$ must have at least three charts. Such an atlas is easy to infer from the common interpretation of $\\mathbb{RP}^2$ as the set of lines of $\\mathbb{R}^3$ passing through the origin $(x,y,z)=(0,0,0)$. Let $U_1$ be the subset of lines that are not contained in the plane $z=0$; this is an open set of $\\mathbb{RP}^2$, so that we declare it as:</p>"}
︠1c7e5243-684e-489e-aba0-24ca6e1475dds︠
U1 = RP2.open_subset('U_1') ; U1
︡64bfa425-d6da-43f6-a32a-c4fb83ee150b︡︡{"html":"<div>$U_1$</div>","done":false}︡{"done":true}
︠91c7a8fc-a624-43db-839a-b08c9dcdb151i︠
%html
<p>Any line in $U_1$ is uniquely determined by its intersection with the plane $z=1$. The Cartesian coordinates $(x,y,1)$ of the intersection point lead to an obvious coordinate system $(x_1,y_1)$ on $U_1$ by setting $(x_1,y_1)=(x,y)$:</p>

︡86f85d73-88a9-40d2-bd28-ab0d35259c2e︡︡{"done":true,"html":"<p>Any line in $U_1$ is uniquely determined by its intersection with the plane $z=1$. The Cartesian coordinates $(x,y,1)$ of the intersection point lead to an obvious coordinate system $(x_1,y_1)$ on $U_1$ by setting $(x_1,y_1)=(x,y)$:</p>"}
︠8303cd5e-ae86-4a6e-a3c4-9f11c8a02c55s︠
X1.<x1,y1> = U1.chart() ; X1
︡d84b7091-e6d5-4800-acb8-77710bd64c59︡︡{"html":"<div>$\\left(U_1,(x_{1}, y_{1})\\right)$</div>","done":false}︡{"done":true}
︠1e7f2c81-7d82-4821-bc26-4b3eee852211i︠
%html
<p>Note that since we have not specified any coordinate range in the arguments of <span style="font-family: courier new,courier;">chart()</span>, the range of $(x_1,y_1)$ is $\mathbb{R}^2$. </p>
<p>Similarly, let $U_2$ be the set of lines through the origin of $\mathbb{R}^3$ that are not contained in the plane $x=0$. Any line in $U_2$ is uniquely determined by its intersection $(1,y,z)$ with the plane $x=1$, leading to coordinates $(x_2,y_2)=(y,z)$ on $U_2$:</p>

︡8f832c0a-c8e3-44a0-a10c-dadd8e0e713e︡︡{"done":true,"html":"<p>Note that since we have not specified any coordinate range in the arguments of <span style=\"font-family: courier new,courier;\">chart()</span>, the range of $(x_1,y_1)$ is $\\mathbb{R}^2$. </p>\n<p>Similarly, let $U_2$ be the set of lines through the origin of $\\mathbb{R}^3$ that are not contained in the plane $x=0$. Any line in $U_2$ is uniquely determined by its intersection $(1,y,z)$ with the plane $x=1$, leading to coordinates $(x_2,y_2)=(y,z)$ on $U_2$:</p>"}
︠81178c7d-5e8d-475b-b65a-b617aea6550bs︠
U2 = RP2.open_subset('U_2')
X2.<x2,y2> = U2.chart() ; X2
︡b46b0402-5089-463f-b913-da22934a795b︡︡{"html":"<div>$\\left(U_2,(x_{2}, y_{2})\\right)$</div>","done":false}︡{"done":true}
︠398a9e02-9ca9-40da-ad6a-cf4f66c36a9bi︠
%html
<p>Finally, let $U_3$ be the set of lines through the origin of $\mathbb{R}^3$ that are not contained in the plane $y=0$. Any line in $U_3$ is uniquely determined by its intersection $(x,1,z)$ with the plane $y=1$, leading to coordinates $(x_3,y_3)=(z,x)$ on $U_3$:</p>

︡881b223f-4e2f-4e91-aeea-ad19d3c76454︡︡{"done":true,"html":"<p>Finally, let $U_3$ be the set of lines through the origin of $\\mathbb{R}^3$ that are not contained in the plane $y=0$. Any line in $U_3$ is uniquely determined by its intersection $(x,1,z)$ with the plane $y=1$, leading to coordinates $(x_3,y_3)=(z,x)$ on $U_3$:</p>"}
︠81c5159f-e1c8-4e88-9194-ff3895a72dd1s︠
U3 = RP2.open_subset('U_3')
X3.<x3,y3> = U3.chart() ; X3
︡62dd9fb6-fc64-4203-aabd-13dfe93cfae0︡︡{"html":"<div>$\\left(U_3,(x_{3}, y_{3})\\right)$</div>","done":false}︡{"done":true}
︠099ac1f8-360f-4188-b02c-d77c7f9a5940i︠
%html
<p>We declare that the union of the three (overlapping) open domains $U_1$, $U_2$ and $U_3$ is $\mathbb{RP}^2$:</p>

︡13ce3372-2ccd-42a9-8ff5-560e77e94517︡︡{"done":true,"html":"<p>We declare that the union of the three (overlapping) open domains $U_1$, $U_2$ and $U_3$ is $\\mathbb{RP}^2$:</p>"}
︠7a3330fc-10ea-4282-9905-ba144adc96f0s︠
RP2.declare_union(U1.union(U2), U3)
U1.union(U2).union(U3)
︡fccd0eb3-8972-4550-843b-67af03cbeb33︡︡{"html":"<div>$\\mathbb{RP}^2$</div>","done":false}︡{"done":true}
︠f2e119fc-50f9-45af-b26d-760569a39826i︠
%html
<p>Finally, to fully specify the manifold $\mathbb{RP}^2$, we give the transition maps between the various charts; the transition map between the charts X1=$(U_1,(x_1,y_1))$ and X2=$(U_2,(x_2,y_2))$ is defined on the set $U_{12} := U_1 \cap U_2$ of lines through the origin of $\mathbb{R}^3$ that are neither contained in the plane $x=0$ ($x_1=0$ in $U_1$) nor contained in the plane $z=0$ ($y_2=0$ in $U_2$):</p>

︡c8c6dd47-3b4f-4ac1-9efa-c1de11e0c616︡︡{"done":true,"html":"<p>Finally, to fully specify the manifold $\\mathbb{RP}^2$, we give the transition maps between the various charts; the transition map between the charts X1=$(U_1,(x_1,y_1))$ and X2=$(U_2,(x_2,y_2))$ is defined on the set $U_{12} := U_1 \\cap U_2$ of lines through the origin of $\\mathbb{R}^3$ that are neither contained in the plane $x=0$ ($x_1=0$ in $U_1$) nor contained in the plane $z=0$ ($y_2=0$ in $U_2$):</p>"}
︠87510d88-1ba7-4581-8e03-70bebf1956cds︠
X1_to_X2 = X1.transition_map(X2, (y1/x1, 1/x1), intersection_name='U_{12}', \
                             restrictions1= x1!=0, restrictions2= y2!=0)
X1_to_X2.display()
︡3cf6df85-708e-4f8b-a05f-59b9d03a9bf7︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} x_{2} &amp; = &amp; \\frac{y_{1}}{x_{1}} \\\\ y_{2} &amp; = &amp; \\frac{1}{x_{1}} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠5ce0da94-fc86-49df-8b80-4fb9941f0328i︠
%html
<p>The inverse of this transition map is easily computed by Sage:</p>

︡231d9f9d-0f3f-4f16-a827-2fca938ed7c6︡︡{"done":true,"html":"<p>The inverse of this transition map is easily computed by Sage:</p>"}
︠ebdbebb4-202b-4c55-b836-adb313ab85bcs︠
X2_to_X1 = X1_to_X2.inverse()
X2_to_X1.display()
︡60386d5c-9931-461a-8e1e-624bb1677782︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} x_{1} &amp; = &amp; \\frac{1}{y_{2}} \\\\ y_{1} &amp; = &amp; \\frac{x_{2}}{y_{2}} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠bcc2467c-eb81-47bf-8b7a-2628cc5c030fi︠
%html
<p>The transition map between the charts X1=$(U_1,(x_1,y_1))$ and X3=$(U_3,(x_3,y_3))$ is defined on the set $U_{13} := U_1 \cap U_3$ of lines through the origin of $\mathbb{R}^3$ that are neither contained in the plane $y=0$ ($y_1=0$ in $U_1$) nor contained in the plane $z=0$ ($x_3=0$ in $U_3$):</p>

︡629c8645-6487-40bb-9702-6fc7022e60cf︡︡{"done":true,"html":"<p>The transition map between the charts X1=$(U_1,(x_1,y_1))$ and X3=$(U_3,(x_3,y_3))$ is defined on the set $U_{13} := U_1 \\cap U_3$ of lines through the origin of $\\mathbb{R}^3$ that are neither contained in the plane $y=0$ ($y_1=0$ in $U_1$) nor contained in the plane $z=0$ ($x_3=0$ in $U_3$):</p>"}
︠6d9035b6-ea98-4789-b13c-3a4b5cfa908as︠
X1_to_X3 = X1.transition_map(X3, (1/y1, x1/y1), intersection_name='U_{13}', \
                             restrictions1= y1!=0, restrictions2= x3!=0)
X1_to_X3.display()
︡5c0fb34d-a196-4620-bd3e-c0a4fcc8526a︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} x_{3} &amp; = &amp; \\frac{1}{y_{1}} \\\\ y_{3} &amp; = &amp; \\frac{x_{1}}{y_{1}} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠b8f7d7d9-0aeb-4ed5-b163-0dc93e3d46e6s︠
X3_to_X1 = X1_to_X3.inverse()
X3_to_X1.display()
︡260b9817-ca62-4928-a1ca-8cacad7498af︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} x_{1} &amp; = &amp; \\frac{y_{3}}{x_{3}} \\\\ y_{1} &amp; = &amp; \\frac{1}{x_{3}} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠bf9abc67-beb2-4301-be34-aa52afa23e63i︠
%html
<p>Finally, the transition map between the charts X2=$(U_2,(x_2,y_2))$ and X3=$(U_3,(x_3,y_3))$ is defined on the set $U_{23} := U_2 \cap U_3$ of lines through the origin of $\mathbb{R}^3$ that are neither contained in the plane $y=0$ ($x_2=0$ in $U_2$) nor contained in the plane $x=0$ ($y_3=0$ in $U_3$):</p>

︡50954b81-2bdc-4717-97e6-f5081968dba7︡︡{"done":true,"html":"<p>Finally, the transition map between the charts X2=$(U_2,(x_2,y_2))$ and X3=$(U_3,(x_3,y_3))$ is defined on the set $U_{23} := U_2 \\cap U_3$ of lines through the origin of $\\mathbb{R}^3$ that are neither contained in the plane $y=0$ ($x_2=0$ in $U_2$) nor contained in the plane $x=0$ ($y_3=0$ in $U_3$):</p>"}
︠f1a3a15e-3693-4210-b470-98b269355facs︠
X2_to_X3 = X2.transition_map(X3, (y2/x2, 1/x2), intersection_name='U_{23}', \
                             restrictions1= x2!=0, restrictions2= y3!=0)
X2_to_X3.display()
︡8810dbb7-4e4e-46b2-a233-2ca9b279f14e︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} x_{3} &amp; = &amp; \\frac{y_{2}}{x_{2}} \\\\ y_{3} &amp; = &amp; \\frac{1}{x_{2}} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠0908e5c6-553e-4f12-898c-00762461b3a9s︠
X3_to_X2 = X2_to_X3.inverse()
X3_to_X2.display()
︡bfeb1872-4898-4b1c-914f-1b3d62d479cf︡︡{"html":"<div>$\\left\\{\\begin{array}{lcl} x_{2} &amp; = &amp; \\frac{1}{y_{3}} \\\\ y_{2} &amp; = &amp; \\frac{x_{3}}{y_{3}} \\end{array}\\right.$</div>","done":false}︡{"done":true}
︠73a14b74-39d3-4497-9f5a-3c65d71f6a3ai︠
%html
<p>At this stage, the manifold $\mathbb{RP}^2$ is fully constructed. It has been provided with the following atlas:</p>

︡7431a6b5-4b96-4a36-88e4-f5268caaf689︡︡{"done":true,"html":"<p>At this stage, the manifold $\\mathbb{RP}^2$ is fully constructed. It has been provided with the following atlas:</p>"}
︠aada34be-692f-4636-bc2d-0aa798e8be27s︠
RP2.atlas()
︡e726c702-6804-4dca-b129-9d9736cfba32︡︡{"html":"<div>[$\\left(U_1,(x_{1}, y_{1})\\right)$, $\\left(U_2,(x_{2}, y_{2})\\right)$, $\\left(U_3,(x_{3}, y_{3})\\right)$, $\\left(U_{12},(x_{1}, y_{1})\\right)$, $\\left(U_{12},(x_{2}, y_{2})\\right)$, $\\left(U_{13},(x_{1}, y_{1})\\right)$, $\\left(U_{13},(x_{3}, y_{3})\\right)$, $\\left(U_{23},(x_{2}, y_{2})\\right)$, $\\left(U_{23},(x_{3}, y_{3})\\right)$]</div>","done":false}︡{"done":true}
︠9636c77f-ae11-4a94-bd62-0e36eaf28bb3i︠
%html
<p>Note that, in addition to the three chart we have defined, the atlas comprises subcharts on the intersection domains $U_{12}$, $U_{13}$ and $U_{23}$. These charts can be obtained by the method <span style="font-family: courier new,courier;">restrict()</span>:</p>

︡f7ff38ba-164d-4072-bd55-266eec0b92a0︡︡{"done":true,"html":"<p>Note that, in addition to the three chart we have defined, the atlas comprises subcharts on the intersection domains $U_{12}$, $U_{13}$ and $U_{23}$. These charts can be obtained by the method <span style=\"font-family: courier new,courier;\">restrict()</span>:</p>"}
︠d25af259-801c-4079-8f4e-20e8722e6efes︠
U12 = U1.intersection(U2)
U13 = U1.intersection(U3)
U23 = U2.intersection(U3)
X1.restrict(U12)
︡0e571a19-d208-4e32-8736-a18b4050aff3︡︡{"html":"<div>$\\left(U_{12},(x_{1}, y_{1})\\right)$</div>","done":false}︡{"done":true}
︠6ea12c47-1906-48d2-a229-60f2bdeaad42s︠
X1.restrict(U12) is RP2.atlas()[3]
︡cad9a041-84f2-43b0-8a2a-6933c140a153︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠aea2520b-bff4-431f-8cb8-4391145e599ei︠
%html
<h2>Non-orientability of $\mathbb{RP}^2$</h2>
<p>It is well known that $\mathbb{RP}^2$ is not an orientable manifold. To illustrate this, let us make an attempt to construct a global non-vanishing 2-form $\epsilon$ on $\mathbb{RP}^2$. If we succeed, this would provide a volume form and $\mathbb{RP}^2$ would be orientable. We start by declaring $\epsilon$ as a 2-form on $\mathbb{RP}^2$:</p>

︡d8204b19-73fd-4474-a101-c2b6cb114618︡︡{"done":true,"html":"<h2>Non-orientability of $\\mathbb{RP}^2$</h2>\n<p>It is well known that $\\mathbb{RP}^2$ is not an orientable manifold. To illustrate this, let us make an attempt to construct a global non-vanishing 2-form $\\epsilon$ on $\\mathbb{RP}^2$. If we succeed, this would provide a volume form and $\\mathbb{RP}^2$ would be orientable. We start by declaring $\\epsilon$ as a 2-form on $\\mathbb{RP}^2$:</p>"}
︠87ae86cc-7257-48db-9ef2-895529f0b4dds︠
eps = RP2.diff_form(2, name='eps', latex_name=r'\epsilon')
print eps
︡10dca47b-16a6-4897-bedd-c086d19a1cf1︡︡{"stdout":"2-form 'eps' on the 2-dimensional manifold 'RP^2'\n","done":false}︡{"done":true}
︠fa056f28-90e6-4b6d-b1a6-f75146a603a1i︠
%html
<p>We set the value of $\epsilon$ on domain $U_1$ to be $\mathrm{d}x_1 \wedge \mathrm{d}y_1$ by demanding that the component $\epsilon_{01}$ of $\epsilon$ with respect to coordinates $(x_1,y_1)$&nbsp; is one, as follows:</p>

︡86733421-0b94-4e9a-a107-b41d18bfaeac︡︡{"done":true,"html":"<p>We set the value of $\\epsilon$ on domain $U_1$ to be $\\mathrm{d}x_1 \\wedge \\mathrm{d}y_1$ by demanding that the component $\\epsilon_{01}$ of $\\epsilon$ with respect to coordinates $(x_1,y_1)$&nbsp; is one, as follows:</p>"}
︠a9c5de49-483b-4cdd-aa21-f3f76e0262a3s︠
e1 = X1.frame() ; e1
︡e66f270c-9d7e-480a-ba92-05ed7295bdef︡︡{"html":"<div>$\\left(U_1 ,\\left(\\frac{\\partial}{\\partial x_{1} },\\frac{\\partial}{\\partial y_{1} }\\right)\\right)$</div>","done":false}︡{"done":true}
︠667c23b8-b6a3-42a3-baeb-aa1dc327dce7s︠
eps[e1,0,1] = 1
eps.display(e1)
︡0ac67abe-d28b-48c7-9168-8e032497bb52︡︡{"html":"<div>$\\epsilon = \\mathrm{d} x_{1}\\wedge \\mathrm{d} y_{1}$</div>","done":false}︡{"done":true}
︠1c5a1f78-0836-4a22-9a04-2103074b1d7fi︠
%html
<p>If we ask for the expression of $\epsilon$ in terms of the coframe $(\mathrm{d}x_2, \mathrm{d}y_2)$ associated with the chart X2 on $U_{12} = U_1\cap U_2$, we get</p>

︡dcbcb9d0-97fb-4051-a060-e206e03258c4︡︡{"done":true,"html":"<p>If we ask for the expression of $\\epsilon$ in terms of the coframe $(\\mathrm{d}x_2, \\mathrm{d}y_2)$ associated with the chart X2 on $U_{12} = U_1\\cap U_2$, we get</p>"}
︠1d8580f5-5b99-42fb-8c76-c70c6dd29f65s︠
eps.display(X2.frame().restrict(U12), chart=X2.restrict(U12))
︡167a1ee2-11a8-43b8-82a1-fdeedf45f294︡︡{"html":"<div>$\\epsilon = \\frac{1}{y_{2}^{3}} \\mathrm{d} x_{2}\\wedge \\mathrm{d} y_{2}$</div>","done":false}︡{"done":true}
︠af342494-c771-4601-819f-a4dc0aab8beci︠
%html
<p>Now, the complement of $U_{12}$ in $U_2$ is defined by $y_2=0$. The above expression shows that it is not possible to extend smoothly $\epsilon$ to the whole domain $U_2$. We conclude that starting from $\mathrm{d}x_1\wedge\mathrm{d}y_1$ on $U_1$, it is not possible to get a regular non-vanishing 2-form on $\mathbb{RP}^2$. This of course follows from the fact that $\mathbb{RP}^2$ is not orientable.</p>

<h2>Steiner map (Roman surface)</h2>
<p>Let us first define $\mathbb{R}^3$ as a 3-dimensional manifold, with a single-chart atlas (Cartesian coordinates Y):</p>

︡7094becd-0d78-4d55-850f-70c41b9ebe8b︡︡{"done":true,"html":"<p>Now, the complement of $U_{12}$ in $U_2$ is defined by $y_2=0$. The above expression shows that it is not possible to extend smoothly $\\epsilon$ to the whole domain $U_2$. We conclude that starting from $\\mathrm{d}x_1\\wedge\\mathrm{d}y_1$ on $U_1$, it is not possible to get a regular non-vanishing 2-form on $\\mathbb{RP}^2$. This of course follows from the fact that $\\mathbb{RP}^2$ is not orientable.</p>\n\n<h2>Steiner map (Roman surface)</h2>\n<p>Let us first define $\\mathbb{R}^3$ as a 3-dimensional manifold, with a single-chart atlas (Cartesian coordinates Y):</p>"}
︠5b82f936-2e3f-4937-989d-51a52ed29754s︠
R3 = Manifold(3, 'R^3', r'\mathbb{R}^3')
Y.<x,y,z> = R3.chart()
︡0feea6ae-eecd-4853-aee9-9a6d3b596ad9︡︡{"done":true}
︠62a4eeda-8f4e-4e53-bd0b-4b8dd9bc4e97i︠
%html
<p>The Steiner map is a map $\mathbb{RP}^2 \rightarrow \mathbb{R}^3$ defined as follows:</p>

︡e0666ef3-fc52-4215-8475-1dbe9d02b371︡︡{"done":true,"html":"<p>The Steiner map is a map $\\mathbb{RP}^2 \\rightarrow \\mathbb{R}^3$ defined as follows:</p>"}
︠404f144c-6681-44d4-8e61-486273db9795s︠
Phi = RP2.diff_mapping(R3, {(X1,Y): [y1/(1+x1^2+y1^2), x1/(1+x1^2+y1^2), x1*y1/(1+x1^2+y1^2)], \
                            (X2,Y): [x2*y2/(1+x2^2+y2^2), y2/(1+x2^2+y2^2), x2/(1+x2^2+y2^2)], \
                            (X3,Y): [x3/(1+x3^2+y3^2), x3*y3/(1+x3^2+y3^2), y3/(1+x3^2+y3^2)]}, \
                            name='Phi', latex_name=r'\Phi')
Phi.display()
︡f8339a34-e398-4828-a8c2-e3d10d4359db︡︡{"html":"<div>$\\begin{array}{llcl} \\Phi:&amp; \\mathbb{RP}^2 &amp; \\longrightarrow &amp; \\mathbb{R}^3 \\\\ \\mbox{on}\\ U_1 : &amp; \\left(x_{1}, y_{1}\\right) &amp; \\longmapsto &amp; \\left(x, y, z\\right) = \\left(\\frac{y_{1}}{x_{1}^{2} + y_{1}^{2} + 1}, \\frac{x_{1}}{x_{1}^{2} + y_{1}^{2} + 1}, \\frac{x_{1} y_{1}}{x_{1}^{2} + y_{1}^{2} + 1}\\right) \\\\ \\mbox{on}\\ U_2 : &amp; \\left(x_{2}, y_{2}\\right) &amp; \\longmapsto &amp; \\left(x, y, z\\right) = \\left(\\frac{x_{2} y_{2}}{x_{2}^{2} + y_{2}^{2} + 1}, \\frac{y_{2}}{x_{2}^{2} + y_{2}^{2} + 1}, \\frac{x_{2}}{x_{2}^{2} + y_{2}^{2} + 1}\\right) \\\\ \\mbox{on}\\ U_3 : &amp; \\left(x_{3}, y_{3}\\right) &amp; \\longmapsto &amp; \\left(x, y, z\\right) = \\left(\\frac{x_{3}}{x_{3}^{2} + y_{3}^{2} + 1}, \\frac{x_{3} y_{3}}{x_{3}^{2} + y_{3}^{2} + 1}, \\frac{y_{3}}{x_{3}^{2} + y_{3}^{2} + 1}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠8f9b1da1-f52a-46e0-97ac-4e1fb0dc19e8i︠
%html
<p>$\Phi$ is a topological immersion of $\mathbb{RP}^2$ into $\mathbb{R}^3$, but it is not a smooth immersion (contrary to the Ap&eacute;ry map below): its differential is not injective at $(x_1,y_1)=(0,1)$ and $(x_1,y_1)=(1,0)$. The image of $\Phi$ is a self-intersecting surface of $\mathbb{R}^3$, called the <strong>Roman surface</strong>:</p>

︡57cfe5ba-6134-4394-88b4-24d0e029ce4e︡︡{"done":true,"html":"<p>$\\Phi$ is a topological immersion of $\\mathbb{RP}^2$ into $\\mathbb{R}^3$, but it is not a smooth immersion (contrary to the Ap&eacute;ry map below): its differential is not injective at $(x_1,y_1)=(0,1)$ and $(x_1,y_1)=(1,0)$. The image of $\\Phi$ is a self-intersecting surface of $\\mathbb{R}^3$, called the <strong>Roman surface</strong>:</p>"}
︠27cb34d1-2dc1-41a9-8565-d5f6fa6c795ds︠
g1 = parametric_plot3d(Phi.expr(X1,Y), (x1,-10,10), (y1,-10,10), plot_points=[100,100])
g2 = parametric_plot3d(Phi.expr(X2,Y), (x2,-10,10), (y2,-10,10), plot_points=[100,100])
g3 = parametric_plot3d(Phi.expr(X3,Y), (x3,-10,10), (y3,-10,10), plot_points=[100,100])
show(g1+g2+g3)
︡3568c6d4-00cf-4005-9b34-f05532375a70︡︡{"done":false,"file":{"uuid":"b4e08d97-ac80-4c08-becd-1f3e7e0928f5","filename":"b4e08d97-ac80-4c08-becd-1f3e7e0928f5.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠45a95093-2950-4f2f-ad6e-606a18a8958cs︠
gX1 = X1.plot(Y, mapping=Phi, max_value=16, nb_values=24, plot_points=100)
gX2 = X2.plot(Y, mapping=Phi, max_value=16, nb_values=24, plot_points=100, color='green')
gX3 = X3.plot(Y, mapping=Phi, max_value=16, nb_values=24, plot_points=100, color='blue')
show(gX1)
︡e1656e6c-b298-4c2d-aa4f-84f44a834336︡︡{"done":false,"file":{"uuid":"99a21bd4-3449-419e-ba93-0032aaee1ea1","filename":"99a21bd4-3449-419e-ba93-0032aaee1ea1.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠4840e0a0-e4c4-4b7b-b2b6-71c5df5d0559s︠
show(gX2)
︡9d4734ef-4a07-4708-a8bc-4c6fae5a7081︡︡{"done":false,"file":{"uuid":"9fcd4bad-88bc-423e-bde7-f3b71ec5ef67","filename":"9fcd4bad-88bc-423e-bde7-f3b71ec5ef67.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠ee5172a1-58ed-402c-9ba2-ad1775ab24ads︠
show(gX3)
︡26216bfc-d3d1-44e8-8afe-3dfea83dcde0︡︡{"done":false,"file":{"uuid":"455eaea1-b57f-41df-921e-7034472031b1","filename":"455eaea1-b57f-41df-921e-7034472031b1.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠15df4556-4b31-4600-8222-96ac2de2c543s︠
show(gX1+gX2+gX3)
︡393e5a30-604e-4fe1-a7aa-899848226e2b︡︡{"done":false,"file":{"uuid":"e96564f5-5288-4dce-8715-ba260b914bde","filename":"e96564f5-5288-4dce-8715-ba260b914bde.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠42e7de41-b277-4b27-a5e2-8c703640a295i︠
%html
<h2>Ap&eacute;ry map (Boy surface)</h2>
<p>The Ap&eacute;ry map [<a href="http://dx.doi.org/10.1016/0001-8708(86)90080-0">Ap&eacute;ry, Adv. Math. <strong>61</strong>, 185 (1986)</a>] is a smooth immersion $\Psi: \mathbb{RP}^2 \rightarrow \mathbb{R}^3$. In terms of the charts X1, X2, X3 introduced above, it is defined as follows:</p>

︡52f6afe2-7195-4c05-a28c-5e4a30002fa3︡︡{"done":true,"html":"<h2>Ap&eacute;ry map (Boy surface)</h2>\n<p>The Ap&eacute;ry map [<a href=\"http://dx.doi.org/10.1016/0001-8708(86)90080-0\">Ap&eacute;ry, Adv. Math. <strong>61</strong>, 185 (1986)</a>] is a smooth immersion $\\Psi: \\mathbb{RP}^2 \\rightarrow \\mathbb{R}^3$. In terms of the charts X1, X2, X3 introduced above, it is defined as follows:</p>"}
︠4bd23406-fa56-4212-84fa-6fabe787e18cs︠
fx = ((2*x^2-y^2-z^2)*(x^2+y^2+z^2)+2*y*z*(y^2-z^2)+z*x*(x^2-z^2)+x*y*(y^2-z^2))/2 ; fx
︡686d1f47-0709-4ea1-88d0-165f082e6e5a︡︡{"html":"<div>$\\frac{1}{2} \\, {\\left(y^{2} - z^{2}\\right)} x y + \\frac{1}{2} \\, {\\left(x^{2} - z^{2}\\right)} x z + {\\left(y^{2} - z^{2}\\right)} y z + \\frac{1}{2} \\, {\\left(2 \\, x^{2} - y^{2} - z^{2}\\right)} {\\left(x^{2} + y^{2} + z^{2}\\right)}$</div>","done":false}︡{"done":true}
︠5341424a-e094-40c0-b8e6-a8eefd135869s︠
fy = sqrt(3)/2*((y^2-z^2)*(x^2+y^2+z^2)+z*x*(z^2-x^2)+x*y*(y^2-x^2)) ; fy
︡f3628665-f861-4116-9f26-627ccab14719︡︡{"html":"<div>$-\\frac{1}{2} \\, \\sqrt{3} {\\left({\\left(x^{2} - y^{2}\\right)} x y + {\\left(x^{2} - z^{2}\\right)} x z - {\\left(x^{2} + y^{2} + z^{2}\\right)} {\\left(y^{2} - z^{2}\\right)}\\right)}$</div>","done":false}︡{"done":true}
︠e2b25e6f-b68c-428d-b430-37b3863c9485s︠
fz = (x+y+z)*((x+y+z)^3/4+(y-x)*(z-y)*(x-z)) ; fz
︡7f44f402-4610-4756-9953-8d99099bc5c8︡︡{"html":"<div>$\\frac{1}{4} \\, {\\left({\\left(x + y + z\\right)}^{3} + 4 \\, {\\left(x - y\\right)} {\\left(x - z\\right)} {\\left(y - z\\right)}\\right)} {\\left(x + y + z\\right)}$</div>","done":false}︡{"done":true}
︠88e10ea6-77db-49a9-8edf-341f0cdeada2s︠
a = sqrt(1+x1^2+y1^2)
fx1 = fx.subs(x=x1/a, y=y1/a, z=1/a).simplify_full()
fy1 = fy.subs(x=x1/a, y=y1/a, z=1/a).simplify_full()
fz1 = fz.subs(x=x1/a, y=y1/a, z=1/a).simplify_full()
︡68af00a8-dd63-4fff-8deb-f30a2189d403︡︡{"done":true}
︠3f303451-e9fb-4c64-954a-8744613b37f1s︠
a = sqrt(1+x2^2+y2^2)
fx2 = fx.subs(x=1/a, y=x2/a, z=y2/a).simplify_full()
fy2 = fy.subs(x=1/a, y=x2/a, z=y2/a).simplify_full()
fz2 = fz.subs(x=1/a, y=x2/a, z=y2/a).simplify_full()
︡fd872b81-860e-4da5-80c3-696501ccf993︡︡{"done":true}
︠aeff112c-bc6d-4064-9330-09498007cd12s︠
a = sqrt(1+x3^2+y3^2)
fx3 = fx.subs(x=y3/a, y=1/a, z=x3/a).simplify_full()
fy3 = fy.subs(x=y3/a, y=1/a, z=x3/a).simplify_full()
fz3 = fz.subs(x=y3/a, y=1/a, z=x3/a).simplify_full()
︡3459a4fb-cde5-4a87-b82a-430e7d1d1850︡︡{"done":true}
︠ce98336e-6af5-4c3a-a28a-e86b4f26a17as︠
Psi = RP2.diff_mapping(R3, {(X1,Y): [fx1, fy1, fz1], (X2,Y): [fx2, fy2, fz2], \
                            (X3,Y): [fx3, fy3, fz3]}, name='Psi', latex_name=r'\Psi')
Psi.display()
︡687c2c70-256f-4446-a1ca-8efff49244c3︡︡{"html":"<div>$\\begin{array}{llcl} \\Psi:&amp; \\mathbb{RP}^2 &amp; \\longrightarrow &amp; \\mathbb{R}^3 \\\\ \\mbox{on}\\ U_1 : &amp; \\left(x_{1}, y_{1}\\right) &amp; \\longmapsto &amp; \\left(x, y, z\\right) = \\left(\\frac{2 \\, x_{1}^{4} + {\\left(x_{1} + 2\\right)} y_{1}^{3} - y_{1}^{4} + x_{1}^{3} + {\\left(x_{1}^{2} - 2\\right)} y_{1}^{2} + x_{1}^{2} - {\\left(x_{1} + 2\\right)} y_{1} - x_{1} - 1}{2 \\, {\\left(x_{1}^{4} + y_{1}^{4} + 2 \\, {\\left(x_{1}^{2} + 1\\right)} y_{1}^{2} + 2 \\, x_{1}^{2} + 1\\right)}}, -\\frac{\\sqrt{3} x_{1}^{3} y_{1} - \\sqrt{3} x_{1}^{2} y_{1}^{2} - \\sqrt{3} x_{1} y_{1}^{3} - \\sqrt{3} y_{1}^{4} + \\sqrt{3} x_{1}^{3} + \\sqrt{3} x_{1}^{2} - \\sqrt{3} x_{1} + \\sqrt{3}}{2 \\, {\\left(x_{1}^{4} + y_{1}^{4} + 2 \\, {\\left(x_{1}^{2} + 1\\right)} y_{1}^{2} + 2 \\, x_{1}^{2} + 1\\right)}}, \\frac{x_{1}^{4} + y_{1}^{4} + 6 \\, {\\left(x_{1}^{2} + 2 \\, x_{1} + 1\\right)} y_{1}^{2} + 8 \\, y_{1}^{3} + 6 \\, x_{1}^{2} + 4 \\, {\\left(2 \\, x_{1}^{3} + 3 \\, x_{1}^{2} + 3 \\, x_{1}\\right)} y_{1} + 8 \\, x_{1} + 1}{4 \\, {\\left(x_{1}^{4} + y_{1}^{4} + 2 \\, {\\left(x_{1}^{2} + 1\\right)} y_{1}^{2} + 2 \\, x_{1}^{2} + 1\\right)}}\\right) \\\\ \\mbox{on}\\ U_2 : &amp; \\left(x_{2}, y_{2}\\right) &amp; \\longmapsto &amp; \\left(x, y, z\\right) = \\left(-\\frac{x_{2}^{4} + {\\left(2 \\, x_{2} + 1\\right)} y_{2}^{3} + y_{2}^{4} - x_{2}^{3} + {\\left(2 \\, x_{2}^{2} + x_{2} - 1\\right)} y_{2}^{2} - x_{2}^{2} - {\\left(2 \\, x_{2}^{3} + 1\\right)} y_{2} - 2}{2 \\, {\\left(x_{2}^{4} + y_{2}^{4} + 2 \\, {\\left(x_{2}^{2} + 1\\right)} y_{2}^{2} + 2 \\, x_{2}^{2} + 1\\right)}}, \\frac{\\sqrt{3} x_{2}^{4} - \\sqrt{3} y_{2}^{4} + \\sqrt{3} x_{2}^{3} + \\sqrt{3} y_{2}^{3} + \\sqrt{3} x_{2}^{2} - \\sqrt{3} y_{2}^{2} - \\sqrt{3} x_{2} - \\sqrt{3} y_{2}}{2 \\, {\\left(x_{2}^{4} + y_{2}^{4} + 2 \\, {\\left(x_{2}^{2} + 1\\right)} y_{2}^{2} + 2 \\, x_{2}^{2} + 1\\right)}}, \\frac{x_{2}^{4} + y_{2}^{4} + 6 \\, {\\left(x_{2}^{2} + 2 \\, x_{2} + 1\\right)} y_{2}^{2} + 8 \\, y_{2}^{3} + 6 \\, x_{2}^{2} + 4 \\, {\\left(2 \\, x_{2}^{3} + 3 \\, x_{2}^{2} + 3 \\, x_{2}\\right)} y_{2} + 8 \\, x_{2} + 1}{4 \\, {\\left(x_{2}^{4} + y_{2}^{4} + 2 \\, {\\left(x_{2}^{2} + 1\\right)} y_{2}^{2} + 2 \\, x_{2}^{2} + 1\\right)}}\\right) \\\\ \\mbox{on}\\ U_3 : &amp; \\left(x_{3}, y_{3}\\right) &amp; \\longmapsto &amp; \\left(x, y, z\\right) = \\left(-\\frac{x_{3}^{4} - x_{3} y_{3}^{3} - 2 \\, y_{3}^{4} + 2 \\, x_{3}^{3} - {\\left(x_{3}^{2} + 1\\right)} y_{3}^{2} + 2 \\, x_{3}^{2} + {\\left(x_{3}^{3} + x_{3}^{2} - 1\\right)} y_{3} - 2 \\, x_{3} + 1}{2 \\, {\\left(x_{3}^{4} + y_{3}^{4} + 2 \\, {\\left(x_{3}^{2} + 1\\right)} y_{3}^{2} + 2 \\, x_{3}^{2} + 1\\right)}}, -\\frac{\\sqrt{3} x_{3}^{4} + {\\left(\\sqrt{3} x_{3} + \\sqrt{3}\\right)} y_{3}^{3} + {\\left(\\sqrt{3} x_{3}^{2} - \\sqrt{3}\\right)} y_{3}^{2} - {\\left(\\sqrt{3} x_{3}^{3} + \\sqrt{3}\\right)} y_{3} - \\sqrt{3}}{2 \\, {\\left(x_{3}^{4} + y_{3}^{4} + 2 \\, {\\left(x_{3}^{2} + 1\\right)} y_{3}^{2} + 2 \\, x_{3}^{2} + 1\\right)}}, \\frac{x_{3}^{4} + y_{3}^{4} + 6 \\, {\\left(x_{3}^{2} + 2 \\, x_{3} + 1\\right)} y_{3}^{2} + 8 \\, y_{3}^{3} + 6 \\, x_{3}^{2} + 4 \\, {\\left(2 \\, x_{3}^{3} + 3 \\, x_{3}^{2} + 3 \\, x_{3}\\right)} y_{3} + 8 \\, x_{3} + 1}{4 \\, {\\left(x_{3}^{4} + y_{3}^{4} + 2 \\, {\\left(x_{3}^{2} + 1\\right)} y_{3}^{2} + 2 \\, x_{3}^{2} + 1\\right)}}\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠5cfe585d-17a6-433f-9647-2a365c046450i︠
%html
<p>The image of $\Psi$ is a self-intersecting surface of $\mathbb{R}^3$, called the <strong>Boy surface,</strong> after Werner Boy (1879-1914):</p>

︡4a8581e3-58b8-4168-93e1-6adbef043bfe︡︡{"done":true,"html":"<p>The image of $\\Psi$ is a self-intersecting surface of $\\mathbb{R}^3$, called the <strong>Boy surface,</strong> after Werner Boy (1879-1914):</p>"}
︠8ff36b58-e017-494a-bccf-507231460c91s︠
g1 = parametric_plot3d(Psi.expr(X1,Y), (x1,-10,10), (y1,-10,10), plot_points=[100,100])
g2 = parametric_plot3d(Psi.expr(X2,Y), (x2,-10,10), (y2,-10,10), plot_points=[100,100])
g3 = parametric_plot3d(Psi.expr(X3,Y), (x3,-10,10), (y3,-10,10), plot_points=[100,100])
show(g1+g2+g3)
︡72a76901-6145-4a78-bf1e-cb03bccefe90︡︡{"done":false,"file":{"uuid":"0aea9398-912b-4e10-bc3f-c1cf1d84db9c","filename":"0aea9398-912b-4e10-bc3f-c1cf1d84db9c.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠531c40c0-ebb8-4a1e-8d56-f5b7d23c89a4s︠
gX1 = X1.plot(Y, mapping=Psi, nb_values=40, plot_points=100)
gX2 = X2.plot(Y, mapping=Psi, nb_values=40, plot_points=100, color='green')
gX3 = X3.plot(Y, mapping=Psi, nb_values=40, plot_points=100, color='blue')
︡71dde0a1-bb63-49f0-a06e-f9d83ac51d3b︡︡{"done":true}
︠82bf5453-24c0-4354-a93f-c41043311180s︠
show(gX1)
︡393a4e41-2736-4bbc-b818-e48384da34aa︡{"done":false,"file":{"uuid":"1f97510e-7adb-4d54-990e-778fdfd71b0e","filename":"1f97510e-7adb-4d54-990e-778fdfd71b0e.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}︡
︠1d4bf01f-5b93-4108-857f-2c2c9bf3a8e6s︠
show(gX2)
︡b52513c0-f37c-459b-99b5-e06e62fdf6ef︡︡{"done":false,"file":{"uuid":"e6734bfd-de44-4352-a660-ae4719cda070","filename":"e6734bfd-de44-4352-a660-ae4719cda070.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠21c2357f-58af-43d3-a922-41e66b241c6bs︠
show(gX3)
︡1aa9d7b4-146a-4ae4-ab89-53094df96c6b︡︡{"done":false,"file":{"uuid":"25051255-67bd-4525-9cde-12864bde9585","filename":"25051255-67bd-4525-9cde-12864bde9585.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠d4f2e668-d884-4bf8-b8ee-f82b57b42b0cs︠
show(gX1+gX2+gX3)
︡d9255f8c-eefd-4ad5-b503-b55195ae4aa6︡︡{"done":false,"file":{"uuid":"8edf5c46-a9c2-4d6f-87b4-6c88a81c76c7","filename":"8edf5c46-a9c2-4d6f-87b4-6c88a81c76c7.sage3d"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠a40b56e7-608f-4d58-83c7-858c5d2b82b0s︠

︡5835df2a-c171-4a70-8da8-83c946dfca4b︡︡{"done":true}










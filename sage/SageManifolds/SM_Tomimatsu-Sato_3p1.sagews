︠1ba7bbe3-9ac5-4a5e-b651-7c174e9dd95ca︠
%auto
typeset_mode(True, display=False)
︡3d54264a-4d0e-4768-9a5d-8881bbd72df5︡{"auto":true}︡
︠ecc747fa-1ec7-49f4-b1a9-5c272fe0b439i︠
%html
<h1 style="text-align: center;">3+1 Einstein equations in the $\delta=2$ Tomimatsu-Sato spacetime</h1>
<p>This worksheet is based on <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.7) and regards the 3+1 slicing of the $\delta=2$ Tomimatsu-Sato spacetime.</p>
<p>It is released under the GNU General Public License version 2.</p>
<p>(c) Claire Som&eacute;, Eric Gourgoulhon (2015)</p>
<p><em><span style="color: #008080;">The worksheet file in Sage notebook format is</span> <a href="http://sagemanifolds.obspm.fr/examples/sws/SM_Tomimatsu-Sato_3p1.sws">here</a></em>.</p>
<h2>Tomimatsu-Sato spacetime</h2>
<p>The Tomimatsu-Sato solution is an exact stationary and axisymmetric&nbsp; solution of the vaccum Einstein equation, which is asymptotically flat and has a non-zero angular momentum. It has been found in 1972 by A. Tomimatsu and H. Sato [<a href="http://dx.doi.org/10.1103/PhysRevLett.29.1344">Phys. Rev. Lett. <strong>29</strong>, 1344 (1972)</a>], as a solution of the Ernst equation. It is actually the member $\delta=2$ of a larger family of solutions parametrized by a positive integer $\delta$ and exhibited by Tomimatsu and Sato in 1973 <a href="http://dx.doi.org/10.1143/PTP.50.95">[Prog. Theor. Phys. <strong>50</strong>, 95 (1973)</a>], the member $\delta=1$ being nothing but the Kerr metric. We refer to [<a href="http://dx.doi.org/10.1143/PTP.127.1057">Manko, Prog. Theor. Phys.<strong> 127</strong>, 1057 (2012)</a>] for a discussion of the properties of this solution.&nbsp;</p>
<h2>Spacelike hypersurface</h2>
<p>We consider some hypersurface $\Sigma$ of a spacelike foliation $(\Sigma_t)_{t\in\mathbb{R}}$ of&nbsp;$\delta=2$ Tomimatsu-Sato spacetime; we declare $\Sigma_t$ as a 3-dimensional manifold:</p>

︡1d73a92a-ba93-444a-8b92-05df03a4d85f︡︡{"done":true,"html":"<h1 style=\"text-align: center;\">3+1 Einstein equations in the $\\delta=2$ Tomimatsu-Sato spacetime</h1>\n<p>This worksheet is based on <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.7) and regards the 3+1 slicing of the $\\delta=2$ Tomimatsu-Sato spacetime.</p>\n<p>It is released under the GNU General Public License version 2.</p>\n<p>(c) Claire Som&eacute;, Eric Gourgoulhon (2015)</p>\n<p><em><span style=\"color: #008080;\">The worksheet file in Sage notebook format is</span> <a href=\"http://sagemanifolds.obspm.fr/examples/sws/SM_Tomimatsu-Sato_3p1.sws\">here</a></em>.</p>\n<h2>Tomimatsu-Sato spacetime</h2>\n<p>The Tomimatsu-Sato solution is an exact stationary and axisymmetric&nbsp; solution of the vaccum Einstein equation, which is asymptotically flat and has a non-zero angular momentum. It has been found in 1972 by A. Tomimatsu and H. Sato [<a href=\"http://dx.doi.org/10.1103/PhysRevLett.29.1344\">Phys. Rev. Lett. <strong>29</strong>, 1344 (1972)</a>], as a solution of the Ernst equation. It is actually the member $\\delta=2$ of a larger family of solutions parametrized by a positive integer $\\delta$ and exhibited by Tomimatsu and Sato in 1973 <a href=\"http://dx.doi.org/10.1143/PTP.50.95\">[Prog. Theor. Phys. <strong>50</strong>, 95 (1973)</a>], the member $\\delta=1$ being nothing but the Kerr metric. We refer to [<a href=\"http://dx.doi.org/10.1143/PTP.127.1057\">Manko, Prog. Theor. Phys.<strong> 127</strong>, 1057 (2012)</a>] for a discussion of the properties of this solution.&nbsp;</p>\n<h2>Spacelike hypersurface</h2>\n<p>We consider some hypersurface $\\Sigma$ of a spacelike foliation $(\\Sigma_t)_{t\\in\\mathbb{R}}$ of&nbsp;$\\delta=2$ Tomimatsu-Sato spacetime; we declare $\\Sigma_t$ as a 3-dimensional manifold:</p>"}
︠c09d2019-4756-4d88-99f7-4c61a030a7a8︠
Sig = Manifold(3, 'Sigma', r'\Sigma', start_index=1)
︡d1163d60-314b-4d0b-b57a-72d5bf73901c︡︡{"done":true}
︠fa28e872-892f-43ef-954a-582698f9146ci︠
%html
<p>On $\Sigma$, we consider the prolate spheroidal <span id="cell_outer_1">coordinates</span> $(x,y,\phi)$, with $x\in(1,+\infty)$, $y\in(-1,1)$ and $\phi\in(0,2\pi)$ :</p>

︡b49df5fe-9b7b-4597-8306-db029171bfd5︡︡{"done":true,"html":"<p>On $\\Sigma$, we consider the prolate spheroidal <span id=\"cell_outer_1\">coordinates</span> $(x,y,\\phi)$, with $x\\in(1,+\\infty)$, $y\\in(-1,1)$ and $\\phi\\in(0,2\\pi)$ :</p>"}
︠782480d4-b2d0-4bfa-baa3-6413b4b67dae︠
X.<r,y,ph> = Sig.chart(r'x:(1,+oo) y:(-1,1) ph:(0,2*pi):\phi')
print X ; X
︡5e635abf-fe16-41c9-929f-cd0ffb40a696︡︡{"stdout":"chart (Sigma, (x, y, ph))\n","done":false}︡{"html":"<div>$\\left(\\Sigma,(x, y, {\\phi})\\right)$</div>","done":false}︡{"done":true}
︠5d04fe5e-0c4d-4da8-b766-555791f8c93ai︠
%html
<h3>Riemannian metric on $\Sigma$</h3>
<p>The Tomimatsu-Sato metric depens on three parameters: the integer $\delta$, the real number $p\in[0,1]$, and the total mass $m$:</p>

︡67e5b1b5-0514-4d71-a594-f470c4b3f316︡︡{"done":true,"html":"<h3>Riemannian metric on $\\Sigma$</h3>\n<p>The Tomimatsu-Sato metric depens on three parameters: the integer $\\delta$, the real number $p\\in[0,1]$, and the total mass $m$:</p>"}
︠bc6db32b-224c-478b-9fea-d0f6053b83f4︠
var('d, p, m')
assume(m>0)
assumptions()
︡ab4b291b-76dc-496e-a5d5-bfb8f373f6d0︡︡{"html":"<div>($d$, $p$, $m$)</div>","done":false}︡{"html":"<div>[$\\text{\\texttt{x{ }is{ }real}}$, $x &gt; 1$, $\\text{\\texttt{y{ }is{ }real}}$, $y &gt; \\left(-1\\right)$, $y &lt; 1$, $\\text{\\texttt{ph{ }is{ }real}}$, ${\\phi} &gt; 0$, ${\\phi} &lt; 2 \\, \\pi$, $m &gt; 0$]</div>","done":false}︡{"done":true}
︠1ee9ab38-39e0-4461-a4fa-10a84f6f62cci︠
%html
<p>We set $\delta=2$ and choose a specific value for $p=1/5$:</p>

︡b4e671db-1216-4e9d-9c63-58105796e09d︡︡{"done":true,"html":"<p>We set $\\delta=2$ and choose a specific value for $p=1/5$:</p>"}
︠a7e08043-2016-4e0e-9d6d-e1501146593a︠
d = 2
p = 1/5
︡f66cd1ef-78e7-424d-ab6f-3e3c1c10a86c︡︡{"done":true}
︠e400a838-0f8e-49e9-9445-c9145dc87430i︠
%html
<p>Furthermore, without any loss of generality, we may set $m=1$ (this simply fixes some length scale):</p>

︡966cad97-ac8d-492a-92e5-2daf5d44305f︡︡{"done":true,"html":"<p>Furthermore, without any loss of generality, we may set $m=1$ (this simply fixes some length scale):</p>"}
︠65f3245e-0a06-4896-a0ba-7afe6a4a3601︠
m = 1
︡50d5648a-17f1-449e-8e58-c6ce11dd63c7︡︡{"done":true}
︠8b1d29a4-24a2-42b2-a998-097ebe436cffi︠
%html
<p>The parameter $q$ is related to $p$ by $p^2+q^2=1$:</p>

︡c76a88c7-28c1-417a-90c3-939fdbb2620c︡︡{"done":true,"html":"<p>The parameter $q$ is related to $p$ by $p^2+q^2=1$:</p>"}
︠a8854d39-954f-4627-b1f6-52baa497087f︠
q = sqrt(1-p^2)
︡2837524e-afd2-4fba-bc02-483843c0e01b︡︡{"done":true}
︠c4794685-0b5a-4ef2-ae50-6692804504e9i︠
%html
<p>Some shortcut notations:</p>

︡84bdd2b1-f10e-4d70-9e2e-624eec606870︡︡{"done":true,"html":"<p>Some shortcut notations:</p>"}
︠bbb2148a-72bd-4b2b-a93a-f373785976e3︠
AA2 = (p^2*(x^2-1)^2+q^2*(1-y^2)^2)^2-4*p^2*q^2*(x^2-1)*(1-y^2)*(x^2-y^2)^2
BB2 = (p^2*x^4+2*p*x^3-2*p*x+q^2*y^4-1)^2+4*q^2*y^2*(p*x^3-p*x*y^2-y^2+1)^2
CC2 = p^3*x*(1-x^2)*(2*(x^4-1)+(x^2+3)*(1-y^2))+p^2*(x^2-1)*((x^2-1)*(1-y^2)-4*x^2*(x^2-y^2))+q^2*(1-y^2)^3*(p*x+1)
︡1b7866ae-ab1a-455c-99df-ae402ce86339︡︡{"done":true}
︠13c2ff55-d9af-4164-8064-2803a05095f6i︠
%html
<p>The Riemannian metric $\gamma$ induced by the spacetime metric $g$ on $\Sigma$:</p>

︡77186048-eae2-4fd8-8c9c-225dbb929901︡︡{"done":true,"html":"<p>The Riemannian metric $\\gamma$ induced by the spacetime metric $g$ on $\\Sigma$:</p>"}
︠f76a01a6-1da1-4f37-ae24-9466bcbf8023︠
gam = Sig.riemann_metric('gam', latex_name=r'\gamma') 
gam[1,1] = m^2*BB2/(p^2*d^2*(x^2-1)*(x^2-y^2)^3)
gam[2,2] = m^2*BB2/(p^2*d^2*(y^2-1)*(-x^2+y^2)^3)
gam[3,3] = - m^2*(y^2-1)*(p^2*BB2^2*(x^2-1)+4*q^2*d^2*CC2^2*(y^2-1))/(AA2*BB2*d^2)
gam.display()
︡d88156d9-8e90-424f-9dcc-37b9e677e273︡︡{"html":"<div>$\\gamma = \\left( \\frac{x^{8} + 576 \\, y^{8} + 20 \\, x^{7} + 96 \\, {\\left(x^{2} + 10 \\, x + 25\\right)} y^{6} + 100 \\, x^{6} - 20 \\, x^{5} - 48 \\, {\\left(3 \\, x^{4} + 10 \\, x^{3} + 30 \\, x + 125\\right)} y^{4} - 250 \\, x^{4} - 500 \\, x^{3} + 96 \\, {\\left(x^{6} + 10 \\, x^{3} + 25\\right)} y^{2} + 100 \\, x^{2} + 500 \\, x + 625}{100 \\, {\\left(x^{8} - {\\left(x^{2} - 1\\right)} y^{6} - x^{6} + 3 \\, {\\left(x^{4} - x^{2}\\right)} y^{4} - 3 \\, {\\left(x^{6} - x^{4}\\right)} y^{2}\\right)}} \\right) \\mathrm{d} x\\otimes \\mathrm{d} x + \\left( \\frac{x^{8} + 576 \\, y^{8} + 20 \\, x^{7} + 96 \\, {\\left(x^{2} + 10 \\, x + 25\\right)} y^{6} + 100 \\, x^{6} - 20 \\, x^{5} - 48 \\, {\\left(3 \\, x^{4} + 10 \\, x^{3} + 30 \\, x + 125\\right)} y^{4} - 250 \\, x^{4} - 500 \\, x^{3} + 96 \\, {\\left(x^{6} + 10 \\, x^{3} + 25\\right)} y^{2} + 100 \\, x^{2} + 500 \\, x + 625}{100 \\, {\\left(y^{8} - {\\left(3 \\, x^{2} + 1\\right)} y^{6} + x^{6} + 3 \\, {\\left(x^{4} + x^{2}\\right)} y^{4} - {\\left(x^{6} + 3 \\, x^{4}\\right)} y^{2}\\right)}} \\right) \\mathrm{d} y\\otimes \\mathrm{d} y + \\left( -\\frac{576 \\, {\\left(x^{2} - 1\\right)} y^{10} - x^{10} - 40 \\, x^{9} + 96 \\, {\\left(x^{4} + 20 \\, x^{3} + 168 \\, x^{2} + 980 \\, x + 2431\\right)} y^{8} - 699 \\, x^{8} - 7920 \\, x^{7} - 48 \\, {\\left(3 \\, x^{6} + 20 \\, x^{5} - x^{4} + 80 \\, x^{3} + 1273 \\, x^{2} + 7900 \\, x + 19525\\right)} y^{6} - 39450 \\, x^{6} + 960 \\, x^{5} + 48 \\, {\\left(2 \\, x^{8} + x^{6} + 60 \\, x^{5} - 3 \\, x^{4} + 1675 \\, x^{2} + 11940 \\, x + 29525\\right)} y^{4} + 39450 \\, x^{4} + 6000 \\, x^{3} + {\\left(x^{10} + 40 \\, x^{9} + 603 \\, x^{8} + 7920 \\, x^{7} + 39546 \\, x^{6} - 2880 \\, x^{5} - 39450 \\, x^{4} - 4080 \\, x^{3} - 45675 \\, x^{2} - 385000 \\, x - 953425\\right)} y^{2} + 9675 \\, x^{2} + 97000 \\, x + 240625}{100 \\, {\\left(x^{8} + 576 \\, y^{8} + 20 \\, x^{7} + 96 \\, {\\left(x^{2} + 10 \\, x + 25\\right)} y^{6} + 100 \\, x^{6} - 20 \\, x^{5} - 48 \\, {\\left(3 \\, x^{4} + 10 \\, x^{3} + 30 \\, x + 125\\right)} y^{4} - 250 \\, x^{4} - 500 \\, x^{3} + 96 \\, {\\left(x^{6} + 10 \\, x^{3} + 25\\right)} y^{2} + 100 \\, x^{2} + 500 \\, x + 625\\right)}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠86ce0065-0f22-46d1-a6db-7d205c452452i︠
%html
<p>A matrix view of the components w.r.t. coordinates $(x,y,\phi)$:</p>

︡a47f5e31-32e5-4392-9673-ff456f4384e6︡︡{"done":true,"html":"<p>A matrix view of the components w.r.t. coordinates $(x,y,\\phi)$:</p>"}
︠f8dedf08-235b-4ac3-adf1-27ab9edd8139︠
gam[:]
︡9dfe400e-adca-4530-8754-96acfb2bc12f︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n\\frac{x^{8} + 576 \\, y^{8} + 20 \\, x^{7} + 96 \\, {\\left(x^{2} + 10 \\, x + 25\\right)} y^{6} + 100 \\, x^{6} - 20 \\, x^{5} - 48 \\, {\\left(3 \\, x^{4} + 10 \\, x^{3} + 30 \\, x + 125\\right)} y^{4} - 250 \\, x^{4} - 500 \\, x^{3} + 96 \\, {\\left(x^{6} + 10 \\, x^{3} + 25\\right)} y^{2} + 100 \\, x^{2} + 500 \\, x + 625}{100 \\, {\\left(x^{8} - {\\left(x^{2} - 1\\right)} y^{6} - x^{6} + 3 \\, {\\left(x^{4} - x^{2}\\right)} y^{4} - 3 \\, {\\left(x^{6} - x^{4}\\right)} y^{2}\\right)}} &amp; 0 &amp; 0 \\\\\n0 &amp; \\frac{x^{8} + 576 \\, y^{8} + 20 \\, x^{7} + 96 \\, {\\left(x^{2} + 10 \\, x + 25\\right)} y^{6} + 100 \\, x^{6} - 20 \\, x^{5} - 48 \\, {\\left(3 \\, x^{4} + 10 \\, x^{3} + 30 \\, x + 125\\right)} y^{4} - 250 \\, x^{4} - 500 \\, x^{3} + 96 \\, {\\left(x^{6} + 10 \\, x^{3} + 25\\right)} y^{2} + 100 \\, x^{2} + 500 \\, x + 625}{100 \\, {\\left(y^{8} - {\\left(3 \\, x^{2} + 1\\right)} y^{6} + x^{6} + 3 \\, {\\left(x^{4} + x^{2}\\right)} y^{4} - {\\left(x^{6} + 3 \\, x^{4}\\right)} y^{2}\\right)}} &amp; 0 \\\\\n0 &amp; 0 &amp; -\\frac{576 \\, {\\left(x^{2} - 1\\right)} y^{10} - x^{10} - 40 \\, x^{9} + 96 \\, {\\left(x^{4} + 20 \\, x^{3} + 168 \\, x^{2} + 980 \\, x + 2431\\right)} y^{8} - 699 \\, x^{8} - 7920 \\, x^{7} - 48 \\, {\\left(3 \\, x^{6} + 20 \\, x^{5} - x^{4} + 80 \\, x^{3} + 1273 \\, x^{2} + 7900 \\, x + 19525\\right)} y^{6} - 39450 \\, x^{6} + 960 \\, x^{5} + 48 \\, {\\left(2 \\, x^{8} + x^{6} + 60 \\, x^{5} - 3 \\, x^{4} + 1675 \\, x^{2} + 11940 \\, x + 29525\\right)} y^{4} + 39450 \\, x^{4} + 6000 \\, x^{3} + {\\left(x^{10} + 40 \\, x^{9} + 603 \\, x^{8} + 7920 \\, x^{7} + 39546 \\, x^{6} - 2880 \\, x^{5} - 39450 \\, x^{4} - 4080 \\, x^{3} - 45675 \\, x^{2} - 385000 \\, x - 953425\\right)} y^{2} + 9675 \\, x^{2} + 97000 \\, x + 240625}{100 \\, {\\left(x^{8} + 576 \\, y^{8} + 20 \\, x^{7} + 96 \\, {\\left(x^{2} + 10 \\, x + 25\\right)} y^{6} + 100 \\, x^{6} - 20 \\, x^{5} - 48 \\, {\\left(3 \\, x^{4} + 10 \\, x^{3} + 30 \\, x + 125\\right)} y^{4} - 250 \\, x^{4} - 500 \\, x^{3} + 96 \\, {\\left(x^{6} + 10 \\, x^{3} + 25\\right)} y^{2} + 100 \\, x^{2} + 500 \\, x + 625\\right)}}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠9e3b988b-d192-4b65-b356-2d0bc702fa9ci︠
%html
<h3>Lapse function and shift vector</h3>

︡45d30744-50a4-43d7-be93-2ece8eeb976e︡︡{"done":true,"html":"<h3>Lapse function and shift vector</h3>"}
︠c3c1aa65-2e3f-40dc-a56e-115c6c4584f0︠
N2 = AA2/BB2 - 2*m*q*CC2*(y^2-1)/BB2*(2*m*q*CC2*(y^2-1)/(BB2*(m^2*(y^2-1)*(p^2*BB2^2*(x^2-1)+4*q^2*d^2*CC2^2*(y^2-1))/(AA2*BB2*d^2)))) 
N2.simplify_full()
︡b51e351a-b4ea-466f-ac4d-bff5ba1ad135︡︡{"html":"<div>$\\frac{x^{10} + 20 \\, x^{9} + 576 \\, {\\left(x^{2} - 1\\right)} y^{8} + 99 \\, x^{8} - 40 \\, x^{7} + 96 \\, {\\left(x^{4} + 10 \\, x^{3} + 24 \\, x^{2} - 10 \\, x - 25\\right)} y^{6} - 350 \\, x^{6} - 480 \\, x^{5} - 48 \\, {\\left(3 \\, x^{6} + 10 \\, x^{5} - 3 \\, x^{4} + 20 \\, x^{3} + 125 \\, x^{2} - 30 \\, x - 125\\right)} y^{4} + 350 \\, x^{4} + 1000 \\, x^{3} + 96 \\, {\\left(x^{8} - x^{6} + 10 \\, x^{5} - 10 \\, x^{3} + 25 \\, x^{2} - 25\\right)} y^{2} + 525 \\, x^{2} - 500 \\, x - 625}{x^{10} + 40 \\, x^{9} + 576 \\, {\\left(x^{2} - 1\\right)} y^{8} + 699 \\, x^{8} + 7920 \\, x^{7} + 96 \\, {\\left(x^{4} + 20 \\, x^{3} + 174 \\, x^{2} + 980 \\, x + 2425\\right)} y^{6} + 39450 \\, x^{6} - 960 \\, x^{5} - 48 \\, {\\left(3 \\, x^{6} + 20 \\, x^{5} - 3 \\, x^{4} + 40 \\, x^{3} + 925 \\, x^{2} + 5940 \\, x + 14675\\right)} y^{4} - 39450 \\, x^{4} - 6000 \\, x^{3} + 96 \\, {\\left(x^{8} - x^{6} + 20 \\, x^{5} - 20 \\, x^{3} + 375 \\, x^{2} + 3000 \\, x + 7425\\right)} y^{2} - 9675 \\, x^{2} - 97000 \\, x - 240625}$</div>","done":false}︡{"done":true}
︠06710f5e-5cce-4102-84ce-aef80b5a54af︠
N = Sig.scalar_field(sqrt(N2.simplify_full()), name='N')
print N
N.display()
︡1deaca59-43c7-4865-9782-bf69daa22ee8︡︡{"stdout":"scalar field 'N' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} N:&amp; \\Sigma &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, {\\phi}\\right) &amp; \\longmapsto &amp; \\sqrt{\\frac{x^{10} + 20 \\, x^{9} + 576 \\, {\\left(x^{2} - 1\\right)} y^{8} + 99 \\, x^{8} - 40 \\, x^{7} + 96 \\, {\\left(x^{4} + 10 \\, x^{3} + 24 \\, x^{2} - 10 \\, x - 25\\right)} y^{6} - 350 \\, x^{6} - 480 \\, x^{5} - 48 \\, {\\left(3 \\, x^{6} + 10 \\, x^{5} - 3 \\, x^{4} + 20 \\, x^{3} + 125 \\, x^{2} - 30 \\, x - 125\\right)} y^{4} + 350 \\, x^{4} + 1000 \\, x^{3} + 96 \\, {\\left(x^{8} - x^{6} + 10 \\, x^{5} - 10 \\, x^{3} + 25 \\, x^{2} - 25\\right)} y^{2} + 525 \\, x^{2} - 500 \\, x - 625}{x^{10} + 40 \\, x^{9} + 576 \\, {\\left(x^{2} - 1\\right)} y^{8} + 699 \\, x^{8} + 7920 \\, x^{7} + 96 \\, {\\left(x^{4} + 20 \\, x^{3} + 174 \\, x^{2} + 980 \\, x + 2425\\right)} y^{6} + 39450 \\, x^{6} - 960 \\, x^{5} - 48 \\, {\\left(3 \\, x^{6} + 20 \\, x^{5} - 3 \\, x^{4} + 40 \\, x^{3} + 925 \\, x^{2} + 5940 \\, x + 14675\\right)} y^{4} - 39450 \\, x^{4} - 6000 \\, x^{3} + 96 \\, {\\left(x^{8} - x^{6} + 20 \\, x^{5} - 20 \\, x^{3} + 375 \\, x^{2} + 3000 \\, x + 7425\\right)} y^{2} - 9675 \\, x^{2} - 97000 \\, x - 240625}} \\end{array}$</div>","done":false}︡{"done":true}
︠1387c147-c987-4ef8-8e2c-6c8d7ca2591a︠
b3 = 2*m*q*CC2*(y^2-1)/(BB2*(m^2*(y^2-1)*(p^2*BB2^2*(x^2-1)+4*q^2*d^2*CC2^2*(y^2-1))/(AA2*BB2*d^2)))
b = Sig.vector_field('beta', latex_name=r'\beta') 
b[3] = b3.simplify_full()
# unset components are zero 
b.display()
︡dc3b151f-cfdc-496f-9133-16b6dee2a787︡︡{"html":"<div>$\\beta = \\left( -\\frac{400 \\, {\\left(2 \\, \\sqrt{3} \\sqrt{2} x^{7} + 20 \\, \\sqrt{3} \\sqrt{2} x^{6} + 24 \\, {\\left(\\sqrt{3} \\sqrt{2} x + 5 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{6} - \\sqrt{3} \\sqrt{2} x^{5} - 25 \\, \\sqrt{3} \\sqrt{2} x^{4} - 72 \\, {\\left(\\sqrt{3} \\sqrt{2} x + 5 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{4} + 10 \\, \\sqrt{3} \\sqrt{2} x^{2} - {\\left(\\sqrt{3} \\sqrt{2} x^{5} + 15 \\, \\sqrt{3} \\sqrt{2} x^{4} + 2 \\, \\sqrt{3} \\sqrt{2} x^{3} - 10 \\, \\sqrt{3} \\sqrt{2} x^{2} - 75 \\, \\sqrt{3} \\sqrt{2} x - 365 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{2} - 25 \\, \\sqrt{3} \\sqrt{2} x - 125 \\, \\sqrt{3} \\sqrt{2}\\right)}}{x^{10} + 40 \\, x^{9} + 576 \\, {\\left(x^{2} - 1\\right)} y^{8} + 699 \\, x^{8} + 7920 \\, x^{7} + 96 \\, {\\left(x^{4} + 20 \\, x^{3} + 174 \\, x^{2} + 980 \\, x + 2425\\right)} y^{6} + 39450 \\, x^{6} - 960 \\, x^{5} - 48 \\, {\\left(3 \\, x^{6} + 20 \\, x^{5} - 3 \\, x^{4} + 40 \\, x^{3} + 925 \\, x^{2} + 5940 \\, x + 14675\\right)} y^{4} - 39450 \\, x^{4} - 6000 \\, x^{3} + 96 \\, {\\left(x^{8} - x^{6} + 20 \\, x^{5} - 20 \\, x^{3} + 375 \\, x^{2} + 3000 \\, x + 7425\\right)} y^{2} - 9675 \\, x^{2} - 97000 \\, x - 240625} \\right) \\frac{\\partial}{\\partial {\\phi} }$</div>","done":false}︡{"done":true}
︠685ebb7e-d03e-4c9d-acd8-b61a2077e27bi︠
%html
<h3>Extrinsic curvature of $\Sigma$</h3>
<p>We use the formula \[ K_{ij} = \frac{1}{2N} \mathcal{L}_{\beta} \gamma_{ij}, \] which is valid for any stationary spacetime:</p>

︡f2a73e49-01a3-4e60-8f0e-8ba62b40ce61︡︡{"done":true,"html":"<h3>Extrinsic curvature of $\\Sigma$</h3>\n<p>We use the formula \\[ K_{ij} = \\frac{1}{2N} \\mathcal{L}_{\\beta} \\gamma_{ij}, \\] which is valid for any stationary spacetime:</p>"}
︠1145cab2-6a45-40f1-9ac2-cc1a6fabd4bb︠
K = gam.lie_der(b) / (2*N)
K.set_name('K')
print K
︡95816fb6-4b6a-4946-ab7b-c20f8f69212d︡︡{"stdout":"field of symmetric bilinear forms 'K' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}
︠0a70308e-8bb4-42c3-a224-ad6d1b6a028ei︠
%html
<p>The component $K_{13} = K_{x\phi}$:</p>

︡de006603-35a2-4e4e-8e08-e71fa1cf560e︡︡{"done":true,"html":"<p>The component $K_{13} = K_{x\\phi}$:</p>"}
︠c5e00ee7-d63c-4880-a16b-f42e87c0a025︠
K[1,3]
︡f8425bb7-179c-4c8d-b085-8878b34a340e︡︡{"html":"<div>$\\frac{2 \\, {\\left(6 \\, \\sqrt{3} \\sqrt{2} x^{16} - 13824 \\, {\\left(\\sqrt{3} \\sqrt{2} x^{2} + 10 \\, \\sqrt{3} \\sqrt{2} x + \\sqrt{3} \\sqrt{2}\\right)} y^{16} + 240 \\, \\sqrt{3} \\sqrt{2} x^{15} + 3793 \\, \\sqrt{3} \\sqrt{2} x^{14} - 6912 \\, {\\left(\\sqrt{3} \\sqrt{2} x^{4} + 20 \\, \\sqrt{3} \\sqrt{2} x^{3} + 150 \\, \\sqrt{3} \\sqrt{2} x^{2} + 500 \\, \\sqrt{3} \\sqrt{2} x + 817 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{14} + 27650 \\, \\sqrt{3} \\sqrt{2} x^{13} + 72403 \\, \\sqrt{3} \\sqrt{2} x^{12} + 576 \\, {\\left(27 \\, \\sqrt{3} \\sqrt{2} x^{6} + 310 \\, \\sqrt{3} \\sqrt{2} x^{5} + 1033 \\, \\sqrt{3} \\sqrt{2} x^{4} + 1060 \\, \\sqrt{3} \\sqrt{2} x^{3} + 10493 \\, \\sqrt{3} \\sqrt{2} x^{2} + 44870 \\, \\sqrt{3} \\sqrt{2} x + 69503 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{12} - 81820 \\, \\sqrt{3} \\sqrt{2} x^{11} - 374975 \\, \\sqrt{3} \\sqrt{2} x^{10} - 96 \\, {\\left(109 \\, \\sqrt{3} \\sqrt{2} x^{8} + 520 \\, \\sqrt{3} \\sqrt{2} x^{7} + 1504 \\, \\sqrt{3} \\sqrt{2} x^{6} + 19360 \\, \\sqrt{3} \\sqrt{2} x^{5} + 92770 \\, \\sqrt{3} \\sqrt{2} x^{4} + 157960 \\, \\sqrt{3} \\sqrt{2} x^{3} + 148264 \\, \\sqrt{3} \\sqrt{2} x^{2} + 731920 \\, \\sqrt{3} \\sqrt{2} x + 1256425 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{10} - 313810 \\, \\sqrt{3} \\sqrt{2} x^{9} + 669975 \\, \\sqrt{3} \\sqrt{2} x^{8} + 24 \\, {\\left(9 \\, \\sqrt{3} \\sqrt{2} x^{10} + 250 \\, \\sqrt{3} \\sqrt{2} x^{9} + 6873 \\, \\sqrt{3} \\sqrt{2} x^{8} + 40920 \\, \\sqrt{3} \\sqrt{2} x^{7} + 63402 \\, \\sqrt{3} \\sqrt{2} x^{6} + 146220 \\, \\sqrt{3} \\sqrt{2} x^{5} + 1047426 \\, \\sqrt{3} \\sqrt{2} x^{4} + 2249400 \\, \\sqrt{3} \\sqrt{2} x^{3} + 876525 \\, \\sqrt{3} \\sqrt{2} x^{2} + 4308810 \\, \\sqrt{3} \\sqrt{2} x + 8401925 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{8} + 1617000 \\, \\sqrt{3} \\sqrt{2} x^{7} + 999675 \\, \\sqrt{3} \\sqrt{2} x^{6} + 96 \\, {\\left(20 \\, \\sqrt{3} \\sqrt{2} x^{11} - 179 \\, \\sqrt{3} \\sqrt{2} x^{10} - 50 \\, \\sqrt{3} \\sqrt{2} x^{9} - 2897 \\, \\sqrt{3} \\sqrt{2} x^{8} - 28400 \\, \\sqrt{3} \\sqrt{2} x^{7} - 57446 \\, \\sqrt{3} \\sqrt{2} x^{6} - 9020 \\, \\sqrt{3} \\sqrt{2} x^{5} - 237650 \\, \\sqrt{3} \\sqrt{2} x^{4} - 731060 \\, \\sqrt{3} \\sqrt{2} x^{3} - 267175 \\, \\sqrt{3} \\sqrt{2} x^{2} - 1037250 \\, \\sqrt{3} \\sqrt{2} x - 2111325 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{6} - 2277250 \\, \\sqrt{3} \\sqrt{2} x^{5} - 4979375 \\, \\sqrt{3} \\sqrt{2} x^{4} - {\\left(187 \\, \\sqrt{3} \\sqrt{2} x^{14} + 3590 \\, \\sqrt{3} \\sqrt{2} x^{13} - 5207 \\, \\sqrt{3} \\sqrt{2} x^{12} - 73540 \\, \\sqrt{3} \\sqrt{2} x^{11} - 454637 \\, \\sqrt{3} \\sqrt{2} x^{10} - 1150150 \\, \\sqrt{3} \\sqrt{2} x^{9} + 199401 \\, \\sqrt{3} \\sqrt{2} x^{8} - 1059000 \\, \\sqrt{3} \\sqrt{2} x^{7} - 7811175 \\, \\sqrt{3} \\sqrt{2} x^{6} + 2899610 \\, \\sqrt{3} \\sqrt{2} x^{5} + 1675075 \\, \\sqrt{3} \\sqrt{2} x^{4} - 32834500 \\, \\sqrt{3} \\sqrt{2} x^{3} - 24681575 \\, \\sqrt{3} \\sqrt{2} x^{2} - 69684250 \\, \\sqrt{3} \\sqrt{2} x - 122823125 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{4} - 4037500 \\, \\sqrt{3} \\sqrt{2} x^{3} + 3461875 \\, \\sqrt{3} \\sqrt{2} x^{2} - 6 \\, {\\left(\\sqrt{3} \\sqrt{2} x^{16} + 40 \\, \\sqrt{3} \\sqrt{2} x^{15} + 601 \\, \\sqrt{3} \\sqrt{2} x^{14} + 4010 \\, \\sqrt{3} \\sqrt{2} x^{13} + 12935 \\, \\sqrt{3} \\sqrt{2} x^{12} - 1060 \\, \\sqrt{3} \\sqrt{2} x^{11} + 10449 \\, \\sqrt{3} \\sqrt{2} x^{10} + 139590 \\, \\sqrt{3} \\sqrt{2} x^{9} + 57825 \\, \\sqrt{3} \\sqrt{2} x^{8} + 146960 \\, \\sqrt{3} \\sqrt{2} x^{7} + 781475 \\, \\sqrt{3} \\sqrt{2} x^{6} - 702250 \\, \\sqrt{3} \\sqrt{2} x^{5} - 2108075 \\, \\sqrt{3} \\sqrt{2} x^{4} - 348500 \\, \\sqrt{3} \\sqrt{2} x^{3} + 2381875 \\, \\sqrt{3} \\sqrt{2} x^{2} + 5456250 \\, \\sqrt{3} \\sqrt{2} x + 6941250 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{2} + 7231250 \\, \\sqrt{3} \\sqrt{2} x + 6109375 \\, \\sqrt{3} \\sqrt{2}\\right)} \\sqrt{x^{10} + 40 \\, x^{9} + 576 \\, {\\left(x^{2} - 1\\right)} y^{8} + 699 \\, x^{8} + 7920 \\, x^{7} + 96 \\, {\\left(x^{4} + 20 \\, x^{3} + 174 \\, x^{2} + 980 \\, x + 2425\\right)} y^{6} + 39450 \\, x^{6} - 960 \\, x^{5} - 48 \\, {\\left(3 \\, x^{6} + 20 \\, x^{5} - 3 \\, x^{4} + 40 \\, x^{3} + 925 \\, x^{2} + 5940 \\, x + 14675\\right)} y^{4} - 39450 \\, x^{4} - 6000 \\, x^{3} + 96 \\, {\\left(x^{8} - x^{6} + 20 \\, x^{5} - 20 \\, x^{3} + 375 \\, x^{2} + 3000 \\, x + 7425\\right)} y^{2} - 9675 \\, x^{2} - 97000 \\, x - 240625}}{{\\left(x^{18} + 60 \\, x^{17} + 331776 \\, {\\left(x^{2} - 1\\right)} y^{16} + 1599 \\, x^{16} + 25880 \\, x^{15} + 110592 \\, {\\left(x^{4} + 15 \\, x^{3} + 99 \\, x^{2} + 485 \\, x + 1200\\right)} y^{14} + 266700 \\, x^{14} + 1555560 \\, x^{13} - 9216 \\, {\\left(17 \\, x^{6} + 60 \\, x^{5} - 417 \\, x^{4} - 3040 \\, x^{3} - 13425 \\, x^{2} - 31020 \\, x - 16975\\right)} y^{12} + 3533300 \\, x^{12} - 4005000 \\, x^{11} + 9216 \\, {\\left(9 \\, x^{8} - 60 \\, x^{7} - 509 \\, x^{6} - 2430 \\, x^{5} - 9525 \\, x^{4} - 24260 \\, x^{3} - 71775 \\, x^{2} - 227250 \\, x - 290600\\right)} y^{10} - 17787450 \\, x^{10} - 18420000 \\, x^{9} + 5760 \\, {\\left(7 \\, x^{10} + 90 \\, x^{9} + 473 \\, x^{8} + 2460 \\, x^{7} + 10050 \\, x^{6} + 15200 \\, x^{5} + 53790 \\, x^{4} + 120900 \\, x^{3} + 198455 \\, x^{2} + 741350 \\, x + 1103625\\right)} y^{8} + 15656250 \\, x^{8} + 31485000 \\, x^{7} - 192 \\, {\\left(143 \\, x^{12} + 675 \\, x^{11} - 1043 \\, x^{10} - 7575 \\, x^{9} - 52650 \\, x^{8} - 224850 \\, x^{7} - 156150 \\, x^{6} + 1001250 \\, x^{5} + 3726075 \\, x^{4} + 6217375 \\, x^{3} + 4145625 \\, x^{2} + 19413125 \\, x + 33330000\\right)} y^{6} + 3527500 \\, x^{6} + 12975000 \\, x^{5} + 96 \\, {\\left(93 \\, x^{14} - 105 \\, x^{13} - 1693 \\, x^{12} - 13470 \\, x^{11} - 99575 \\, x^{10} - 222675 \\, x^{9} - 149025 \\, x^{8} - 1024500 \\, x^{7} - 2270025 \\, x^{6} + 2366625 \\, x^{5} + 9545625 \\, x^{4} + 11931250 \\, x^{3} + 451875 \\, x^{2} + 11346875 \\, x + 28273125\\right)} y^{4} + 80032500 \\, x^{4} + 102025000 \\, x^{3} + 192 \\, {\\left(x^{16} + 30 \\, x^{15} + 399 \\, x^{14} + 3955 \\, x^{13} + 19950 \\, x^{12} + 3765 \\, x^{11} + 19850 \\, x^{10} + 197000 \\, x^{9} + 47025 \\, x^{8} + 77000 \\, x^{7} + 646875 \\, x^{6} - 598125 \\, x^{5} - 2642500 \\, x^{4} - 2896875 \\, x^{3} + 1117500 \\, x^{2} + 1581250 \\, x - 687500\\right)} y^{2} - 78609375 \\, x^{2} - 180937500 \\, x - 150390625\\right)} \\sqrt{x^{8} + 576 \\, y^{8} + 20 \\, x^{7} + 96 \\, {\\left(x^{2} + 10 \\, x + 25\\right)} y^{6} + 100 \\, x^{6} - 20 \\, x^{5} - 48 \\, {\\left(3 \\, x^{4} + 10 \\, x^{3} + 30 \\, x + 125\\right)} y^{4} - 250 \\, x^{4} - 500 \\, x^{3} + 96 \\, {\\left(x^{6} + 10 \\, x^{3} + 25\\right)} y^{2} + 100 \\, x^{2} + 500 \\, x + 625} \\sqrt{x + 1} \\sqrt{x - 1}}$</div>","done":false}︡{"done":true}
︠c3cbbb29-0fbf-4b54-91df-334916b63cb6i︠
%html
<p>The type-(1,1) tensor $K^\sharp$ of components $K^i_{\ \, j} = \gamma^{ik} K_{kj}$:</p>

︡8d4b4231-8aad-4863-8689-b30ecea8d207︡︡{"done":true,"html":"<p>The type-(1,1) tensor $K^\\sharp$ of components $K^i_{\\ \\, j} = \\gamma^{ik} K_{kj}$:</p>"}
︠2c5071df-2577-41aa-8d5e-315f2624d126︠
Ku = K.up(gam, 0)
print Ku
︡607cc46a-a2c2-458a-b25c-c0175472c95d︡︡{"stdout":"tensor field of type (1,1) on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}
︠c6be4034-d4df-4e3c-9d45-cc7fbd48e60ai︠
%html
<p>We may check that the hypersurface $\Sigma$ is maximal, i.e. that $K^k_{\ \, k} = 0$:</p>

︡e6699a56-c256-49e9-9f6f-5cf0cece5ce1︡︡{"done":true,"html":"<p>We may check that the hypersurface $\\Sigma$ is maximal, i.e. that $K^k_{\\ \\, k} = 0$:</p>"}
︠0e480fcd-a833-4557-958f-9ed8a99ca170︠
trK = Ku.trace()
print trK
︡01b0712d-40d0-4b54-b033-442b94997e22︡︡{"stdout":"scalar field on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}
︠725bc1be-a91e-4eb9-b738-971f57075b12i︠
%html
<h3>Connection and curvature</h3>
<p>Let us call $D$ the Levi-Civita connection associated with $\gamma$: </p>

︡292c099f-2646-4efd-970e-7946c4971d4e︡︡{"done":true,"html":"<h3>Connection and curvature</h3>\n<p>Let us call $D$ the Levi-Civita connection associated with $\\gamma$: </p>"}
︠b79bd323-8ff2-429b-81a2-66c67368a220︠
D = gam.connection(name='D')
print D
︡d14008e6-d094-4807-8f2f-f8eb0c034603︡︡{"stdout":"Levi-Civita connection 'D' associated with the Riemannian metric 'gam' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}
︠8502f48e-c0ea-45be-b768-af864a1f4f84i︠
%html
<p>The Ricci tensor associated with $\gamma$:</p>

︡70cd2364-7983-4271-af46-6bfe4b5c554c︡︡{"done":true,"html":"<p>The Ricci tensor associated with $\\gamma$:</p>"}
︠62c2e6b6-e30f-4304-a710-d5e22a664b71︠
Ric = gam.ricci()
print Ric
︡3aa89f7b-7df6-4daa-bcc3-3a13a165cb1f︡{"stdout":"field of symmetric bilinear forms 'Ric(gam)' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡︡︡
︠220b2daa-9f99-4262-9966-ab029e430f51i︠
%html
<p>The scalar curvature $R = \gamma^{ij} R_{ij}$:</p>

︡7179d427-a911-40d9-b541-d88d90c131e5︡︡{"done":true,"html":"<p>The scalar curvature $R = \\gamma^{ij} R_{ij}$:</p>"}
︠9cc21cde-7a34-4255-a83e-56e7383b8bd0︠
R = gam.ricci_scalar(name='R')
print R
︡29d1411f-87da-42ee-99ce-b79f92afbc4c︡{"stdout":"scalar field 'R' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠89ff61c6-9563-4bae-be74-663f90802537i︠
%html
<h2>3+1 Einstein equations</h2>
<p>Let us check that the vacuum 3+1 Einstein equations are satisfied.</p>
<p>We start by the constraint equations:</p>
<h3>Hamiltonian constraint</h3>
<p>Let us first evaluate the term $K_{ij} K^{ij}$:</p>

︡347bc421-c66f-4c38-a9da-1e0819a47acb︡︡{"done":true,"html":"<h2>3+1 Einstein equations</h2>\n<p>Let us check that the vacuum 3+1 Einstein equations are satisfied.</p>\n<p>We start by the constraint equations:</p>\n<h3>Hamiltonian constraint</h3>\n<p>Let us first evaluate the term $K_{ij} K^{ij}$:</p>"}
︠
Kuu = Ku.up(gam, 1)
trKK = K['_ij']*Kuu['^ij']
print trKK
︡31007f1d-e594-42e6-806a-ddd57a3f0e36︡︡
︠26ab870c-18e9-488b-b966-0a75aaee0e93i︠
%html
<p>The vacuum Hamiltonian constraint equation is \[R + K^2 -K_{ij} K^{ij} = 0 \]</p>

︡11369215-1299-411b-a4bc-39511a9cb917︡︡{"done":true,"html":"<p>The vacuum Hamiltonian constraint equation is \\[R + K^2 -K_{ij} K^{ij} = 0 \\]</p>"}
︠4f8543ae-ede3-4d62-8a5a-5ce7365abbe3︠
︠
Ham = R + trK^2 - trKK
print Ham ; Ham.display()
︡42956103-0b08-4d3d-9acf-adb4ac234bd4︡{"done":false,"stde":"Eo in lines 1-1\nTaceback (most ecent call last):\n  File \"/pojects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_seve.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"<sting>\", line 1\n    ︠\n    ^\nSyntaxError: invalid syntax\n"}︡{"done":true}︡
︠7a052a2f-06d2-45a2-89c6-bf636d976684i︠
%html
<p>Hence the Hamiltonian constraint is satisfied.</p>

<h3>Momentum constraint</h3>
<p>In vaccum, the momentum constraint is \[ D_j K^j_{\ \, i} - D_i K = 0 \]</p>

︡e9a55975-9500-439d-bf7e-9eedc57dabe4︡︡{"done":true,"html":"<p>Hence the Hamiltonian constraint is satisfied.</p>\n\n<h3>Momentum constraint</h3>\n<p>In vaccum, the momentum constraint is \\[ D_j K^j_{\\ \\, i} - D_i K = 0 \\]</p>"}
︠c7cf1afb-9ae9-4309-bbc6-2f8a1d53f99c︠
︠
mom = D(Ku).trace(0,2) - D(trK)
print mom
mom.display()
︡e41a2b86-1812-4702-9cc1-4de89ebb2191︡{"done":false,"stde":"Eo in lines 1-1\nTaceback (most ecent call last):\n  File \"/pojects/sage/sage-6.9/local/lib/python2.7/site-packages/smc_sagews/sage_seve.py\", line 905, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"<sting>\", line 1\n    ︠\n    ^\nSyntaxError: invalid syntax\n"}︡{"done":true}︡
︠21166208-11ab-4fcd-950d-093b3c394055i︠
%html
<p>Hence the momentum constraint is satisfied.</p>

<h3>Dynamical Einstein equations</h3>
<p>Let us first evaluate the symmetric bilinear form $k_{ij} := K_{ik} K^k_{\ \, j}$:</p>

︡653e6b64-b574-49ef-87b8-63420ea18bf1︡︡{"done":true,"html":"<p>Hence the momentum constraint is satisfied.</p>\n\n<h3>Dynamical Einstein equations</h3>\n<p>Let us first evaluate the symmetric bilinear form $k_{ij} := K_{ik} K^k_{\\ \\, j}$:</p>"}
︠b32a5fa3-c8bf-4f29-a723-eaac7cfd30b8︠
KK = K['_ik']*Ku['^k_j']
print KK
︡259d5dd5-d01c-46f5-bf1b-26108dddd147︡{"stdout":"tensor field of type (0,2) on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠d8ca0a12-82fb-4629-a325-bdcfc6d1a048︠
KK1 = KK.symmetrize()
KK == KK1
︡1913754d-ebba-4448-b9b1-dc3def41ba86︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}︡
︠12480b59-3beb-479e-a458-3f39f5dde60b︠
KK = KK1
print KK
︡caeaf0cc-c23f-468f-a90e-2f36b9998649︡{"stdout":"field of symmetric bilinear forms on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠8fedf49f-0e6c-4eeb-a9c5-fb37c08a0a7bi︠
%html
<p>In vacuum and for stationary spacetimes, the dynamical Einstein equations are \[ \mathcal{L}_\beta K_{ij} - D_i D_j N + N \left( R_{ij} + K K_{ij} - 2 K_{ik} K^k_{\ \, j}\right) = 0 \]</p>

︡3da4b03f-52bb-422e-9941-6b146dd2f1e6︡︡{"done":true,"html":"<p>In vacuum and for stationary spacetimes, the dynamical Einstein equations are \\[ \\mathcal{L}_\\beta K_{ij} - D_i D_j N + N \\left( R_{ij} + K K_{ij} - 2 K_{ik} K^k_{\\ \\, j}\\right) = 0 \\]</p>"}
︠
dyn = K.lie_der(b) - D(D(N)) + N*( Ric + trK*K - 2*KK )
print dyn ; dyn.display()
︡a5e20a4c-b249-4623-ab7b-77bc6fdd6cd6︡︡
︠2c871b91-5206-411a-bffb-c355d12fd539i︠
%html
<p>Hence the dynamical Einstein equations are satisfied.</p>

<p>Finally we have checked that all the 3+1 Einstein equations are satisfied by the $\delta=2$ Tomimatsu-Sato solution.</p>

︡c92c979a-42a0-4fe1-9498-b1fa032208d3︡︡{"done":true,"html":"<p>Hence the dynamical Einstein equations are satisfied.</p>\n\n<p>Finally we have checked that all the 3+1 Einstein equations are satisfied by the $\\delta=2$ Tomimatsu-Sato solution.</p>"}
︠ec06bf8f-cb2c-42bb-82cd-eecc914eb5be︠

︡e5b8a72e-1bd1-4d07-9b60-f97074e71890︡{"done":true}︡










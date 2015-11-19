︠e8a2b812-3ef3-49ed-836b-aed1df48407ca︠
%auto
typeset_mode(True, display=False)
︡991236fd-7e0a-48a0-ac38-f99ff7cf09ff︡{"auto":true}︡
︠f368570a-bb34-461c-8b1e-4964baa2d60di︠
%html
<h1 style="text-align: center;">3+1 Simon-Mars tensor in the $\delta=2$ Tomimatsu-Sato spacetime</h1>
<p>This is&nbsp; a <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.7) worksheet implementing the computation of the 3+1 decomposition of the Simon-Mars tensor in the $\delta=2$ Tomimatsu-Sato spacetime. The results obtained here are used in the article <a href="http://arxiv.org/abs/1412.6542">arXiv:1412.6542</a>.</p>
<p>The worksheet is released under the GNU General Public License version 2.</p>
<p>(c) Claire Som&eacute;, Eric Gourgoulhon (2015)</p>
<p><em><span style="color: #008080;">The worksheet file in Sage notebook format is</span> <a href="http://sagemanifolds.obspm.fr/examples/sws/SM_Simon-Mars_3p1_TS2.sws">here</a></em>.</p>
<h2>Tomimatsu-Sato spacetime</h2>
<p>The Tomimatsu-Sato metric is an exact stationary and axisymmetric&nbsp; solution of the vacuum Einstein equation, which is asymptotically flat and has a non-zero angular momentum. It has been found in 1972 by A. Tomimatsu and H. Sato [<a href="http://dx.doi.org/10.1103/PhysRevLett.29.1344">Phys. Rev. Lett. <strong>29</strong>, 1344 (1972)</a>], as a solution of the Ernst equation. It is actually the member $\delta=2$ of a larger family of solutions parametrized by a positive integer $\delta$ and exhibited by Tomimatsu and Sato in 1973 <a href="http://dx.doi.org/10.1143/PTP.50.95">[Prog. Theor. Phys. <strong>50</strong>, 95 (1973)</a>], the member $\delta=1$ being nothing but the Kerr metric. We refer to [<a href="http://dx.doi.org/10.1143/PTP.127.1057">Manko, Prog. Theor. Phys.<strong> 127</strong>, 1057 (2012)</a>] for a discussion of the properties of this solution.</p>
<h2>Spacelike hypersurface</h2>
<p>We consider some hypersurface $\Sigma$ of a spacelike foliation $(\Sigma_t)_{t\in\mathbb{R}}$ of&nbsp;$\delta=2$ Tomimatsu-Sato spacetime; we declare $\Sigma_t$ as a 3-dimensional manifold:</p>

︡4f9f7056-05d0-49ea-857f-e80f6cd65725︡︡{"done":true,"html":"<h1 style=\"text-align: center;\">3+1 Simon-Mars tensor in the $\\delta=2$ Tomimatsu-Sato spacetime</h1>\n<p>This is&nbsp; a <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.7) worksheet implementing the computation of the 3+1 decomposition of the Simon-Mars tensor in the $\\delta=2$ Tomimatsu-Sato spacetime. The results obtained here are used in the article <a href=\"http://arxiv.org/abs/1412.6542\">arXiv:1412.6542</a>.</p>\n<p>The worksheet is released under the GNU General Public License version 2.</p>\n<p>(c) Claire Som&eacute;, Eric Gourgoulhon (2015)</p>\n<p><em><span style=\"color: #008080;\">The worksheet file in Sage notebook format is</span> <a href=\"http://sagemanifolds.obspm.fr/examples/sws/SM_Simon-Mars_3p1_TS2.sws\">here</a></em>.</p>\n<h2>Tomimatsu-Sato spacetime</h2>\n<p>The Tomimatsu-Sato metric is an exact stationary and axisymmetric&nbsp; solution of the vacuum Einstein equation, which is asymptotically flat and has a non-zero angular momentum. It has been found in 1972 by A. Tomimatsu and H. Sato [<a href=\"http://dx.doi.org/10.1103/PhysRevLett.29.1344\">Phys. Rev. Lett. <strong>29</strong>, 1344 (1972)</a>], as a solution of the Ernst equation. It is actually the member $\\delta=2$ of a larger family of solutions parametrized by a positive integer $\\delta$ and exhibited by Tomimatsu and Sato in 1973 <a href=\"http://dx.doi.org/10.1143/PTP.50.95\">[Prog. Theor. Phys. <strong>50</strong>, 95 (1973)</a>], the member $\\delta=1$ being nothing but the Kerr metric. We refer to [<a href=\"http://dx.doi.org/10.1143/PTP.127.1057\">Manko, Prog. Theor. Phys.<strong> 127</strong>, 1057 (2012)</a>] for a discussion of the properties of this solution.</p>\n<h2>Spacelike hypersurface</h2>\n<p>We consider some hypersurface $\\Sigma$ of a spacelike foliation $(\\Sigma_t)_{t\\in\\mathbb{R}}$ of&nbsp;$\\delta=2$ Tomimatsu-Sato spacetime; we declare $\\Sigma_t$ as a 3-dimensional manifold:</p>"}
︠2dc56b92-f31d-42cc-b7e1-2a0d9bb3f699︠
Sig = Manifold(3, 'Sigma', r'\Sigma', start_index=1)
︡d2d5662c-96a0-44e0-89f8-6a7fc89efb19︡︡{"done":true}
︠c8ad1004-52d9-44c4-88ef-b4222df6c37ci︠
%html
<p>On $\Sigma$, we consider the prolate spheroidal <span id="cell_outer_1">coordinates</span> $(x,y,\phi)$, with $x\in(1,+\infty)$, $y\in(-1,1)$ and $\phi\in(0,2\pi)$ :</p>

︡4d9a2700-f365-4682-934b-b946fd120e6a︡︡{"done":true,"html":"<p>On $\\Sigma$, we consider the prolate spheroidal <span id=\"cell_outer_1\">coordinates</span> $(x,y,\\phi)$, with $x\\in(1,+\\infty)$, $y\\in(-1,1)$ and $\\phi\\in(0,2\\pi)$ :</p>"}
︠9638bf1c-52a3-4f91-978b-6abb06e3a7fe︠
X.<r,y,ph> = Sig.chart(r'x:(1,+oo) y:(-1,1) ph:(0,2*pi):\phi')
print X ; X
︡57b34eef-46ba-460f-8568-cfc9fca812af︡︡{"stdout":"chart (Sigma, (x, y, ph))\n","done":false}︡{"html":"<div>$\\left(\\Sigma,(x, y, {\\phi})\\right)$</div>","done":false}︡{"done":true}
︠10404333-eac4-455c-a832-e5d1c55046f3i︠
%html
<h3>Riemannian metric on $\Sigma$</h3>
<p>The Tomimatsu-Sato metric depens on three parameters: the integer $\delta$, the real number $p\in[0,1]$, and the total mass $m$:</p>

︡f96de05e-a356-41f4-b4c0-d82e1a69ac01︡︡{"done":true,"html":"<h3>Riemannian metric on $\\Sigma$</h3>\n<p>The Tomimatsu-Sato metric depens on three parameters: the integer $\\delta$, the real number $p\\in[0,1]$, and the total mass $m$:</p>"}
︠e6c4d0e6-2276-4d95-895b-5dc68eb05e3a︠
var('d, p, m')
assume(m>0)
assumptions()
︡475df4ec-9067-4cba-8577-81c6795f3bf3︡︡{"html":"<div>($d$, $p$, $m$)</div>","done":false}︡{"html":"<div>[$\\text{\\texttt{x{ }is{ }real}}$, $x &gt; 1$, $\\text{\\texttt{y{ }is{ }real}}$, $y &gt; \\left(-1\\right)$, $y &lt; 1$, $\\text{\\texttt{ph{ }is{ }real}}$, ${\\phi} &gt; 0$, ${\\phi} &lt; 2 \\, \\pi$, $m &gt; 0$]</div>","done":false}︡{"done":true}
︠bdfd2360-3474-4e11-b8db-7874a9c3327di︠
%html
<p>We set $\delta=2$ and choose a specific value for $p$, namely $p=1/5$:</p>

︡08c976bf-8b81-4c51-926e-c3bb4d8c071f︡︡{"done":true,"html":"<p>We set $\\delta=2$ and choose a specific value for $p$, namely $p=1/5$:</p>"}
︠dfa73118-d571-4206-a19f-c18687755fe7︠
d = 2
p = 1/5
︡ccdaa43b-2e60-4d5a-8754-1dd19e1b2fb6︡︡{"done":true}
︠e0a4010a-8a4d-430a-a7ea-6350c4255050i︠
%html
<p>Furthermore, without any loss of generality, we may set $m=1$ (this simply fixes some length scale):</p>

︡7f9efdf7-837b-45fd-a010-73cbea0f041c︡︡{"done":true,"html":"<p>Furthermore, without any loss of generality, we may set $m=1$ (this simply fixes some length scale):</p>"}
︠6d20a763-6926-41ea-b701-788189d5429e︠
m=1
︡9336878d-4b1e-4bc4-9312-fce50fafb570︡︡{"done":true}
︠9dfad284-0d63-402b-8ec9-6a3bb18de079i︠
%html
<p>The parameter $q$ is related to $p$ by $p^2+q^2=1$:</p>

︡ffc47ce9-3c40-4f21-906c-17f2c7b72bc8︡︡{"done":true,"html":"<p>The parameter $q$ is related to $p$ by $p^2+q^2=1$:</p>"}
︠ca000fe5-7c5b-4d1d-855a-2c95e2150e33︠
q = sqrt(1-p^2)
︡e6b1719f-523a-4267-ab6e-3101cf13f560︡︡{"done":true}
︠c4989884-e8a9-47ab-98a1-9459c1302199i︠
%html
<p>Some shortcut notations:</p>

︡bc7cf246-f89b-4134-a86c-5233a40d93aa︡︡{"done":true,"html":"<p>Some shortcut notations:</p>"}
︠be43c132-e9fa-42ee-aff3-f01cb1f27c5d︠
AA2 = (p^2*(x^2-1)^2+q^2*(1-y^2)^2)^2-4*p^2*q^2*(x^2-1)*(1-y^2)*(x^2-y^2)^2
BB2 = (p^2*x^4+2*p*x^3-2*p*x+q^2*y^4-1)^2+4*q^2*y^2*(p*x^3-p*x*y^2-y^2+1)^2
CC2 = p^3*x*(1-x^2)*(2*(x^4-1)+(x^2+3)*(1-y^2))+p^2*(x^2-1)*((x^2-1)*(1-y^2)-4*x^2*(x^2-y^2))+q^2*(1-y^2)^3*(p*x+1)
︡1ac93d92-5935-4797-b530-a3e2c48d48ad︡︡{"done":true}
︠3310d3ee-1e9b-4240-b94c-95751e3361f3i︠
%html
<p>The Riemannian metric $\gamma$ induced by the spacetime metric $g$ on $\Sigma$:</p>

︡c26ef906-8c5b-423a-9689-013659728af7︡︡{"done":true,"html":"<p>The Riemannian metric $\\gamma$ induced by the spacetime metric $g$ on $\\Sigma$:</p>"}
︠f851ba67-468e-4247-8a3c-e164783e7b72︠
gam = Sig.riemann_metric('gam', latex_name=r'\gamma') 
gam[1,1] = m^2*BB2/(p^2*d^2*(x^2-1)*(x^2-y^2)^3)
gam[2,2] = m^2*BB2/(p^2*d^2*(y^2-1)*(-x^2+y^2)^3)
gam[3,3] = - m^2*(y^2-1)*(p^2*BB2^2*(x^2-1)+4*q^2*d^2*CC2^2*(y^2-1))/(AA2*BB2*d^2)
gam.display()
︡fcc85995-cb8c-4d6c-a47d-3de77e3d6f77︡︡{"html":"<div>$\\gamma = \\left( \\frac{x^{8} + 576 \\, y^{8} + 20 \\, x^{7} + 96 \\, {\\left(x^{2} + 10 \\, x + 25\\right)} y^{6} + 100 \\, x^{6} - 20 \\, x^{5} - 48 \\, {\\left(3 \\, x^{4} + 10 \\, x^{3} + 30 \\, x + 125\\right)} y^{4} - 250 \\, x^{4} - 500 \\, x^{3} + 96 \\, {\\left(x^{6} + 10 \\, x^{3} + 25\\right)} y^{2} + 100 \\, x^{2} + 500 \\, x + 625}{100 \\, {\\left(x^{8} - {\\left(x^{2} - 1\\right)} y^{6} - x^{6} + 3 \\, {\\left(x^{4} - x^{2}\\right)} y^{4} - 3 \\, {\\left(x^{6} - x^{4}\\right)} y^{2}\\right)}} \\right) \\mathrm{d} x\\otimes \\mathrm{d} x + \\left( \\frac{x^{8} + 576 \\, y^{8} + 20 \\, x^{7} + 96 \\, {\\left(x^{2} + 10 \\, x + 25\\right)} y^{6} + 100 \\, x^{6} - 20 \\, x^{5} - 48 \\, {\\left(3 \\, x^{4} + 10 \\, x^{3} + 30 \\, x + 125\\right)} y^{4} - 250 \\, x^{4} - 500 \\, x^{3} + 96 \\, {\\left(x^{6} + 10 \\, x^{3} + 25\\right)} y^{2} + 100 \\, x^{2} + 500 \\, x + 625}{100 \\, {\\left(y^{8} - {\\left(3 \\, x^{2} + 1\\right)} y^{6} + x^{6} + 3 \\, {\\left(x^{4} + x^{2}\\right)} y^{4} - {\\left(x^{6} + 3 \\, x^{4}\\right)} y^{2}\\right)}} \\right) \\mathrm{d} y\\otimes \\mathrm{d} y + \\left( -\\frac{576 \\, {\\left(x^{2} - 1\\right)} y^{10} - x^{10} - 40 \\, x^{9} + 96 \\, {\\left(x^{4} + 20 \\, x^{3} + 168 \\, x^{2} + 980 \\, x + 2431\\right)} y^{8} - 699 \\, x^{8} - 7920 \\, x^{7} - 48 \\, {\\left(3 \\, x^{6} + 20 \\, x^{5} - x^{4} + 80 \\, x^{3} + 1273 \\, x^{2} + 7900 \\, x + 19525\\right)} y^{6} - 39450 \\, x^{6} + 960 \\, x^{5} + 48 \\, {\\left(2 \\, x^{8} + x^{6} + 60 \\, x^{5} - 3 \\, x^{4} + 1675 \\, x^{2} + 11940 \\, x + 29525\\right)} y^{4} + 39450 \\, x^{4} + 6000 \\, x^{3} + {\\left(x^{10} + 40 \\, x^{9} + 603 \\, x^{8} + 7920 \\, x^{7} + 39546 \\, x^{6} - 2880 \\, x^{5} - 39450 \\, x^{4} - 4080 \\, x^{3} - 45675 \\, x^{2} - 385000 \\, x - 953425\\right)} y^{2} + 9675 \\, x^{2} + 97000 \\, x + 240625}{100 \\, {\\left(x^{8} + 576 \\, y^{8} + 20 \\, x^{7} + 96 \\, {\\left(x^{2} + 10 \\, x + 25\\right)} y^{6} + 100 \\, x^{6} - 20 \\, x^{5} - 48 \\, {\\left(3 \\, x^{4} + 10 \\, x^{3} + 30 \\, x + 125\\right)} y^{4} - 250 \\, x^{4} - 500 \\, x^{3} + 96 \\, {\\left(x^{6} + 10 \\, x^{3} + 25\\right)} y^{2} + 100 \\, x^{2} + 500 \\, x + 625\\right)}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠42fdbf66-deea-4ea2-b57d-0cbde13a6b0ai︠
%html
<p>A matrix view of the components w.r.t. coordinates $(x,y,\phi)$:</p>

︡fbc8a637-77d3-4578-843d-e6c063b0a142︡︡{"done":true,"html":"<p>A matrix view of the components w.r.t. coordinates $(x,y,\\phi)$:</p>"}
︠469d78b6-e457-42fa-b837-cc39258bcc61︠
gam[:]
︡d1204947-14f8-4a52-8be4-ab12b9e6aa6f︡︡{"html":"<div>$\\left(\\begin{array}{rrr}\n\\frac{x^{8} + 576 \\, y^{8} + 20 \\, x^{7} + 96 \\, {\\left(x^{2} + 10 \\, x + 25\\right)} y^{6} + 100 \\, x^{6} - 20 \\, x^{5} - 48 \\, {\\left(3 \\, x^{4} + 10 \\, x^{3} + 30 \\, x + 125\\right)} y^{4} - 250 \\, x^{4} - 500 \\, x^{3} + 96 \\, {\\left(x^{6} + 10 \\, x^{3} + 25\\right)} y^{2} + 100 \\, x^{2} + 500 \\, x + 625}{100 \\, {\\left(x^{8} - {\\left(x^{2} - 1\\right)} y^{6} - x^{6} + 3 \\, {\\left(x^{4} - x^{2}\\right)} y^{4} - 3 \\, {\\left(x^{6} - x^{4}\\right)} y^{2}\\right)}} &amp; 0 &amp; 0 \\\\\n0 &amp; \\frac{x^{8} + 576 \\, y^{8} + 20 \\, x^{7} + 96 \\, {\\left(x^{2} + 10 \\, x + 25\\right)} y^{6} + 100 \\, x^{6} - 20 \\, x^{5} - 48 \\, {\\left(3 \\, x^{4} + 10 \\, x^{3} + 30 \\, x + 125\\right)} y^{4} - 250 \\, x^{4} - 500 \\, x^{3} + 96 \\, {\\left(x^{6} + 10 \\, x^{3} + 25\\right)} y^{2} + 100 \\, x^{2} + 500 \\, x + 625}{100 \\, {\\left(y^{8} - {\\left(3 \\, x^{2} + 1\\right)} y^{6} + x^{6} + 3 \\, {\\left(x^{4} + x^{2}\\right)} y^{4} - {\\left(x^{6} + 3 \\, x^{4}\\right)} y^{2}\\right)}} &amp; 0 \\\\\n0 &amp; 0 &amp; -\\frac{576 \\, {\\left(x^{2} - 1\\right)} y^{10} - x^{10} - 40 \\, x^{9} + 96 \\, {\\left(x^{4} + 20 \\, x^{3} + 168 \\, x^{2} + 980 \\, x + 2431\\right)} y^{8} - 699 \\, x^{8} - 7920 \\, x^{7} - 48 \\, {\\left(3 \\, x^{6} + 20 \\, x^{5} - x^{4} + 80 \\, x^{3} + 1273 \\, x^{2} + 7900 \\, x + 19525\\right)} y^{6} - 39450 \\, x^{6} + 960 \\, x^{5} + 48 \\, {\\left(2 \\, x^{8} + x^{6} + 60 \\, x^{5} - 3 \\, x^{4} + 1675 \\, x^{2} + 11940 \\, x + 29525\\right)} y^{4} + 39450 \\, x^{4} + 6000 \\, x^{3} + {\\left(x^{10} + 40 \\, x^{9} + 603 \\, x^{8} + 7920 \\, x^{7} + 39546 \\, x^{6} - 2880 \\, x^{5} - 39450 \\, x^{4} - 4080 \\, x^{3} - 45675 \\, x^{2} - 385000 \\, x - 953425\\right)} y^{2} + 9675 \\, x^{2} + 97000 \\, x + 240625}{100 \\, {\\left(x^{8} + 576 \\, y^{8} + 20 \\, x^{7} + 96 \\, {\\left(x^{2} + 10 \\, x + 25\\right)} y^{6} + 100 \\, x^{6} - 20 \\, x^{5} - 48 \\, {\\left(3 \\, x^{4} + 10 \\, x^{3} + 30 \\, x + 125\\right)} y^{4} - 250 \\, x^{4} - 500 \\, x^{3} + 96 \\, {\\left(x^{6} + 10 \\, x^{3} + 25\\right)} y^{2} + 100 \\, x^{2} + 500 \\, x + 625\\right)}}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠2f61f695-4f86-4164-9fd3-7be767f325f5i︠
%html
<h3>Lapse function and shift vector</h3>

︡20cf7e4c-d6fd-461b-b579-67dd9981a280︡︡{"done":true,"html":"<h3>Lapse function and shift vector</h3>"}
︠e643a552-2246-4ef8-8ce1-07ee8466b121︠
N2 = AA2/BB2 - 2*m*q*CC2*(y^2-1)/BB2*(2*m*q*CC2*(y^2-1)/(BB2*(m^2*(y^2-1)*(p^2*BB2^2*(x^2-1)+4*q^2*d^2*CC2^2*(y^2-1))/(AA2*BB2*d^2))))
N2.simplify_full()
︡2f5205dc-4b77-47b2-960e-bfb13a0e50a5︡︡{"html":"<div>$\\frac{x^{10} + 20 \\, x^{9} + 576 \\, {\\left(x^{2} - 1\\right)} y^{8} + 99 \\, x^{8} - 40 \\, x^{7} + 96 \\, {\\left(x^{4} + 10 \\, x^{3} + 24 \\, x^{2} - 10 \\, x - 25\\right)} y^{6} - 350 \\, x^{6} - 480 \\, x^{5} - 48 \\, {\\left(3 \\, x^{6} + 10 \\, x^{5} - 3 \\, x^{4} + 20 \\, x^{3} + 125 \\, x^{2} - 30 \\, x - 125\\right)} y^{4} + 350 \\, x^{4} + 1000 \\, x^{3} + 96 \\, {\\left(x^{8} - x^{6} + 10 \\, x^{5} - 10 \\, x^{3} + 25 \\, x^{2} - 25\\right)} y^{2} + 525 \\, x^{2} - 500 \\, x - 625}{x^{10} + 40 \\, x^{9} + 576 \\, {\\left(x^{2} - 1\\right)} y^{8} + 699 \\, x^{8} + 7920 \\, x^{7} + 96 \\, {\\left(x^{4} + 20 \\, x^{3} + 174 \\, x^{2} + 980 \\, x + 2425\\right)} y^{6} + 39450 \\, x^{6} - 960 \\, x^{5} - 48 \\, {\\left(3 \\, x^{6} + 20 \\, x^{5} - 3 \\, x^{4} + 40 \\, x^{3} + 925 \\, x^{2} + 5940 \\, x + 14675\\right)} y^{4} - 39450 \\, x^{4} - 6000 \\, x^{3} + 96 \\, {\\left(x^{8} - x^{6} + 20 \\, x^{5} - 20 \\, x^{3} + 375 \\, x^{2} + 3000 \\, x + 7425\\right)} y^{2} - 9675 \\, x^{2} - 97000 \\, x - 240625}$</div>","done":false}︡{"done":true}
︠9d4b0e35-8b4e-458e-9b99-a3519c0b8ebf︠
N = Sig.scalar_field(sqrt(N2.simplify_full()), name='N')
print N
N.display()
︡e7f2aff8-3412-4ed3-a785-c8890276845b︡︡{"stdout":"scalar field 'N' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"html":"<div>$\\begin{array}{llcl} N:&amp; \\Sigma &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(x, y, {\\phi}\\right) &amp; \\longmapsto &amp; \\sqrt{\\frac{x^{10} + 20 \\, x^{9} + 576 \\, {\\left(x^{2} - 1\\right)} y^{8} + 99 \\, x^{8} - 40 \\, x^{7} + 96 \\, {\\left(x^{4} + 10 \\, x^{3} + 24 \\, x^{2} - 10 \\, x - 25\\right)} y^{6} - 350 \\, x^{6} - 480 \\, x^{5} - 48 \\, {\\left(3 \\, x^{6} + 10 \\, x^{5} - 3 \\, x^{4} + 20 \\, x^{3} + 125 \\, x^{2} - 30 \\, x - 125\\right)} y^{4} + 350 \\, x^{4} + 1000 \\, x^{3} + 96 \\, {\\left(x^{8} - x^{6} + 10 \\, x^{5} - 10 \\, x^{3} + 25 \\, x^{2} - 25\\right)} y^{2} + 525 \\, x^{2} - 500 \\, x - 625}{x^{10} + 40 \\, x^{9} + 576 \\, {\\left(x^{2} - 1\\right)} y^{8} + 699 \\, x^{8} + 7920 \\, x^{7} + 96 \\, {\\left(x^{4} + 20 \\, x^{3} + 174 \\, x^{2} + 980 \\, x + 2425\\right)} y^{6} + 39450 \\, x^{6} - 960 \\, x^{5} - 48 \\, {\\left(3 \\, x^{6} + 20 \\, x^{5} - 3 \\, x^{4} + 40 \\, x^{3} + 925 \\, x^{2} + 5940 \\, x + 14675\\right)} y^{4} - 39450 \\, x^{4} - 6000 \\, x^{3} + 96 \\, {\\left(x^{8} - x^{6} + 20 \\, x^{5} - 20 \\, x^{3} + 375 \\, x^{2} + 3000 \\, x + 7425\\right)} y^{2} - 9675 \\, x^{2} - 97000 \\, x - 240625}} \\end{array}$</div>","done":false}︡{"done":true}
︠e64532aa-665a-434b-8e06-a18591d42c58︠
b3 = 2*m*q*CC2*(y^2-1)/(BB2*(m^2*(y^2-1)*(p^2*BB2^2*(x^2-1)+4*q^2*d^2*CC2^2*(y^2-1))/(AA2*BB2*d^2)))
b = Sig.vector_field('beta', latex_name=r'\beta') 
b[3] = b3.simplify_full()
# unset components are zero 
b.display()
︡246c22df-bd03-4669-a620-17b548df4b93︡︡{"html":"<div>$\\beta = \\left( -\\frac{400 \\, {\\left(2 \\, \\sqrt{3} \\sqrt{2} x^{7} + 20 \\, \\sqrt{3} \\sqrt{2} x^{6} + 24 \\, {\\left(\\sqrt{3} \\sqrt{2} x + 5 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{6} - \\sqrt{3} \\sqrt{2} x^{5} - 25 \\, \\sqrt{3} \\sqrt{2} x^{4} - 72 \\, {\\left(\\sqrt{3} \\sqrt{2} x + 5 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{4} + 10 \\, \\sqrt{3} \\sqrt{2} x^{2} - {\\left(\\sqrt{3} \\sqrt{2} x^{5} + 15 \\, \\sqrt{3} \\sqrt{2} x^{4} + 2 \\, \\sqrt{3} \\sqrt{2} x^{3} - 10 \\, \\sqrt{3} \\sqrt{2} x^{2} - 75 \\, \\sqrt{3} \\sqrt{2} x - 365 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{2} - 25 \\, \\sqrt{3} \\sqrt{2} x - 125 \\, \\sqrt{3} \\sqrt{2}\\right)}}{x^{10} + 40 \\, x^{9} + 576 \\, {\\left(x^{2} - 1\\right)} y^{8} + 699 \\, x^{8} + 7920 \\, x^{7} + 96 \\, {\\left(x^{4} + 20 \\, x^{3} + 174 \\, x^{2} + 980 \\, x + 2425\\right)} y^{6} + 39450 \\, x^{6} - 960 \\, x^{5} - 48 \\, {\\left(3 \\, x^{6} + 20 \\, x^{5} - 3 \\, x^{4} + 40 \\, x^{3} + 925 \\, x^{2} + 5940 \\, x + 14675\\right)} y^{4} - 39450 \\, x^{4} - 6000 \\, x^{3} + 96 \\, {\\left(x^{8} - x^{6} + 20 \\, x^{5} - 20 \\, x^{3} + 375 \\, x^{2} + 3000 \\, x + 7425\\right)} y^{2} - 9675 \\, x^{2} - 97000 \\, x - 240625} \\right) \\frac{\\partial}{\\partial {\\phi} }$</div>","done":false}︡{"done":true}
︠37e34e2d-2ca2-47f8-93c3-a332b7cbf5bei︠
%html
<h3>Extrinsic curvature of $\Sigma$</h3>
<p>We use the formula \[ K_{ij} = \frac{1}{2N} \mathcal{L}_{\beta} \gamma_{ij}, \] which is valid for any stationary spacetime:</p>

︡148a6b19-4afd-42a9-805f-b298b7f6dbdb︡︡{"done":true,"html":"<h3>Extrinsic curvature of $\\Sigma$</h3>\n<p>We use the formula \\[ K_{ij} = \\frac{1}{2N} \\mathcal{L}_{\\beta} \\gamma_{ij}, \\] which is valid for any stationary spacetime:</p>"}
︠43ebb403-9198-4dd5-8c01-eb9bda92e206︠
K = gam.lie_der(b) / (2*N)
K.set_name('K')
print K
︡fcf9cac6-cdac-4be6-8566-d9cf25722fb1︡︡{"stdout":"field of symmetric bilinear forms 'K' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}
︠8471c44a-3c47-47f2-ac0d-f6f3a61caa0ei︠
%html
<p>The component $K_{13} = K_{x\phi}$:</p>

︡91cc1760-40c8-4674-8db8-ebd648411cda︡︡{"done":true,"html":"<p>The component $K_{13} = K_{x\\phi}$:</p>"}
︠4f596e4d-da1b-4913-be37-794385c6c5c7︠
K[1,3]
︡e92d1ebc-408f-4460-b2f2-2edf54b94c6e︡︡{"html":"<div>$\\frac{2 \\, {\\left(6 \\, \\sqrt{3} \\sqrt{2} x^{16} - 13824 \\, {\\left(\\sqrt{3} \\sqrt{2} x^{2} + 10 \\, \\sqrt{3} \\sqrt{2} x + \\sqrt{3} \\sqrt{2}\\right)} y^{16} + 240 \\, \\sqrt{3} \\sqrt{2} x^{15} + 3793 \\, \\sqrt{3} \\sqrt{2} x^{14} - 6912 \\, {\\left(\\sqrt{3} \\sqrt{2} x^{4} + 20 \\, \\sqrt{3} \\sqrt{2} x^{3} + 150 \\, \\sqrt{3} \\sqrt{2} x^{2} + 500 \\, \\sqrt{3} \\sqrt{2} x + 817 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{14} + 27650 \\, \\sqrt{3} \\sqrt{2} x^{13} + 72403 \\, \\sqrt{3} \\sqrt{2} x^{12} + 576 \\, {\\left(27 \\, \\sqrt{3} \\sqrt{2} x^{6} + 310 \\, \\sqrt{3} \\sqrt{2} x^{5} + 1033 \\, \\sqrt{3} \\sqrt{2} x^{4} + 1060 \\, \\sqrt{3} \\sqrt{2} x^{3} + 10493 \\, \\sqrt{3} \\sqrt{2} x^{2} + 44870 \\, \\sqrt{3} \\sqrt{2} x + 69503 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{12} - 81820 \\, \\sqrt{3} \\sqrt{2} x^{11} - 374975 \\, \\sqrt{3} \\sqrt{2} x^{10} - 96 \\, {\\left(109 \\, \\sqrt{3} \\sqrt{2} x^{8} + 520 \\, \\sqrt{3} \\sqrt{2} x^{7} + 1504 \\, \\sqrt{3} \\sqrt{2} x^{6} + 19360 \\, \\sqrt{3} \\sqrt{2} x^{5} + 92770 \\, \\sqrt{3} \\sqrt{2} x^{4} + 157960 \\, \\sqrt{3} \\sqrt{2} x^{3} + 148264 \\, \\sqrt{3} \\sqrt{2} x^{2} + 731920 \\, \\sqrt{3} \\sqrt{2} x + 1256425 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{10} - 313810 \\, \\sqrt{3} \\sqrt{2} x^{9} + 669975 \\, \\sqrt{3} \\sqrt{2} x^{8} + 24 \\, {\\left(9 \\, \\sqrt{3} \\sqrt{2} x^{10} + 250 \\, \\sqrt{3} \\sqrt{2} x^{9} + 6873 \\, \\sqrt{3} \\sqrt{2} x^{8} + 40920 \\, \\sqrt{3} \\sqrt{2} x^{7} + 63402 \\, \\sqrt{3} \\sqrt{2} x^{6} + 146220 \\, \\sqrt{3} \\sqrt{2} x^{5} + 1047426 \\, \\sqrt{3} \\sqrt{2} x^{4} + 2249400 \\, \\sqrt{3} \\sqrt{2} x^{3} + 876525 \\, \\sqrt{3} \\sqrt{2} x^{2} + 4308810 \\, \\sqrt{3} \\sqrt{2} x + 8401925 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{8} + 1617000 \\, \\sqrt{3} \\sqrt{2} x^{7} + 999675 \\, \\sqrt{3} \\sqrt{2} x^{6} + 96 \\, {\\left(20 \\, \\sqrt{3} \\sqrt{2} x^{11} - 179 \\, \\sqrt{3} \\sqrt{2} x^{10} - 50 \\, \\sqrt{3} \\sqrt{2} x^{9} - 2897 \\, \\sqrt{3} \\sqrt{2} x^{8} - 28400 \\, \\sqrt{3} \\sqrt{2} x^{7} - 57446 \\, \\sqrt{3} \\sqrt{2} x^{6} - 9020 \\, \\sqrt{3} \\sqrt{2} x^{5} - 237650 \\, \\sqrt{3} \\sqrt{2} x^{4} - 731060 \\, \\sqrt{3} \\sqrt{2} x^{3} - 267175 \\, \\sqrt{3} \\sqrt{2} x^{2} - 1037250 \\, \\sqrt{3} \\sqrt{2} x - 2111325 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{6} - 2277250 \\, \\sqrt{3} \\sqrt{2} x^{5} - 4979375 \\, \\sqrt{3} \\sqrt{2} x^{4} - {\\left(187 \\, \\sqrt{3} \\sqrt{2} x^{14} + 3590 \\, \\sqrt{3} \\sqrt{2} x^{13} - 5207 \\, \\sqrt{3} \\sqrt{2} x^{12} - 73540 \\, \\sqrt{3} \\sqrt{2} x^{11} - 454637 \\, \\sqrt{3} \\sqrt{2} x^{10} - 1150150 \\, \\sqrt{3} \\sqrt{2} x^{9} + 199401 \\, \\sqrt{3} \\sqrt{2} x^{8} - 1059000 \\, \\sqrt{3} \\sqrt{2} x^{7} - 7811175 \\, \\sqrt{3} \\sqrt{2} x^{6} + 2899610 \\, \\sqrt{3} \\sqrt{2} x^{5} + 1675075 \\, \\sqrt{3} \\sqrt{2} x^{4} - 32834500 \\, \\sqrt{3} \\sqrt{2} x^{3} - 24681575 \\, \\sqrt{3} \\sqrt{2} x^{2} - 69684250 \\, \\sqrt{3} \\sqrt{2} x - 122823125 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{4} - 4037500 \\, \\sqrt{3} \\sqrt{2} x^{3} + 3461875 \\, \\sqrt{3} \\sqrt{2} x^{2} - 6 \\, {\\left(\\sqrt{3} \\sqrt{2} x^{16} + 40 \\, \\sqrt{3} \\sqrt{2} x^{15} + 601 \\, \\sqrt{3} \\sqrt{2} x^{14} + 4010 \\, \\sqrt{3} \\sqrt{2} x^{13} + 12935 \\, \\sqrt{3} \\sqrt{2} x^{12} - 1060 \\, \\sqrt{3} \\sqrt{2} x^{11} + 10449 \\, \\sqrt{3} \\sqrt{2} x^{10} + 139590 \\, \\sqrt{3} \\sqrt{2} x^{9} + 57825 \\, \\sqrt{3} \\sqrt{2} x^{8} + 146960 \\, \\sqrt{3} \\sqrt{2} x^{7} + 781475 \\, \\sqrt{3} \\sqrt{2} x^{6} - 702250 \\, \\sqrt{3} \\sqrt{2} x^{5} - 2108075 \\, \\sqrt{3} \\sqrt{2} x^{4} - 348500 \\, \\sqrt{3} \\sqrt{2} x^{3} + 2381875 \\, \\sqrt{3} \\sqrt{2} x^{2} + 5456250 \\, \\sqrt{3} \\sqrt{2} x + 6941250 \\, \\sqrt{3} \\sqrt{2}\\right)} y^{2} + 7231250 \\, \\sqrt{3} \\sqrt{2} x + 6109375 \\, \\sqrt{3} \\sqrt{2}\\right)} \\sqrt{x^{10} + 40 \\, x^{9} + 576 \\, {\\left(x^{2} - 1\\right)} y^{8} + 699 \\, x^{8} + 7920 \\, x^{7} + 96 \\, {\\left(x^{4} + 20 \\, x^{3} + 174 \\, x^{2} + 980 \\, x + 2425\\right)} y^{6} + 39450 \\, x^{6} - 960 \\, x^{5} - 48 \\, {\\left(3 \\, x^{6} + 20 \\, x^{5} - 3 \\, x^{4} + 40 \\, x^{3} + 925 \\, x^{2} + 5940 \\, x + 14675\\right)} y^{4} - 39450 \\, x^{4} - 6000 \\, x^{3} + 96 \\, {\\left(x^{8} - x^{6} + 20 \\, x^{5} - 20 \\, x^{3} + 375 \\, x^{2} + 3000 \\, x + 7425\\right)} y^{2} - 9675 \\, x^{2} - 97000 \\, x - 240625}}{{\\left(x^{18} + 60 \\, x^{17} + 331776 \\, {\\left(x^{2} - 1\\right)} y^{16} + 1599 \\, x^{16} + 25880 \\, x^{15} + 110592 \\, {\\left(x^{4} + 15 \\, x^{3} + 99 \\, x^{2} + 485 \\, x + 1200\\right)} y^{14} + 266700 \\, x^{14} + 1555560 \\, x^{13} - 9216 \\, {\\left(17 \\, x^{6} + 60 \\, x^{5} - 417 \\, x^{4} - 3040 \\, x^{3} - 13425 \\, x^{2} - 31020 \\, x - 16975\\right)} y^{12} + 3533300 \\, x^{12} - 4005000 \\, x^{11} + 9216 \\, {\\left(9 \\, x^{8} - 60 \\, x^{7} - 509 \\, x^{6} - 2430 \\, x^{5} - 9525 \\, x^{4} - 24260 \\, x^{3} - 71775 \\, x^{2} - 227250 \\, x - 290600\\right)} y^{10} - 17787450 \\, x^{10} - 18420000 \\, x^{9} + 5760 \\, {\\left(7 \\, x^{10} + 90 \\, x^{9} + 473 \\, x^{8} + 2460 \\, x^{7} + 10050 \\, x^{6} + 15200 \\, x^{5} + 53790 \\, x^{4} + 120900 \\, x^{3} + 198455 \\, x^{2} + 741350 \\, x + 1103625\\right)} y^{8} + 15656250 \\, x^{8} + 31485000 \\, x^{7} - 192 \\, {\\left(143 \\, x^{12} + 675 \\, x^{11} - 1043 \\, x^{10} - 7575 \\, x^{9} - 52650 \\, x^{8} - 224850 \\, x^{7} - 156150 \\, x^{6} + 1001250 \\, x^{5} + 3726075 \\, x^{4} + 6217375 \\, x^{3} + 4145625 \\, x^{2} + 19413125 \\, x + 33330000\\right)} y^{6} + 3527500 \\, x^{6} + 12975000 \\, x^{5} + 96 \\, {\\left(93 \\, x^{14} - 105 \\, x^{13} - 1693 \\, x^{12} - 13470 \\, x^{11} - 99575 \\, x^{10} - 222675 \\, x^{9} - 149025 \\, x^{8} - 1024500 \\, x^{7} - 2270025 \\, x^{6} + 2366625 \\, x^{5} + 9545625 \\, x^{4} + 11931250 \\, x^{3} + 451875 \\, x^{2} + 11346875 \\, x + 28273125\\right)} y^{4} + 80032500 \\, x^{4} + 102025000 \\, x^{3} + 192 \\, {\\left(x^{16} + 30 \\, x^{15} + 399 \\, x^{14} + 3955 \\, x^{13} + 19950 \\, x^{12} + 3765 \\, x^{11} + 19850 \\, x^{10} + 197000 \\, x^{9} + 47025 \\, x^{8} + 77000 \\, x^{7} + 646875 \\, x^{6} - 598125 \\, x^{5} - 2642500 \\, x^{4} - 2896875 \\, x^{3} + 1117500 \\, x^{2} + 1581250 \\, x - 687500\\right)} y^{2} - 78609375 \\, x^{2} - 180937500 \\, x - 150390625\\right)} \\sqrt{x^{8} + 576 \\, y^{8} + 20 \\, x^{7} + 96 \\, {\\left(x^{2} + 10 \\, x + 25\\right)} y^{6} + 100 \\, x^{6} - 20 \\, x^{5} - 48 \\, {\\left(3 \\, x^{4} + 10 \\, x^{3} + 30 \\, x + 125\\right)} y^{4} - 250 \\, x^{4} - 500 \\, x^{3} + 96 \\, {\\left(x^{6} + 10 \\, x^{3} + 25\\right)} y^{2} + 100 \\, x^{2} + 500 \\, x + 625} \\sqrt{x + 1} \\sqrt{x - 1}}$</div>","done":false}︡{"done":true}
︠fb974809-7273-4b6d-8253-0c275bf8961fi︠
%html
<p>The type-(1,1) tensor $K^\sharp$ of components $K^i_{\ \, j} = \gamma^{ik} K_{kj}$:</p>

︡26b54def-9ba6-463c-9d3a-a141bfec66b0︡︡{"done":true,"html":"<p>The type-(1,1) tensor $K^\\sharp$ of components $K^i_{\\ \\, j} = \\gamma^{ik} K_{kj}$:</p>"}
︠46b0a91f-74da-41f8-87ad-63c088f3e7b4︠
Ku = K.up(gam, 0)
print Ku
︡81ceb474-0e74-462b-afa0-d6268a2c5870︡{"stdout":"tensor field of type (1,1) on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠1e90baa5-b335-4116-99b5-f8ee15b898c9i︠
%html
<p>We may check that the hypersurface $\Sigma$ is maximal, i.e. that $K^k_{\ \, k} = 0$:</p>

︡b3cf8261-87d9-4815-b34a-175193a36bf2︡︡{"done":true,"html":"<p>We may check that the hypersurface $\\Sigma$ is maximal, i.e. that $K^k_{\\ \\, k} = 0$:</p>"}
︠23952d6e-3436-4bec-a20d-3ec0ab907c1b︠
trK = Ku.trace()
print trK
︡bb5ec4a1-08ed-4be7-903f-6620fc746132︡{"stdout":"scalar field on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠ee4e5993-3173-40c4-83f2-b7a015dfb8bdi︠
%html
<h3>Connection and curvature</h3>
<p>Let us call $D$ the Levi-Civita connection associated with $\gamma$: </p>

︡1280e5f4-9e88-456e-98eb-e94dafe4fb05︡︡{"done":true,"html":"<h3>Connection and curvature</h3>\n<p>Let us call $D$ the Levi-Civita connection associated with $\\gamma$: </p>"}
︠054b4914-0036-4500-ab3c-5d88c54e384a︠
D = gam.connection(name='D')
print D
︡ec8f555d-601f-4303-b14e-7a26f784adf5︡{"stdout":"Levi-Civita connection 'D' associated with the Riemannian metric 'gam' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠f7d6481d-3f51-401d-9590-ca44d0e4fc81i︠
%html
<p>The Ricci tensor associated with $\gamma$:</p>

︡c6b1c794-947c-4668-991c-cb1dcc72b6d6︡︡{"done":true,"html":"<p>The Ricci tensor associated with $\\gamma$:</p>"}
︠b600df6e-8592-4f11-800e-360651c9b726s︠
Ric = gam.ricci()
print Ric
︡67cc0950-581b-4cb8-b62e-c0ea3e85b3c2︡{"stdout":"field of symmetric bilinear forms 'Ric(gam)' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠637f9875-c8f6-45b4-9ed7-52ee6a0344f9i︠
%html
<p>The scalar curvature $R = \gamma^{ij} R_{ij}$:</p>

︡d19c4ea9-f4a3-4019-8f64-dee508873953︡︡{"done":true,"html":"<p>The scalar curvature $R = \\gamma^{ij} R_{ij}$:</p>"}
︠fd7dda60-755d-45c7-8a61-5f281f15b1bcs︠
R = gam.ricci_scalar(name='R')
print R
︡3fcbafd1-9bec-43df-adf6-d8564c3044d6︡{"stdout":"scalar field 'R' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠742b382c-34a2-43c2-a8ec-94ffd5fd888ci︠
%html
<h3>Terms related to the extrinsic curvature</h3>
<p>Let us first evaluate the term $K_{ij} K^{ij}$:</p>

︡8250661b-a93f-4986-80ce-e01525ea94cd︡︡{"done":true,"html":"<h3>Terms related to the extrinsic curvature</h3>\n<p>Let us first evaluate the term $K_{ij} K^{ij}$:</p>"}
︠e1788830-0b19-423f-b685-9cf5c72dca65s︠
Kuu = Ku.up(gam, 1)
trKK = K['_ij']*Kuu['^ij']
print trKK
︡a4e78b5d-83ad-4939-a617-3c763232e1ca︡︡{"stdout":"scalar field on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}
︠903b6594-a395-430c-b03e-8ef867ae13d5i︠
%html
<p>Then we compute the symmetric bilinear form $k_{ij} := K_{ik} K^k_{\ \, j}$:</p>

︡3faa12de-4d14-4e11-85cc-86e7ef04cb52︡︡{"done":true,"html":"<p>Then we compute the symmetric bilinear form $k_{ij} := K_{ik} K^k_{\\ \\, j}$:</p>"}
︠dc2b00e4-fc85-4760-832a-78d5acc8690e︠
KK = K['_ik']*Ku['^k_j']
print KK
︡8a718d05-31e1-4af2-a749-4d80735198d6︡{"stdout":"tensor field of type (0,2) on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠74206e96-a645-4f1b-8dc3-97ffadfc5793i︠
%html
<p>We check that this tensor field is symmetric:</p>

︡8a5be13b-a64a-45d1-b8d5-7e83ed13ed45︡︡{"done":true,"html":"<p>We check that this tensor field is symmetric:</p>"}
︠0a62dff0-a24b-4e64-bd3d-3c3146f2ee2d︠
KK1 = KK.symmetrize()
KK == KK1
︡68caabcc-95f8-4e31-bc2b-ca7bac4af741︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}︡
︠611e5301-bd26-4628-85de-146691046233i︠
%html
<p>Accordingly, we work with the explicitly symmetric version:</p>

︡6e6cc627-11c4-4cef-b7a3-45d3b0105f97︡︡{"done":true,"html":"<p>Accordingly, we work with the explicitly symmetric version:</p>"}
︠a304c8ed-bc2a-49cc-a1e3-12c03fbadff2︠
KK = KK1
print KK
︡ed20787d-b33d-4c2c-9e03-f08276058d18︡{"stdout":"field of symmetric bilinear forms on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠576fcd40-5f3c-403d-956f-bfd5b87a3486i︠
%html
<p>&nbsp;</p>
<h2>Electric and magnetic parts of the Weyl tensor</h2>
<p>The electric part is the bilinear form $E$ given by \[ E_{ij} = R_{ij} + K K_{ij} - K_{ik} K^k_{\ \, j} \]</p>

︡598225c5-70a7-4d3b-aca7-8e4fb0c400a0︡︡{"done":true,"html":"<p>&nbsp;</p>\n<h2>Electric and magnetic parts of the Weyl tensor</h2>\n<p>The electric part is the bilinear form $E$ given by \\[ E_{ij} = R_{ij} + K K_{ij} - K_{ik} K^k_{\\ \\, j} \\]</p>"}
︠faf1a5ad-67b2-40a0-ac4e-91bc0c8a7913︠
E = Ric + trK*K - KK
print E
︡fc3f42a7-2b9f-4ebc-a4f9-1ba6d8fe6ad0︡{"stdout":"field of symmetric bilinear forms on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠cdc92f39-d7be-4d00-a948-680337fbb39ci︠
%html
<p>The magnetic part is the bilinear form $B$ defined by \[ B_{ij} = \epsilon^k_{\ \, l i} D_k K^l_{\ \, j}, \]</p>
<p>where $\epsilon^k_{\ \, l i}$ are the components of the type-(1,2) tensor $\epsilon^\sharp$, related to the&nbsp;Levi-Civita alternating tensor $\epsilon$ associated with $\gamma$ by $\epsilon^k_{\ \, l i} = \gamma^{km} \epsilon_{m l i}$. In SageManifolds, $\epsilon$ is obtained by the command <span style="font-family: courier new,courier;">volume_form()</span> and $\epsilon^\sharp$ by the command <span style="font-family: courier new,courier;">volume_form(1)</span> (1 = 1 index raised):</p>

︡f397732e-d3d5-4baa-b20d-36a1f6d09330︡︡{"done":true,"html":"<p>The magnetic part is the bilinear form $B$ defined by \\[ B_{ij} = \\epsilon^k_{\\ \\, l i} D_k K^l_{\\ \\, j}, \\]</p>\n<p>where $\\epsilon^k_{\\ \\, l i}$ are the components of the type-(1,2) tensor $\\epsilon^\\sharp$, related to the&nbsp;Levi-Civita alternating tensor $\\epsilon$ associated with $\\gamma$ by $\\epsilon^k_{\\ \\, l i} = \\gamma^{km} \\epsilon_{m l i}$. In SageManifolds, $\\epsilon$ is obtained by the command <span style=\"font-family: courier new,courier;\">volume_form()</span> and $\\epsilon^\\sharp$ by the command <span style=\"font-family: courier new,courier;\">volume_form(1)</span> (1 = 1 index raised):</p>"}
︠b50963c1-1878-4910-af41-201fc7309263︠
eps = gam.volume_form() 
print eps
︡fb33ec8b-f660-4875-8543-dabe0dc936e0︡{"stdout":"3-form 'eps_gam' on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠8ecf3d9a-5b9d-4b9d-8ace-c7ceea9c7af5︠
epsu = gam.volume_form(1)
print epsu
︡66cfab3a-0626-43ce-b1f9-98ea854553f5︡{"stdout":"tensor field of type (1,2) on the 3-dimensional manifold 'Sigma'\n","done":false}︡{"done":true}︡
︠ab85e589-402a-45f8-b6c7-63553f878cb7︠
DKu = D(Ku)
B = epsu['^k_li']*DKu['^l_jk'] 
print B
︡822d3085-ecc5-4300-9916-b87a8d564457︡
︠59c573c2-0e46-4b42-a5a4-c91673ad8b73i︠
%html
<p>Let us check that $B$ is symmetric:</p>

︡03fb075e-3bf1-4afb-b97b-6e1e09be5c75︡︡{"done":true,"html":"<p>Let us check that $B$ is symmetric:</p>"}
︠e350f761-79a9-45df-b421-501ab92eb514︠
B1 = B.symmetrize()
B == B1
︡8213de70-ed13-475b-9279-5d1d1d98fcaf︡
︠00f3ca7f-3099-4024-a52d-2344734dba03i︠
%html
<p>Accordingly, we set</p>

︡9237289e-fcdb-44a4-9ced-edbffd32b648︡︡{"done":true,"html":"<p>Accordingly, we set</p>"}
︠c8d1e764-7820-4ad2-9875-9f3a5bd5dced︠
B = B1
B.set_name('B')
print B
︡638cbe98-6dca-452a-92b2-5b6577047449︡
︠086e492f-e0a5-45ca-9405-5fcbdea7c4f0i︠
%html
<h2>3+1 decomposition of the Simon-Mars tensor</h2>
<p>We proceed according to the computation presented in <a href="http://arxiv.org/abs/1412.6542">arXiv:1412.6542</a>.</p>
<p>Tensor $E^\sharp$ of components $E^i_ {\ \, j}$:</p>

︡9cd1c390-f418-4bed-aecf-74dfa51ee0e5︡︡{"done":true,"html":"<h2>3+1 decomposition of the Simon-Mars tensor</h2>\n<p>We proceed according to the computation presented in <a href=\"http://arxiv.org/abs/1412.6542\">arXiv:1412.6542</a>.</p>\n<p>Tensor $E^\\sharp$ of components $E^i_ {\\ \\, j}$:</p>"}
︠eea3f280-bbca-4d55-b9e3-b1a89553f6fb︠
Eu = E.up(gam, 0) 
print Eu
︡499d344c-bad2-440e-adaa-906da394f7f4︡
︠8fb7cba9-6b07-49d0-adb3-ec60d2da1babi︠
%html
<p>Tensor $B^\sharp$ of components $B^i_{\ \, j}$:</p>

︡d5531f20-81b5-401b-b1de-0079f3a60ae1︡︡{"done":true,"html":"<p>Tensor $B^\\sharp$ of components $B^i_{\\ \\, j}$:</p>"}
︠ad6e94d9-05d2-4408-8eee-98d61e4e3a7e︠
Bu = B.up(gam, 0)
print Bu
︡470865c5-3bf4-4bc5-9f5e-74313aa5a098︡
︠3524f926-65e5-4029-bf5d-40149d2ec101i︠
%html
<p>1-form $\beta^\flat$ of components $\beta_i$ and its exterior derivative:</p>

︡af49b376-e8bd-48a0-93b5-229802412fcd︡︡{"done":true,"html":"<p>1-form $\\beta^\\flat$ of components $\\beta_i$ and its exterior derivative:</p>"}
︠229119ae-aef6-4a14-88b6-bd21f06b722d︠
bd = b.down(gam)
xdb = bd.exterior_der()
print xdb
︡40603103-6cf1-4ea7-b158-6c5f041aa33e︡
︠1e58a006-8b64-417b-a9ba-1a9bcaa60769i︠
%html
<p>Scalar square of shift $\beta_i \beta^i$:</p>

︡4e6ce9c8-8c52-46be-b5d8-a752ea52c9d4︡︡{"done":true,"html":"<p>Scalar square of shift $\\beta_i \\beta^i$:</p>"}
︠735218c9-725a-4906-a1cf-4ba28e2395a4︠
b2 = bd(b)
print b2
︡7d310f36-8843-4d11-89ad-f2a0038be789︡
︠e3269b79-5d99-42f7-8754-22ae0cc10213i︠
%html
<p>Scalar $Y = E(\beta,\beta) = E_{ij} \beta^i \beta^j$:</p>

︡200f9852-2fc8-44b1-8903-5d4659b7e337︡︡{"done":true,"html":"<p>Scalar $Y = E(\\beta,\\beta) = E_{ij} \\beta^i \\beta^j$:</p>"}
︠ecf26a95-8a8a-4fef-956b-104236f9f74a︠
Ebb = E(b,b)
Y = Ebb
print Y
︡b2209b2e-0b9b-4ae6-aad4-dd993e694a19︡
︠1347d807-abe8-4d4e-a99d-d488bf46d277i︠
%html
<p>Scalar $\bar Y = B(\beta,\beta) = B_{ij}\beta^i \beta^j$:</p>

︡f4fc3bf3-843b-4d07-ab29-9f1dc074cddd︡︡{"done":true,"html":"<p>Scalar $\\bar Y = B(\\beta,\\beta) = B_{ij}\\beta^i \\beta^j$:</p>"}
︠54e38f30-0adc-4072-86c1-2511d3b63e24︠
Bbb = B(b,b)
Y_bar = Bbb
print Y_bar
︡f294c360-d741-4d25-9df3-3ed4b720b7a8︡
︠110c06e2-58f5-4ffd-9b3a-a7c58de0f835i︠
%html
<p>1-form of components $Eb_i = E_{ij} \beta^j$:</p>

︡062e495d-8d59-4021-a10b-e50415def866︡︡{"done":true,"html":"<p>1-form of components $Eb_i = E_{ij} \\beta^j$:</p>"}
︠dd2cf54e-8672-4cc0-a3a7-ec76a7b1df4e︠
Eb = E.contract(b)
print Eb
︡38f51b45-bac3-4b07-b38b-515f7ac0fa19︡
︠ea849ebc-f857-423c-96ee-a99e42fa2951i︠
%html
<p>Vector field of components $Eub^i = E^i_{\ \, j} \beta^j$:</p>

︡1c6f1bec-0e4d-405a-91e0-9e3268d18e0f︡︡{"done":true,"html":"<p>Vector field of components $Eub^i = E^i_{\\ \\, j} \\beta^j$:</p>"}
︠479e4969-6058-48dc-b80e-15b3f66160a8︠
Eub = Eu.contract(b)
print Eub
︡59673bbd-98a7-498e-9fc2-b781d02bb1fe︡
︠831705a2-d4a9-4111-899a-284f490f7bf3i︠
%html
<p>1-form of components $Bb_i = B_{ij} \beta^j$:</p>

︡1b0ff782-1de4-4aac-ae7c-46517d07d62b︡︡{"done":true,"html":"<p>1-form of components $Bb_i = B_{ij} \\beta^j$:</p>"}
︠de19f9be-3014-4b25-9556-f28f956bc985︠
Bb = B.contract(b)
print Bb
︡c876c50e-6786-4320-82c5-37ce0618dadf︡
︠a53b80de-2fbb-4aae-880c-291dad5a5aa3i︠
%html
<p>Vector field of components $Bub^i = B^i_{\ \, j} \beta^j$:</p>

︡80539c7c-f3a1-4a8f-aeef-677cb793bd0c︡︡{"done":true,"html":"<p>Vector field of components $Bub^i = B^i_{\\ \\, j} \\beta^j$:</p>"}
︠9f4ea2c6-d1a8-4657-b357-cf76a47441de︠
Bub = Bu.contract(b)
print Bub
︡11ece7ed-0559-45c9-b071-8a0fe912b440︡
︠582c5eac-f854-440b-8f5b-b4406b784f07i︠
%html
<p>Vector field of components $Kub^i = K^i_{\ \, j} \beta^j$:</p>

︡285ca922-a815-48a0-8b2e-87405a0f20d2︡︡{"done":true,"html":"<p>Vector field of components $Kub^i = K^i_{\\ \\, j} \\beta^j$:</p>"}
︠1a8f26d3-c344-4aab-8830-65be833ee288︠
Kub = Ku.contract(b)
print Kub
︡0f4ad545-7e37-4226-a497-33c106e2c0f9︡
︠f82358b5-43c6-4700-90ab-f8ec33fb6b0b︠
T = 2*b(N) - 2*K(b,b)
print T ; T.display()
︡11c667d3-c6f0-4f39-92ac-b1ed1d6bb84f︡
︠b42b35f3-feec-4eb6-81d9-89f9fdb1b18e︠
Db = D(b)  #  Db^i_j = D_j b^i
Dbu = Db.up(gam, 1)  # Dbu^{ij} = D^j b^i
bDb = b*Dbu  # bDb^{ijk} = b^i D^k b^j
T_bar = eps['_ijk']*bDb['^ikj']
print T_bar ; T_bar.display()
︡b64b8a84-258a-498b-8a5a-85b581b0ecd7︡
︠0fbef62b-5188-4051-b12c-1bf37e0ef120︠
epsb = eps.contract(b) 
print epsb
︡fa2d193e-e6a0-4a8b-8577-2fdf952c7cb0︡
︠ed50fc01-5ecc-4729-95da-3422132afdd5︠
epsB = eps['_ijl']*Bu['^l_k']
print epsB
︡3a0efd9f-b6ce-4645-afe3-faf890fa6c2a︡
︠7192611f-b3fb-424a-a52c-df20acb97036︠
Z = 2*N*( D(N)  -K.contract(b)) + b.contract(xdb)
print Z
︡ca40e317-77b5-44b1-abbc-7734ce027e45︡
︠00ea2e18-db94-4742-9772-41e9d18a833e︠
DNu = D(N).up(gam)
A = 2*(DNu - Ku.contract(b))*b + N*Dbu
Z_bar = eps['_ijk']*A['^kj']
print Z_bar
︡0c03eace-7ea7-4d8c-9f29-143ba61490cd︡
︠516dc59a-3c4e-4891-88a6-e6c4b28245e0︠
W = N*Eb + epsb.contract(Bub)
print W
︡cb571ff0-2dc5-45ba-9055-61820f9c9c1c︡
︠730b3bc1-f88f-4bad-97dd-33e24dc60df8︠
W_bar = N*Bb - epsb.contract(Eub)
print W_bar
︡326d0668-9d51-4e54-8db6-dbc9debbaabf︡
︠2fc74d2d-1fc0-4490-94cf-d0fea8c10c43︠
M = - 4*Eb(Kub - DNu) - 2*(epsB['_ij.']*Dbu['^ji'])(b)
print M ; M.display()
︡d82baade-7df8-4222-a030-9b2eae504a70︡
︠2f71d057-89ee-4c76-aaf5-c356bc9abab5︠
M_bar = 2*(eps.contract(Eub))['_ij']*Dbu['^ji'] - 4*Bb(Kub - DNu)
print M_bar ; M_bar.display()
︡41f1d840-0e77-48f9-9b86-e13f441dcded︡
︠f0d03f9e-0fa4-4147-8174-e9b691a463bc︠
F = (N^2 - b2)*gam + bd*bd
print F
︡88972dea-f8d4-433b-8ced-f132cb81b4d9︡
︠822d1d8a-6a2f-400c-bf36-e8da2f9e3ee3︠
A = epsB['_ilk']*b['^l'] + epsB['_ikl']*b['^l'] + Bu['^m_i']*epsb['_mk'] - 2*N*E
xdbE = xdb['_kl']*Eu['^k_i']
L = 2*N*epsB['_kli']*Dbu['^kl'] + 2*xdb['_ij']*Eub['^j'] + 2*xdbE['_li']*b['^l'] \
    + 2*A['_ik']*(Kub - DNu)['^k']
print L
︡854241b3-fee3-456c-b134-7caed3365b93︡
︠f2963759-87ee-4206-8e86-6f9c7909a77e︠
N2pbb = N^2 + b2
V = N2pbb*E - 2*(b.contract(E)*bd).symmetrize() + Ebb*gam + 2*N*(b.contract(epsB).symmetrize())
print V
︡cedebd41-ea0c-409f-9364-2d5399837037︡
︠10db3e1e-6d57-4800-bc05-980069b458f9︠
beps = b.contract(eps)
V_bar = N2pbb*B - 2*(b.contract(B)*bd).symmetrize() + Bbb*gam \
        -2*N*(beps['_il']*Eu['^l_j']).symmetrize()
print V_bar
︡0d2e309d-e4e0-4389-8ecb-70b2f68cc5e9︡
︠e57b8b5f-ad3c-4513-b637-63179e504b51︠
F = (N^2 - b2)*gam + bd*bd
print F
︡2a1e5e52-f6f4-4a6e-ad73-a8761f936e2c︡
︠a4bed560-72ca-4fe6-ab8e-dddf5ca4b564︠
R1 = (4*(V*Z - V_bar*Z_bar) + F*L).antisymmetrize(1,2)
print R1
︡f3b24586-4e15-45df-8286-64e20f8d725e︡
︠b848787b-12f9-45f6-aef3-abe1b0c8993f︠
R2 = 4*(T*V - T_bar*V_bar - W*Z + W_bar*Z_bar) + M*F - N*bd*L
print R2
︡c2535558-73a9-4fa9-8e18-d5c83fcf9734︡
︠47f9317b-d3df-497a-b9a5-28c1f6740163︠
R3 = (4*(W*Z - W_bar*Z_bar) + N*bd*L).antisymmetrize()
print R3
︡41289909-6a4d-4936-988c-80a8c1497cc8︡
︠ee034fb9-fe14-49f4-a851-ec0c7f03f144︠
R2[3,1] == -2*R3[3,1]
︡572a0d30-2564-4742-a34f-2a3f7202393e︡
︠3bd744c1-1bba-475c-8108-f69aced5fd28︠
R2[3,2] == -2*R3[3,2]
︡6a628691-faee-4c91-88bd-6217220891c0︡
︠2b1691dd-3786-4b9a-a914-eded32acea2b︠
R4 = 4*(T*W - T_bar*W_bar) -4*(Y*Z - Y_bar*Z_bar) + N*M*bd - b2*L
print R4
︡0524053f-f728-4d60-abc1-d829865fd6ba︡
︠1e4f3a22-45a1-4612-ac69-5e3661967087︠
epsE = eps['_ijl']*Eu['^l_k']
print epsE
︡0670b60c-0e8d-48de-a064-349c48d838f0︡
︠a7f97e16-5b3d-4882-ba9f-800c0566f2e4︠
A = - epsE['_ilk']*b['^l'] - epsE['_ikl']*b['^l'] - Eu['^m_i']*epsb['_mk'] - 2*N*B
xdbB = xdb['_kl']*Bu['^k_i']
L_bar = - 2*N*epsE['_kli']*Dbu['^kl'] + 2*xdb['_ij']*Bub['^j'] + 2*xdbB['_li']*b['^l'] \
    + 2*A['_ik']*(Kub - DNu)['^k']
print L_bar
︡30789c79-874b-4353-ac21-9c27346dbffe︡
︠2d5a880c-a8db-4da2-b151-dc710baa9e44︠
R1_bar = (4*(V*Z_bar + V_bar*Z) + F*L_bar).antisymmetrize(1,2)
print R1_bar
︡4d7bbe4c-1d84-46ba-abab-ee699445c7d8︡
︠85f82003-ed10-48a9-ae7a-e4bb2037c422︠
R2_bar = 4*(T_bar*V + T*V_bar) - 4*(W*Z_bar + W_bar*Z) + M_bar*F - N*bd*L_bar
print R2_bar
︡9b2e521f-d6a8-4f6e-80e3-928463f5253c︡
︠ee2e7fcb-ef17-4561-93a2-15d6e78db4c6︠
R3_bar = (4*(W*Z_bar + W_bar*Z) + N*bd*L_bar).antisymmetrize()
print R3_bar
︡92ea23e8-2de6-4b7d-b628-3ce37ccbc6b7︡
︠573d0456-bbaf-4cb7-acc8-f3ffc44d3e88︠
R4_bar = 4*(T_bar*W + T*W_bar - Y*Z_bar - Y_bar*Z) + M_bar*N*bd - b2*L_bar
print R4_bar
︡071d3805-09b5-4cf8-8244-b57bf58f16cd︡
︠4974aee3-c8ae-426d-95f4-c2ae0e30caba︠
R1u = R1.up(gam)
print R1u
︡5ba2b7cd-57c0-4c35-a152-2d1d696c04e4︡
︠19ef35db-2047-43f2-8316-8e3e4ded3cec︠
R2u = R2.up(gam)
print R2u
︡a84aca14-b6dd-4780-aab5-6c2c64761d61︡
︠c58b82ac-a2ca-4c56-95a3-203e43eae9e4︠
R3u = R3.up(gam)
print R3u
︡60c9f0ab-916a-461a-a540-4c77abd48478︡
︠14050f9a-0ea8-473e-9205-ae9b5252d2de︠
R4u = R4.up(gam)
print R4u
︡55c944b0-fc21-4d1d-96f0-284176b17259︡
︠c4a0d52f-6763-4552-9770-a0e48330573b︠
R1_baru = R1_bar.up(gam)
print R1_baru
︡2f70875f-0670-43c1-a114-5a9e90830d20︡
︠545205fc-5c34-449b-baf2-6cb755e2a859︠
R2_baru = R2_bar.up(gam)
print R2_baru
︡5d3e6403-0605-4327-be82-a60dc5bc5a09︡
︠42b354e7-11ce-46cb-a43b-f9c3b53dc7a7︠
R3_baru = R3_bar.up(gam)
print R3_baru
︡675b5e8d-2b98-46d7-8f89-e68d4dadb9b6︡
︠d9dd5f83-a642-4b1c-b722-7f5a0ab4c654︠
R4_baru = R4_bar.up(gam)
print R4_baru
︡71d8ef2b-f2f7-4f16-ab8a-18466214ab1a︡
︠6deb5ece-61a3-47c3-9921-9fc2c58cc567i︠
%html
<h3>Simon-Mars scalars</h3>

︡0786e1ce-d89a-42bf-b614-02c1fc6b592d︡︡{"done":true,"html":"<h3>Simon-Mars scalars</h3>"}
︠c066afb9-d764-4da9-896d-70d9f3ad3a1a︠
S1 = 4*(R1['_ijk']*R1u['^ijk'] - R1_bar['_ijk']*R1_baru['^ijk'] - 2*(R2['_ij']*R2u['^ij'] - R2_bar['_ij']*R2_baru['^ij']) - R3['_ij']*R3u['^ij'] + R3_bar['_ij']*R3_baru['^ij'] + 2*(R4['_i']*R4u['^i'] - R4_bar['_i']*R4_baru['^i']))
print S1
︡61fadfde-9c3f-4386-bb87-a16dc1eb9c0f︡
︠ed0f8d6f-4778-4880-9dc7-b8d382fc5d1f︠
S1E = S1.expr()
︡a830d170-f007-4c34-90e3-1a426bc558e0︡
︠8cbed18f-ae60-4a2e-aaf3-3ae3604bd5a1︠
S2 = 4*(R1['_ijk']*R1_baru['^ijk'] + R1_bar['_ijk']*R1u['^ijk'] - 2*(R2['_ij']*R2_baru['^ij'] + R2_bar['_ij']*R2u['^ij']) - R3['_ij']*R3_baru['^ij'] - R3_bar['_ij']*R3u['^ij'] + 2*(R4['_i']*R4_baru['^i'] + R4_bar['_i']*R4u['^i']))
print S2
︡558efce5-fd4f-4e63-8c0f-91fc6c2138a4︡
︠053d63b1-6eee-4b27-9d92-622e02d46a20︠
S2E = S2.expr()
︡eb0a4296-b36d-48e7-9485-8cfab35a8ec1︡
︠afe786b1-717f-4c9c-a6b3-765c7afd4bcb︠
lS1E = log(S1E,10).simplify_full()
︡78a31185-46bb-4e7a-9722-a93829fcaa8a︡
︠354465f5-c9e4-400d-af98-92e9619198ad︠
lS2E = log(S2E,10).simplify_full()
︡72bf6493-e558-451b-93b8-237551fa9d8e︡
︠866ff29d-0a48-4ab6-9a5a-271ad8b54f51i︠
%html
<p>Simon-Mars scalars expressed in terms of the coordinates $X=-1/x,y$:</p>

︡2b7af1d5-f07e-483e-ad4d-e83025e40142︡︡{"done":true,"html":"<p>Simon-Mars scalars expressed in terms of the coordinates $X=-1/x,y$:</p>"}
︠80382a46-12ef-42c5-b726-ab903ac05ea7︠
var('X')
S1EX = S1E.subs(x=-1/X).simplify_full()
S2EX = S2E.subs(x=-1/X).simplify_full()
︡41ef2389-8c11-4439-853a-ef79bba3aa71︡
︠058d10c8-d904-41fb-95cb-6be1487ab061i︠
%html
<p>Definition of the ergoregion:</p>

︡2fb7cfa5-a83e-4f6a-bf07-08bef8b200c9︡︡{"done":true,"html":"<p>Definition of the ergoregion:</p>"}
︠5a01a542-6836-42ac-859f-023b14b0c2c8︠
g00 = - AA2/BB2
g00X = g00.subs(x=-1/X).simplify_full()
︡58f1fdf5-6fa1-4ac4-a6f0-1bc41c5b408c︡
︠f2e5a913-9fc0-47ed-875b-2fee40fa13ea︠
ergXy = implicit_plot(g00X, (-1,0), (-1,1), plot_points=200, fill=False, linewidth=1, color='black', axes_labels=(r"$X\,\left[M^{-1}\right]$", r"$y\,\left[M\right]$"), fontsize=14)
︡8acc7eeb-2f38-4dc6-bbec-b914a470de53︡
︠cf9c312c-5a88-4e63-9f89-f428e767d209i︠
%html
<p>Due to the very high degree of the polynomials involved in the expression of the Simon-Mars scalars, the floating-point precision of Sage's <span style="font-family: courier new,courier;">contour_plot</span> function (53 bits) is not sufficient. Taking avantage that Sage is <strong>open-source</strong>, we modify the function to allow for an arbitrary precision. First, we define a sampling function with a floating-point precision specified by the user (argument <span style="font-family: courier new,courier;">precis</span>):&nbsp;</p>

︡c4ff89e7-f9af-4f02-8e42-6e34d6a5171e︡︡{"done":true,"html":"<p>Due to the very high degree of the polynomials involved in the expression of the Simon-Mars scalars, the floating-point precision of Sage's <span style=\"font-family: courier new,courier;\">contour_plot</span> function (53 bits) is not sufficient. Taking avantage that Sage is <strong>open-source</strong>, we modify the function to allow for an arbitrary precision. First, we define a sampling function with a floating-point precision specified by the user (argument <span style=\"font-family: courier new,courier;\">precis</span>):&nbsp;</p>"}
︠80ff35ae-1cd3-41c7-93b1-3ab8aa430a18︠
def array_precisXy(fXy, Xmin, Xmax, ymin, ymax, np, precis, tronc):
    RP = RealField(precis)
    Xmin = RP(Xmin)
    Xmax = RP(Xmax)
    ymin = RP(ymin)
    ymax = RP(ymax)
    dX = (Xmax - Xmin) / RP(np-1)
    dy = (ymax - ymin) / RP(np-1)
    resu = []
    for i in range(np):
        list_y = []
        yy = ymin + dy * RP(i)
        fyy = fXy.subs(y=yy)
        for j in range(np):
            XX = Xmin + dX * RP(j)
            fyyXX = fyy.subs(X = XX)
            val = RP(log(abs(fyyXX) + 1e-20, 10))
            if val < -tronc:
                val = -tronc
            elif val > tronc:
                val = tronc
            list_y.append(val)
        resu.append(list_y)
    return resu
︡68617257-3236-47b1-a779-6b24bbaea65a︡
︠f4ac3b73-4600-4760-839c-365f786a3899i︠
%html
<p>Then we redefine <span style="font-family: courier new,courier;">contour_plot</span> so that it uses the sampling function with a floating-point precision of 200 bits:</p>

︡542b5e6d-78f9-4b74-a6c4-a8cfda225874︡︡{"done":true,"html":"<p>Then we redefine <span style=\"font-family: courier new,courier;\">contour_plot</span> so that it uses the sampling function with a floating-point precision of 200 bits:</p>"}
︠67866603-f9cb-4dfd-9c35-ea56b70bfd0f︠
from sage.misc.decorators import options, suboptions

@suboptions('colorbar', orientation='vertical', format=None, spacing=None)
@suboptions('label', fontsize=9, colors='blue', inline=None, inline_spacing=3, fmt="%1.2f")
@options(plot_points=100, fill=True, contours=None, linewidths=None, linestyles=None, labels=False, frame=True, axes=False, colorbar=False, legend_label=None, aspect_ratio=1)
def contour_plot_precisXy(f, xrange, yrange, **options):
    from sage.plot.all import Graphics
    from sage.plot.misc import setup_for_eval_on_grid
    from sage.plot.contour_plot import ContourPlot

    np = options['plot_points']
    precis = 200  # floating-point precision = 200 bits 
    tronc = 10
    xy_data_array = array_precisXy(f, xrange[0], xrange[1], yrange[0], yrange[1], np, precis, tronc)

    g = Graphics()

    # Reset aspect_ratio to 'automatic' in case scale is 'semilog[xy]'.
    # Otherwise matplotlib complains.
    scale = options.get('scale', None)
    if isinstance(scale, (list, tuple)):
        scale = scale[0]
    if scale == 'semilogy' or scale == 'semilogx':
        options['aspect_ratio'] = 'automatic'

    g._set_extra_kwds(Graphics._extract_kwds_for_show(options, ignore=['xmin', 'xmax']))
    g.add_primitive(ContourPlot(xy_data_array, xrange, yrange, options))
    return g
︡4b4e9ab7-34b7-4741-97c6-fddeb01df355︡
︠b50441b0-f6ff-49f0-89ae-ae1cbd5701f4i︠
%html
<p>Then we are able to draw the contour plot of the two Simon-Mars scalars, in terms of the coordinates $(X,y)$ (Figure 11 of <a href="http://arxiv.org/abs/1412.6542">arXiv:1412.6542</a>):</p>

︡dc728e5e-881e-4e04-a818-6086271cb8c9︡︡{"done":true,"html":"<p>Then we are able to draw the contour plot of the two Simon-Mars scalars, in terms of the coordinates $(X,y)$ (Figure 11 of <a href=\"http://arxiv.org/abs/1412.6542\">arXiv:1412.6542</a>):</p>"}
︠1e9df7c9-7783-4db8-b293-ea54295046aa︠
c1Xy = contour_plot_precisXy(S1EX, (-1,0), (-1,1), plot_points=200, fill=False, cmap='hsv', linewidths=1, contours=(-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8), colorbar=True, colorbar_spacing='uniform', colorbar_format='%1.f', axes_labels=(r"$X\,\left[M^{-1}\right]$", r"$y\,\left[M\right]$"), fontsize=14)
︡2a469da9-d9c6-4b24-8693-63301bbd8662︡
︠49e4b86e-7366-4471-b542-0a0c8c055aa7︠
S1TSXy = c1Xy+ergXy
show(S1TSXy)
︡5b76e4c9-f405-4cce-b13d-5fa99b163975︡
︠7296fcac-702e-4652-844c-7ac0726df18f︠
c2Xy = contour_plot_precisXy(S2EX, (-1,0), (-1,1), plot_points=200, fill=False, cmap='hsv', linewidths=1, contours=(-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10), colorbar=True, colorbar_spacing='uniform', colorbar_format='%1.f', axes_labels=(r"$X\,\left[M^{-1}\right]$", r"$y\,\left[M\right]$"), fontsize=14)
︡57c1dc98-92e1-4252-acde-87ce4a073130︡
︠b31e360a-ad92-4a5f-97cb-afa4a905df51︠
S2TSXy = c2Xy + ergXy
show(S2TSXy)
︡4e32783a-9e41-4c95-942c-3f960b863d96︡
︠d0defda6-e29b-426c-8e00-a10a6a515469i︠
%html
<p>Let us do the same in terms of the Weyl-Lewis-Papapetrou cylindrical coordinates $(\rho,z)$, which are related to the prolate spheroidal coordinates $(x,y)$ by \[ \rho = \sqrt{(x^2-1)(1-y^2)}&nbsp; \quad\mbox{and}\quad z=xy . \]&nbsp;</p>
<p>For simplicity, we denote $\rho$ by $r$:</p>

︡c92becb0-19e0-4b74-a287-ddc6e56d0ddd︡︡{"done":true,"html":"<p>Let us do the same in terms of the Weyl-Lewis-Papapetrou cylindrical coordinates $(\\rho,z)$, which are related to the prolate spheroidal coordinates $(x,y)$ by \\[ \\rho = \\sqrt{(x^2-1)(1-y^2)}&nbsp; \\quad\\mbox{and}\\quad z=xy . \\]&nbsp;</p>\n<p>For simplicity, we denote $\\rho$ by $r$:</p>"}
︠4193de64-64a7-4c15-8af3-332b1d9c1a84︠
var('r z')
︡ce5c279b-acf3-4aec-9202-70b19e14bdf5︡
︠f747a5d8-80e0-4084-8d3f-91c0d4e57c4f︠
S1Erz = S1E.subs(x=1/2*(sqrt(r^2+(z+1)^2)+sqrt(r^2+(z-1)^2)), y=1/2*(sqrt(r^2+(z+1)^2)-sqrt(r^2+(z-1)^2)))
S1Erz = S1Erz.simplify_full()
︡e5b273a0-af41-42cb-a396-b65ce8ab93e1︡
︠c2a12fef-349e-4dbb-8e69-8e5276c81cfa︠
S2Erz = S2E.subs(x=1/2*(sqrt(r^2+(z+1)^2)+sqrt(r^2+(z-1)^2)), y=1/2*(sqrt(r^2+(z+1)^2)-sqrt(r^2+(z-1)^2)))
S2Erz = S2Erz.simplify_full()
︡dba3bf49-435d-4afe-aec7-5f76522af45f︡
︠8650f0da-7b89-4050-ad09-888667ecf70f︠
def tab_precis(fz, zz, rmin, rmax, np, precis, tronc):
    RP = RealField(precis)
    rmin = RP(rmin)
    rmax = RP(rmax)
    zz = RP(zz)
    dr = (rmax - rmin) / RP(np-1)
    resu = []
    fzz = fz.subs(z=zz)
    for i in range(np):
        rr = rmin + dr * RP(i)
        val = RP(log(abs(fzz.subs(r = rr)), 10))
        if val < -tronc:
            val = -tronc
        elif val > tronc:
            val = tronc
        resu.append((rr, zz, val))
    return resu
︡6d2f7393-de60-4ae9-a729-4883e493dcdf︡
︠c823f69e-a0f1-4299-ba0c-c8fe074cf038i︠
%html
<p>3D plots</p>

︡b9b04e77-54ac-4ddb-b4d7-ad29d7019207︡︡{"done":true,"html":"<p>3D plots</p>"}
︠b412633a-318c-4047-9868-4931ed6cc9cf︠
gg = Graphics()
rmin = 0.1
rmax = 3
zmin = -2
zmax = 2
npr = 200
npz = npr
precis = 200 # 200-bits floating-point precision
tronc = 5
dz = (zmax-zmin) / (npz-1)
for i in range(npz):
    zz = zmin + i*dz
    gg += line3d(tab_precis(S1Erz, zz, rmin, rmax, npr, precis, tronc))
show(gg)
︡5740437a-c8eb-4fa6-84e0-35e287d137e6︡
︠a23e1d81-d1aa-41ec-89e8-b33396f81cf3︠
gg2 = Graphics()
rmin = 0.1
rmax = 3
zmin = -2
zmax = 2
npr = 200
npz = npr
precis = 200
tronc = 5
dz = (zmax-zmin) / (npz-1)
for i in range(npz):
    zz = zmin + i*dz
    gg2 += line3d(tab_precis(S2Erz, zz, rmin, rmax, npr, precis, tronc))
show(gg2)
︡e0e4ce02-4a7d-45d2-bbed-3859be13f367︡
︠523ce9d1-2771-412d-825a-8c8e1be681aei︠
%html
<p>Contour plots of the two Simon-Mars scalar fields in terms of coordinates $(\rho,z)$ (Figure 12 of <a href="http://arxiv.org/abs/1412.6542">arXiv:1412.6542</a>)</p>

︡e2605c61-6eae-4972-99c6-8e7e7e387f62︡︡{"done":true,"html":"<p>Contour plots of the two Simon-Mars scalar fields in terms of coordinates $(\\rho,z)$ (Figure 12 of <a href=\"http://arxiv.org/abs/1412.6542\">arXiv:1412.6542</a>)</p>"}
︠873efe4b-3abd-4ae2-be4d-0ed73d741614︠
def array_precis(frz, rmin, rmax, zmin, zmax, np, precis, tronc):
    RP = RealField(precis)
    rmin = RP(rmin)
    rmax = RP(rmax)
    zmin = RP(zmin)
    zmax = RP(zmax)
    dr = (rmax - rmin) / RP(np-1)
    dz = (zmax - zmin) / RP(np-1)
    resu = []
    for i in range(np):
        list_z = []
        zz = zmin + dz * RP(i)
        fzz = frz.subs(z=zz)
        for j in range(np):
            rr = rmin + dr * RP(j)
            fzzrr = fzz.subs(r = rr)
            val = RP(log(abs(fzzrr) + 1e-20, 10))
            if val < -tronc:
                val = -tronc
            elif val > tronc:
                val = tronc
            list_z.append(val)
        resu.append(list_z)
    return resu
︡3c8d45aa-3b85-40a4-be06-c7ce6889f9c4︡
︠e6198aa7-09c7-4c0c-8dbf-9151fdcbc641︠
rmin = 0.1
rmax = 3
zmin = -2
zmax = 2
npr = 10
npz = npr
precis = 100
tronc = 5
val = array_precis(S1Erz, rmin, rmax, zmin, zmax, npr, precis, tronc)
︡8625680e-67cb-4efb-b8db-2e7ee6ed5546︡
︠de6153fe-edec-4911-9682-c782d48bdc91︠
from sage.misc.decorators import options, suboptions

@suboptions('colorbar', orientation='vertical', format=None, spacing=None)
@suboptions('label', fontsize=9, colors='blue', inline=None, inline_spacing=3, fmt="%1.2f")
@options(plot_points=100, fill=True, contours=None, linewidths=None, linestyles=None, labels=False, frame=True, axes=False, colorbar=False, legend_label=None, aspect_ratio=1)
def contour_plot_precis(f, xrange, yrange, **options):
    from sage.plot.all import Graphics
    from sage.plot.misc import setup_for_eval_on_grid
    from sage.plot.contour_plot import ContourPlot

    np = options['plot_points']
    precis = 200
    tronc = 10
    xy_data_array = array_precis(f, xrange[0], xrange[1], yrange[0], yrange[1], np, precis, tronc)

    g = Graphics()

    # Reset aspect_ratio to 'automatic' in case scale is 'semilog[xy]'.
    # Otherwise matplotlib complains.
    scale = options.get('scale', None)
    if isinstance(scale, (list, tuple)):
        scale = scale[0]
    if scale == 'semilogy' or scale == 'semilogx':
        options['aspect_ratio'] = 'automatic'

    g._set_extra_kwds(Graphics._extract_kwds_for_show(options, ignore=['xmin', 'xmax']))
    g.add_primitive(ContourPlot(xy_data_array, xrange, yrange, options))
    return g
︡b03d552f-b24f-4f43-b211-c3ab7e1cdf2a︡
︠3a07fc4c-bf4b-4073-82ef-e63f31f42b97︠
c1rz = contour_plot_precis(S1Erz, (0.0001,10), (-5,5.001), plot_points=300, fill=False, cmap='hsv', linewidths=1, contours=(-10,-9,-8,-7,-6,-5.5,-5,-4.5,-4,-3.5,-3,-2.5,-2,-1.5,-1,-0.5,0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5), colorbar=True, colorbar_spacing='uniform', colorbar_format='%1.f', axes_labels=(r"$\rho\,\left[M\right]$", r"$z\,\left[M\right]$"), fontsize=14)
︡269fa852-b0de-4595-9693-4f80b694b300︡
︠62ec5475-69e7-47fe-ad4a-45871f32d469︠
g00rz = g00.subs(x=1/2*(sqrt(r^2+(z+1)^2)+sqrt(r^2+(z-1)^2)), y=1/2*(sqrt(r^2+(z+1)^2)-sqrt(r^2+(z-1)^2))).simplify_full()
c2 = implicit_plot(g00rz, (0.0001,10), (-5,5.001), plot_points=200, fill=False, linewidth=1, color='black', axes_labels=(r"$\rho\,\left[M\right]$", r"$z\,\left[M\right]$"), fontsize=14)
S1TSrz = c1rz+c2
show(S1TSrz)
︡a0dc2f80-c63b-4d45-bf49-9020c276e2cf︡
︠8067ece6-d922-4329-a9a4-f6d01326c513︠
c2rz = contour_plot_precis(S2Erz, (0.0001,10), (-5,5.001), plot_points=300, fill=False, cmap='hsv', linewidths=1, contours=(-10,-9,-8,-7,-6,-5.5,-5,-4.5,-4,-3.5,-3,-2.5,-2,-1.5,-1,-0.5,0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5), colorbar=True, colorbar_spacing='uniform', colorbar_format='%1.f', axes_labels=(r"$\rho\,\left[M\right]$", r"$z\,\left[M\right]$"), fontsize=14)
S2TSrz = c2rz+c2
show(S2TSrz)
︡5ba8ac89-28e9-4457-8d17-c0f2a8750826︡
︠0a4f7734-61cf-4873-ad07-3e8ce54c86ad︠

︡4de4055e-e4d9-4536-9a24-722a26f4c180︡










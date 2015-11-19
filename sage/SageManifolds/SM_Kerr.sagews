︠95a2f093-7345-4139-8fbe-5f3dccfaedd4as︠
%auto
typeset_mode(True, display=False)
︡9159e58f-3a6d-4d06-bd03-7f140b267e39︡︡{"auto":true}︡{"done":true}
︠691859e5-5036-41b3-a73f-2b0022c23022i︠
%html
<h1 style="text-align: center;">Kerr spacetime</h1>
<p>This worksheet demonstrates a few capabilities of <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.8) in computations regarding Kerr spacetime.</p>
<p>It is released under the GNU General Public License version 3.</p>
<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>
<p><em><span style="color: #008080;">The corresponding worksheet file can be downloaded from</span> <a href="http://sagemanifolds.obspm.fr/examples/sws/SM_Kerr.sws">here</a></em>.</p>
<p>&nbsp;</p>
<h2>Spacetime manifold</h2>
<p>We can then declare the Kerr spacetime as a 4-dimensional diffentiable manifold:</p>

︡c6cf52ad-c5ab-455f-968d-b2936c5d1ebe︡︡{"done":true,"html":"<h1 style=\"text-align: center;\">Kerr spacetime</h1>\n<p>This worksheet demonstrates a few capabilities of <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.8) in computations regarding Kerr spacetime.</p>\n<p>It is released under the GNU General Public License version 3.</p>\n<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>\n<p><em><span style=\"color: #008080;\">The corresponding worksheet file can be downloaded from</span> <a href=\"http://sagemanifolds.obspm.fr/examples/sws/SM_Kerr.sws\">here</a></em>.</p>\n<p>&nbsp;</p>\n<h2>Spacetime manifold</h2>\n<p>We can then declare the Kerr spacetime as a 4-dimensional diffentiable manifold:</p>"}
︠714c0482-f782-4d58-800d-1a0e289452bcs︠
M = Manifold(4, 'M', r'\mathcal{M}')
︡cb0dddc3-34ad-44c3-9f3c-91ae3fc803e5︡︡{"done":true}
︠80992182-8520-488d-8884-eb1c55f8e848i︠
%html
<p>Let us use the standard <strong>Boyer-Lindquist coordinates</strong> on it, by first introducing the part $\mathcal{M}_0$ covered by these coordinates</p>

︡6e92e81a-ff74-4ec8-9917-2e2c68068d65︡︡{"done":true,"html":"<p>Let us use the standard <strong>Boyer-Lindquist coordinates</strong> on it, by first introducing the part $\\mathcal{M}_0$ covered by these coordinates</p>"}
︠95b3aaaf-f19a-4638-98e4-fe11f3cdcf91s︠
M0 = M.open_subset('M0', r'\mathcal{M}_0')
# BL = Boyer-Lindquist
BL.<t,r,th,ph> = M0.chart(r't r:(0,+oo) th:(0,pi):\theta ph:(0,2*pi):\phi') 
print BL ; BL
︡6e711e4a-1696-4089-a71e-b926187f4705︡︡{"stdout":"chart (M0, (t, r, th, ph))\n","done":false}︡{"html":"<div>$\\left(\\mathcal{M}_0,(t, r, {\\theta}, {\\phi})\\right)$</div>","done":false}︡{"done":true}
︠6b72aceb-7dfd-4327-bd72-63b38c10f033s︠
BL[0], BL[1]
︡46f5f3fd-08d9-4c0d-bfda-cff8f32631a5︡︡{"html":"<div>($t$, $r$)</div>","done":false}︡{"done":true}
︠2c7eee66-1494-4827-8192-bafa2f8fdaaai︠
%html
<h2>Metric tensor</h2>

<p>The 2 parameters $m$ and $a$ of the Kerr spacetime are declared as symbolic variables:</p>

︡7f0445a9-3aaf-490f-89b8-d4802eb06e16︡︡{"done":true,"html":"<h2>Metric tensor</h2>\n\n<p>The 2 parameters $m$ and $a$ of the Kerr spacetime are declared as symbolic variables:</p>"}
︠c26023db-5d35-4b9f-8312-d2342160293ds︠
var('m, a')
︡c85308cf-b408-48ba-9738-7dfeea4f204b︡︡{"html":"<div>($m$, $a$)</div>","done":false}︡{"done":true}
︠8ee4da76-05e3-4cd0-a9b0-6cbfb0790021i︠
%html
<p>Let us introduce the spacetime metric:</p>

︡d7a00727-9963-4ebc-a3cf-1a4e962fc7e5︡︡{"done":true,"html":"<p>Let us introduce the spacetime metric:</p>"}
︠19ca6ad8-795e-4cde-b02a-40bd91187741s︠
g = M.lorentz_metric('g')
︡bbf79090-1be4-4477-9ede-1d78277aa68f︡︡{"done":true}
︠f6273ca1-3947-47fb-9074-59b940516d11i︠
%html
<p>The metric is set by its components in the coordinate frame associated with Boyer-Lindquist coordinates, which is the current manifold's default frame:</p>

︡325d8c08-7013-4236-a5dd-a39ed87b03ce︡︡{"done":true,"html":"<p>The metric is set by its components in the coordinate frame associated with Boyer-Lindquist coordinates, which is the current manifold's default frame:</p>"}
︠995253f9-f068-44ed-a531-ad61b0c43e3cs︠
rho2 = r^2 + (a*cos(th))^2
Delta = r^2 -2*m*r + a^2
g[0,0] = -(1-2*m*r/rho2)
g[0,3] = -2*a*m*r*sin(th)^2/rho2
g[1,1], g[2,2] = rho2/Delta, rho2
g[3,3] = (r^2+a^2+2*m*r*(a*sin(th))^2/rho2)*sin(th)^2
g.display()
︡ca304212-bb99-4906-8d97-8aada25b7289︡︡{"html":"<div>$g = \\left( -\\frac{a^{2} \\cos\\left({\\theta}\\right)^{2} - 2 \\, m r + r^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\right) \\mathrm{d} t\\otimes \\mathrm{d} t + \\left( -\\frac{2 \\, a m r \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\right) \\mathrm{d} t\\otimes \\mathrm{d} {\\phi} + \\left( \\frac{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}}{a^{2} - 2 \\, m r + r^{2}} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + \\left( a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2} \\right) \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + \\left( -\\frac{2 \\, a m r \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} t + \\left( \\frac{2 \\, a^{2} m r \\sin\\left({\\theta}\\right)^{4} + {\\left(a^{2} r^{2} + r^{4} + {\\left(a^{4} + a^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠816fb82e-8a7c-4741-a058-2caf9f15507as︠
g[:]  # matrix view of all the components in the manifold's default vector frame
︡4bf77474-c672-4509-b010-46056fd4008e︡︡{"html":"<div>$\\left(\\begin{array}{rrrr}\n-\\frac{a^{2} \\cos\\left({\\theta}\\right)^{2} - 2 \\, m r + r^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} &amp; 0 &amp; 0 &amp; -\\frac{2 \\, a m r \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\\n0 &amp; \\frac{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}}{a^{2} - 2 \\, m r + r^{2}} &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2} &amp; 0 \\\\\n-\\frac{2 \\, a m r \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} &amp; 0 &amp; 0 &amp; \\frac{2 \\, a^{2} m r \\sin\\left({\\theta}\\right)^{4} + {\\left(a^{2} r^{2} + r^{4} + {\\left(a^{4} + a^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠4a1b005a-61fa-40c8-9c01-c4e8bde8c74as︠
g.display_comp()
︡6520c186-021a-44df-b74a-ca952f35dc13︡︡{"html":"<div>$\\begin{array}{lcl} g_{ \\, t \\, t }^{ \\phantom{\\, t } \\phantom{\\, t } } &amp; = &amp; -\\frac{a^{2} \\cos\\left({\\theta}\\right)^{2} - 2 \\, m r + r^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\ g_{ \\, t \\, {\\phi} }^{ \\phantom{\\, t } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\frac{2 \\, a m r \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\ g_{ \\, r \\, r }^{ \\phantom{\\, r } \\phantom{\\, r } } &amp; = &amp; \\frac{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}}{a^{2} - 2 \\, m r + r^{2}} \\\\ g_{ \\, {\\theta} \\, {\\theta} }^{ \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } } &amp; = &amp; a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2} \\\\ g_{ \\, {\\phi} \\, t }^{ \\phantom{\\, {\\phi} } \\phantom{\\, t } } &amp; = &amp; -\\frac{2 \\, a m r \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\ g_{ \\, {\\phi} \\, {\\phi} }^{ \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{2 \\, a^{2} m r \\sin\\left({\\theta}\\right)^{4} + {\\left(a^{2} r^{2} + r^{4} + {\\left(a^{4} + a^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\end{array}$</div>","done":false}︡{"done":true}
︠9ead7602-532f-4e60-96a6-b8e051abbdb8i︠
%html
<h2>Levi-Civita Connection</h2>

<p>The Levi-Civita connection $\nabla$ associated with $g$:</p>

︡2bd2dbeb-2164-44f7-b0c5-626e95a70781︡︡{"done":true,"html":"<h2>Levi-Civita Connection</h2>\n\n<p>The Levi-Civita connection $\\nabla$ associated with $g$:</p>"}
︠ed29ce99-9232-4f28-9ee8-39d49a963736s︠
nab = g.connection() ; print nab
︡90e6d644-a6a8-4169-8b79-69f27606cfe7︡︡{"stdout":"Levi-Civita connection 'nabla_g' associated with the Lorentzian metric 'g' on the 4-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠61dc5a79-6b0b-4c98-ab42-c113ad83aec1i︠
%html
<p>Let us verify that the covariant derivative of $g$ with respect to $\nabla$ vanishes identically:</p>

︡1483cee7-78f2-49e3-ba43-28b107285934︡︡{"done":true,"html":"<p>Let us verify that the covariant derivative of $g$ with respect to $\\nabla$ vanishes identically:</p>"}
︠47c4c41c-7fef-47f8-88fb-a289a0aff358s︠
nab(g) == 0
︡5565b856-a848-4459-b7be-e21460434c29︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠bd910cf6-bc59-4f94-bcc2-81260d782662s︠
nab(g).display() # another view of the above property
︡d7bcc856-4798-4126-a158-a4ef6aa8f95a︡︡{"html":"<div>$\\nabla_{g} g = 0$</div>","done":false}︡{"done":true}
︠f92fbc6d-4959-4745-a5e6-3c8af843fe68i︠
%html
<p>The nonzero Christoffel symbols (skipping those that can be deduced by symmetry of the last two indices):</p>

︡763b41a3-db73-4a51-b61f-2830e3d13222︡︡{"done":true,"html":"<p>The nonzero Christoffel symbols (skipping those that can be deduced by symmetry of the last two indices):</p>"}
︠25d93d12-2fb4-4ffc-97ae-09495079c52as︠
g.christoffel_symbols_display()
︡f05ac87c-a19e-4f44-9da0-344fb15ad19c︡︡{"html":"<div>$\\begin{array}{lcl} \\Gamma_{ \\phantom{\\, t } \\, t \\, r }^{ \\, t \\phantom{\\, t } \\phantom{\\, r } } &amp; = &amp; -\\frac{a^{4} m - m r^{4} - {\\left(a^{4} m + a^{2} m r^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{2} r^{4} - 2 \\, m r^{5} + r^{6} + {\\left(a^{6} - 2 \\, a^{4} m r + a^{4} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{4} + 2 \\, {\\left(a^{4} r^{2} - 2 \\, a^{2} m r^{3} + a^{2} r^{4}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\\\ \\Gamma_{ \\phantom{\\, t } \\, t \\, {\\theta} }^{ \\, t \\phantom{\\, t } \\phantom{\\, {\\theta} } } &amp; = &amp; -\\frac{2 \\, a^{2} m r \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\\\ \\Gamma_{ \\phantom{\\, t } \\, r \\, {\\phi} }^{ \\, t \\phantom{\\, r } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\frac{{\\left(a^{3} m r^{2} + 3 \\, a m r^{4} - {\\left(a^{5} m - a^{3} m r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{2} r^{4} - 2 \\, m r^{5} + r^{6} + {\\left(a^{6} - 2 \\, a^{4} m r + a^{4} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{4} + 2 \\, {\\left(a^{4} r^{2} - 2 \\, a^{2} m r^{3} + a^{2} r^{4}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\\\ \\Gamma_{ \\phantom{\\, t } \\, {\\theta} \\, {\\phi} }^{ \\, t \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\frac{2 \\, {\\left(a^{5} m r \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)^{5} - {\\left(a^{5} m r + a^{3} m r^{3}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)^{3}\\right)}}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\ \\Gamma_{ \\phantom{\\, r } \\, t \\, t }^{ \\, r \\phantom{\\, t } \\phantom{\\, t } } &amp; = &amp; \\frac{a^{2} m r^{2} - 2 \\, m^{2} r^{3} + m r^{4} - {\\left(a^{4} m - 2 \\, a^{2} m^{2} r + a^{2} m r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\ \\Gamma_{ \\phantom{\\, r } \\, t \\, {\\phi} }^{ \\, r \\phantom{\\, t } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\frac{{\\left(a^{3} m r^{2} - 2 \\, a m^{2} r^{3} + a m r^{4} - {\\left(a^{5} m - 2 \\, a^{3} m^{2} r + a^{3} m r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\ \\Gamma_{ \\phantom{\\, r } \\, r \\, r }^{ \\, r \\phantom{\\, r } \\phantom{\\, r } } &amp; = &amp; \\frac{a^{2} m - m r^{2} - {\\left(a^{2} m - a^{2} r\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{2} r^{2} - 2 \\, m r^{3} + r^{4} + {\\left(a^{4} - 2 \\, a^{2} m r + a^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\\\ \\Gamma_{ \\phantom{\\, r } \\, r \\, {\\theta} }^{ \\, r \\phantom{\\, r } \\phantom{\\, {\\theta} } } &amp; = &amp; -\\frac{a^{2} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\ \\Gamma_{ \\phantom{\\, r } \\, {\\theta} \\, {\\theta} }^{ \\, r \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } } &amp; = &amp; -\\frac{a^{2} r - 2 \\, m r^{2} + r^{3}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\ \\Gamma_{ \\phantom{\\, r } \\, {\\phi} \\, {\\phi} }^{ \\, r \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{{\\left(a^{4} m r^{2} - 2 \\, a^{2} m^{2} r^{3} + a^{2} m r^{4} - {\\left(a^{6} m - 2 \\, a^{4} m^{2} r + a^{4} m r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}\\right)} \\sin\\left({\\theta}\\right)^{4} - {\\left(a^{2} r^{5} - 2 \\, m r^{6} + r^{7} + {\\left(a^{6} r - 2 \\, a^{4} m r^{2} + a^{4} r^{3}\\right)} \\cos\\left({\\theta}\\right)^{4} + 2 \\, {\\left(a^{4} r^{3} - 2 \\, a^{2} m r^{4} + a^{2} r^{5}\\right)} \\cos\\left({\\theta}\\right)^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, t \\, t }^{ \\, {\\theta} \\phantom{\\, t } \\phantom{\\, t } } &amp; = &amp; -\\frac{2 \\, a^{2} m r \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, t \\, {\\phi} }^{ \\, {\\theta} \\phantom{\\, t } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{2 \\, {\\left(a^{3} m r + a m r^{3}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, r \\, r }^{ \\, {\\theta} \\phantom{\\, r } \\phantom{\\, r } } &amp; = &amp; \\frac{a^{2} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{2} r^{2} - 2 \\, m r^{3} + r^{4} + {\\left(a^{4} - 2 \\, a^{2} m r + a^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, r \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, r } \\phantom{\\, {\\theta} } } &amp; = &amp; \\frac{r}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, {\\theta} \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } } &amp; = &amp; -\\frac{a^{2} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, {\\phi} \\, {\\phi} }^{ \\, {\\theta} \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\frac{{\\left({\\left(a^{6} - 2 \\, a^{4} m r + a^{4} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{5} + 2 \\, {\\left(a^{4} r^{2} - 2 \\, a^{2} m r^{3} + a^{2} r^{4}\\right)} \\cos\\left({\\theta}\\right)^{3} + {\\left(2 \\, a^{4} m r + 4 \\, a^{2} m r^{3} + a^{2} r^{4} + r^{6}\\right)} \\cos\\left({\\theta}\\right)\\right)} \\sin\\left({\\theta}\\right)}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, t \\, r }^{ \\, {\\phi} \\phantom{\\, t } \\phantom{\\, r } } &amp; = &amp; -\\frac{a^{3} m \\cos\\left({\\theta}\\right)^{2} - a m r^{2}}{a^{2} r^{4} - 2 \\, m r^{5} + r^{6} + {\\left(a^{6} - 2 \\, a^{4} m r + a^{4} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{4} + 2 \\, {\\left(a^{4} r^{2} - 2 \\, a^{2} m r^{3} + a^{2} r^{4}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, t \\, {\\theta} }^{ \\, {\\phi} \\phantom{\\, t } \\phantom{\\, {\\theta} } } &amp; = &amp; -\\frac{2 \\, a m r \\cos\\left({\\theta}\\right)}{{\\left(a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}\\right)} \\sin\\left({\\theta}\\right)} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, r \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, r } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\frac{a^{2} m r^{2} + 2 \\, m r^{4} - r^{5} + {\\left(a^{4} m - a^{4} r\\right)} \\cos\\left({\\theta}\\right)^{4} - {\\left(a^{4} m - a^{2} m r^{2} + 2 \\, a^{2} r^{3}\\right)} \\cos\\left({\\theta}\\right)^{2}}{a^{2} r^{4} - 2 \\, m r^{5} + r^{6} + {\\left(a^{6} - 2 \\, a^{4} m r + a^{4} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{4} + 2 \\, {\\left(a^{4} r^{2} - 2 \\, a^{2} m r^{3} + a^{2} r^{4}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, {\\theta} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{a^{4} \\cos\\left({\\theta}\\right)^{5} - 2 \\, {\\left(a^{2} m r - a^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{3} + {\\left(2 \\, a^{2} m r + r^{4}\\right)} \\cos\\left({\\theta}\\right)}{{\\left(a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}\\right)} \\sin\\left({\\theta}\\right)} \\end{array}$</div>","done":false}︡{"done":true}
︠3d3ed0b2-e334-4dcc-a467-bb8085fda309i︠
%html
<h2>Killing vectors</h2>
<p>The default vector frame on the spacetime manifold is the coordinate basis associated with Boyer-Lindquist coordinates:</p>

︡318a0b08-4112-494b-a14b-eee1f1803ab1︡︡{"done":true,"html":"<h2>Killing vectors</h2>\n<p>The default vector frame on the spacetime manifold is the coordinate basis associated with Boyer-Lindquist coordinates:</p>"}
︠9c76fdd7-7852-4064-a081-cf4314abf45es︠
M.default_frame() is BL.frame()
︡5e6b2097-f683-4aa2-804f-a43035ee73a5︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠c02c1d74-5d0c-40e5-9b66-a7df16b9c6fds︠
BL.frame()
︡9c9fd413-e695-4b85-8957-c61c571cb154︡︡{"html":"<div>$\\left(\\mathcal{M}_0 ,\\left(\\frac{\\partial}{\\partial t },\\frac{\\partial}{\\partial r },\\frac{\\partial}{\\partial {\\theta} },\\frac{\\partial}{\\partial {\\phi} }\\right)\\right)$</div>","done":false}︡{"done":true}
︠cbe9be80-2275-4134-aaee-ca15f3e414fbi︠
%html
<p>Let us consider the first vector field of this frame:</p>

︡71b97f66-bf4d-4fa5-9629-c990b8e8a56e︡︡{"done":true,"html":"<p>Let us consider the first vector field of this frame:</p>"}
︠e86a7839-10f9-48b3-84d9-93b52f8a9715s︠
xi = BL.frame()[0] ; xi
︡bf5bd358-c761-426a-aa2b-15b997a4e032︡︡{"html":"<div>$\\frac{\\partial}{\\partial t }$</div>","done":false}︡{"done":true}
︠5a75712c-750b-4a1c-8d7b-e9b981699bees︠
print xi
︡faae2d07-1a09-4e18-94bf-50c6fc828a3b︡︡{"stdout":"vector field 'd/dt' on the open subset 'M0' of the 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠53026cbc-7bb1-47f3-a585-d82c9b34feb3i︠
%html
<p>The 1-form associated to it by metric duality is</p>

︡dc73cf2d-475d-4911-817e-63f26b00321e︡︡{"done":true,"html":"<p>The 1-form associated to it by metric duality is</p>"}
︠115a35a3-78c1-4864-ab64-87d1929c93b1s︠
xi_form = xi.down(g) ; xi_form.display()
︡20683da7-23b6-441c-9c58-b1797134d1b1︡︡{"html":"<div>$\\left( -\\frac{a^{2} \\cos\\left({\\theta}\\right)^{2} - 2 \\, m r + r^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\right) \\mathrm{d} t + \\left( -\\frac{2 \\, a m r \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\right) \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠fef8c0a1-9706-4e40-bdb9-87feb54e1f84i︠
%html
<p>Its covariant derivative is</p>

︡68a19a45-d1e7-4389-9d14-f21c73060648︡︡{"done":true,"html":"<p>Its covariant derivative is</p>"}
︠2bea1208-1b5a-4636-86e4-3490a1e54264s︠
nab_xi = nab(xi_form) ; print nab_xi ; nab_xi.display()
︡132ae69c-593d-4396-be6b-9ea4a6f61825︡︡{"stdout":"tensor field of type (0,2) on the open subset 'M0' of the 4-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\left( \\frac{a^{2} m \\cos\\left({\\theta}\\right)^{2} - m r^{2}}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} t\\otimes \\mathrm{d} r + \\left( \\frac{2 \\, a^{2} m r \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} t\\otimes \\mathrm{d} {\\theta} + \\left( -\\frac{a^{2} m \\cos\\left({\\theta}\\right)^{2} - m r^{2}}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} r\\otimes \\mathrm{d} t + \\left( \\frac{{\\left(a^{3} m \\cos\\left({\\theta}\\right)^{2} - a m r^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} r\\otimes \\mathrm{d} {\\phi} + \\left( -\\frac{2 \\, a^{2} m r \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} {\\theta}\\otimes \\mathrm{d} t + \\left( \\frac{2 \\, {\\left(a^{3} m r + a m r^{3}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\phi} + \\left( -\\frac{{\\left(a^{3} m \\cos\\left({\\theta}\\right)^{2} - a m r^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} r + \\left( -\\frac{2 \\, {\\left(a^{3} m r + a m r^{3}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\theta}$</div>","done":false}︡{"done":true}
︠512d77f5-72bf-4d7e-ac8a-f620de860a86i︠
%html
<p>Let us check that the Killing equation is satisfied:</p>

︡25b41824-fee3-4dd2-bd5b-74414d1f3321︡︡{"done":true,"html":"<p>Let us check that the Killing equation is satisfied:</p>"}
︠a33c44a1-de03-4fa2-817c-b23100f3704cs︠
nab_xi.symmetrize() == 0
︡2ef63419-c54e-46fc-bacd-abcca4f530e3︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠9efdb089-46b3-4b29-9901-cb73fbd176dci︠
%html
<p>Similarly, let us check that $\frac{\partial}{\partial\phi}$ is a Killing vector:</p>

︡2a10136a-29a4-4a49-bafe-5cd0fd484a78︡︡{"done":true,"html":"<p>Similarly, let us check that $\\frac{\\partial}{\\partial\\phi}$ is a Killing vector:</p>"}
︠0f3f9591-5583-467d-b684-aaa455700244s︠
chi = BL.frame()[3] ; chi
︡de453ed1-12ff-48e8-a7dc-defecd35d270︡︡{"html":"<div>$\\frac{\\partial}{\\partial {\\phi} }$</div>","done":false}︡{"done":true}
︠4a663293-f693-44c8-8809-c8efaa331cbds︠
nab(chi.down(g)).symmetrize() == 0
︡59aa50a3-89d8-4148-ac48-19be25a9fbcb︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠b56ed727-09a2-4ace-8aa6-ecca911908e7i︠
%html
<h2>Curvature</h2>

<p>The Ricci tensor associated with $g$:</p>

︡2a7f1119-cad2-4740-b6bc-08450aa5fbed︡︡{"done":true,"html":"<h2>Curvature</h2>\n\n<p>The Ricci tensor associated with $g$:</p>"}
︠f811d760-cfa9-42f8-8ff3-6bce8d9cc455s︠
Ric = g.ricci() ; print Ric
︡ab7d0115-552c-4350-b775-0be56671c5d1︡︡{"stdout":"field of symmetric bilinear forms 'Ric(g)' on the 4-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠5dc12179-8d2d-4c67-9581-10be087dee65i︠
%html
<p>Let us check that Kerr metric is a solution of the vacuum Einstein equation:</p>

︡bff71e14-4846-4b72-a7fb-4299f0eb0b46︡︡{"done":true,"html":"<p>Let us check that Kerr metric is a solution of the vacuum Einstein equation:</p>"}
︠e995132a-3a6d-4bc2-b54c-2560325e4e18s︠
Ric == 0
︡dc0399a2-0a27-41e1-a8b9-5d2ff2b835e9︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠10d786b3-49c8-406d-889b-1f2afd89a0bes︠
Ric.display() # another view of the above property
︡9050ae5f-ea84-4cd0-92ab-5ef74331f285︡︡{"html":"<div>$\\mathrm{Ric}\\left(g\\right) = 0$</div>","done":false}︡{"done":true}
︠4373586b-48c2-4680-bcc0-ac5a464bb210i︠
%html
<p>The Riemann curvature tensor associated with $g$:</p>

︡889825d8-c6f2-4d69-a094-1eae9cd28d0e︡︡{"done":true,"html":"<p>The Riemann curvature tensor associated with $g$:</p>"}
︠6c2eca03-79cd-4050-9d5b-42fad42fe8bcs︠
R = g.riemann() ; print R
︡c5ba5ca8-4af3-4c11-b55e-8a532d8d34ef︡︡{"stdout":"tensor field 'Riem(g)' of type (1,3) on the 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠49d9019a-7ecb-496a-be3b-1ca219460240i︠
%html
<p>Contrary to the Ricci tensor, the Riemann tensor does not vanish; for instance, the component $R^0_{\ \, 123}$ is</p>

︡4fc3c64a-6dad-4b7f-8ca5-170eebca396d︡︡{"done":true,"html":"<p>Contrary to the Ricci tensor, the Riemann tensor does not vanish; for instance, the component $R^0_{\\ \\, 123}$ is</p>"}
︠2ce3c238-673f-4c89-952e-1a9a86cd0174s︠
R[0,1,2,3]
︡ec39ba05-7290-4d92-8b06-65babb6b400a︡︡{"html":"<div>$-\\frac{{\\left(a^{7} m - 2 \\, a^{5} m^{2} r + a^{5} m r^{2}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)^{5} + {\\left(a^{7} m + 2 \\, a^{5} m^{2} r + 6 \\, a^{5} m r^{2} - 6 \\, a^{3} m^{2} r^{3} + 5 \\, a^{3} m r^{4}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)^{3} - 2 \\, {\\left(a^{7} m - a^{5} m r^{2} - 5 \\, a^{3} m r^{4} - 3 \\, a m r^{6}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{2} r^{6} - 2 \\, m r^{7} + r^{8} + {\\left(a^{8} - 2 \\, a^{6} m r + a^{6} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{6} + 3 \\, {\\left(a^{6} r^{2} - 2 \\, a^{4} m r^{3} + a^{4} r^{4}\\right)} \\cos\\left({\\theta}\\right)^{4} + 3 \\, {\\left(a^{4} r^{4} - 2 \\, a^{2} m r^{5} + a^{2} r^{6}\\right)} \\cos\\left({\\theta}\\right)^{2}}$</div>","done":false}︡{"done":true}
︠4d890582-e2a0-4d04-96ab-464b464368b6i︠
%html
<h3>Bianchi identity</h3>

<p>Let us check the Bianchi identity $\nabla_p R^i_{\ \, j kl} + \nabla_k R^i_{\ \, jlp} + \nabla_l R^i_{\ \, jpk} = 0$:</p>

︡f1c773ed-e348-4e8e-be16-9ae6e0b26cfa︡︡{"done":true,"html":"<h3>Bianchi identity</h3>\n\n<p>Let us check the Bianchi identity $\\nabla_p R^i_{\\ \\, j kl} + \\nabla_k R^i_{\\ \\, jlp} + \\nabla_l R^i_{\\ \\, jpk} = 0$:</p>"}
︠fcfd0b67-f36b-45ef-a4bc-5ba59b09fd8dr︠
DR = nab(R) ; print DR  #long (takes a while)
︡9bcf5e5f-c359-43ff-80dd-014f4ab65c2d︡
︠efe05f3b-dff3-4acd-bc38-9256a73a8ae2r︠
for i in M.irange():
    for j in M.irange():
        for k in M.irange():
            for l in M.irange():
                for p in M.irange():
                    print DR[i,j,k,l,p] + DR[i,j,l,p,k] + DR[i,j,p,k,l] ,
︡d8762900-e4a7-4072-aa55-8b9e8419f806︡
︠2166fd04-786a-4bfa-9bb8-ccc4626db9d3i︠
%html
<p>If the last sign in the Bianchi identity is changed to minus, the identity does no longer hold:</p>

︡11d02cad-90e6-421b-828a-a7118bffab4d︡︡{"done":true,"html":"<p>If the last sign in the Bianchi identity is changed to minus, the identity does no longer hold:</p>"}
︠17f16fdf-deb0-45b2-91a9-950ced020210r︠
DR[0,1,2,3,1] + DR[0,1,3,1,2] + DR[0,1,1,2,3] # should be zero (Bianchi identity)
︡99caeddf-11c7-42d8-9286-118ee82e7f47︡
︠7c61d58b-a203-486d-ae57-621118a63b32r︠
DR[0,1,2,3,1] + DR[0,1,3,1,2] - DR[0,1,1,2,3] # note the change of the second + to -
︡36f1e986-943a-4510-bd2e-e29f0d5f1bd9︡
︠bdb5b52c-8c84-4bae-8506-11a778826cdfi︠
%html
<h3>Kretschmann scalar</h3>

<p>The tensor $R^\flat$, of components $R_{ijkl} = g_{ip} R^p_{\ \, jkl}$:</p>

︡795ab2ed-9a0f-4ef7-8114-48e44796d16a︡︡{"done":true,"html":"<h3>Kretschmann scalar</h3>\n\n<p>The tensor $R^\\flat$, of components $R_{ijkl} = g_{ip} R^p_{\\ \\, jkl}$:</p>"}
︠9fcf131e-bced-4fd9-8418-61e38b95a045r︠
dR = R.down(g) ; print dR
︡8e915a24-203e-4b64-af08-7fbbfec2ff70︡
︠96d38e2b-9007-435b-a10f-0fb5a2b38d34i︠
%html
<p>The tensor $R^\sharp$, of components $R^{ijkl} = g^{jp} g^{kq} g^{lr} R^i_{\ \, pqr}$:</p>

︡0836f6a2-d4e6-47a6-a3c1-380fb961b5d9︡︡{"done":true,"html":"<p>The tensor $R^\\sharp$, of components $R^{ijkl} = g^{jp} g^{kq} g^{lr} R^i_{\\ \\, pqr}$:</p>"}
︠5e63700f-5ae9-4f81-9aec-022633746a83r︠
uR = R.up(g) ; print uR
︡4d93db74-483d-4fcf-a247-950fdc023281︡
︠dde45755-7f38-4f24-8a6e-74cdd7937a47i︠
%html
<p>The Kretschmann scalar $K := R^{ijkl} R_{ijkl}$:</p>

︡ae5fb627-9bb7-4b7a-ae72-128d373bd53b︡︡{"done":true,"html":"<p>The Kretschmann scalar $K := R^{ijkl} R_{ijkl}$:</p>"}
︠e249652d-4473-4673-b0dd-637ae750271ar︠
Kr_scalar = uR['^{ijkl}']*dR['_{ijkl}']
Kr_scalar.display()
︡c98ee23d-c741-4f28-96c2-723fee79b20c︡
︠2518595a-29e0-49a4-8366-c4a82ff20f6ai︠
%html
<p>A variant of this expression can be obtained by invoking the factor() method:</p>

︡545e00e2-4956-40e8-8ccd-6ec8bd140dbe︡︡{"done":true,"html":"<p>A variant of this expression can be obtained by invoking the factor() method:</p>"}
︠2ec888ab-0478-4e25-a6bb-18384951166cr︠
Kr = Kr_scalar.function_chart()  # the coordinate function representing the scalar field in the default chart
Kr.factor()
︡04d97291-48a3-4c14-8175-d7569c136984︡
︠925765e2-a074-4361-b16e-394931e3c4a3i︠
%html
<p>As a check, we can compare Kr to the formula given by R. Conn Henry, <a href="http://iopscience.iop.org/0004-637X/535/1/350/fulltext/">Astrophys. J. <strong>535</strong>, 350 (2000)</a>:</p>

︡e137e8e0-c621-4d44-b11e-789f44d2cdbd︡︡{"done":true,"html":"<p>As a check, we can compare Kr to the formula given by R. Conn Henry, <a href=\"http://iopscience.iop.org/0004-637X/535/1/350/fulltext/\">Astrophys. J. <strong>535</strong>, 350 (2000)</a>:</p>"}
︠c1842029-6880-4af4-9551-c32fbdbf690br︠
Kr == 48*m^2*(r^6 - 15*r^4*(a*cos(th))^2 + 15*r^2*(a*cos(th))^4 - (a*cos(th))^6) / (r^2+(a*cos(th))^2)^6
︡e83858cf-a837-46f4-a0c6-cb1b791bd128︡
︠94db5f8b-497a-4bdb-8ae1-ba0d6705b735i︠
%html
<p>The Schwarzschild value of the Kretschmann scalar is recovered by setting $a=0$:</p>

︡0e649ffa-7827-4d27-aeb4-a7a9dcc065d3︡︡{"done":true,"html":"<p>The Schwarzschild value of the Kretschmann scalar is recovered by setting $a=0$:</p>"}
︠3a9e65fb-f036-45e1-95f5-4bae0efbf3car︠
Kr.expr().subs(a=0)
︡c1dde73a-01cf-465e-b762-7f7124501dfd︡
︠9836db6a-17fe-449d-ab15-b1f38f182c19r︠
K1 = Kr.expr().subs(m=1, a=0.9)
︡9ea7292c-aad9-4137-94d0-1d7478b70b42︡
︠4dd207a3-4b2d-4d25-87b3-476675848a0er︠
plot3d(K1, (r,1,3), (th, 0, pi))
︡f38f0a15-a1fe-4788-b14e-6c0bf5bd6dbe︡
︠0a3b9ba6-983d-4c1e-b9b6-e3c5b82bd57er︠

︡4537a3e4-c70f-4edf-907f-9ba5bc89194d︡
︠b280e491-7606-453c-aa6d-340b01963846r︠

︡039fb7ce-a7ee-4091-8e42-618567d460d2︡
︠e1e412fa-b8e0-4f0e-8c56-de65ced72bcer︠

︡c7e9ffa8-db0f-4c8a-83aa-528c885a001d︡










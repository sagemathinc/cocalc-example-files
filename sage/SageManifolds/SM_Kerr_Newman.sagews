︠ae2f7a78-6d73-4b0f-a790-036cbad30e0das︠
%auto
typeset_mode(True, display=False)
︡10c89cd6-4d47-4e5b-9ddb-e8beb38906bd︡︡{"auto":true}︡{"done":true}
︠89c9fff0-b1a6-4565-86b3-77addb409ee3i︠
%html
<h1 style="text-align: center;">Kerr-Newman spacetime</h1>
<p>This worksheet demonstrates a few capabilities of <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.8) in computations regarding Kerr-Newman spacetime, especially the check of Maxwell equations and Einstein equations.</p>
<p>It is released under the GNU General Public License version 3.</p>
<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>
<p><em><span style="color: #008080;">The corresponding worksheet file can be downloaded from</span> <a href="http://sagemanifolds.obspm.fr/examples/sws/SM_Kerr_Newman.sws">here</a>.</em></p>
<p>&nbsp;</p>
<h2>Spacetime manifold</h2>
<p>We start by declaring the Kerr-Newman spacetime as a 4-dimensional diffentiable manifold:</p>

︡de52f10c-b086-45d8-95ab-52de03c58737︡︡{"done":true,"html":"<h1 style=\"text-align: center;\">Kerr-Newman spacetime</h1>\n<p>This worksheet demonstrates a few capabilities of <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.8) in computations regarding Kerr-Newman spacetime, especially the check of Maxwell equations and Einstein equations.</p>\n<p>It is released under the GNU General Public License version 3.</p>\n<p>(c) Eric Gourgoulhon, Michal Bejger (2015)</p>\n<p><em><span style=\"color: #008080;\">The corresponding worksheet file can be downloaded from</span> <a href=\"http://sagemanifolds.obspm.fr/examples/sws/SM_Kerr_Newman.sws\">here</a>.</em></p>\n<p>&nbsp;</p>\n<h2>Spacetime manifold</h2>\n<p>We start by declaring the Kerr-Newman spacetime as a 4-dimensional diffentiable manifold:</p>"}
︠e0602933-a206-4574-a52d-f0d99fcf497as︠
M = Manifold(4, 'M', r'\mathcal{M}')
︡89e63871-8c69-437e-8496-07a20ef647a4︡︡{"done":true}
︠41f5adcc-002f-4b4e-8bd9-d703dece35b2i︠
%html
<p>Let us use the standard <strong>Boyer-Lindquist coordinates</strong> on it, by first introducing the part $\mathcal{M}_0$ covered by these coordinates</p>

︡757d4416-cd39-45fc-86b0-7bd9945c2992︡︡{"done":true,"html":"<p>Let us use the standard <strong>Boyer-Lindquist coordinates</strong> on it, by first introducing the part $\\mathcal{M}_0$ covered by these coordinates</p>"}
︠cb467730-47cc-41de-8244-d904fa77596cs︠
M0 = M.open_subset('M0', r'\mathcal{M}_0')
# BL = Boyer-Lindquist
BL.<t,r,th,ph> = M0.chart(r't r:(0,+oo) th:(0,pi):\theta ph:(0,2*pi):\phi') 
print BL ; BL
︡5b404291-f7e2-421d-b223-d9d4ed637332︡︡{"stdout":"chart (M0, (t, r, th, ph))\n","done":false}︡{"html":"<div>$\\left(\\mathcal{M}_0,(t, r, {\\theta}, {\\phi})\\right)$</div>","done":false}︡{"done":true}
︠8dced339-f34e-44de-a0d3-681f42b90ebfi︠
%html
<h2>Metric tensor</h2>
<p>The 3 parameters $m$, $a$ and $q$ of the Kerr-Newman spacetime are declared as symbolic variables:</p>

︡42688c9a-acce-406f-9431-146685b6b163︡︡{"done":true,"html":"<h2>Metric tensor</h2>\n<p>The 3 parameters $m$, $a$ and $q$ of the Kerr-Newman spacetime are declared as symbolic variables:</p>"}
︠b3490163-5411-4ef4-8f7a-d663ad3bd6f7s︠
var('m a q')
︡622c1bda-c52f-4753-b9c8-f33b65d5d474︡︡{"html":"<div>($m$, $a$, $q$)</div>","done":false}︡{"done":true}
︠052141dc-0639-459c-8172-a06e257e371ci︠
%html
<p>Let us introduce the spacetime metric:</p>

︡16e07352-c567-4ae4-94bd-7286c4025463︡︡{"done":true,"html":"<p>Let us introduce the spacetime metric:</p>"}
︠d0187d6f-9fcc-4d90-b988-67162f64a36fs︠
g = M.lorentz_metric('g')
︡eb777184-45b5-4d65-8773-c5dc271303d1︡︡{"done":true}
︠ccce8e1e-2485-4a94-a9d7-04f3350d61cbi︠
%html
<p>The metric is defined by its components in the coordinate frame associated with Boyer-Lindquist coordinates, which is the current manifold's default frame:</p>

︡f37a09ad-b789-4ee5-991d-f06c9f4008ce︡︡{"done":true,"html":"<p>The metric is defined by its components in the coordinate frame associated with Boyer-Lindquist coordinates, which is the current manifold's default frame:</p>"}
︠07fb0b7d-8c84-4960-98c2-53e96e9d5c1fs︠
rho2 = r^2 + (a*cos(th))^2
Delta = r^2 -2*m*r + a^2 + q^2
g[0,0] = -1 + (2*m*r-q^2)/rho2
g[0,3] = -a*sin(th)^2*(2*m*r-q^2)/rho2
g[1,1], g[2,2] = rho2/Delta, rho2
g[3,3] = (r^2 + a^2 + (2*m*r-q^2)*(a*sin(th))^2/rho2)*sin(th)^2
g.display()
︡9a0d815f-d3d1-40ad-ad5f-cb609877b91f︡︡{"html":"<div>$g = \\left( -\\frac{a^{2} \\cos\\left({\\theta}\\right)^{2} + q^{2} - 2 \\, m r + r^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\right) \\mathrm{d} t\\otimes \\mathrm{d} t + \\left( \\frac{{\\left(a q^{2} - 2 \\, a m r\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\right) \\mathrm{d} t\\otimes \\mathrm{d} {\\phi} + \\left( \\frac{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}}{a^{2} + q^{2} - 2 \\, m r + r^{2}} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + \\left( a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2} \\right) \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + \\left( \\frac{{\\left(a q^{2} - 2 \\, a m r\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} t + \\left( -\\frac{{\\left(a^{2} q^{2} - 2 \\, a^{2} m r\\right)} \\sin\\left({\\theta}\\right)^{4} - {\\left(a^{2} r^{2} + r^{4} + {\\left(a^{4} + a^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠ff6b5edc-fa59-40ae-bd17-9af04a86b0dds︠
g.display_comp()
︡bbd3cec6-616d-4712-ba62-c4358ef8d1f0︡︡{"html":"<div>$\\begin{array}{lcl} g_{ \\, t \\, t }^{ \\phantom{\\, t } \\phantom{\\, t } } &amp; = &amp; -\\frac{a^{2} \\cos\\left({\\theta}\\right)^{2} + q^{2} - 2 \\, m r + r^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\ g_{ \\, t \\, {\\phi} }^{ \\phantom{\\, t } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{{\\left(a q^{2} - 2 \\, a m r\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\ g_{ \\, r \\, r }^{ \\phantom{\\, r } \\phantom{\\, r } } &amp; = &amp; \\frac{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}}{a^{2} + q^{2} - 2 \\, m r + r^{2}} \\\\ g_{ \\, {\\theta} \\, {\\theta} }^{ \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } } &amp; = &amp; a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2} \\\\ g_{ \\, {\\phi} \\, t }^{ \\phantom{\\, {\\phi} } \\phantom{\\, t } } &amp; = &amp; \\frac{{\\left(a q^{2} - 2 \\, a m r\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\ g_{ \\, {\\phi} \\, {\\phi} }^{ \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\frac{{\\left(a^{2} q^{2} - 2 \\, a^{2} m r\\right)} \\sin\\left({\\theta}\\right)^{4} - {\\left(a^{2} r^{2} + r^{4} + {\\left(a^{4} + a^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\end{array}$</div>","done":false}︡{"done":true}
︠08c4cd5a-c7e1-41fb-b048-87ab0fc5c699s︠
g.inverse()[0,0]
︡7192a2ab-cc5a-44b9-8144-0ede24501027︡︡{"html":"<div>$\\frac{a^{4} + 2 \\, a^{2} r^{2} + r^{4} - {\\left(a^{4} + a^{2} q^{2} - 2 \\, a^{2} m r + a^{2} r^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{2 \\, m r^{3} - r^{4} - {\\left(a^{2} + q^{2}\\right)} r^{2} - {\\left(a^{4} + a^{2} q^{2} - 2 \\, a^{2} m r + a^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}}$</div>","done":false}︡{"done":true}
︠f0f3294c-fb64-40f7-9de6-271d2bbf2f65i︠
%html
<p>The lapse function:</p>

︡bc2759ca-bf1c-498d-bd0e-18ce4aaf268a︡︡{"done":true,"html":"<p>The lapse function:</p>"}
︠ba04e291-606d-446e-a2b9-14f5cf17151fs︠
N = 1/sqrt(-(g.inverse()[[0,0]])) ; N
︡e1fef3f6-cd60-4185-b2c9-800d2804b468︡︡{"html":"<div>$\\mbox{scalar field on the open subset 'M0' of the 4-dimensional manifold 'M'}$</div>","done":false}︡{"done":true}
︠ed7466c2-4afc-48a2-8472-fae6dff12b21s︠
N.display()
︡a92eb573-8f09-411d-8d49-80634363e585︡︡{"html":"<div>$\\begin{array}{llcl} &amp; \\mathcal{M}_0 &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(t, r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; \\frac{\\sqrt{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\sqrt{a^{2} + q^{2} - 2 \\, m r + r^{2}}}{\\sqrt{a^{4} + 2 \\, a^{2} r^{2} + r^{4} - {\\left(a^{4} + a^{2} q^{2} - 2 \\, a^{2} m r + a^{2} r^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}} \\end{array}$</div>","done":false}︡{"done":true}
︠3b4c80aa-fd79-4418-9915-78e15e23e2eci︠
%html
<h2>Electromagnetic field tensor</h2>
<p>Let us first introduce the 1-form basis associated with Boyer-Lindquist coordinates:</p>

︡e160d6ab-afe8-4faf-b3d1-a36b1974704f︡︡{"done":true,"html":"<h2>Electromagnetic field tensor</h2>\n<p>Let us first introduce the 1-form basis associated with Boyer-Lindquist coordinates:</p>"}
︠e87dfb4e-3a34-493e-8735-c5708a72b720s︠
dBL = BL.coframe() ; dBL
︡2d0d05fb-1227-4e2d-b393-a450913f7401︡︡{"html":"<div>$\\left(\\mathcal{M}_0 ,\\left(\\mathrm{d} t,\\mathrm{d} r,\\mathrm{d} {\\theta},\\mathrm{d} {\\phi}\\right)\\right)$</div>","done":false}︡{"done":true}
︠9eba5119-7b76-41e3-b02f-610e6e22e810i︠
%html
<p>The electromagnetic field tensor $F$ is formed as [cf. e.g. Eq. (33.5) of Misner, Thorne &amp; Wheeler (1973)]</p>

︡8aac91a0-2d37-4acd-88fe-0417f0975b98︡︡{"done":true,"html":"<p>The electromagnetic field tensor $F$ is formed as [cf. e.g. Eq. (33.5) of Misner, Thorne &amp; Wheeler (1973)]</p>"}
︠1b2fbf85-3eaa-4a90-b016-967301b591c3s︠
F = M.diff_form(2, name='F')
F.set_restriction( q/rho2^2 * (r^2-a^2*cos(th)^2)* dBL[1].wedge( dBL[0] - a*sin(th)^2* dBL[3] ) + \
    2*q/rho2^2 * a*r*cos(th)*sin(th)* dBL[2].wedge( (r^2+a^2)* dBL[3] - a* dBL[0] ) )
F.display()
︡ec4832ae-ff36-4883-9af7-cddd6322450f︡︡{"html":"<div>$F = \\left( \\frac{a^{2} q \\cos\\left({\\theta}\\right)^{2} - q r^{2}}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} t\\wedge \\mathrm{d} r + \\left( \\frac{2 \\, a^{2} q r \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} t\\wedge \\mathrm{d} {\\theta} + \\left( \\frac{{\\left(a^{3} q \\cos\\left({\\theta}\\right)^{2} - a q r^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} r\\wedge \\mathrm{d} {\\phi} + \\left( \\frac{2 \\, {\\left(a^{3} q r + a q r^{3}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} {\\theta}\\wedge \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠09b6281b-f0e5-4f19-a074-882f960ba22cs︠
F.display_comp()
︡a863c616-e876-498c-b17b-8e06bef4a93f︡︡{"html":"<div>$\\begin{array}{lcl} F_{ \\, t \\, r }^{ \\phantom{\\, t } \\phantom{\\, r } } &amp; = &amp; \\frac{a^{2} q \\cos\\left({\\theta}\\right)^{2} - q r^{2}}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\\\ F_{ \\, t \\, {\\theta} }^{ \\phantom{\\, t } \\phantom{\\, {\\theta} } } &amp; = &amp; \\frac{2 \\, a^{2} q r \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\\\ F_{ \\, r \\, t }^{ \\phantom{\\, r } \\phantom{\\, t } } &amp; = &amp; -\\frac{a^{2} q \\cos\\left({\\theta}\\right)^{2} - q r^{2}}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\\\ F_{ \\, r \\, {\\phi} }^{ \\phantom{\\, r } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{{\\left(a^{3} q \\cos\\left({\\theta}\\right)^{2} - a q r^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\\\ F_{ \\, {\\theta} \\, t }^{ \\phantom{\\, {\\theta} } \\phantom{\\, t } } &amp; = &amp; -\\frac{2 \\, a^{2} q r \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\\\ F_{ \\, {\\theta} \\, {\\phi} }^{ \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{2 \\, {\\left(a^{3} q r + a q r^{3}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\\\ F_{ \\, {\\phi} \\, r }^{ \\phantom{\\, {\\phi} } \\phantom{\\, r } } &amp; = &amp; -\\frac{{\\left(a^{3} q \\cos\\left({\\theta}\\right)^{2} - a q r^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\\\ F_{ \\, {\\phi} \\, {\\theta} }^{ \\phantom{\\, {\\phi} } \\phantom{\\, {\\theta} } } &amp; = &amp; -\\frac{2 \\, {\\left(a^{3} q r + a q r^{3}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\end{array}$</div>","done":false}︡{"done":true}
︠e95431aa-9d57-4f8e-85c6-e6e016e4dd6ai︠
%html
<p>The Hodge dual of $F$:</p>

︡85a1a3c0-8d1b-432b-9010-0aca1b5afac7︡︡{"done":true,"html":"<p>The Hodge dual of $F$:</p>"}
︠68828dd8-2c88-4c4f-9db4-8a1f56b35fb2s︠
star_F = F.hodge_star(g) ; star_F.display()
︡f26a37f0-a181-43d7-b4d6-9128a34c3a32︡︡{"html":"<div>$\\star F = \\left( \\frac{2 \\, a q r \\cos\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} t\\wedge \\mathrm{d} r + \\left( -\\frac{{\\left(a^{3} q \\cos\\left({\\theta}\\right)^{2} - a q r^{2}\\right)} \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} t\\wedge \\mathrm{d} {\\theta} + \\left( -\\frac{2 \\, {\\left(a^{4} q r \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)^{4} - {\\left(a^{4} q r + a^{2} q r^{3}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)^{2}\\right)}}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\right) \\mathrm{d} r\\wedge \\mathrm{d} {\\phi} + \\left( \\frac{{\\left(a^{4} q + a^{2} q r^{2}\\right)} \\sin\\left({\\theta}\\right)^{3} - {\\left(a^{4} q - q r^{4}\\right)} \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} {\\theta}\\wedge \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠33f41355-9155-436c-bae7-7e456348d0e8i︠
%html
<h3>Maxwell equations</h3>

<p>Let us check that $F$ obeys the two (source-free) Maxwell equations:</p>

︡473937da-9e9c-4ea9-9b2b-893bfcbe6eb8︡︡{"done":true,"html":"<h3>Maxwell equations</h3>\n\n<p>Let us check that $F$ obeys the two (source-free) Maxwell equations:</p>"}
︠22bb65ca-539e-45fe-a194-5f1a075b6a55s︠
xder(F).display()
︡2ffa4f45-8703-4191-92bc-eb017b4a67d2︡︡{"html":"<div>$\\mathrm{d}F = 0$</div>","done":false}︡{"done":true}
︠9a212cfa-3095-4cda-b966-147af4b1bd9bs︠
xder(star_F).display()
︡eaaa0346-8f19-41ee-ac35-c084d43e2fc2︡︡{"html":"<div>$\\mathrm{d}\\star F = 0$</div>","done":false}︡{"done":true}
︠6856e839-4813-437a-be03-a4cc8e065448i︠
%html
<h2>Levi-Civita Connection</h2>

<p>The Levi-Civita connection $\nabla$ associated with $g$:</p>

︡5c8b038c-8518-41a8-94b4-0bbfa5630f50︡︡{"done":true,"html":"<h2>Levi-Civita Connection</h2>\n\n<p>The Levi-Civita connection $\\nabla$ associated with $g$:</p>"}
︠119c58e0-7dcd-4c2d-ab62-a4e031b5b0fbs︠
nab = g.connection() ; print nab
︡8054c07e-1f67-4900-9821-da4222cb9a1a︡︡{"stdout":"Levi-Civita connection 'nabla_g' associated with the Lorentzian metric 'g' on the 4-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠562863cb-0afe-4c5f-89c4-cea486452c10i︠
%html
<p>Let us verify that the covariant derivative of $g$ with respect to $\nabla$ vanishes identically:</p>

︡5eb73909-c2e5-427f-91ab-f55d20b4bf97︡︡{"done":true,"html":"<p>Let us verify that the covariant derivative of $g$ with respect to $\\nabla$ vanishes identically:</p>"}
︠aba00cf1-944c-44b2-8429-f91243f3f49fs︠
nab(g) == 0
︡9782c0e0-2931-424d-a953-b7952e3eb90b︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠79d01667-271d-498d-a18f-d42b2ecfd6a2s︠
nab(g).display() # another view of the above property
︡8d336fa5-a4bf-47a5-9eb0-292bdbd73591︡{"html":"<div>$\\nabla_{g} g = 0$</div>","done":false}︡{"done":true}︡
︠45729200-e736-4b62-9f53-623c762d2e74i︠
%html
<p><span id="cell_outer_13">The nonzero Christoffel symbols (skipping those that can be deduced by symmetry of the last two indices):</span></p>

︡a3fa11b3-c1dc-4b01-9884-34b85e332831︡︡{"done":true,"html":"<p><span id=\"cell_outer_13\">The nonzero Christoffel symbols (skipping those that can be deduced by symmetry of the last two indices):</span></p>"}
︠1fc49681-33d8-491c-a725-a631f7a742c4s︠
g.christoffel_symbols_display()
︡b4170f31-4648-4632-9570-b7422d052d40︡︡{"html":"<div>$\\begin{array}{lcl} \\Gamma_{ \\phantom{\\, t } \\, t \\, r }^{ \\, t \\phantom{\\, t } \\phantom{\\, r } } &amp; = &amp; \\frac{a^{4} m + a^{2} q^{2} r + q^{2} r^{3} - m r^{4} - {\\left(a^{4} m + a^{2} m r^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{2 \\, m r^{5} - r^{6} - {\\left(a^{2} + q^{2}\\right)} r^{4} - {\\left(a^{6} + a^{4} q^{2} - 2 \\, a^{4} m r + a^{4} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{4} + 2 \\, {\\left(2 \\, a^{2} m r^{3} - a^{2} r^{4} - {\\left(a^{4} + a^{2} q^{2}\\right)} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\\\ \\Gamma_{ \\phantom{\\, t } \\, t \\, {\\theta} }^{ \\, t \\phantom{\\, t } \\phantom{\\, {\\theta} } } &amp; = &amp; \\frac{{\\left(a^{2} q^{2} - 2 \\, a^{2} m r\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\\\ \\Gamma_{ \\phantom{\\, t } \\, r \\, {\\phi} }^{ \\, t \\phantom{\\, r } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{{\\left(a^{5} m + a^{3} q^{2} r - a^{3} m r^{2}\\right)} \\sin\\left({\\theta}\\right)^{4} - {\\left(a^{5} m + 2 \\, a^{3} q^{2} r - 2 \\, a^{3} m r^{2} + 2 \\, a q^{2} r^{3} - 3 \\, a m r^{4}\\right)} \\sin\\left({\\theta}\\right)^{2}}{2 \\, m r^{5} - r^{6} - {\\left(a^{2} + q^{2}\\right)} r^{4} - {\\left(a^{6} + a^{4} q^{2} - 2 \\, a^{4} m r + a^{4} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{4} + 2 \\, {\\left(2 \\, a^{2} m r^{3} - a^{2} r^{4} - {\\left(a^{4} + a^{2} q^{2}\\right)} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\\\ \\Gamma_{ \\phantom{\\, t } \\, {\\theta} \\, {\\phi} }^{ \\, t \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{{\\left(a^{5} q^{2} - 2 \\, a^{5} m r\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)^{5} - {\\left(a^{5} q^{2} - 2 \\, a^{5} m r + a^{3} q^{2} r^{2} - 2 \\, a^{3} m r^{3}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)^{3}}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\ \\Gamma_{ \\phantom{\\, r } \\, t \\, t }^{ \\, r \\phantom{\\, t } \\phantom{\\, t } } &amp; = &amp; \\frac{m r^{4} - {\\left(2 \\, m^{2} + q^{2}\\right)} r^{3} + {\\left(a^{2} m + 3 \\, m q^{2}\\right)} r^{2} - {\\left(a^{4} m + a^{2} m q^{2} - 2 \\, a^{2} m^{2} r + a^{2} m r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2} - {\\left(a^{2} q^{2} + q^{4}\\right)} r}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\ \\Gamma_{ \\phantom{\\, r } \\, t \\, {\\phi} }^{ \\, r \\phantom{\\, t } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\frac{{\\left(a m r^{4} - {\\left(2 \\, a m^{2} + a q^{2}\\right)} r^{3} + {\\left(a^{3} m + 3 \\, a m q^{2}\\right)} r^{2} - {\\left(a^{5} m + a^{3} m q^{2} - 2 \\, a^{3} m^{2} r + a^{3} m r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2} - {\\left(a^{3} q^{2} + a q^{4}\\right)} r\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\ \\Gamma_{ \\phantom{\\, r } \\, r \\, r }^{ \\, r \\phantom{\\, r } \\phantom{\\, r } } &amp; = &amp; -\\frac{a^{2} m + q^{2} r - m r^{2} - {\\left(a^{2} m - a^{2} r\\right)} \\sin\\left({\\theta}\\right)^{2}}{2 \\, m r^{3} - r^{4} - {\\left(a^{2} + q^{2}\\right)} r^{2} - {\\left(a^{4} + a^{2} q^{2} - 2 \\, a^{2} m r + a^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\\\ \\Gamma_{ \\phantom{\\, r } \\, r \\, {\\theta} }^{ \\, r \\phantom{\\, r } \\phantom{\\, {\\theta} } } &amp; = &amp; -\\frac{a^{2} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\ \\Gamma_{ \\phantom{\\, r } \\, {\\theta} \\, {\\theta} }^{ \\, r \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } } &amp; = &amp; \\frac{2 \\, m r^{2} - r^{3} - {\\left(a^{2} + q^{2}\\right)} r}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\ \\Gamma_{ \\phantom{\\, r } \\, {\\phi} \\, {\\phi} }^{ \\, r \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{{\\left(a^{2} m r^{4} - {\\left(2 \\, a^{2} m^{2} + a^{2} q^{2}\\right)} r^{3} + {\\left(a^{4} m + 3 \\, a^{2} m q^{2}\\right)} r^{2} - {\\left(a^{6} m + a^{4} m q^{2} - 2 \\, a^{4} m^{2} r + a^{4} m r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2} - {\\left(a^{4} q^{2} + a^{2} q^{4}\\right)} r\\right)} \\sin\\left({\\theta}\\right)^{4} + {\\left(2 \\, m r^{6} - r^{7} - {\\left(a^{2} + q^{2}\\right)} r^{5} + {\\left(2 \\, a^{4} m r^{2} - a^{4} r^{3} - {\\left(a^{6} + a^{4} q^{2}\\right)} r\\right)} \\cos\\left({\\theta}\\right)^{4} + 2 \\, {\\left(2 \\, a^{2} m r^{4} - a^{2} r^{5} - {\\left(a^{4} + a^{2} q^{2}\\right)} r^{3}\\right)} \\cos\\left({\\theta}\\right)^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, t \\, t }^{ \\, {\\theta} \\phantom{\\, t } \\phantom{\\, t } } &amp; = &amp; \\frac{{\\left(a^{2} q^{2} - 2 \\, a^{2} m r\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, t \\, {\\phi} }^{ \\, {\\theta} \\phantom{\\, t } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\frac{{\\left(a^{3} q^{2} - 2 \\, a^{3} m r + a q^{2} r^{2} - 2 \\, a m r^{3}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, r \\, r }^{ \\, {\\theta} \\phantom{\\, r } \\phantom{\\, r } } &amp; = &amp; -\\frac{a^{2} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{2 \\, m r^{3} - r^{4} - {\\left(a^{2} + q^{2}\\right)} r^{2} - {\\left(a^{4} + a^{2} q^{2} - 2 \\, a^{2} m r + a^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, r \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, r } \\phantom{\\, {\\theta} } } &amp; = &amp; \\frac{r}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, {\\theta} \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } } &amp; = &amp; -\\frac{a^{2} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, {\\phi} \\, {\\phi} }^{ \\, {\\theta} \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\frac{{\\left({\\left(a^{6} + a^{4} q^{2} - 2 \\, a^{4} m r + a^{4} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{5} - 2 \\, {\\left(2 \\, a^{2} m r^{3} - a^{2} r^{4} - {\\left(a^{4} + a^{2} q^{2}\\right)} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{3} - {\\left(a^{4} q^{2} - 2 \\, a^{4} m r + 2 \\, a^{2} q^{2} r^{2} - 4 \\, a^{2} m r^{3} - a^{2} r^{4} - r^{6}\\right)} \\cos\\left({\\theta}\\right)\\right)} \\sin\\left({\\theta}\\right)}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, t \\, r }^{ \\, {\\phi} \\phantom{\\, t } \\phantom{\\, r } } &amp; = &amp; \\frac{a^{3} m \\cos\\left({\\theta}\\right)^{2} + a q^{2} r - a m r^{2}}{2 \\, m r^{5} - r^{6} - {\\left(a^{2} + q^{2}\\right)} r^{4} - {\\left(a^{6} + a^{4} q^{2} - 2 \\, a^{4} m r + a^{4} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{4} + 2 \\, {\\left(2 \\, a^{2} m r^{3} - a^{2} r^{4} - {\\left(a^{4} + a^{2} q^{2}\\right)} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, t \\, {\\theta} }^{ \\, {\\phi} \\phantom{\\, t } \\phantom{\\, {\\theta} } } &amp; = &amp; \\frac{{\\left(a q^{2} - 2 \\, a m r\\right)} \\cos\\left({\\theta}\\right)}{{\\left(a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}\\right)} \\sin\\left({\\theta}\\right)} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, r \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, r } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\frac{a^{2} q^{2} r - a^{2} m r^{2} + q^{2} r^{3} - 2 \\, m r^{4} + r^{5} - {\\left(a^{4} m - a^{4} r\\right)} \\cos\\left({\\theta}\\right)^{4} + {\\left(a^{4} m - a^{2} m r^{2} + 2 \\, a^{2} r^{3}\\right)} \\cos\\left({\\theta}\\right)^{2}}{2 \\, m r^{5} - r^{6} - {\\left(a^{2} + q^{2}\\right)} r^{4} - {\\left(a^{6} + a^{4} q^{2} - 2 \\, a^{4} m r + a^{4} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{4} + 2 \\, {\\left(2 \\, a^{2} m r^{3} - a^{2} r^{4} - {\\left(a^{4} + a^{2} q^{2}\\right)} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, {\\theta} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{a^{4} \\cos\\left({\\theta}\\right)^{5} + {\\left(a^{2} q^{2} - 2 \\, a^{2} m r + 2 \\, a^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{3} - {\\left(a^{2} q^{2} - 2 \\, a^{2} m r - r^{4}\\right)} \\cos\\left({\\theta}\\right)}{{\\left(a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}\\right)} \\sin\\left({\\theta}\\right)} \\end{array}$</div>","done":false}︡{"done":true}
︠bbe07533-935c-4357-abeb-5b092db9c9d4i︠
%html
<h2>Killing vectors</h2>
<p><span id="cell_outer_32">The default vector frame on the spacetime manifold is the coordinate basis associated with Boyer-Lindquist coordinates:</span></p>

︡96efd957-c2d6-4cca-af35-5a44ad4e4c5a︡︡{"done":true,"html":"<h2>Killing vectors</h2>\n<p><span id=\"cell_outer_32\">The default vector frame on the spacetime manifold is the coordinate basis associated with Boyer-Lindquist coordinates:</span></p>"}
︠16f8e79e-666d-48a8-b039-dd216ef2257fs︠
M.default_frame() is BL.frame()
︡248583df-e392-47f8-b1bf-55bebf75feae︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠2cd83306-34a0-4746-b845-caf3a1c5818as︠
BL.frame()
︡d08967e9-fb60-4217-b660-45ceffb21554︡︡{"html":"<div>$\\left(\\mathcal{M}_0 ,\\left(\\frac{\\partial}{\\partial t },\\frac{\\partial}{\\partial r },\\frac{\\partial}{\\partial {\\theta} },\\frac{\\partial}{\\partial {\\phi} }\\right)\\right)$</div>","done":false}︡{"done":true}
︠ea0a221e-b735-4281-888b-1ae8ee7a76a3i︠
%html
<p>Let us consider the first vector field of this frame:</p>

︡0beac5cd-7041-4feb-a718-00b62ba8d27b︡︡{"done":true,"html":"<p>Let us consider the first vector field of this frame:</p>"}
︠bd71baf4-aa72-416b-906d-cdaf3ee9e6d9s︠
xi = BL.frame()[0] ; xi
︡f1d5bf8c-0063-4bf0-8691-61dc61fcf001︡︡{"html":"<div>$\\frac{\\partial}{\\partial t }$</div>","done":false}︡{"done":true}
︠2cea4223-de96-4f70-a22b-9388584487f7s︠
print xi
︡c7420510-cfad-4909-8783-b4514605866c︡︡{"stdout":"vector field 'd/dt' on the open subset 'M0' of the 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠85386afe-e567-4f44-b57c-727500af95fdi︠
%html
<p><span id="cell_outer_35">The 1-form associated to it by metric duality is</span></p>

︡87281901-cfcc-4512-be1f-9640cd3ca2fe︡︡{"done":true,"html":"<p><span id=\"cell_outer_35\">The 1-form associated to it by metric duality is</span></p>"}
︠920eef86-9315-47ad-82ea-d16bd9f71279s︠
xi_form = xi.down(g) ; xi_form.display()
︡8d12d56d-3aba-458e-bc9b-462c765b31d7︡︡{"html":"<div>$\\left( -\\frac{a^{2} \\cos\\left({\\theta}\\right)^{2} + q^{2} - 2 \\, m r + r^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\right) \\mathrm{d} t + \\left( \\frac{{\\left(a q^{2} - 2 \\, a m r\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\right) \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠a85279dc-57e3-4abc-b259-7428b52c7d84i︠
%html
<p><span id="cell_outer_36">Its covariant derivative is</span></p>

︡9688def1-1133-4dcb-96c6-8ea7d36cc07d︡︡{"done":true,"html":"<p><span id=\"cell_outer_36\">Its covariant derivative is</span></p>"}
︠f592f8cf-b31f-4346-9ef5-85542d7b6bebs︠
nab_xi = nab(xi_form) ; print nab_xi ; nab_xi.display()
︡742cddf7-0dca-40dd-9271-10b7719df041︡︡{"stdout":"tensor field of type (0,2) on the open subset 'M0' of the 4-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"html":"<div>$\\left( \\frac{m r^{4} - {\\left(2 \\, m^{2} + q^{2}\\right)} r^{3} + {\\left(a^{2} m + 3 \\, m q^{2}\\right)} r^{2} - {\\left(a^{4} m + a^{2} m q^{2} - 2 \\, a^{2} m^{2} r + a^{2} m r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2} - {\\left(a^{2} q^{2} + q^{4}\\right)} r}{2 \\, m r^{5} - r^{6} - {\\left(a^{2} + q^{2}\\right)} r^{4} - {\\left(a^{6} + a^{4} q^{2} - 2 \\, a^{4} m r + a^{4} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{4} + 2 \\, {\\left(2 \\, a^{2} m r^{3} - a^{2} r^{4} - {\\left(a^{4} + a^{2} q^{2}\\right)} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\right) \\mathrm{d} t\\otimes \\mathrm{d} r + \\left( -\\frac{{\\left(a^{2} q^{2} - 2 \\, a^{2} m r\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} t\\otimes \\mathrm{d} {\\theta} + \\left( -\\frac{m r^{4} - {\\left(2 \\, m^{2} + q^{2}\\right)} r^{3} + {\\left(a^{2} m + 3 \\, m q^{2}\\right)} r^{2} - {\\left(a^{4} m + a^{2} m q^{2} - 2 \\, a^{2} m^{2} r + a^{2} m r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2} - {\\left(a^{2} q^{2} + q^{4}\\right)} r}{2 \\, m r^{5} - r^{6} - {\\left(a^{2} + q^{2}\\right)} r^{4} - {\\left(a^{6} + a^{4} q^{2} - 2 \\, a^{4} m r + a^{4} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{4} + 2 \\, {\\left(2 \\, a^{2} m r^{3} - a^{2} r^{4} - {\\left(a^{4} + a^{2} q^{2}\\right)} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\right) \\mathrm{d} r\\otimes \\mathrm{d} t + \\left( -\\frac{a^{3} m \\cos\\left({\\theta}\\right)^{4} - a q^{2} r + a m r^{2} - {\\left(a^{3} m - a q^{2} r + a m r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} r\\otimes \\mathrm{d} {\\phi} + \\left( \\frac{{\\left(a^{2} q^{2} - 2 \\, a^{2} m r\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} {\\theta}\\otimes \\mathrm{d} t + \\left( -\\frac{{\\left(a^{3} q^{2} - 2 \\, a^{3} m r + a q^{2} r^{2} - 2 \\, a m r^{3}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\phi} + \\left( \\frac{a^{3} m \\sin\\left({\\theta}\\right)^{4} - {\\left(a^{3} m + a q^{2} r - a m r^{2}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} r + \\left( \\frac{{\\left(a^{3} q^{2} - 2 \\, a^{3} m r + a q^{2} r^{2} - 2 \\, a m r^{3}\\right)} \\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right)}{a^{4} \\cos\\left({\\theta}\\right)^{4} + 2 \\, a^{2} r^{2} \\cos\\left({\\theta}\\right)^{2} + r^{4}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\theta}$</div>","done":false}︡{"done":true}
︠ea625136-7c3f-447e-a9b9-bde9c6468edai︠
%html
<p><span id="cell_outer_37">Let us check that the vector field $\xi=\frac{\partial}{\partial t}$ obeys Killing equation:</span></p>

︡bf7c5e61-33a5-4598-aaff-0cb4da534782︡︡{"done":true,"html":"<p><span id=\"cell_outer_37\">Let us check that the vector field $\\xi=\\frac{\\partial}{\\partial t}$ obeys Killing equation:</span></p>"}
︠16abbc2d-f60b-4651-a0f7-f298ed899889s︠
nab_xi.symmetrize() == 0
︡418a7294-8042-42f8-95eb-0fe847120eaa︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠96795b8b-1732-4da0-bc81-4465b2452527i︠
%html
<p><span id="cell_outer_38">Similarly, let us check that</span> $\chi := \frac{\partial}{\partial\phi}$ is a Killing vector:</p>

︡975cd92f-56b9-4692-bdd7-26b48b8f8427︡︡{"done":true,"html":"<p><span id=\"cell_outer_38\">Similarly, let us check that</span> $\\chi := \\frac{\\partial}{\\partial\\phi}$ is a Killing vector:</p>"}
︠a0972597-be36-4f96-a61a-5ee974d43081s︠
chi = BL.frame()[3] ; chi
︡46337f5f-954b-4a30-8557-fccd7f59c397︡︡{"html":"<div>$\\frac{\\partial}{\\partial {\\phi} }$</div>","done":false}︡{"done":true}
︠480d24e7-6a8b-4d42-9947-495ccee8b837s︠
nab(chi.down(g)).symmetrize() == 0
︡184838c3-f5b5-4528-bcd9-cb0d13ece052︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠31ab046a-fdf2-46b2-b2e8-20f63a147b19i︠
%html
<p>Another way to check that $\xi$ and $\chi$ are Killing vectors is the vanishing of the Lie derivative of the metric tensor along them:</p>

︡1f71aab9-f462-4a75-a460-19bdbe6aafe8︡︡{"done":true,"html":"<p>Another way to check that $\\xi$ and $\\chi$ are Killing vectors is the vanishing of the Lie derivative of the metric tensor along them:</p>"}
︠6eea8336-9842-439d-a7a2-dfc5617c5281s︠
g.lie_der(xi) == 0
︡7746ee30-c916-41b6-933b-9e999b995421︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠43e18cae-e839-4025-b6e8-ed26954d4ddas︠
g.lie_der(chi) == 0
︡bd43b016-c055-4600-a8e7-c182b118f2ca︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠19a20601-6c12-4367-968c-999cc81cd807i︠
%html
<h2>Curvature</h2>

<p>The Ricci tensor associated with $g$:</p>

︡487286be-8b7d-43f1-8c5c-e89b59785e0e︡︡{"done":true,"html":"<h2>Curvature</h2>\n\n<p>The Ricci tensor associated with $g$:</p>"}
︠b0aab5cb-68d9-466c-9e7d-a4e8305d904es︠
Ric = g.ricci() ; print Ric
︡8e1966bd-ea49-40df-bcd9-7d9bfffe3a86︡︡{"stdout":"field of symmetric bilinear forms 'Ric(g)' on the 4-dimensional manifold 'M'","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠232937a6-d8b5-476e-a8fa-57a55122b8dds︠
Ric.display()
︡b44b904c-3aba-48fc-a26a-e870bc8f0c0f︡︡{"html":"<div>$\\mathrm{Ric}\\left(g\\right) = \\left( -\\frac{a^{2} q^{2} \\cos\\left({\\theta}\\right)^{2} - 2 \\, a^{2} q^{2} - q^{4} + 2 \\, m q^{2} r - q^{2} r^{2}}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\right) \\mathrm{d} t\\otimes \\mathrm{d} t + \\left( -\\frac{2 \\, a^{3} q^{2} + a q^{4} - 2 \\, a m q^{2} r + 2 \\, a q^{2} r^{2} - {\\left(2 \\, a^{3} q^{2} + a q^{4} - 2 \\, a m q^{2} r + 2 \\, a q^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\right) \\mathrm{d} t\\otimes \\mathrm{d} {\\phi} + \\left( \\frac{q^{2}}{2 \\, m r^{3} - r^{4} - {\\left(a^{2} + q^{2}\\right)} r^{2} - {\\left(a^{4} + a^{2} q^{2} - 2 \\, a^{2} m r + a^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + \\left( \\frac{q^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} \\right) \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + \\left( -\\frac{2 \\, a^{3} q^{2} + a q^{4} - 2 \\, a m q^{2} r + 2 \\, a q^{2} r^{2} - {\\left(2 \\, a^{3} q^{2} + a q^{4} - 2 \\, a m q^{2} r + 2 \\, a q^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} t + \\left( -\\frac{{\\left(a^{6} q^{2} + a^{4} q^{4} - 2 \\, a^{4} m q^{2} r + a^{4} q^{2} r^{2}\\right)} \\sin\\left({\\theta}\\right)^{6} - {\\left(a^{4} q^{4} - 2 \\, a^{4} m q^{2} r + a^{2} q^{4} r^{2} - 2 \\, a^{2} m q^{2} r^{3}\\right)} \\sin\\left({\\theta}\\right)^{4} - {\\left(a^{6} q^{2} + 3 \\, a^{4} q^{2} r^{2} + 3 \\, a^{2} q^{2} r^{4} + q^{2} r^{6}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{8} \\cos\\left({\\theta}\\right)^{8} + 4 \\, a^{6} r^{2} \\cos\\left({\\theta}\\right)^{6} + 6 \\, a^{4} r^{4} \\cos\\left({\\theta}\\right)^{4} + 4 \\, a^{2} r^{6} \\cos\\left({\\theta}\\right)^{2} + r^{8}} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠03aad13b-ee57-420e-a727-fff0cc060d84s︠
Ric[:]
︡9251851e-e0c2-4e4b-b5d1-d3bd7d354b3e︡︡{"html":"<div>$\\left(\\begin{array}{rrrr}\n-\\frac{a^{2} q^{2} \\cos\\left({\\theta}\\right)^{2} - 2 \\, a^{2} q^{2} - q^{4} + 2 \\, m q^{2} r - q^{2} r^{2}}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} &amp; 0 &amp; 0 &amp; -\\frac{2 \\, a^{3} q^{2} + a q^{4} - 2 \\, a m q^{2} r + 2 \\, a q^{2} r^{2} - {\\left(2 \\, a^{3} q^{2} + a q^{4} - 2 \\, a m q^{2} r + 2 \\, a q^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} \\\\\n0 &amp; \\frac{q^{2}}{2 \\, m r^{3} - r^{4} - {\\left(a^{2} + q^{2}\\right)} r^{2} - {\\left(a^{4} + a^{2} q^{2} - 2 \\, a^{2} m r + a^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}} &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; \\frac{q^{2}}{a^{2} \\cos\\left({\\theta}\\right)^{2} + r^{2}} &amp; 0 \\\\\n-\\frac{2 \\, a^{3} q^{2} + a q^{4} - 2 \\, a m q^{2} r + 2 \\, a q^{2} r^{2} - {\\left(2 \\, a^{3} q^{2} + a q^{4} - 2 \\, a m q^{2} r + 2 \\, a q^{2} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{2}}{a^{6} \\cos\\left({\\theta}\\right)^{6} + 3 \\, a^{4} r^{2} \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} r^{4} \\cos\\left({\\theta}\\right)^{2} + r^{6}} &amp; 0 &amp; 0 &amp; -\\frac{{\\left(a^{6} q^{2} + a^{4} q^{4} - 2 \\, a^{4} m q^{2} r + a^{4} q^{2} r^{2}\\right)} \\sin\\left({\\theta}\\right)^{6} - {\\left(a^{4} q^{4} - 2 \\, a^{4} m q^{2} r + a^{2} q^{4} r^{2} - 2 \\, a^{2} m q^{2} r^{3}\\right)} \\sin\\left({\\theta}\\right)^{4} - {\\left(a^{6} q^{2} + 3 \\, a^{4} q^{2} r^{2} + 3 \\, a^{2} q^{2} r^{4} + q^{2} r^{6}\\right)} \\sin\\left({\\theta}\\right)^{2}}{a^{8} \\cos\\left({\\theta}\\right)^{8} + 4 \\, a^{6} r^{2} \\cos\\left({\\theta}\\right)^{6} + 6 \\, a^{4} r^{4} \\cos\\left({\\theta}\\right)^{4} + 4 \\, a^{2} r^{6} \\cos\\left({\\theta}\\right)^{2} + r^{8}}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠c9662367-26eb-44db-81fe-0f06c6b06d2ci︠
%html
<p>Let us check that in the Kerr case, i.e. when $q=0$, the Ricci tensor is zero:</p>

︡fe73b667-d2d5-4d33-be5d-92f2f8fd9dfd︡︡{"done":true,"html":"<p>Let us check that in the Kerr case, i.e. when $q=0$, the Ricci tensor is zero:</p>"}
︠7b2859e8-3917-42f3-bf4a-3c3477c57203s︠
Ric[:].subs(q=0)
︡7659dcf7-295c-4b80-9df7-f52c3faa39a4︡︡{"html":"<div>$\\left(\\begin{array}{rrrr}\n0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠f347b11c-d3dc-4b87-a4cb-ec915c42fd15i︠
%html
<p>The Riemann curvature tensor associated with $g$:</p>

︡08150f1a-01a7-4ddc-a5f9-446cf5fcefe3︡︡{"done":true,"html":"<p>The Riemann curvature tensor associated with $g$:</p>"}
︠d172394b-3d0e-4c55-a7b4-a5a9e7fe02dfs︠
R = g.riemann() ; print R
︡0b613fa2-905b-4f66-87d1-e1990fba7a7f︡︡{"stdout":"tensor field 'Riem(g)' of type (1,3) on the 4-dimensional manifold 'M'\n","done":false}︡{"done":true}
︠2b47b31c-521f-4564-8f58-c892a38a867ai︠
%html
<p>The component $R^0_{\ \, 101}$ of the Riemann tensor is</p>

︡528165f3-5e94-4e91-b070-069fa66da763︡︡{"done":true,"html":"<p>The component $R^0_{\\ \\, 101}$ of the Riemann tensor is</p>"}
︠7be6631c-9791-4e9e-8a3c-e6cd635da29as︠
R[0,1,0,1]
︡b80865f9-63fc-4d37-b085-704653b1c29a︡︡{"html":"<div>$\\frac{4 \\, a^{2} q^{2} r^{2} - 3 \\, a^{2} m r^{3} + 3 \\, q^{2} r^{4} - 2 \\, m r^{5} + {\\left(a^{4} q^{2} - 3 \\, a^{4} m r\\right)} \\cos\\left({\\theta}\\right)^{4} - {\\left(2 \\, a^{4} q^{2} - 9 \\, a^{4} m r + 2 \\, a^{2} q^{2} r^{2} - 7 \\, a^{2} m r^{3}\\right)} \\cos\\left({\\theta}\\right)^{2}}{2 \\, m r^{7} - r^{8} - {\\left(a^{2} + q^{2}\\right)} r^{6} - {\\left(a^{8} + a^{6} q^{2} - 2 \\, a^{6} m r + a^{6} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{6} + 3 \\, {\\left(2 \\, a^{4} m r^{3} - a^{4} r^{4} - {\\left(a^{6} + a^{4} q^{2}\\right)} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{4} + 3 \\, {\\left(2 \\, a^{2} m r^{5} - a^{2} r^{6} - {\\left(a^{4} + a^{2} q^{2}\\right)} r^{4}\\right)} \\cos\\left({\\theta}\\right)^{2}}$</div>","done":false}︡{"done":true}
︠1b4fc5b8-6acf-4b1b-85f1-233e16b61a0di︠
%html
<p>The expression in the uncharged limit (Kerr spacetime) is</p>

︡17e162b9-ab85-46cf-bf06-5c1c717802a7︡︡{"done":true,"html":"<p>The expression in the uncharged limit (Kerr spacetime) is</p>"}
︠745c41c0-5f47-428b-b9d3-b32ebdf118a0s︠
R[0,1,0,1].expr().subs(q=0).simplify_rational()
︡4bd53208-d2dc-4f9b-9eed-0fa57f8fbab9︡︡{"html":"<div>$\\frac{3 \\, a^{4} m r \\cos\\left({\\theta}\\right)^{4} + 3 \\, a^{2} m r^{3} + 2 \\, m r^{5} - {\\left(9 \\, a^{4} m r + 7 \\, a^{2} m r^{3}\\right)} \\cos\\left({\\theta}\\right)^{2}}{a^{2} r^{6} - 2 \\, m r^{7} + r^{8} + {\\left(a^{8} - 2 \\, a^{6} m r + a^{6} r^{2}\\right)} \\cos\\left({\\theta}\\right)^{6} + 3 \\, {\\left(a^{6} r^{2} - 2 \\, a^{4} m r^{3} + a^{4} r^{4}\\right)} \\cos\\left({\\theta}\\right)^{4} + 3 \\, {\\left(a^{4} r^{4} - 2 \\, a^{2} m r^{5} + a^{2} r^{6}\\right)} \\cos\\left({\\theta}\\right)^{2}}$</div>","done":false}︡{"done":true}
︠45a28abb-bf74-4948-ac48-0e580fe9b762i︠
%html
<p>while in the non-rotating limit (Reissner-Nordstr&ouml;m spacetime), it is</p>

︡11e2ad9b-6939-4b40-9a94-0459b4b90e85︡︡{"done":true,"html":"<p>while in the non-rotating limit (Reissner-Nordstr&ouml;m spacetime), it is</p>"}
︠2541ebab-2c5c-4d6d-ab66-67e2ed9025ees︠
R[0,1,0,1].expr().subs(a=0).simplify_rational()
︡a7cb7941-fa6e-4819-b35a-e20ced8557c8︡︡{"html":"<div>$-\\frac{3 \\, q^{2} - 2 \\, m r}{q^{2} r^{2} - 2 \\, m r^{3} + r^{4}}$</div>","done":false}︡{"done":true}
︠3e9bbc8a-0493-44a2-8406-2989b8562764i︠
%html
<p>In the Schwarzschild limit, it reduces to</p>

︡0468e93b-02eb-459c-bd23-cd5b69bb7de2︡︡{"done":true,"html":"<p>In the Schwarzschild limit, it reduces to</p>"}
︠71932a1b-48be-40cd-a6c8-e2aa5ce2af26s︠
R[0,1,0,1].expr().subs(a=0, q=0).simplify_rational()
︡62e1f7dc-5c4c-4336-a47c-a6f554ae0566︡︡{"html":"<div>$-\\frac{2 \\, m}{2 \\, m r^{2} - r^{3}}$</div>","done":false}︡{"done":true}
︠a695777f-8d3c-44b7-98d8-0dc22ba57cb1i︠
%html
<p>Obviously, it vanishes in the flat space limit:</p>

︡619335f8-448d-4fef-9c2c-6de333002b6c︡︡{"done":true,"html":"<p>Obviously, it vanishes in the flat space limit:</p>"}
︠9f597486-c14c-4dbd-81e8-070f5131ba26s︠
R[0,1,0,1].expr().subs(m=0, a=0, q=0)
︡7a33bf3a-4023-46e3-8d82-b25da37f53f7︡︡{"html":"<div>$0$</div>","done":false}︡{"done":true}
︠b08ef8fb-ce14-49b8-bccc-1d2d9c58b35bi︠
%html
<h3>Bianchi identity</h3>

<p>Let us check the Bianchi identity $\nabla_p R^i_{\ \, j kl} + \nabla_k R^i_{\ \, jlp} + \nabla_l R^i_{\ \, jpk} = 0$:</p>

︡675ede47-4c69-4089-be3e-16b7b4aa6f88︡︡{"done":true,"html":"<h3>Bianchi identity</h3>\n\n<p>Let us check the Bianchi identity $\\nabla_p R^i_{\\ \\, j kl} + \\nabla_k R^i_{\\ \\, jlp} + \\nabla_l R^i_{\\ \\, jpk} = 0$:</p>"}
︠e4f9af2d-5851-4fca-b69c-41f6d343f9f4r︠
DR = nab(R) ; print DR  #long (takes a while)
︡3fe25b04-a451-4dec-8262-df4c53f2996d︡
︠bf64b710-9d1c-4215-b7fc-12c584cb389cr︠
for i in M.irange():
    for j in M.irange():
        for k in M.irange():
            for l in M.irange():
                for p in M.irange():
                    print DR[i,j,k,l,p] + DR[i,j,l,p,k] + DR[i,j,p,k,l] ,
︡f5bdf016-2e8d-4fe9-a311-6731ee300146︡
︠bc882100-b566-4e83-9f78-a109fbb64bdbi︠
%html
<p>If the last sign in the Bianchi identity is changed to minus, the identity does no longer hold:</p>

︡4dcf68b8-f0d3-40ab-b18d-d1ffe4a3af9a︡︡{"done":true,"html":"<p>If the last sign in the Bianchi identity is changed to minus, the identity does no longer hold:</p>"}
︠da8d2d8e-b14d-427f-a499-40ffc9619cebr︠
DR[0,1,2,3,1] + DR[0,1,3,1,2] + DR[0,1,1,2,3] # should be zero (Bianchi identity)
︡10c4acff-102c-41cc-802e-014227cf3f20︡
︠0ad6d1d3-1705-48fb-a0bf-93a4c7531eb4r︠
DR[0,1,2,3,1] + DR[0,1,3,1,2] - DR[0,1,1,2,3] # note the change of the second + to -
︡97e91d71-eea4-4f6b-9858-90d17f396526︡
︠e874dc2e-c22f-45bb-b552-4b8f198e7d4di︠
%html
<h3>Ricci scalar</h3>
<p>The Ricci scalar $R = g^{\mu\nu} R_{\mu\nu}$ of the Kerr-Newman spacetime vanishes identically:</p>

︡eed0efce-b483-4d20-acd5-ff0fce996275︡︡{"done":true,"html":"<h3>Ricci scalar</h3>\n<p>The Ricci scalar $R = g^{\\mu\\nu} R_{\\mu\\nu}$ of the Kerr-Newman spacetime vanishes identically:</p>"}
︠99fb0b74-1862-4e1c-929c-bbb8d91875abr︠
g.ricci_scalar().display()
︡366ea31d-cb37-4050-add9-10c6c9842039︡
︠bff38e5c-bf08-4df6-bdfc-9edfbd9d4e03i︠
%html
<h2>Einstein equation</h2>
<p>The Einstein tensor is</p>

︡d04fc17b-2783-4b70-b742-0390cde21f5a︡︡{"done":true,"html":"<h2>Einstein equation</h2>\n<p>The Einstein tensor is</p>"}
︠92f19b32-4808-4b35-89db-e4f3947a62e2r︠
G = Ric - 1/2*g.ricci_scalar()*g ; print G
︡b9999c80-a923-4bd6-ad50-73c3fa9788cc︡
︠e4d80fec-d8f0-4603-a36c-8051c404788ci︠
%html
<p>Since the Ricci scalar is zero, the Einstein tensor reduces to the Ricci tensor:</p>

︡5fb89132-acb3-4aa0-b865-1c274b84c531︡︡{"done":true,"html":"<p>Since the Ricci scalar is zero, the Einstein tensor reduces to the Ricci tensor:</p>"}
︠88c81d10-ef18-41b3-a689-5e4fa5cac47fr︠
G == Ric
︡2796e517-786a-4c6a-b13d-e0c173564c3e︡
︠bfd0b130-c639-474b-a4f5-6aed7cc96eb7i︠
%html
<p>The invariant $F_{\mu\nu} F^{\mu\nu}$ of the electromagnetic field:</p>

︡b9243e34-4bba-4b57-a06b-37cbf4604e9d︡︡{"done":true,"html":"<p>The invariant $F_{\\mu\\nu} F^{\\mu\\nu}$ of the electromagnetic field:</p>"}
︠13dfa7c1-8632-4524-80b3-2318d465b83ar︠
Fuu = F.up(g)
F2 = F['_ab']*Fuu['^ab'] ; print F2
︡061cb4d6-ef84-44c6-8a46-8248d7712999︡
︠327a8c28-70f4-4872-b6ba-e9693f85e4b8r︠
F2.display()
︡5ee4d3e1-87fc-46fa-9127-63833d799637︡
︠b231dd11-21ca-4dfb-843f-2022ff83eaa1i︠
%html
<p>The energy-momentum tensor of the electromagnetic field:</p>

︡69ce1f85-2c05-4b97-ac55-9a8326fd3b70︡︡{"done":true,"html":"<p>The energy-momentum tensor of the electromagnetic field:</p>"}
︠5c8de992-d424-4a99-b24c-574b5b7e06afr︠
Fud = F.up(g,0)
T = 1/(4*pi)*( F['_k.']*Fud['^k_.'] - 1/4*F2 * g ); print T
︡3292835a-556b-43f0-b53d-8db91d65e17c︡
︠196944ee-087f-4ceb-83e8-b107548a6f2ar︠
T[:]
︡d5dc116f-bf5e-4bbb-b4a3-e8260149d064︡
︠c6f0183d-29be-4a4a-a2da-cf9537dda7bfi︠
%html
<p>Check of the Einstein equation:</p>

︡4842254d-4493-4d4e-8952-43a28f6e635a︡︡{"done":true,"html":"<p>Check of the Einstein equation:</p>"}
︠8c613891-0994-4eb9-8af4-a6ed5bb531efr︠
G == 8*pi*T
︡50ce4595-ff95-4d50-8a20-869bb868713c︡
︠2cdc239d-b356-451e-b6c7-3cebecc23bc7i︠
%html
<h3>Kretschmann scalar</h3>

<p>The tensor $R^\flat$, of components $R_{ijkl} = g_{ip} R^p_{\ \, jkl}$:</p>

︡6d221117-5c38-477f-b45f-2494d428344f︡︡{"done":true,"html":"<h3>Kretschmann scalar</h3>\n\n<p>The tensor $R^\\flat$, of components $R_{ijkl} = g_{ip} R^p_{\\ \\, jkl}$:</p>"}
︠d38543c5-79ff-400b-acdc-5399f936d344r︠
dR = R.down(g) ; print dR
︡eddc8a39-7be3-4848-afe2-97139c89dc18︡
︠15ef1e7a-5f5e-4a75-851b-98b674da369ei︠
%html
<p>The tensor $R^\sharp$, of components $R^{ijkl} = g^{jp} g^{kq} g^{lr} R^i_{\ \, pqr}$:</p>

︡d33edd00-27ef-47d5-809b-e50e0d08c8aa︡︡{"done":true,"html":"<p>The tensor $R^\\sharp$, of components $R^{ijkl} = g^{jp} g^{kq} g^{lr} R^i_{\\ \\, pqr}$:</p>"}
︠89c99deb-b7ef-4b91-9531-a978ad25208er︠
uR = R.up(g) ; print uR
︡dce42ba1-896a-4875-8724-076d2362a69a︡
︠12f62e8a-473c-40eb-8d85-85661d2227b6i︠
%html
<p>The Kretschmann scalar $K := R^{ijkl} R_{ijkl}$:</p>

︡5bff5fbd-d876-496e-a1a3-480080267d9e︡︡{"done":true,"html":"<p>The Kretschmann scalar $K := R^{ijkl} R_{ijkl}$:</p>"}
︠af289796-1cc7-4e3c-a76d-ee1d1b289014r︠
Kr_scalar = uR['^ijkl']*dR['_ijkl']
Kr_scalar.display()
︡d948bd7b-07a7-4ef8-aad1-cd33f774339a︡
︠13b81bdd-02ea-4daf-92aa-4f4d9199a4d0i︠
%html
<p>A variant of this expression can be obtained by invoking the factor() method:</p>

︡43a772fd-65ec-430d-88c3-b1a3a92ab002︡︡{"done":true,"html":"<p>A variant of this expression can be obtained by invoking the factor() method:</p>"}
︠c8529675-c677-4edf-93d6-70d747c2de89r︠
Kr = Kr_scalar.function_chart() # coordinate function representing the scalar field in the default chart
Kr.factor()
︡73548d2b-de7e-4f33-8a74-eaf88c8ffd5b︡
︠a4335c80-919b-4527-ae86-35f1f0ae944fi︠
%html
<p>As a check, we can compare Kr to the formula given by R. Conn Henry, <a href="http://iopscience.iop.org/0004-637X/535/1/350/fulltext/">Astrophys. J. <strong>535</strong>, 350 (2000)</a>:</p>

︡471e9193-1464-413c-9109-fc7c8ed5e943︡︡{"done":true,"html":"<p>As a check, we can compare Kr to the formula given by R. Conn Henry, <a href=\"http://iopscience.iop.org/0004-637X/535/1/350/fulltext/\">Astrophys. J. <strong>535</strong>, 350 (2000)</a>:</p>"}
︠3b02e1ab-bd17-4914-95a0-10fbad2ab60br︠
Kr == 8/(r^2+(a*cos(th))^2)^6 *( \
          6*m^2*(r^6 - 15*r^4*(a*cos(th))^2 + 15*r^2*(a*cos(th))^4 - (a*cos(th))^6) \
        - 12*m*q^2*r*(r^4 - 10*(a*r*cos(th))^2 + 5*(a*cos(th))^4) \
        + q^4*(7*r^4 - 34*(a*r*cos(th))^2 + 7*(a*cos(th))^4) )
︡17a5ed22-b540-4fa7-ad70-404c62d83775︡
︠c1f4f9d8-ca73-4367-ab28-fe35ec1d33a4i︠
%html
<p>The Schwarzschild value of the Kretschmann scalar is recovered by setting $a=0$ and $q=0$:</p>

︡6d344d8e-5d66-441b-b295-d4dde5decc0b︡︡{"done":true,"html":"<p>The Schwarzschild value of the Kretschmann scalar is recovered by setting $a=0$ and $q=0$:</p>"}
︠145ca360-5aec-468a-b34d-4327c98614der︠
Kr.expr().subs(a=0, q=0)
︡e33325e0-7311-49b4-95a0-2435fb2a03c4︡
︠0a7f7312-f518-4a26-b45e-7e1e9a115f1fr︠
K1 = Kr.expr().subs(m=1, a=0.9, q=0.5)
︡fee893fa-8afa-40f5-88a6-628881ada189︡
︠f7d93009-41e3-4dfb-9031-3e7bc92ea900r︠
plot3d(K1, (r,1,3), (th, 0, pi))
︡ef9befbf-7e2e-4f55-8f4c-154e92157e5f︡
︠f2d7d92c-3c90-41ae-91d8-23e46b579fc2r︠

︡30c71755-217d-4b0d-bac9-13899ac27ff0︡
︠d672b88a-bf1f-49c4-898a-765e7b08047br︠

︡3b709a88-7d54-4a61-90aa-f2d258cec99f︡










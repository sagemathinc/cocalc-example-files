︠8ec38345-a38f-4691-8e64-33785ce18629as︠
%auto
typeset_mode(True, display=False)
︡a909d6b8-de63-4626-81db-ce2f3ed010e9︡{"auto":true}︡
︠c6d5d137-cf2f-412f-98f9-59e2c236e5f9i︠
%html
<h1 style="text-align: center;">Friedmann equations</h1>
<p>This worksheet demonstrates a few capabilities of <a href="http://sagemanifolds.obspm.fr/">SageManifolds</a> (version 0.8) in computations regarding cosmological spacetimes with Friedmann-Lema&icirc;tre-Robertson-Walker (FLRW) metrics. <br /><br />It is released under the GNU General Public License version 3.<br /><br />(c) Michal Bejger, Eric Gourgoulhon (2015)<br /><br /><em><span style="color: #008080;">The corresponding worksheet file can be downloaded from</span> <a href="http://sagemanifolds.obspm.fr/examples/sws/SM_Friedmann_equations.sws">here</a></em>.<br /><br /></p>
<p>We declare the spacetime M as a 4-dimensional manifold:</p>

︡bc3d914f-57c4-4246-abaa-b5f52a518e47︡︡{"done":true,"html":"<h1 style=\"text-align: center;\">Friedmann equations</h1>\n<p>This worksheet demonstrates a few capabilities of <a href=\"http://sagemanifolds.obspm.fr/\">SageManifolds</a> (version 0.8) in computations regarding cosmological spacetimes with Friedmann-Lema&icirc;tre-Robertson-Walker (FLRW) metrics. <br /><br />It is released under the GNU General Public License version 3.<br /><br />(c) Michal Bejger, Eric Gourgoulhon (2015)<br /><br /><em><span style=\"color: #008080;\">The corresponding worksheet file can be downloaded from</span> <a href=\"http://sagemanifolds.obspm.fr/examples/sws/SM_Friedmann_equations.sws\">here</a></em>.<br /><br /></p>\n<p>We declare the spacetime M as a 4-dimensional manifold:</p>"}
︠29deeb83-8396-4f5b-918e-9045272b2490︠
M = Manifold(4, 'M')
︡60906ae8-c999-4239-9c0a-39c05709a18e︡︡{"done":true}
︠451de110-62a8-483a-b428-f1ec25590790i︠
%html
<p>We introduce the standard FLRW coordinates:</p>

︡084e349b-bf6d-4e0a-8d74-57830ebfc8dc︡︡{"done":true,"html":"<p>We introduce the standard FLRW coordinates:</p>"}
︠c8868f4c-799a-43ac-9f4a-3b3de61c7e70︠
fr.<t,r,th,ph> = M.chart(r't r:[0,+oo) th:[0,pi]:\theta ph:[0,2*pi):\phi')
fr
︡97f4994d-13ec-4a1a-a5ef-da3947c6ad42︡︡{"html":"<div>$\\left(M,(t, r, {\\theta}, {\\phi})\\right)$</div>","done":false}︡{"done":true}
︠cb1e0b85-c458-4afc-832a-9b11c9120ef4i︠
%html
<p>Assuming that the speed of light c=1, let us define a few variables: Newton's constant $G$, the cosmological constant $\Lambda$, the spatial curvature constant $k$, the scale factor $a(t)$, the fluid proper density $\rho$ and the fluid pressure $p$:</p>

︡4cd61e43-a631-44dc-bc6e-e6388ecf4cd0︡︡{"done":true,"html":"<p>Assuming that the speed of light c=1, let us define a few variables: Newton's constant $G$, the cosmological constant $\\Lambda$, the spatial curvature constant $k$, the scale factor $a(t)$, the fluid proper density $\\rho$ and the fluid pressure $p$:</p>"}
︠b06dd24f-40dc-4c09-ad6b-5cba4a9a9df7︠
var('G, Lambda, k')
a = M.scalar_field(function('a', t), name='a')
rho = M.scalar_field(function('rho', t), name='rho')
p = M.scalar_field(function('p', t), name='p')
︡571a319f-230a-40bd-ac10-5bd0e4309d41︡︡{"html":"<div>($G$, $\\Lambda$, $k$)</div>","done":false}︡{"done":true}
︠eb6351f7-763d-4287-8f9a-2e53d017e9b9i︠
%html
<p>The FLRW metric is defined by its components:</p>

︡775ae25a-d568-4a39-9641-b3e7518b4ac1︡︡{"done":true,"html":"<p>The FLRW metric is defined by its components:</p>"}
︠5a265742-a23a-4de0-afe1-1f985b11a6d5︠
g = M.lorentz_metric('g')
g[0,0] = -1
g[1,1] = a*a/(1 - k*r^2)
g[2,2] = a*a*r^2
g[3,3] = a*a*(r*sin(th))^2
g.display()
︡a43ab758-04a3-45b0-ae58-53d94d78122e︡︡{"html":"<div>$g = -\\mathrm{d} t\\otimes \\mathrm{d} t + \\left( -\\frac{a\\left(t\\right)^{2}}{k r^{2} - 1} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + r^{2} a\\left(t\\right)^{2} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + r^{2} a\\left(t\\right)^{2} \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠525a3b86-edfa-400b-b400-20a9e4c891d5i︠
%html
<p>A matrix view of the metric components:</p>

︡a2aee7d0-065e-41bd-b47f-b58ab1901da7︡︡{"done":true,"html":"<p>A matrix view of the metric components:</p>"}
︠1c7b6b46-366e-4316-8987-8a2a19433070︠
g[:]
︡c974ef0a-13e2-4576-97b0-625fda5ed441︡︡{"html":"<div>$\\left(\\begin{array}{rrrr}\n-1 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; -\\frac{a\\left(t\\right)^{2}}{k r^{2} - 1} &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; r^{2} a\\left(t\\right)^{2} &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; r^{2} a\\left(t\\right)^{2} \\sin\\left({\\theta}\\right)^{2}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠6eed5576-c9e5-405f-b3e2-04b502e522ffi︠
%html
<p>The Levi-Civita connection associated with the metric is computed:</p>

︡82688b2f-a5c0-4ef4-8566-4705e4190b45︡︡{"done":true,"html":"<p>The Levi-Civita connection associated with the metric is computed:</p>"}
︠458ce70d-8620-47a9-aa24-cbcd981bd048︠
nab = g.connection()
g.christoffel_symbols_display()
︡ff496530-7866-4460-84f9-bb7e37a30275︡︡{"html":"<div>$\\begin{array}{lcl} \\Gamma_{ \\phantom{\\, t } \\, r \\, r }^{ \\, t \\phantom{\\, r } \\phantom{\\, r } } &amp; = &amp; -\\frac{a\\left(t\\right) \\frac{\\partial\\,a}{\\partial t}}{k r^{2} - 1} \\\\ \\Gamma_{ \\phantom{\\, t } \\, {\\theta} \\, {\\theta} }^{ \\, t \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } } &amp; = &amp; r^{2} a\\left(t\\right) \\frac{\\partial\\,a}{\\partial t} \\\\ \\Gamma_{ \\phantom{\\, t } \\, {\\phi} \\, {\\phi} }^{ \\, t \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; r^{2} a\\left(t\\right) \\sin\\left({\\theta}\\right)^{2} \\frac{\\partial\\,a}{\\partial t} \\\\ \\Gamma_{ \\phantom{\\, r } \\, t \\, r }^{ \\, r \\phantom{\\, t } \\phantom{\\, r } } &amp; = &amp; \\frac{\\frac{\\partial\\,a}{\\partial t}}{a\\left(t\\right)} \\\\ \\Gamma_{ \\phantom{\\, r } \\, r \\, r }^{ \\, r \\phantom{\\, r } \\phantom{\\, r } } &amp; = &amp; -\\frac{k r}{k r^{2} - 1} \\\\ \\Gamma_{ \\phantom{\\, r } \\, {\\theta} \\, {\\theta} }^{ \\, r \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } } &amp; = &amp; k r^{3} - r \\\\ \\Gamma_{ \\phantom{\\, r } \\, {\\phi} \\, {\\phi} }^{ \\, r \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; {\\left(k r^{3} - r\\right)} \\sin\\left({\\theta}\\right)^{2} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, t \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, t } \\phantom{\\, {\\theta} } } &amp; = &amp; \\frac{\\frac{\\partial\\,a}{\\partial t}}{a\\left(t\\right)} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, r \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, r } \\phantom{\\, {\\theta} } } &amp; = &amp; \\frac{1}{r} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, {\\phi} \\, {\\phi} }^{ \\, {\\theta} \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right) \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, t \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, t } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{\\frac{\\partial\\,a}{\\partial t}}{a\\left(t\\right)} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, r \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, r } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{1}{r} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, {\\theta} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{\\cos\\left({\\theta}\\right)}{\\sin\\left({\\theta}\\right)} \\end{array}$</div>","done":false}︡{"done":true}
︠46649727-644e-476e-87f4-2fa4c0a4d295i︠
%html
Ricci tensor:

︡f8e936ce-cf99-4e74-8b45-e7bff9a599f8︡︡{"done":true,"html":"Ricci tensor:"}
︠f90a4d89-a379-46d9-a636-0d5e76f66ea6︠
Ricci = nab.ricci()
Ricci.display()
︡d0192019-cb28-4773-95d8-d34d2ae8697a︡︡{"html":"<div>$\\mathrm{Ric}\\left(g\\right) = -\\frac{3 \\, \\frac{\\partial^2\\,a}{\\partial t^2}}{a\\left(t\\right)} \\mathrm{d} t\\otimes \\mathrm{d} t + \\left( -\\frac{2 \\, \\left(\\frac{\\partial\\,a}{\\partial t}\\right)^{2} + a\\left(t\\right) \\frac{\\partial^2\\,a}{\\partial t^2} + 2 \\, k}{k r^{2} - 1} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + \\left( 2 \\, r^{2} \\left(\\frac{\\partial\\,a}{\\partial t}\\right)^{2} + r^{2} a\\left(t\\right) \\frac{\\partial^2\\,a}{\\partial t^2} + 2 \\, k r^{2} \\right) \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + {\\left(2 \\, r^{2} \\left(\\frac{\\partial\\,a}{\\partial t}\\right)^{2} + r^{2} a\\left(t\\right) \\frac{\\partial^2\\,a}{\\partial t^2} + 2 \\, k r^{2}\\right)} \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠67e339ad-65c6-40cd-9470-40a1aa621f10i︠
%html
<p>Ricci scalar ($R^\mu_{\ \, \mu}$):</p>

︡d534a2b5-88d5-4bcd-aa33-621117ff68b1︡︡{"done":true,"html":"<p>Ricci scalar ($R^\\mu_{\\ \\, \\mu}$):</p>"}
︠5ed84d3e-da5e-4a9e-887b-a9ee4e0ba183︠
Ricci_scalar = g.ricci_scalar()
Ricci_scalar.display()
︡8f594d00-faca-4aee-9521-7a75197d21fe︡︡{"html":"<div>$\\begin{array}{llcl} \\mathrm{r}\\left(g\\right):&amp; M &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(t, r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; \\frac{6 \\, {\\left(\\left(\\frac{\\partial\\,a}{\\partial t}\\right)^{2} + a\\left(t\\right) \\frac{\\partial^2\\,a}{\\partial t^2} + k\\right)}}{a\\left(t\\right)^{2}} \\end{array}$</div>","done":false}︡{"done":true}
︠fa9e8d85-559b-4b53-9410-bf2a1c3841b1i︠
%html
<p>The fluid 4-velocity:</p>

︡f16dd622-2c09-4e25-8b32-2aa4ace48539︡︡{"done":true,"html":"<p>The fluid 4-velocity:</p>"}
︠9d0aa00c-c746-409c-896e-a516c320dbd5︠
u = M.vector_field('u')
u[0] = 1
u.display()
︡0d02754b-242b-475e-92bf-319d51a9eb24︡︡{"html":"<div>$u = \\frac{\\partial}{\\partial t }$</div>","done":false}︡{"done":true}
︠bb53e945-87f7-48a5-b718-d1d1e9cff988︠
g(u,u).expr()
︡1e3fcc47-1989-48bd-bfc3-fa8fc7c2dd80︡︡{"html":"<div>$-1$</div>","done":false}︡{"done":true}
︠a108aae9-3108-43d7-b4e6-c04553a5bf57i︠
%html
<p>Perfect fluid energy-momentum tensor $T$:</p>

︡fbbe83e9-7054-4dac-a0c2-3a1feeb22fc1︡︡{"done":true,"html":"<p>Perfect fluid energy-momentum tensor $T$:</p>"}
︠70c7a9c9-4388-4419-ab93-1e4f50072503︠
u_form = u.down(g) # the 1-form associated to u by metric duality
T = (rho+p)*(u_form*u_form) + p*g
T.set_name('T')
print T
T.display()
︡7be9bf39-02b2-40bd-a47c-40968802968f︡︡{"stdout":"field of symmetric bilinear forms 'T' on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$T = \\rho\\left(t\\right) \\mathrm{d} t\\otimes \\mathrm{d} t + \\left( -\\frac{a\\left(t\\right)^{2} p\\left(t\\right)}{k r^{2} - 1} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + r^{2} a\\left(t\\right)^{2} p\\left(t\\right) \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + r^{2} a\\left(t\\right)^{2} p\\left(t\\right) \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠7df5bb56-77f8-4eb2-989c-fe037cb08b07i︠
%html
<p>The trace of $T$ (we use index notation to denote the double contraction $g^{ab} T_{ab}$):</p>

︡f61de102-435e-4f9c-a2b9-5b529b617d84︡︡{"done":true,"html":"<p>The trace of $T$ (we use index notation to denote the double contraction $g^{ab} T_{ab}$):</p>"}
︠56a3ccb3-1c62-4a9b-82a0-657bdc631648︠
Ttrace = g.inverse()['^ab']*T['_ab']
Ttrace.display()
︡af229b2d-bfc3-4ac5-ba87-7bff0d8d9210︡︡{"html":"<div>$\\begin{array}{llcl} &amp; M &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(t, r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; 3 \\, p\\left(t\\right) - \\rho\\left(t\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠e021c064-a5cc-4004-9cee-12ff68f1d85bi︠
%html
<p>Einstein equation: $R_{\mu \nu} - {1 \over 2} R g_{\mu \nu} +&nbsp;\Lambda g_{\mu \nu} = {8 \pi G} T_{\mu \nu}$</p>

︡038ab29a-7f51-4c25-84d0-d1fe5f75d8fe︡︡{"done":true,"html":"<p>Einstein equation: $R_{\\mu \\nu} - {1 \\over 2} R g_{\\mu \\nu} +&nbsp;\\Lambda g_{\\mu \\nu} = {8 \\pi G} T_{\\mu \\nu}$</p>"}
︠e79bdc26-a040-4d3b-bc1b-dff6fbc752d6︠
E1 = Ricci - Ricci_scalar/2*g + Lambda*g - (8*pi*G)*T
print "First Friedmann equation:\n"
E1[0,0].expr().expand() == 0
︡9fdec45e-4848-4151-aa9e-a2ce6eea5301︡︡{"stdout":"First Friedmann equation:\n\n","done":false}︡{"html":"<div>$-8 \\, \\pi G \\rho\\left(t\\right) - \\Lambda + \\frac{3 \\, D[0]\\left(a\\right)\\left(t\\right)^{2}}{a\\left(t\\right)^{2}} + \\frac{3 \\, k}{a\\left(t\\right)^{2}} = 0$</div>","done":false}︡{"done":true}
︠3496320a-0507-4296-b27a-d124e09eae94i︠
%html
<p>Trace-reversed version of the Einstein equation: $R_{\mu \nu} - \Lambda g_{\mu \nu} = {8 \pi G} \left(T_{\mu \nu} - {1 \over 2}T\,g_{\mu \nu}\right)$</p>

︡f3bc3f1e-9a50-452f-8612-6265e6b91bf6︡︡{"done":true,"html":"<p>Trace-reversed version of the Einstein equation: $R_{\\mu \\nu} - \\Lambda g_{\\mu \\nu} = {8 \\pi G} \\left(T_{\\mu \\nu} - {1 \\over 2}T\\,g_{\\mu \\nu}\\right)$</p>"}
︠cb36b6aa-4880-4f4d-a4b6-23c247692ffb︠
E2 = Ricci - Lambda*g - (8*pi*G)*(T - Ttrace/2*g)
print "Second Friedmann equation:\n"
E2[0,0].expr().expand() == 0
︡da6b6a79-e789-42b5-b672-0bf69c094b80︡︡{"stdout":"Second Friedmann equation:\n\n","done":false}︡{"html":"<div>$-12 \\, \\pi G p\\left(t\\right) - 4 \\, \\pi G \\rho\\left(t\\right) + \\Lambda - \\frac{3 \\, D[0, 0]\\left(a\\right)\\left(t\\right)}{a\\left(t\\right)} = 0$</div>","done":false}︡{"done":true}
︠48399a58-637c-48b9-ac28-0473c55afdd8︠










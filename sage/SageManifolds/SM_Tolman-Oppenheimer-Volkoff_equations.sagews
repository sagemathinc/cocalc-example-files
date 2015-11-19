︠2e880361-b40e-4a72-82d5-7c67fe1153a9as︠
%auto
typeset_mode(True, display=False)
︡a38a2e03-40c0-4d27-b428-168b07443fd2︡{"auto":true}︡
︠225cea73-1af1-4e4d-ab4f-4bd784b2c0c4i︠
%md
## Tolman-Oppenheimer-Volkoff equations

*This worksheet illustrates some features of SageManifolds (v0.8) on the derivation of the Tolman-Oppenheimer-Volkoff equations (spherically symmetric, stationary solution of general relativity).*

We will calculate the Einstein equations   
$$R_{\mu\nu} - \frac{1}{2}Rg_{\mu\nu} = T_{\mu\nu}$$
for a corresponding spherically symmetric, stationary metric $g$. In the above, $R_{\mu\nu}$ is the Ricci tensor, $R=R^\mu_\mu$ is the Ricci scalar, and $T_{\mu\nu}$ is the energy-momentum tensor (left side of Einstein's equations describe the geometry of spacetime, and the right side the matter in the spacetime).

We first declare the spacetime Mas a general 4­dimensional manifold
︡db6c09fe-77b2-47f7-b8da-2dfe56999f74︡︡{"done":true,"md":"## Tolman-Oppenheimer-Volkoff equations\n\n*This worksheet illustrates some features of SageManifolds (v0.8) on the derivation of the Tolman-Oppenheimer-Volkoff equations (spherically symmetric, stationary solution of general relativity).*\n\nWe will calculate the Einstein equations   \n$$R_{\\mu\\nu} - \\frac{1}{2}Rg_{\\mu\\nu} = T_{\\mu\\nu}$$\nfor a corresponding spherically symmetric, stationary metric $g$. In the above, $R_{\\mu\\nu}$ is the Ricci tensor, $R=R^\\mu_\\mu$ is the Ricci scalar, and $T_{\\mu\\nu}$ is the energy-momentum tensor (left side of Einstein's equations describe the geometry of spacetime, and the right side the matter in the spacetime).\n\nWe first declare the spacetime Mas a general 4­dimensional manifold"}
︠1b5633a6-2da1-4965-85e5-23453ade7405︠
M = Manifold(4, 'M', r'\mathcal{M}')
print M ; M
︡b9e075dd-5e26-4e20-ab05-b9f201a0cbc0︡︡{"stdout":"4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$\\mathcal{M}$</div>","done":false}︡{"done":true}
︠fee185aa-6207-43a4-a953-0eab54dda990i︠
%md
with the standard spherical coordinates (`X` denotes the coordinate chart on `M`):
︡a5db36a6-ce62-499a-86f2-9c8d1817e642︡︡{"done":true,"md":"with the standard spherical coordinates (`X` denotes the coordinate chart on `M`):"}
︠5b5c5fcc-07b2-4fd7-a45c-0fdc5c232ffd︠
X.<t,r,th,ph> = M.chart(r't r:(0,+oo) th:(0,pi):\theta phi:(0,2*pi):\phi')
︡85dbec3d-d424-4d03-a78a-fdce324bc801︡︡{"done":true}
︠9cb2185f-51c6-4d74-b2b0-ee0951102e38i︠
%md
In order to define a general spherically symmetric, stationary metric one needs a few auxiliary functions of the radial coordinate $r$ - metric functions $\nu(r)$ and $\lambda(r)$, matter pressure $p(r)$ and energy density $\rho(r)$, as well as the mass $m(r)$ enclosed within the sphere of the radius $r$:
︡b60413aa-56e2-47dd-a492-7eef0033525b︡︡{"done":true,"md":"In order to define a general spherically symmetric, stationary metric one needs a few auxiliary functions of the radial coordinate $r$ - metric functions $\\nu(r)$ and $\\lambda(r)$, matter pressure $p(r)$ and energy density $\\rho(r)$, as well as the mass $m(r)$ enclosed within the sphere of the radius $r$:"}
︠6a1cee8c-f6d8-46ef-bedc-89a370432563︠
# metric functions:
nu = function("nu", r, latex_name=r"\nu")
lam = function("lambda", r, latex_name=r"\lambda")
# density and pressure:
rho = function("rho", r, latex_name=r"\rho")
p = function("P", r)
# mass enclosed in sphere of radius r:
m = function("m", r)
︡935d4ef3-ce09-49e9-ac53-a45fbed660a0︡︡{"done":true}
︠c5144848-5000-4341-ad4c-e2b20bb7a3cai︠
%md
In general, such metric reads as follows: 
︡7f593049-1855-48df-a294-3bd7f5843a7e︡︡{"done":true,"md":"In general, such metric reads as follows:"}
︠930bc887-a3f5-42f0-ae7f-9b950de2d465︠
g = M.lorentz_metric('g')
g[0,0] = -exp(2*nu)
g[1,1] = exp(2*lam)
g[2,2], g[3,3] = r^2, r^2*sin(th)^2
g.display()
︡b6cc7e88-c4e6-42d7-8cf7-e3f960fa8351︡︡{"html":"<div>$g = -e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} \\mathrm{d} t\\otimes \\mathrm{d} t + e^{\\left(2 \\, \\lambda\\left(r\\right)\\right)} \\mathrm{d} r\\otimes \\mathrm{d} r + r^{2} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + r^{2} \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠bdd9a469-55da-4090-95de-0032622d7775i︠
%md
which works assuming that the physical constants G=c=1. Let's introduce G and c as variables to obtain the dimensional version of the equations:
︡a03fb546-94e2-46da-83d9-99c03054f214︡︡{"done":true,"md":"which works assuming that the physical constants G=c=1. Let's introduce G and c as variables to obtain the dimensional version of the equations:"}
︠5b43da35-5ad1-41a6-80cb-28c781fbf7af︠
var('G c pi'); assume(G>0); assume(c>0)
︡729413ac-d042-4c46-87c2-3eb12be0aad8︡︡{"html":"<div>($G$, $c$, $\\pi$)</div>","done":false}︡{"done":true}
︠bfd9e2e5-98be-4d74-969e-472f60c32271i︠
%md
From the Newtonian weak field limit considerations (Newtonian force far from the source) one may simplify the above expression and replace $\lambda(r)$ with $\frac{1-2Gm}{rc^2}$, as well as explicitly put $c^2$ in front of $g_{tt}$. Then
︡ec32c776-e7aa-405b-a5bc-35e9e64631c6︡︡{"done":true,"md":"From the Newtonian weak field limit considerations (Newtonian force far from the source) one may simplify the above expression and replace $\\lambda(r)$ with $\\frac{1-2Gm}{rc^2}$, as well as explicitly put $c^2$ in front of $g_{tt}$. Then"}
︠b593fb6c-c85a-4a91-becb-13d70530e691︠
g[0,0] = -c^2*exp(2*nu)
g[1,1] = 1/(1-2*G*m/(r*c^2))
g.display()
︡bc2fc7bc-884d-4769-a466-d7c09f171004︡︡{"html":"<div>$g = -c^{2} e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} \\mathrm{d} t\\otimes \\mathrm{d} t + \\left( \\frac{c^{2} r}{c^{2} r - 2 \\, G m\\left(r\\right)} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + r^{2} \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + r^{2} \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠d46684fa-bea8-4640-b954-ee5e185edc6fi︠
%md
The Ricci tensor is a result of a method `ricci()` acting on the metric `g`:
︡7d11f52a-c213-4c64-80bb-32f2aed7c023︡︡{"done":true,"md":"The Ricci tensor is a result of a method `ricci()` acting on the metric `g`:"}
︠75ac1fae-07d7-4912-a8c6-371ced72d7ae︠
Ricci = g.ricci(); Ricci.display()
︡9c787794-0c09-449e-b4d6-995b4125f779︡︡{"html":"<div>$\\mathrm{Ric}\\left(g\\right) = \\left( \\frac{c^{2} r^{2} e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} + c^{2} r^{2} e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} \\frac{\\partial^2\\,\\nu}{\\partial r^2} + 2 \\, c^{2} r e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} \\frac{\\partial\\,\\nu}{\\partial r} - {\\left(2 \\, r e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} m\\left(r\\right) \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} + 2 \\, r e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} m\\left(r\\right) \\frac{\\partial^2\\,\\nu}{\\partial r^2} + {\\left(r e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} \\frac{\\partial\\,m}{\\partial r} + 3 \\, e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} m\\left(r\\right)\\right)} \\frac{\\partial\\,\\nu}{\\partial r}\\right)} G}{r^{2}} \\right) \\mathrm{d} t\\otimes \\mathrm{d} t + \\left( -\\frac{c^{2} r^{3} \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} + c^{2} r^{3} \\frac{\\partial^2\\,\\nu}{\\partial r^2} - {\\left(2 \\, r^{2} m\\left(r\\right) \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} + 2 \\, r^{2} m\\left(r\\right) \\frac{\\partial^2\\,\\nu}{\\partial r^2} + 2 \\, r \\frac{\\partial\\,m}{\\partial r} + {\\left(r^{2} \\frac{\\partial\\,m}{\\partial r} - r m\\left(r\\right)\\right)} \\frac{\\partial\\,\\nu}{\\partial r} - 2 \\, m\\left(r\\right)\\right)} G}{c^{2} r^{3} - 2 \\, G r^{2} m\\left(r\\right)} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + \\left( -\\frac{c^{2} r^{2} \\frac{\\partial\\,\\nu}{\\partial r} - {\\left(2 \\, r m\\left(r\\right) \\frac{\\partial\\,\\nu}{\\partial r} + r \\frac{\\partial\\,m}{\\partial r} + m\\left(r\\right)\\right)} G}{c^{2} r} \\right) \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + \\left( -\\frac{c^{2} r^{2} \\sin\\left({\\theta}\\right)^{2} \\frac{\\partial\\,\\nu}{\\partial r} - {\\left(2 \\, r m\\left(r\\right) \\frac{\\partial\\,\\nu}{\\partial r} + r \\frac{\\partial\\,m}{\\partial r} + m\\left(r\\right)\\right)} G \\sin\\left({\\theta}\\right)^{2}}{c^{2} r} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠0895beb1-5b4d-4cc9-878a-eea479744a57i︠
%md
For example, the $R_{tt}$ component is 
︡2d1b63a1-7dd0-43af-a479-a5cc956c806c︡︡{"done":true,"md":"For example, the $R_{tt}$ component is"}
︠718b5ca0-9077-475f-ad68-c87d27b01841︠
Ricci[0,0]
︡fe2536e5-5ecb-4e45-899b-c4e8b3b3aefd︡︡{"html":"<div>$\\frac{c^{2} r^{2} e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} + c^{2} r^{2} e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} \\frac{\\partial^2\\,\\nu}{\\partial r^2} + 2 \\, c^{2} r e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} \\frac{\\partial\\,\\nu}{\\partial r} - {\\left(2 \\, r e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} m\\left(r\\right) \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} + 2 \\, r e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} m\\left(r\\right) \\frac{\\partial^2\\,\\nu}{\\partial r^2} + {\\left(r e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} \\frac{\\partial\\,m}{\\partial r} + 3 \\, e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} m\\left(r\\right)\\right)} \\frac{\\partial\\,\\nu}{\\partial r}\\right)} G}{r^{2}}$</div>","done":false}︡{"done":true}
︠0bb86f3c-e122-4378-a369-e6ca62ba47e1︠
Ricci[0,0].expand().collect(nu.diff(r)).collect(nu.diff(r,r)).collect(c^2*exp(2*nu)).collect_common_factors()
︡14780691-cfea-4301-89b0-bc3a015ec0b7︡︡{"html":"<div>${\\left(c^{2} \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} - \\frac{2 \\, G m\\left(r\\right) \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2}}{r} + c^{2} \\frac{\\partial^2\\,\\nu}{\\partial r^2} + \\frac{2 \\, c^{2} \\frac{\\partial\\,\\nu}{\\partial r}}{r} - \\frac{G \\frac{\\partial\\,m}{\\partial r} \\frac{\\partial\\,\\nu}{\\partial r}}{r} - \\frac{2 \\, G m\\left(r\\right) \\frac{\\partial^2\\,\\nu}{\\partial r^2}}{r} - \\frac{3 \\, G m\\left(r\\right) \\frac{\\partial\\,\\nu}{\\partial r}}{r^{2}}\\right)} e^{\\left(2 \\, \\nu\\left(r\\right)\\right)}$</div>","done":false}︡{"done":true}
︠e76cfc88-80be-4c1d-b86d-5a5afb54cdda︠
Ricci[1,1].expand().collect_common_factors()
︡ecbc456d-908e-476b-acf1-c17c57076ab8︡︡{"html":"<div>$-\\frac{c^{2} r^{3} \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} - 2 \\, G r^{2} m\\left(r\\right) \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} + c^{2} r^{3} \\frac{\\partial^2\\,\\nu}{\\partial r^2} - G r^{2} \\frac{\\partial\\,m}{\\partial r} \\frac{\\partial\\,\\nu}{\\partial r} - 2 \\, G r^{2} m\\left(r\\right) \\frac{\\partial^2\\,\\nu}{\\partial r^2} + G r m\\left(r\\right) \\frac{\\partial\\,\\nu}{\\partial r} - 2 \\, G r \\frac{\\partial\\,m}{\\partial r} + 2 \\, G m\\left(r\\right)}{{\\left(c^{2} r - 2 \\, G m\\left(r\\right)\\right)} r^{2}}$</div>","done":false}︡{"done":true}
︠062a466d-5643-49d3-9f91-9463544c1174︠
Ricci[2,2].expand().collect(nu.diff(r)).collect(nu.diff(r,r)).collect(c^2*exp(2*nu))
︡57920438-eeaf-4e24-bab8-9c3d5007848f︡︡{"html":"<div>$-r \\frac{\\partial\\,\\nu}{\\partial r} + \\frac{2 \\, G m\\left(r\\right) \\frac{\\partial\\,\\nu}{\\partial r}}{c^{2}} + \\frac{G \\frac{\\partial\\,m}{\\partial r}}{c^{2}} + \\frac{G m\\left(r\\right)}{c^{2} r}$</div>","done":false}︡{"done":true}
︠6933e66e-2883-4466-be45-05b63e16e6e8i︠
%md
Ricci scalar is obtained by the `ricci_scalar()` method acting on `g`:
︡de255033-cd13-4c35-baed-2feb301c70fb︡︡{"done":true,"md":"Ricci scalar is obtained by the `ricci_scalar()` method acting on `g`:"}
︠ffa2b253-52b9-4256-8550-8f607466cdff︠
Ric_scalar = g.ricci_scalar()
(Ric_scalar.function_chart(X)).collect(nu.diff(r)).collect(nu.diff(r,r)).collect(c^2*exp(2*nu))
︡7ae287e3-56aa-481e-aa8b-388a85ea4cad︡︡{"html":"<div>$-\\frac{2 \\, {\\left(c^{2} r^{2} \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} + c^{2} r^{2} \\frac{\\partial^2\\,\\nu}{\\partial r^2} + 2 \\, c^{2} r \\frac{\\partial\\,\\nu}{\\partial r} - {\\left(2 \\, r m\\left(r\\right) \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} + 2 \\, r m\\left(r\\right) \\frac{\\partial^2\\,\\nu}{\\partial r^2} + {\\left(r \\frac{\\partial\\,m}{\\partial r} + 3 \\, m\\left(r\\right)\\right)} \\frac{\\partial\\,\\nu}{\\partial r} + 2 \\, \\frac{\\partial\\,m}{\\partial r}\\right)} G\\right)}}{c^{2} r^{2}}$</div>","done":false}︡{"done":true}
︠6b135c6c-9842-4d4d-a961-7b946940805di︠
%md
It is the trace of the Ricci tensor, $R = R_\mu^\mu$: 
︡7aefce40-4d20-4554-b0ea-9fe997bc4749︡︡{"done":true,"md":"It is the trace of the Ricci tensor, $R = R_\\mu^\\mu$:"}
︠be2f5f4e-7288-4506-93df-8c051290a00e︠
Ric_scalar == Ricci.up(g, 1).trace(0, 1)
︡240eb7d1-d02f-4e1b-b1bf-2d93b551c373︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠13430c80-7359-4b98-a099-6d3ac8b73a34i︠
%md
Left side of the Einstein equations is
︡0d71d8b6-9f1f-4b98-ba3f-907a664f5832︡︡{"done":true,"md":"Left side of the Einstein equations is"}
︠54db2160-8330-4f01-8d3d-bde048d9b1a0︠
E = Ricci - (Ric_scalar*g)/2; E.display()
︡18617a12-dcfa-4b40-acfd-e66cb3da1ae7︡︡{"html":"<div>$\\mathrm{Ric}\\left(g\\right)-\\mbox{unnamed metric} = \\frac{2 \\, G e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} \\frac{\\partial\\,m}{\\partial r}}{r^{2}} \\mathrm{d} t\\otimes \\mathrm{d} t + \\left( \\frac{2 \\, {\\left(c^{2} r^{2} \\frac{\\partial\\,\\nu}{\\partial r} - {\\left(2 \\, r m\\left(r\\right) \\frac{\\partial\\,\\nu}{\\partial r} + m\\left(r\\right)\\right)} G\\right)}}{c^{2} r^{3} - 2 \\, G r^{2} m\\left(r\\right)} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + \\left( \\frac{c^{2} r^{3} \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} + c^{2} r^{3} \\frac{\\partial^2\\,\\nu}{\\partial r^2} + c^{2} r^{2} \\frac{\\partial\\,\\nu}{\\partial r} - {\\left(2 \\, r^{2} m\\left(r\\right) \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} + 2 \\, r^{2} m\\left(r\\right) \\frac{\\partial^2\\,\\nu}{\\partial r^2} + r \\frac{\\partial\\,m}{\\partial r} + {\\left(r^{2} \\frac{\\partial\\,m}{\\partial r} + r m\\left(r\\right)\\right)} \\frac{\\partial\\,\\nu}{\\partial r} - m\\left(r\\right)\\right)} G}{c^{2} r} \\right) \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + \\left( -\\frac{{\\left(2 \\, r^{2} m\\left(r\\right) \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} + 2 \\, r^{2} m\\left(r\\right) \\frac{\\partial^2\\,\\nu}{\\partial r^2} + r \\frac{\\partial\\,m}{\\partial r} + {\\left(r^{2} \\frac{\\partial\\,m}{\\partial r} + r m\\left(r\\right)\\right)} \\frac{\\partial\\,\\nu}{\\partial r} - m\\left(r\\right)\\right)} G \\sin\\left({\\theta}\\right)^{2} - {\\left(c^{2} r^{3} \\left(\\frac{\\partial\\,\\nu}{\\partial r}\\right)^{2} + c^{2} r^{3} \\frac{\\partial^2\\,\\nu}{\\partial r^2} + c^{2} r^{2} \\frac{\\partial\\,\\nu}{\\partial r}\\right)} \\sin\\left({\\theta}\\right)^{2}}{c^{2} r} \\right) \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠45ce37fb-4848-4b15-bd63-e8d940dfe3cai︠
%md
Now for the energy-momentum tensor, $T_{\mu\nu}$: 
︡303183fa-4fab-4b24-8007-0170c76fa6d7︡︡{"done":true,"md":"Now for the energy-momentum tensor, $T_{\\mu\\nu}$:"}
︠a2b59de6-e2c3-419e-9da2-16502b7c5276︠
u = M.vector_field('u')
u[0] = exp(-nu)
u.display()
︡b31e15f6-7e25-43ac-a216-72f3df805d08︡︡{"html":"<div>$u = e^{\\left(-\\nu\\left(r\\right)\\right)} \\frac{\\partial}{\\partial t }$</div>","done":false}︡{"done":true}
︠d6043b81-8ba8-409a-bd8f-56e6a04e33c2i︠
%md
We can check if it is indeed the timelike 4-vector by checking $u_\mu u^\mu = -c^2$ by contracting it with the metric `g` using a method `contract()`: 
︡28fffa4c-aeae-42b3-90c5-e3b0da6c914e︡︡{"done":true,"md":"We can check if it is indeed the timelike 4-vector by checking $u_\\mu u^\\mu = -c^2$ by contracting it with the metric `g` using a method `contract()`:"}
︠3c53d558-0b94-4b48-95a3-710344357d80︠
umuumu = g.contract(0,u,0).contract(0,u,0).function_chart(X)
umuumu == -c^2
︡7d82f7af-5271-4559-9dfb-7192c1c4e147︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠9c777b25-9c3c-4228-b73c-7b40d278933di︠
%md
The product $u_\mu u^\mu$ can be also obtained in much a simpler way, by just invoking
︡77317103-b719-45b5-8d19-31ff4d4e81c6︡︡{"done":true,"md":"The product $u_\\mu u^\\mu$ can be also obtained in much a simpler way, by just invoking"}
︠ecef057d-6105-4919-989d-1633363722bd︠
umuumu = g(u,u)
umuumu == -c^2
︡f5088c38-4fc6-4c53-ae62-5075f99b2d66︡︡{"html":"<div>$\\mathrm{True}$</div>","done":false}︡{"done":true}
︠a89bf876-fd9b-4065-b95b-bccc2d629bb0i︠
%md
Let's now adopt $T_{\mu\nu}$ in perfect fluid form:  
︡43a444f0-29d5-4b5b-af48-4a5b2eba40dc︡︡{"done":true,"md":"Let's now adopt $T_{\\mu\\nu}$ in perfect fluid form:"}
︠924c575b-34b7-41ac-8ff1-e514b64cb4d0︠
u_form = u.down(g)
T = (rho + p/c^2)*(u_form*u_form) + p*g
T.set_name('T')
print T
T.display()
︡4b2dbe40-b802-4d1f-b593-d07bd2944b0d︡︡{"stdout":"field of symmetric bilinear forms 'T' on the 4-dimensional manifold 'M'\n","done":false}︡{"html":"<div>$T = c^{4} e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} \\rho\\left(r\\right) \\mathrm{d} t\\otimes \\mathrm{d} t + \\left( \\frac{c^{2} r P\\left(r\\right)}{c^{2} r - 2 \\, G m\\left(r\\right)} \\right) \\mathrm{d} r\\otimes \\mathrm{d} r + r^{2} P\\left(r\\right) \\mathrm{d} {\\theta}\\otimes \\mathrm{d} {\\theta} + r^{2} P\\left(r\\right) \\sin\\left({\\theta}\\right)^{2} \\mathrm{d} {\\phi}\\otimes \\mathrm{d} {\\phi}$</div>","done":false}︡{"done":true}
︠7d6194e5-0143-4a6e-a283-b81e6d8db6b2︠
Ttrace = (T.up(g, 0)).trace(0, 1)
Ttrace.display()
︡8963ab86-ddda-49f1-acca-1c02c2d0fdc7︡︡{"html":"<div>$\\begin{array}{llcl} &amp; \\mathcal{M} &amp; \\longrightarrow &amp; \\mathbb{R} \\\\ &amp; \\left(t, r, {\\theta}, {\\phi}\\right) &amp; \\longmapsto &amp; -c^{2} \\rho\\left(r\\right) + 3 \\, P\\left(r\\right) \\end{array}$</div>","done":false}︡{"done":true}
︠f5fde047-786b-4ab6-a749-1bec1933a575i︠
%md
Three components of the Einstein equations are as follows - the $E_{tt}$ one: 
︡42afb71e-896b-4de5-b487-179df2537607︡︡{"done":true,"md":"Three components of the Einstein equations are as follows - the $E_{tt}$ one:"}
︠8ce6d6df-5957-4189-b061-4c9c0627d1fa︠
E0=(E[0,0] - (8*pi*G/c^4)*T[0,0]).expr() == 0
︡d0db8cc3-eb33-4c8c-8391-815510f6687f︡︡{"done":true}
︠f5656d5e-ae93-4ed3-aa79-a1da3fc06183i︠
%md
A small reorganization of the first equation, using the function solve() to solve for $dm/dr$: 
︡ed6a9973-cdc7-4007-a5f7-cdf6254802b7︡︡{"done":true,"md":"A small reorganization of the first equation, using the function solve() to solve for $dm/dr$:"}
︠1cbbaf7c-d90a-4b8d-8e56-eb36f889e836︠
E0 = solve((E0*(-r^2/(G*exp(2*nu))/2)).expand().simplify(), m.diff(r))[0]
︡60cf2638-3d23-4c78-b72e-3886989e3ab9︡︡{"done":true}
︠4e2f57bf-3de0-42a3-a6cc-3c2a6a8ae9a2i︠
%md
Using SageManifolds ExpressionNice to display the derivatives in textbook form: 
︡af9595e1-2c78-47cc-aa61-75bebe527e33︡︡{"done":true,"md":"Using SageManifolds ExpressionNice to display the derivatives in textbook form:"}
︠6547a678-8f61-435b-a47e-c8af16e409b6︠
from sage.geometry.manifolds.utilities import ExpressionNice
︡c16c38fe-8bb6-460e-9249-cf68ef141585︡︡{"done":true}
︠0e3806a8-eba3-4414-9ce1-5f31850d9b67︠
ExpressionNice(E0)
︡e63b37ca-a696-4266-aad4-1b6cf33e460a︡︡{"html":"<div>$\\frac{\\partial\\,m}{\\partial r} = 4 \\, \\pi r^{2} \\rho\\left(r\\right)$</div>","done":false}︡{"done":true}
︠1e709320-fd00-4344-9e80-83d9aa8a3d4ci︠
%md
Radial component of Einstein's equations, $E_{rr}$: 
︡f3e2a5ae-7429-408f-8e11-5f494eb584ca︡︡{"done":true,"md":"Radial component of Einstein's equations, $E_{rr}$:"}
︠f4722f25-72bf-49c5-9366-1e66f6921b79︠
E1 = (E[1,1] - (8*pi*G/c^4)*T[1,1]).expr() == 0
︡d75d8527-e528-451a-b654-e31a8db30385︡︡{"done":true}
︠676079e6-a617-47c1-aa77-fd21253fa447︠
E1 = solve((E1*(c^4*r^3 - 2*G*c^2*r^2*m)/2).expand().simplify_full(), nu.diff(r))[0]
ExpressionNice(E1)
︡d6ecf32a-6916-49b1-a98e-65ff5c3b198e︡︡{"html":"<div>$\\frac{\\partial\\,\\nu}{\\partial r} = \\frac{{\\left(4 \\, \\pi r^{3} P\\left(r\\right) + c^{2} m\\left(r\\right)\\right)} G}{c^{4} r^{2} - 2 \\, G c^{2} r m\\left(r\\right)}$</div>","done":false}︡{"done":true}
︠af844a47-dbaf-4759-b0d5-cd1e9b884fd0i︠
%md
For the third equation we use radial part of the energy-momentum conservation equation $\nabla_\mu T^{\mu\nu}$. First, to define the energy-momentum tensor $T^{\mu\nu}$ itself:
︡63e94a43-a613-42db-a268-a7b041052242︡︡{"done":true,"md":"For the third equation we use radial part of the energy-momentum conservation equation $\\nabla_\\mu T^{\\mu\\nu}$. First, to define the energy-momentum tensor $T^{\\mu\\nu}$ itself:"}
︠d8947141-0e3c-4086-9e2a-3ecfc132d627︠
Tup = T.up(g,0).up(g,1)
Tup[:]
︡b79edd8f-16ae-484a-a919-2294ab078248︡︡{"html":"<div>$\\left(\\begin{array}{rrrr}\ne^{\\left(-2 \\, \\nu\\left(r\\right)\\right)} \\rho\\left(r\\right) &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; \\frac{c^{2} r P\\left(r\\right) - 2 \\, G P\\left(r\\right) m\\left(r\\right)}{c^{2} r} &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; \\frac{P\\left(r\\right)}{r^{2}} &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; \\frac{P\\left(r\\right)}{r^{2} \\sin\\left({\\theta}\\right)^{2}}\n\\end{array}\\right)$</div>","done":false}︡{"done":true}
︠33157485-5f9a-431e-aef7-3cf58e856acei︠
%md
Connection ${\tt nab}$ for the covariant derivative, and the printout of the non-vanishing Christoffel symbols:  
︡549f6222-7f14-4917-ac09-46ac4f4acab4︡︡{"done":true,"md":"Connection ${\\tt nab}$ for the covariant derivative, and the printout of the non-vanishing Christoffel symbols:"}
︠9edf4613-d8b9-4626-a7fa-ba6c6754674b︠
nab = g.connection()
nab.display()
︡9d732a1a-efea-437f-a69e-26f0baebcf39︡︡{"html":"<div>$\\begin{array}{lcl} \\Gamma_{ \\phantom{\\, t } \\, t \\, r }^{ \\, t \\phantom{\\, t } \\phantom{\\, r } } &amp; = &amp; \\frac{\\partial\\,\\nu}{\\partial r} \\\\ \\Gamma_{ \\phantom{\\, t } \\, r \\, t }^{ \\, t \\phantom{\\, r } \\phantom{\\, t } } &amp; = &amp; \\frac{\\partial\\,\\nu}{\\partial r} \\\\ \\Gamma_{ \\phantom{\\, r } \\, t \\, t }^{ \\, r \\phantom{\\, t } \\phantom{\\, t } } &amp; = &amp; \\frac{c^{2} r e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} \\frac{\\partial\\,\\nu}{\\partial r} - 2 \\, G e^{\\left(2 \\, \\nu\\left(r\\right)\\right)} m\\left(r\\right) \\frac{\\partial\\,\\nu}{\\partial r}}{r} \\\\ \\Gamma_{ \\phantom{\\, r } \\, r \\, r }^{ \\, r \\phantom{\\, r } \\phantom{\\, r } } &amp; = &amp; \\frac{{\\left(r \\frac{\\partial\\,m}{\\partial r} - m\\left(r\\right)\\right)} G}{c^{2} r^{2} - 2 \\, G r m\\left(r\\right)} \\\\ \\Gamma_{ \\phantom{\\, r } \\, {\\theta} \\, {\\theta} }^{ \\, r \\phantom{\\, {\\theta} } \\phantom{\\, {\\theta} } } &amp; = &amp; -\\frac{c^{2} r - 2 \\, G m\\left(r\\right)}{c^{2}} \\\\ \\Gamma_{ \\phantom{\\, r } \\, {\\phi} \\, {\\phi} }^{ \\, r \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\frac{c^{2} r \\sin\\left({\\theta}\\right)^{2} - 2 \\, G m\\left(r\\right) \\sin\\left({\\theta}\\right)^{2}}{c^{2}} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, r \\, {\\theta} }^{ \\, {\\theta} \\phantom{\\, r } \\phantom{\\, {\\theta} } } &amp; = &amp; \\frac{1}{r} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, {\\theta} \\, r }^{ \\, {\\theta} \\phantom{\\, {\\theta} } \\phantom{\\, r } } &amp; = &amp; \\frac{1}{r} \\\\ \\Gamma_{ \\phantom{\\, {\\theta} } \\, {\\phi} \\, {\\phi} }^{ \\, {\\theta} \\phantom{\\, {\\phi} } \\phantom{\\, {\\phi} } } &amp; = &amp; -\\cos\\left({\\theta}\\right) \\sin\\left({\\theta}\\right) \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, r \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, r } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{1}{r} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, {\\theta} \\, {\\phi} }^{ \\, {\\phi} \\phantom{\\, {\\theta} } \\phantom{\\, {\\phi} } } &amp; = &amp; \\frac{\\cos\\left({\\theta}\\right)}{\\sin\\left({\\theta}\\right)} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, {\\phi} \\, r }^{ \\, {\\phi} \\phantom{\\, {\\phi} } \\phantom{\\, r } } &amp; = &amp; \\frac{1}{r} \\\\ \\Gamma_{ \\phantom{\\, {\\phi} } \\, {\\phi} \\, {\\theta} }^{ \\, {\\phi} \\phantom{\\, {\\phi} } \\phantom{\\, {\\theta} } } &amp; = &amp; \\frac{\\cos\\left({\\theta}\\right)}{\\sin\\left({\\theta}\\right)} \\end{array}$</div>","done":false}︡{"done":true}
︠6348a99c-448f-4d0b-8acb-6ed04faa5d3a︠
co = nab(Tup)
︡d33503d3-751a-4f41-a566-308828e9d5f5︡︡{"done":true}
︠77665d6e-5fbb-4c21-9156-da4b0fce7439i︠
%md
The following calculates the radial component of $\nabla_\mu T^{\mu\nu}$: 
︡4a1b4b01-2339-4ef5-a1b0-a0cd8557cdef︡︡{"done":true,"md":"The following calculates the radial component of $\\nabla_\\mu T^{\\mu\\nu}$:"}
︠d6fec1ac-9dcc-45bb-abad-6125f1a9edb2︠
cosum = 0
# radial component of the covariant derivative:
for i in M.irange():
    cosum += co[i,1,i]
cosum
︡41847486-6c35-4c3e-9375-7d66293cc083︡︡{"html":"<div>$\\frac{c^{2} r \\frac{\\partial\\,P}{\\partial r} - 2 \\, {\\left(m\\left(r\\right) \\frac{\\partial\\,P}{\\partial r} + {\\left(c^{2} m\\left(r\\right) \\rho\\left(r\\right) + P\\left(r\\right) m\\left(r\\right)\\right)} \\frac{\\partial\\,\\nu}{\\partial r}\\right)} G + {\\left(c^{4} r \\rho\\left(r\\right) + c^{2} r P\\left(r\\right)\\right)} \\frac{\\partial\\,\\nu}{\\partial r}}{c^{2} r}$</div>","done":false}︡{"done":true}
︠a0a651ac-920d-4b3f-8d97-5f6ff672cc53i︠
%md
Solve for $dp/dr$: 
︡c0871fdd-9bdf-4a76-919f-1f414dec7e6d︡︡{"done":true,"md":"Solve for $dp/dr$:"}
︠bf5f1ef7-72c8-415f-afeb-fec922d5dfa1︠
E2 = solve(cosum.expr(), p.diff(r))[0]
ExpressionNice(E2)
︡7232b36a-72c7-4e99-b6ff-d269e4ac4553︡︡{"html":"<div>$\\frac{\\partial\\,P}{\\partial r} = -{\\left(c^{2} \\rho\\left(r\\right) + P\\left(r\\right)\\right)} \\frac{\\partial\\,\\nu}{\\partial r}$</div>","done":false}︡{"done":true}
︠ba51ed70-7545-4587-b512-923735206aa3i︠
%md
Finally, the three TOV equations: 
︡561320d1-6737-4c51-8d03-ef7788a2ee9d︡︡{"done":true,"md":"Finally, the three TOV equations:"}
︠d75557c0-1aa5-42f9-998e-a68a2445b6dc︠
ExpressionNice(E0), ExpressionNice(E1), ExpressionNice(E2)
︡68680622-8c4f-45b4-aa74-c263cfc60dd0︡︡{"html":"<div>($\\frac{\\partial\\,m}{\\partial r} = 4 \\, \\pi r^{2} \\rho\\left(r\\right)$, $\\frac{\\partial\\,\\nu}{\\partial r} = \\frac{{\\left(4 \\, \\pi r^{3} P\\left(r\\right) + c^{2} m\\left(r\\right)\\right)} G}{c^{4} r^{2} - 2 \\, G c^{2} r m\\left(r\\right)}$, $\\frac{\\partial\\,P}{\\partial r} = -{\\left(c^{2} \\rho\\left(r\\right) + P\\left(r\\right)\\right)} \\frac{\\partial\\,\\nu}{\\partial r}$)</div>","done":false}︡{"done":true}
︠7cb3f628-f208-4af0-b865-d25c481e484f︠










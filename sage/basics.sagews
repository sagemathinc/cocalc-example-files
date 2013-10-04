︠5eb63087-9306-44bd-8d96-ce0a74839ee3i︠
%md
## Sage Basics

Evaluate all cells via pressing the `Shift`+`Return` keys or the small "play" button in the menu.

︡12fbd4c0-f8e2-4b08-8b03-79b5b1abf4fb︡{"html":"<h2>Sage Basics</h2>\n\n<p>Evaluate all cells via pressing the <code>Shift</code>+<code>Return</code> keys or the small &#8220;play&#8221; button in the menu.</p>\n"}︡
︠e3f5916d-1904-41e1-b02c-2b60185db6a5︠
x = var('x')
solve(2*x^2 + 3 * x - 10 == 0, x)
︡c93eed45-6be0-4c97-b1f3-9363b2518288︡{"stdout":"[x == -1/4*sqrt(89) - 3/4, x == 1/4*sqrt(89) - 3/4]\n"}︡
︠edeeb0ed-8818-43e7-a96c-4b702a64ae6c︠
# expressions
var('x y z')
ex1 = 2 * x / (1 + x + y ^2) * sin(x*z)
ex2 = ex1 / x / sin(x*z)
show(ex1)
show(ex2)
︠3f2d7a03-8b3d-47f8-980a-79bda1f390e8︠
phi = var('phi')
find_root(cos(phi) * sin(tan(phi - pi/2)) == sqrt(phi), 0, 2 * pi)
︡c32787cd-d140-4090-9158-ce2871753c10︡{"stdout":"0.2637894422530672"}︡{"stdout":"\n"}︡
︠77f17302-71e3-4aa0-8287-df2e9f72c6bd︠
diff(sin(x^2), x, 4)
︡93dabe7e-4481-4114-b560-03c86187cb83︡{"stdout":"16*x^4*sin(x^2) - 48*x^2*cos(x^2) - 12*sin(x^2)\n"}︡
︠eb66dad4-8d19-4cc0-a0f9-bab4a50a20fa︠
A = Matrix(ZZ, [[1,2,-3],[3,2,1],[1,1,1]])
A.inverse()
︡9bdd2416-ed9e-4744-bfd3-e15a5bfe718b︡{"stdout":"[-1/6  5/6 -4/3]\n[ 1/3 -2/3  5/3]\n[-1/6 -1/6  2/3]\n"}︡
︠19ebea0e-039d-4f29-a70f-c9cb776a53d5︠
A2 = A.change_ring(RDF)
A2.inverse()
︡606ca2bd-1739-44e6-bf89-54399c658d46︡{"stdout":"[-0.166666666667  0.833333333333  -1.33333333333]\n[ 0.333333333333 -0.666666666667   1.66666666667]\n[-0.166666666667 -0.166666666667  0.666666666667]"}︡{"stdout":"\n"}︡
︠2b15a82c-41d6-47d3-8a61-f2582697b1ce︠
v = vector(ZZ, [-4, 0, 1])
s = A \ v
s
︡14221feb-08c3-4c59-95e7-4448a9d8e60c︡{"stdout":"(-2/3, 1/3, 4/3)\n"}︡
︠cab27b12-58d5-4b9d-bc8c-903c589bf6e0︠
v == A * s
︡db351962-8419-4d77-a10f-2a0a401b3d87︡{"stdout":"True\n"}︡
︠ce05bff7-c361-4db4-be6d-5dc2060a6b81︠
A.echelon_form()
︡059372c2-2be4-413f-ba08-52be40eb26ae︡{"stdout":"[1 0 5]\n[0 1 2]\n[0 0 6]\n"}︡
︠64be15ef-7706-41b1-aff6-6347a36d0ab4︠
E = EllipticCurve('131a')
E.plot()
︡5a3e12d5-ff1f-40be-a4ca-500953588ca9︡{"file":{"show":true,"uuid":"6fd688ad-ddb4-4c31-bf42-66b4f53513db","filename":"/mnt/home/2Qrdjpk5/.sage/temp/compute3a/31270/tmp_LFLywp.png"}}︡
︠a8804e64-497d-4124-aa91-f11e0daa9418i︠
E2 = E.change_ring(GF(101))
E2.plot()
︡e0164ed6-a08d-4361-bd9f-e732f6ff593e︡{"file":{"show":true,"uuid":"bfaaf341-656b-49f1-a8ea-c979284e94e2","filename":"/mnt/home/2Qrdjpk5/.sage/temp/compute3a/31270/tmp_dE7T9_.png"}}︡
︠282581a4-95e3-47d6-921a-b671e21fc702︠
bessel_J(2.1,1, 'pari', 250)
︡232fa6b7-7a2b-43a0-97d2-3548cda441b3︡{"stdout":"0.097838255257252160061715725960235803678515571060227678839771094653725501184\n"}︡
︠54bf1c1f-c0df-42a7-97fa-682003e2f6c7︠

show(sum(plot(lambda x : bessel_J(x, k), (x, -pi, 3 * pi), color=Color((k/5.,1-k/5., 1))) for k in range(1,5)))
︡f5d92474-fdf5-4b28-86fa-7c49ee63b185︡{"file":{"show":true,"uuid":"43ae546d-83bb-4d89-9561-66cabc29c358","filename":"/mnt/home/2Qrdjpk5/.sage/temp/compute3a/31270/tmp__iRuio.png"}}︡
︠f7418ece-7989-444e-8c43-19961ca91b41︠










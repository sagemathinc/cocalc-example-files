︠882071fb-f9cd-4ca2-99c6-e96a30404130︠
%md
Sympy
-----
Cells are evaluated in Sage, hence there are a few differences.

* Raw Python integer numbers are entered by appending an `r`, like `42r`.
* The `^` symbol automatically expands to `**`

︡39b55391-3d11-4f90-8baf-cc0c455edf96︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/mnt/home/2Qrdjpk5/.sagemathcloud/sage_server.py\", line 494, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nKeyError: 6\n"}︡
︠e193d9e4-c00f-489d-a7a5-7229bd024d65a︠
from __future__ import division
from sympy import *
x, y, z, t = symbols('x y z t')
k, m, n = symbols('k m n', integer=True)
f, g, h = symbols('f g h', cls=Function)
︡a9c9959d-b204-42b4-8e4b-0533558bf8ff︡
︠d461d4ef-c468-412c-a8bf-d268f0196b5b︠
ex = x * log(2*x) / log(x)
simplify(ex)
︡c5770e86-bda6-40d7-b784-bbecf060af6f︡{"stdout":"x + x*log(2)/log(x)\n"}︡
︠66826ac7-fc7f-41b4-ac1d-f4449118976b︠
ex.subs({x : 2*pi})
︡9bb50311-ce67-4371-9237-854c3fb3b118︡{"stdout":"2*pi*log(4*pi)/log(2*pi)\n"}︡
︠d79457ad-9526-4a47-866e-20722748580d︠
limit((x-3*x^2)/(1-x-2 * x^2), x, oo)
︡ac6ff81c-1ce1-4690-b1da-12a2e9240e94︡{"stdout":"3/2"}︡{"stdout":"\n"}︡
︠aabd2cc1-95bd-4f04-ac8b-d8ab507e058d︠
expr = (x^2 - 1)/(x - 1)
print expr
print expr.cancel()
︡b6f64254-ae69-475c-a105-46dbb57f7c1c︡{"stdout":"(x**2 - 1)/(x - 1)\n"}︡{"stdout":"x + 1\n"}︡
︠81817e50-2c7e-4799-a5b8-3d799512cea5︠
expr2 = log(expr).integrate(x)
pprint(expr2, use_unicode=True)
︡9f6103f7-077c-43e1-824d-ff09be22ae09︡{"stdout":"     ⎛   2         ⎞          ⎛   2         ⎞\n     ⎜  x       1  ⎟          ⎜  x       1  ⎟\nx⋅log⎜───── - ─────⎟ - x + log⎜───── - ─────⎟\n     ⎝x - 1   x - 1⎠          ⎝x - 1   x - 1⎠\n"}︡
︠6135d32b-2f30-4ecf-9a3f-3da6412ce91c︠
%latex
latex(expr2)
︡06d6d276-614f-4d00-a250-d796fa59c528︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/mnt/home/2Qrdjpk5/.sagemathcloud/sage_server.py\", line 494, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nKeyError: 5\n"}︡
︠c31ed3d3-1fe6-4967-a240-9f7afc9fca53︠
@interact
def diffit(i = slider(range(7), default = 3)):
    expr = sin(i * x) ^ (i * x)
    pprint(expr, use_unicode=True)
    print
    dexpr = expr.diff(x, i)
    pprint(dexpr, use_unicode=True)
︡124527e9-b4fe-48f0-a050-6a50d01357e0︡{"interact":{"style":"None","flicker":false,"layout":[[["i",12,null]],[["",12,null]]],"id":"a6a299f4-a93e-4cff-ab52-58fbba893a3f","controls":[{"control_type":"slider","default":3,"var":"i","width":null,"vals":["0","1","2","3","4","5","6"],"animate":true,"label":"i","display_value":true}]}}︡
︠9caffed7-1ba8-4523-94ec-560ac3e363b0︠
︡3dd0ad2e-275d-4703-bded-2e32bbb89377︡
︠63e98b73-4ab4-4df3-bb7d-1ac8e0960a57︠











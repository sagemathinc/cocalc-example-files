︠d8ea3ebc-3789-4e21-8858-fe82d61caec5i︠
%md
Sympy
-----

Cells are evaluated in Sage, hence there are a few differences.

* Raw Python integer numbers are entered by appending an `r`, like `42r`.
* The `^` symbol automatically expands to `**`.
︡9e71c464-5bd9-4a9f-844b-51c6dc1334b6︡{"html":"<h2>Sympy</h2>\n\n<p>Cells are evaluated in Sage, hence there are a few differences.</p>\n\n<ul>\n<li>Raw Python integer numbers are entered by appending an <code>r</code>, like <code>42r</code>.</li>\n<li>The <code>^</code> symbol automatically expands to <code>**</code>.</li>\n</ul>\n"}︡
︠12e9d2b0-4c5f-49d3-b625-0d320e397c8aa︠
%auto
from __future__ import division
import sympy as sy
from sympy import symbols, log, pi, oo, pprint, Function, limit
x, y, z, t = symbols('x y z t')
k, m, n = symbols('k m n', integer=True)
f, g, h = symbols('f g h', cls=Function)
︡f42726ae-e04c-4745-9ddd-0961ac9235ca︡{"auto":true}︡
︠d461d4ef-c468-412c-a8bf-d268f0196b5b︠
ex = x * log(2*x) / log(x)
simplify(ex)
︡4df71821-c1e0-4987-9c9f-2289fccf74d9︡{"stdout":"x + x*log(2)/log(x)\n"}︡
︠66826ac7-fc7f-41b4-ac1d-f4449118976b︠
ex.subs({x : 2*pi})
︡20b26977-6a28-40dd-a9f4-b57754660ed6︡{"stdout":"2*pi*log(4*pi)/log(2*pi)\n"}︡
︠d79457ad-9526-4a47-866e-20722748580d︠
limit((x-3*x^2)/(1-x-2 * x^2), x, oo)
︡8b833874-ae75-46e1-92f2-2e265b4f6106︡{"stdout":"3/2"}︡{"stdout":"\n"}︡
︠aabd2cc1-95bd-4f04-ac8b-d8ab507e058d︠
expr = (x^2 - 1)/(x - 1)
print expr
print expr.cancel()
︡32fa59d3-2789-4a50-b688-06b7e60bd143︡{"stdout":"(x**2 - 1)/(x - 1)\n"}︡{"stdout":"x + 1\n"}︡
︠81817e50-2c7e-4799-a5b8-3d799512cea5︠
expr2 = log(expr).integrate(x)
pprint(expr2, use_unicode=True)
︡2c44f3b9-a655-4d06-b169-9187cf09cbcd︡{"stdout":"     ⎛   2         ⎞          ⎛   2         ⎞\n     ⎜  x       1  ⎟          ⎜  x       1  ⎟\nx⋅log⎜───── - ─────⎟ - x + log⎜───── - ─────⎟\n     ⎝x - 1   x - 1⎠          ⎝x - 1   x - 1⎠\n"}︡
︠6135d32b-2f30-4ecf-9a3f-3da6412ce91c︠
@interact
def diffit(i = slider(range(7), default = 3)):
    expr = sin(i * x) ^ (i * x)
    pprint(expr, use_unicode=True)
    print
    dexpr = expr.diff(x, i)
    pprint(dexpr, use_unicode=True)
︡b44ecf3e-25cd-4f43-b806-045e8c913ca3︡{"interact":{"style":"None","flicker":false,"layout":[[["i",12,null]],[["",12,null]]],"id":"8a863777-3a15-4b6b-a647-41761296b572","controls":[{"control_type":"slider","default":3,"var":"i","width":null,"vals":["0","1","2","3","4","5","6"],"animate":true,"label":"i","display_value":true}]}}︡
︠9caffed7-1ba8-4523-94ec-560ac3e363b0︠
︡e489dbef-5cfa-442e-9a86-03e809cb8b77︡
︠63e98b73-4ab4-4df3-bb7d-1ac8e0960a57︠











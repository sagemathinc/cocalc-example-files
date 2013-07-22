︠191922d8-6385-4a48-a8a0-df9f7dcd9386i︠
%md
Sympy Code Generating Test
--------------------------

* [Codegen](http://docs.sympy.org/dev/modules/utilities/codegen.html)
* [Autowrap](http://docs.sympy.org/dev/modules/utilities/autowrap.html)
︡12577e2c-c3d2-40a4-8c4c-e3d43188e02b︡{"html":"<h2>Sympy Code Generating Test</h2>\n\n<ul>\n<li><a href=\"http://docs.sympy.org/dev/modules/utilities/codegen.html\">Codegen</a></li>\n<li><a href=\"http://docs.sympy.org/dev/modules/utilities/autowrap.html\">Autowrap</a></li>\n</ul>\n"}︡
︠a4d795ec-6f92-453a-89b5-1b1fa8c959eda︠
%auto
from sympy.utilities.codegen import codegen
from sympy.utilities.autowrap import autowrap, binary_function
from sympy import symbols, oo, pprint, IndexedBase, Idx, Eq
︡178fb8d4-bf9f-4799-baf8-079bca6a9b71︡{"auto":true}︡
︠99a0e7c3-0401-4f2b-8cfb-bce796fb4993︠
x, y, z = symbols('x y z')
expr = ((1-x+y-z**2)**7).expand()
#binary_callable = autowrap(expr)
#binary_callable(2,3,1)

f = binary_function('f', expr)
f(x,y).evalf(2, subs = {x:1.1, y : -2.2})

︡0e7ecd1d-43de-4b2b-ae39-f33d1020840c︡{"stderr":"Error in lines 5-5\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/mnt/home/2Qrdjpk5/.sagemathcloud/sage_server.py\", line 494, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/usr/local/sage/sage-5.10.rc1/local/lib/python2.7/site-packages/sympy/utilities/autowrap.py\", line 406, in binary_function\n    binary = autowrap(expr, **kwargs)\n  File \"/usr/local/sage/sage-5.10.rc1/local/lib/python2.7/site-packages/sympy/utilities/autowrap.py\", line 386, in autowrap\n    return code_wrapper.wrap_code(routine, helpers=helps)\n  File \"/usr/local/sage/sage-5.10.rc1/local/lib/python2.7/site-packages/sympy/utilities/autowrap.py\", line 129, in wrap_code\n    self._process_files(routine)\n  File \"/usr/local/sage/sage-5.10.rc1/local/lib/python2.7/site-packages/sympy/utilities/autowrap.py\", line 153, in _process_files\n    \"Error while executing command: %s\" % \" \".join(command))\nCodeWrapError: Error while executing command: f2py -m wrapper_module_4 -c wrapped_code_4.f90\n"}︡
︠6d2c19be-d11e-4e60-813d-43f6124ba060︠
A, x, y = map(IndexedBase, ['A', 'x', 'y'])
m, n = symbols('m n', integer=True)
i = Idx('i', m)
j = Idx('j', n)
expr = Eq(y[i], A[i, j]*x[j])
pprint(expr, use_unicode=True)
︡f252813e-882c-4130-ab17-d0950fbe85e9︡{"stdout":"y[i] = A[i, j]⋅x[j]\n"}︡
︠f983eade-3615-4907-8e71-d63fdb2b5c4e︠
matvec = autowrap(expr)
matvec
︡2d593c6a-b156-448d-8bd3-3c60862a1c53︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/mnt/home/2Qrdjpk5/.sagemathcloud/sage_server.py\", line 494, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/usr/local/sage/sage-5.10.rc1/local/lib/python2.7/site-packages/sympy/utilities/autowrap.py\", line 386, in autowrap\n    return code_wrapper.wrap_code(routine, helpers=helps)\n  File \"/usr/local/sage/sage-5.10.rc1/local/lib/python2.7/site-packages/sympy/utilities/autowrap.py\", line 129, in wrap_code\n    self._process_files(routine)\n  File \"/usr/local/sage/sage-5.10.rc1/local/lib/python2.7/site-packages/sympy/utilities/autowrap.py\", line 153, in _process_files\n    \"Error while executing command: %s\" % \" \".join(command))\nCodeWrapError: Error while executing command: f2py -m wrapper_module_1 -c wrapped_code_1.f90\n"}︡
︠8a22b49e-ec69-4106-ad08-7a8ca0073332︠










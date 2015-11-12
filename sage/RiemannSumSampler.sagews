︠88503bcf-3c1b-4a32-90b7-1a994614f707i︠
%md
The purpose of this worksheet is to help illustrate the concept of Riemann sum.

It allows you to compare, both numerically and graphically,
$$
\int_a^bf(x)dx\qquad \mbox{and} \qquad \sum_{i=1}^nf(x_i^*)(x_i-x_{i-1})=\left(\frac{b-a}{n}\right)\sum_{i=1}^nf(x_i^*)
$$
namely the definite integral of any function $f$ over any interval $[a,b]$and its left $\left(\mbox{i.e.}\;x_i^*=x_{i-1}\right)$ / right $\left(\mbox{i.e.}\;x_i^*=x_i\right)$ / middle  $\left(\mbox{i.e.}\;x_i^*=(x_{i-1}+x_i)/2\right)$ Riemann sum with respect to the partition
$$x_i=a+i\left(\frac{b-a}{n}\right)\qquad i=0, 1, \ldots, n$$
of $[a,b]$ into $n$ subintervals of equal width. 
︡d7c31744-3c8a-4a52-909c-a00897c747cb︡︡{"done":true,"md":"The purpose of this worksheet is to help illustrate the concept of Riemann sum.\n\nIt allows you to compare, both numerically and graphically,\n$$\n\\int_a^bf(x)dx\\qquad \\mbox{and} \\qquad \\sum_{i=1}^nf(x_i^*)(x_i-x_{i-1})=\\left(\\frac{b-a}{n}\\right)\\sum_{i=1}^nf(x_i^*)\n$$\nnamely the definite integral of any function $f$ over any interval $[a,b]$and its left $\\left(\\mbox{i.e.}\\;x_i^*=x_{i-1}\\right)$ / right $\\left(\\mbox{i.e.}\\;x_i^*=x_i\\right)$ / middle  $\\left(\\mbox{i.e.}\\;x_i^*=(x_{i-1}+x_i)/2\\right)$ Riemann sum with respect to the partition\n$$x_i=a+i\\left(\\frac{b-a}{n}\\right)\\qquad i=0, 1, \\ldots, n$$\nof $[a,b]$ into $n$ subintervals of equal width."}
︠42fb6f41-aeb8-49f5-9c22-12df62063ad1i︠
%md
# First draft
︡5b8886aa-8e25-4131-b06c-320b7da5190d︡︡{"done":true,"md":"# First draft"}
︠375eae55-a492-4211-8797-d82ce2ae5faei︠
%md
In the cell below:
- Make your own choices for $f(x)$, $a$, $b$ and $n$.
- Set $t=0$ if you want a left Riemann sum, $t=1$ for a right one, and $t=0.5$ for a middle one.
- Evaluate and see the output.
︡91d25fa0-e52e-469a-a17a-ca6a62e767ad︡︡{"done":true,"md":"In the cell below:\n- Make your own choices for $f(x)$, $a$, $b$ and $n$.\n- Set $t=0$ if you want a left Riemann sum, $t=1$ for a right one, and $t=0.5$ for a middle one.\n- Evaluate and see the output."}
︠b5790215-0b6d-4263-b91e-681892b27668︠
f(x) = x^3-5*x+2 ### The function.
a = -1 ### The lower bound.
b = 2 ### The upper bound.
n = 18 ### The number of rectangles.
t = 1 ### 0 for a left Riemann sum, 1 for a right one, 0.5 for a middle one.
###############################################################################################
##########################Do not edit below this line.#########################################
###############################################################################################
I = integral(f(x), x, a, b).n()
delta = (b-a)/n; tdelta = t*delta; xk = a; L = []; S = 0
for k in range(n):
    L = L + [(xk, 0)]
    y = f(xk+tdelta)
    S = S + y
    L = L + [(xk,y)]
    xk = xk + delta
    L = L + [(xk, y)]
S = delta*S.n()
pretty_print('Integral = %s'%I)
pretty_print('Riemann Sum = %s'%S)
L = L + [(xk,0)]
G = plot(f(x), (x, a-(b-a)/20, b+(b-a)/20), color = 'red', thickness = 1)
G = G + plot(f(x), (x, a, b), color = 'red', thickness = 1, fill = true, fillcolor = 'grey')
G = G + polygon(L, edgecolor = 'black', rgbcolor = (t,t^2,1-t))
G.show(aspect_ratio = 'automatic')
︡9bd03070-e6db-4896-8434-5b0966f98ef4︡︡{"html":"<div align='center'>Integral = 2.25000000000000</div>","done":false}︡{"html":"<div align='center'>Riemann Sum = 1.77083333333333</div>","done":false}︡{"once":false,"done":false,"file":{"show":true,"uuid":"5719744a-e424-47fe-8d34-f8c7c0d6b25d","filename":"/projects/321def00-5f90-4be8-afb7-4d6ef7fd1e67/.sage/temp/compute4-us/16349/tmp_XUG7z3.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠37bc2ac4-2d20-43ff-a7a1-d46dcbd3d275i︠
%md
# Using the interactive capabilities of SageMath
︡5c38db94-9c8f-435d-958c-0eb9ad748f8d︡︡{"done":true,"md":"# Using the interactive capabilities of SageMath"}
︠1865760d-7881-426e-9994-045d3653c4ffi︠
%md
Evaluating the following cell will do the same thing as above, with some of the user-friendly options provided by @interact.
See http://wiki.sagemath.org/interact/ for more examples.
︡37851a67-dc1d-4f35-be92-5424022d8fdc︡︡{"done":true,"md":"Evaluating the following cell will do the same thing as above, with some of the user-friendly options provided by @interact.\nSee http://wiki.sagemath.org/interact/ for more examples."}
︠f1ff9b12-7d29-4ea6-ab78-81c69a5781d1︠
@interact
def _(f=input_box(default=x^3-5*x+2), a=input_box(default=-1), b=input_box(default=2), n=input_box(default=15), Method=['Left', 'Right', 'Middle']):
    if Method=='Left':
        t=0
    elif Method=='Right':
        t=1
    else:
        t=0.5
    f(x)=f
    I = integral(f(x), x, a, b).n()
    delta = (b-a)/n; tdelta = t*delta; xk = a; L = []; S = 0
    for k in range(n):
        L = L + [(xk, 0)]
        y = f(xk+tdelta)
        S = S + y
        L = L + [(xk,y)]
        xk = xk + delta
        L = L + [(xk, y)]
    S = delta*S.n()
    pretty_print('Integral = %s'%I)
    pretty_print('Riemann Sum = %s'%S)
    L = L + [(xk,0)]
    G = plot(f(x), (x, a-(b-a)/20, b+(b-a)/20), color = 'red', thickness = 1)
    G = G + plot(f(x), (x, a, b), color = 'red', thickness = 1, fill = true, fillcolor = 'grey')
    G = G + polygon(L, edgecolor = 'black', rgbcolor = (t,t^2,1-t))
    G.show(aspect_ratio = 'automatic')
︡d8825dcf-0fbc-4aad-8401-128d87a37eaa︡︡{"interact":{"style":"None","flicker":false,"layout":[[["f",12,null]],[["a",12,null]],[["b",12,null]],[["n",12,null]],[["Method",12,null]],[["",12,null]]],"id":"105c4a03-bcd0-445e-bb91-2fb00e2690a5","controls":[{"control_type":"input-box","default":"x^3 - 5*x + 2","label":"f","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"f","type":null},{"control_type":"input-box","default":-1,"label":"a","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"a","type":null},{"control_type":"input-box","default":2,"label":"b","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"b","type":null},{"control_type":"input-box","default":15,"label":"n","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"n","type":null},{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["Left","Right","Middle"],"label":"Method","nrows":null,"width":null,"var":"Method"}]},"done":false}︡{"done":true}
︠f000dd9e-c5d5-4409-a4f7-0e87c8812fc8i︠
%md
# Sharing our interact with the help of SageMathCell
︡ceea2449-a063-42ed-8117-6d3f02ada6cb︡︡{"done":true,"md":"# Sharing our interact with the help of SageMathCell"}
︠d08bed91-eef4-4c93-9f86-1e8943883ad0i︠
%md
Entering the above code in [SageMathCell](https://sagecell.sagemath.org/) allows us to share this interact easily.
[Here it is](https://sagecell.sagemath.org/?z=eJx9UstuqzAQ3VfqP3hTYQfIDbnK5kZI3VWR0k1ZRmlkwBCEYyMzqPD3dxxDHlVaL_DMnDNnHua1UiAMz-D5KRcFOdAirlTTwSHVPcUI7yTE_effcDXr_SULCH-AhxEC6QPAJqgH8WiFwLuAo87jnbcVBXgB8T6q8ng23qs8l8Lbs3_PTwRPVUzk2JHHuD0QL5wj5C3Nad3xoonXivv8-cq5Be1ZXDh7Q2JiV1MaLqkFAtLj8DgmmyvKHCkXEjgSaRpy9ketCUwRmJ2tNelr9PDe4rXbr0mC99hwoQ2psQgxXJWCKnbTlaVviU92tK8DsmD7KzQghA3VvivGrojVTjBp-EFnuJU5N4Yf303xU-lLjhU_M2fJdQGNEQDDoTG4Kuptxn0h86X1XjYPSR-VOHGlSNKdRl4y8u4KX0Z-w2gjNYyPQO0rhG7hywU-hz_ZCGZa4k5j4hmR438ExyqrlWhbDEXsKveGRb5L2of9XSAgRSXtbGA64ZwLvTRi8L5X0HIotaLbgIi8FBduKnlWo7gp0ylGIYDPZRCFwCaReXvUX5S3jcjgYDhU2ubyDvQJncxj_wFMqf2g&lang=sage).
︡6bbfdccd-6001-41ea-aaab-304bb060a8c0︡︡{"done":true,"md":"Entering the above code in [SageMathCell](https://sagecell.sagemath.org/) allows us to share this interact easily.\n[Here it is](https://sagecell.sagemath.org/?z=eJx9UstuqzAQ3VfqP3hTYQfIDbnK5kZI3VWR0k1ZRmlkwBCEYyMzqPD3dxxDHlVaL_DMnDNnHua1UiAMz-D5KRcFOdAirlTTwSHVPcUI7yTE_effcDXr_SULCH-AhxEC6QPAJqgH8WiFwLuAo87jnbcVBXgB8T6q8ng23qs8l8Lbs3_PTwRPVUzk2JHHuD0QL5wj5C3Nad3xoonXivv8-cq5Be1ZXDh7Q2JiV1MaLqkFAtLj8DgmmyvKHCkXEjgSaRpy9ketCUwRmJ2tNelr9PDe4rXbr0mC99hwoQ2psQgxXJWCKnbTlaVviU92tK8DsmD7KzQghA3VvivGrojVTjBp-EFnuJU5N4Yf303xU-lLjhU_M2fJdQGNEQDDoTG4Kuptxn0h86X1XjYPSR-VOHGlSNKdRl4y8u4KX0Z-w2gjNYyPQO0rhG7hywU-hz_ZCGZa4k5j4hmR438ExyqrlWhbDEXsKveGRb5L2of9XSAgRSXtbGA64ZwLvTRi8L5X0HIotaLbgIi8FBduKnlWo7gp0ylGIYDPZRCFwCaReXvUX5S3jcjgYDhU2ubyDvQJncxj_wFMqf2g&lang=sage)."}
︠90895610-d1ca-4332-b14c-b084401fcb6d︠










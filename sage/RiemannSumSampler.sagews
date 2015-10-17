︠88503bcf-3c1b-4a32-90b7-1a994614f707is︠
%md
The purpose of this brief worksheet is to help illustrate the concept of Riemann sum.

It allows you to compare, both numerically and graphically,
$$
\int_a^bf(x)dx\qquad \mbox{and} \qquad \sum_{i=1}^nf(x_i^*)(x_i-x_{i-1})=\left(\frac{b-a}{n}\right)\sum_{i=1}^nf(x_i^*)
$$
namely the definite integral of any function $f$ over any interval $[a,b]$and its left $\left(\mbox{i.e.}\;x_i^*=x_{i-1}\right)$ / right $\left(\mbox{i.e.}\;x_i^*=x_i\right)$ / middle  $\left(\mbox{i.e.}\;x_i^*=(x_{i-1}+x_i)/2\right)$ Riemann sum with respect to the partition
$$x_i=a+i\left(\frac{b-a}{n}\right)\qquad i=0, 1, \ldots, n$$
of $[a,b]$ into $n$ subintervals of equal width. 
︡d7c31744-3c8a-4a52-909c-a00897c747cb︡{"md":"The purpose of this brief worksheet is to help illustrate the concept of Riemann sum.\n\nIt allows you to compare, both numerically and graphically,\n$$\n\\int_a^bf(x)dx\\qquad \\mbox{and} \\qquad \\sum_{i=1}^nf(x_i^*)(x_i-x_{i-1})=\\left(\\frac{b-a}{n}\\right)\\sum_{i=1}^nf(x_i^*)\n$$\nnamely the definite integral of any function $f$ over any interval $[a,b]$and its left $\\left(\\mbox{i.e.}\\;x_i^*=x_{i-1}\\right)$ / right $\\left(\\mbox{i.e.}\\;x_i^*=x_i\\right)$ / middle  $\\left(\\mbox{i.e.}\\;x_i^*=(x_{i-1}+x_i)/2\\right)$ Riemann sum with respect to the partition\n$$x_i=a+i\\left(\\frac{b-a}{n}\\right)\\qquad i=0, 1, \\ldots, n$$\nof $[a,b]$ into $n$ subintervals of equal width. \n"}︡
︠375eae55-a492-4211-8797-d82ce2ae5faeis︠
%md
In the cell below:
- Make your own choices for $f(x)$, $a$, $b$ and $n$.
- Set $t=0$ if you want a left Riemann sum, $t=1$ for a right one, and $t=0.5$ for a middle one.
- Evaluate and see the output.
- Double-click to edit your settings.
︡91d25fa0-e52e-469a-a17a-ca6a62e767ad︡{"md":"In the cell below:\n- Make your own choices for $f(x)$, $a$, $b$ and $n$.\n- Set $t=0$ if you want a left Riemann sum, $t=1$ for a right one, and $t=0.5$ for a middle one.\n- Evaluate and see the output.\n- Double-click to edit your settings.\n"}︡
︠b5790215-0b6d-4263-b91e-681892b27668︠
f(x) = x^3-5*x+2 ### The function.
a = -1 ### The lower bound.
b = 2 ### The upper bound.
n = 15 ### The number of rectangles.
t = 1 ### 0 for a left Riemann sum, 1 for a right one, 0.5 for a middle one.
###############################################################################################
##########################Do not edit below this line.#########################################
###############################################################################################
html("Value of the definite integral $\displaystyle \int_a^bf(x)\,dx$:")
x = var('x'); I = integral(f(x), x, a, b); show(I.n())
html('Value of the Riemann sum $\displaystyle \sum_{i=1}^nf(x_i^*)(x_i-x_{i-1})$:')
delta = (b-a)/n; tdelta = t*delta; x = a; L = []; S = 0
for k in range(n):
    L = L + [(x, 0)]
    y = f(x+tdelta)
    S = S + y
    L = L + [(x,y)]
    x = x + delta
    L = L + [(x, y)]
S = delta*S; show(S.n())
L = L + [(x,0)]; x = var('x')
G = plot(f(x), (x, a-(b-a)/20, b+(b-a)/20), color = 'red', thickness = 1)
G = G + plot(f(x), (x, a, b), color = 'red', thickness = 1, fill = true, fillcolor = 'grey')
G = G + polygon(L, edgecolor = 'black', rgbcolor = (t,t^2,1-t))
G.show(aspect_ratio = 'automatic')
︡ef3be54d-0fdd-4aff-aeca-9bde291fbf30︡{"html":"Value of the definite integral $\\displaystyle \\int_a^bf(x)\\,dx$:"}︡{"html":"<div align='center'>$\\displaystyle 2.25000000000000$</div>"}︡{"html":"Value of the Riemann sum $\\displaystyle \\sum_{i=1}^nf(x_i^*)(x_i-x_{i-1})$:"}︡{"html":"<div align='center'>$\\displaystyle 1.68000000000000$</div>"}︡{"once":false,"file":{"show":true,"uuid":"93f81fdd-de1f-488b-919a-c9cce124f171","filename":"/projects/321def00-5f90-4be8-afb7-4d6ef7fd1e67/.sage/temp/compute4-us/31169/tmp_WbgUTM.svg"}}︡{"html":"<div align='center'></div>"}︡
︠37bc2ac4-2d20-43ff-a7a1-d46dcbd3d275︠










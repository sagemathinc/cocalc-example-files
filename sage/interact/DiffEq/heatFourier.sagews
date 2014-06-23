︠ab1b64a5-65f8-4846-b182-c128ac33c96c︠
var('x')
x0  = 0
k=1
f   = x*exp(-x^2)
p   = plot(f,0,2*pi, thickness=2)
c   = 1/pi
orden=10
alpha=[(n,c*numerical_integral(f*sin(x*n/2),0,2*pi)[0] ) for n in range(1,orden)]

@interact
def _(tiempo = (0.1*j for j in (0..10)) ):
    ft = sum( a*sin(x*n/2)*exp(-k*(n/2)^2*tiempo) for n,a in alpha)
    pt = plot(ft, 0, 2*pi, color='green', thickness=2)
    show( p + pt, ymin = -.2)
︡e89c3e02-494d-42ca-9b5b-f6e9a8e8f7cf︡{"stdout":"x\n"}︡{"interact":{"style":"None","flicker":false,"layout":[[["tiempo",12,null]],[["",12,null]]],"id":"60f12d1e-6fe5-45d6-afa9-9c9ffb7f56bf","controls":[{"control_type":"slider","default":0,"var":"tiempo","width":null,"vals":["0.000000000000000","0.100000000000000","0.200000000000000","0.300000000000000","0.400000000000000","0.500000000000000","0.600000000000000","0.700000000000000","0.800000000000000","0.900000000000000","1.00000000000000"],"animate":true,"label":"tiempo","display_value":true}]}}︡
︠7853e2cc-f96b-424b-9d43-34fcd4d40b8c︠










︠40498f9a-5871-45ee-a35e-f6eb5d480f38i︠
%md
Interactive Elements
︡7dac6e10-5a26-47eb-89e1-6e3b4e52053b︡{"html":"<p>Interactive Elements</p>\n"}︡
︠23f68532-7cac-4716-b716-773db178c3f3︠
u, x = var('u x')
@interact
def diff_interact(n = slider(range(1,10), default = 3)):
    ex = sin(2*x^2) * x
    show(latex(ex))
    show(latex(ex.diff(n)))

︡92019d97-e523-41af-b43d-8d18f762ec92︡{"interact":{"style":"None","flicker":false,"layout":[[["n",12,null]],[["",12,null]]],"id":"6925e8eb-5cda-4818-a127-04765bc4ca89","controls":[{"control_type":"slider","default":2,"var":"n","width":null,"vals":["1","2","3","4","5","6","7","8","9"],"animate":true,"label":"n","display_value":true}]}}︡
︠fa68aa2d-b93f-4131-aa57-a6241d2b1756︠










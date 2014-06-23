︠16765d23-9a12-417b-be50-0467cfed4a8a︠
L = [[-0.5, 2.0^(x/100.0) - 1 + sqrt(3.0)/2] for x in xrange(1000, -1, -1)]
R = [[0.5, 2.0^(x/100.0) - 1 + sqrt(3.0)/2] for x in xrange(1000)]
xes = [x/1000.0 for x in xrange(-500,501,1)]
M = [[x,abs(sqrt(x^2-1))] for x in xes]
fundamental_domain = L+M+R
fundamental_domain = [[x-1,y] for x,y in fundamental_domain]
@interact
def _(gen = selector(['t+1', 't-1', '-1/t'], buttons=True,nrows=1)):
    global fundamental_domain
    if gen == 't+1':
        fundamental_domain = [[x+1,y] for x,y in fundamental_domain]
    elif gen == 't-1':
        fundamental_domain = [[x-1,y] for x,y in fundamental_domain]
    elif gen == '-1/t':
        new_dom = []
        for x,y in fundamental_domain:
            sq_mod = x^2 + y^2
            new_dom.append([(-1)*x/sq_mod, y/sq_mod])
        fundamental_domain = new_dom
    P = polygon(fundamental_domain)
    P.ymax(1.2); P.ymin(-0.1)
    P.show()
︡64fe0b5c-3512-4794-9c62-fd4254c10889︡{"interact":{"style":"None","flicker":false,"layout":[[["gen",12,null]],[["",12,null]]],"id":"f0415528-4c3a-4ef8-924e-9537b4f8c807","controls":[{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["t+1","t-1","-1/t"],"label":"gen","nrows":1,"width":null,"var":"gen"}]}}︡
︠a946eb46-43ad-47b7-97cf-104508d8432b︠










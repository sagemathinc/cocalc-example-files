︠f8eff22e-9524-4603-a39e-fd89026fe542︠
def f(s, braces=True): 
    t = ', '.join(sorted(list(s)))
    if braces: return '{' + t + '}'
    return t
def g(s): return set(str(s).replace(',',' ').split())

@interact
def _(X='1,2,3,a', Y='2,a,3,4,apple', Z='a,b,10,apple'):
    S = [g(X), g(Y), g(Z)]
    X,Y,Z = S
    XY = X & Y
    XZ = X & Z
    YZ = Y & Z
    XYZ = XY & Z
    html('<center>')
    html("$X \cap Y$ = %s"%f(XY))
    html("$X \cap Z$ = %s"%f(XZ))
    html("$Y \cap Z$ = %s"%f(YZ))
    html("$X \cap Y \cap Z$ = %s"%f(XYZ))
    html('</center>')
    centers = [(cos(n*2*pi/3), sin(n*2*pi/3)) for n in [0,1,2]]
    scale = 1.7
    clr = ['yellow', 'blue', 'green']
    G = Graphics()
    for i in range(len(S)):
        G += circle(centers[i], scale, rgbcolor=clr[i], 
             fill=True, alpha=0.3)
    for i in range(len(S)):
        G += circle(centers[i], scale, rgbcolor='black')

    # Plot what is in one but neither other
    for i in range(len(S)):
        Z = set(S[i])
        for j in range(1,len(S)):
            Z = Z.difference(S[(i+j)%3])
        G += text(f(Z,braces=False), (1.5*centers[i][0],1.7*centers[i][1]), rgbcolor='black')


    # Plot pairs of intersections
    for i in range(len(S)):
        Z = (set(S[i]) & S[(i+1)%3]) - set(XYZ)
        C = (1.3*cos(i*2*pi/3 + pi/3), 1.3*sin(i*2*pi/3 + pi/3))
        G += text(f(Z,braces=False), C, rgbcolor='black')

    # Plot intersection of all three
    G += text(f(XYZ,braces=False), (0,0), rgbcolor='black')

    # Show it
    G.show(aspect_ratio=1, axes=False)
︡894d8b39-2312-4e1b-99bb-04b53738e06a︡{"interact":{"style":"None","flicker":false,"layout":[[["X",12,null]],[["Y",12,null]],[["Z",12,null]],[["",12,null]]],"id":"5741b9c1-2a2e-4fac-a305-90ff8f3ad00d","controls":[{"control_type":"input-box","default":"1,2,3,a","label":"X","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"X","type":"<type 'str'>"},{"control_type":"input-box","default":"2,a,3,4,apple","label":"Y","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"Y","type":"<type 'str'>"},{"control_type":"input-box","default":"a,b,10,apple","label":"Z","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"Z","type":"<type 'str'>"}]}}︡
︠410f44a7-e482-4bae-882b-501646e14b81︠










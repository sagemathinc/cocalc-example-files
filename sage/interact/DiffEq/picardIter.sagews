︠67cc9381-2791-4da7-bedb-608391128632︠
def picard_iteration(f, a, c, iterations):
    '''
    Computes the N-th Picard iterate for the IVP  

        x' = f(t,x), x(a) = c.

    EXAMPLES:
        sage: var('x t s')
        (x, t, s)
        sage: a = 0; c = 2
        sage: f = lambda t,x: 1-x
        sage: picard_iteration(f, a, c, 0)
        2
         sage: picard_iteration(f, a, c, 1)
        2 - t
        sage: picard_iteration(f, a, c, 2)
        t^2/2 - t + 2
        sage: picard_iteration(f, a, c, 3)
        -t^3/6 + t^2/2 - t + 2

    '''
    if iterations == 0:
        return c
    if iterations == 1:
        x0 = lambda t: c + integral(f(t=s,x=c), s, a, t)
        return expand(x0(t))
    for i in range(iterations):
        x_old = lambda s: picard_iteration(f, a, c, iterations-1).subs(t=s)
        x0 = lambda t: c + integral(f(t=s,x=x_old(s)), s, a, t)
    return expand(x0(t))

@interact
def picarder(n_iterations = slider(0,20,1,default = 2)):
    var('x,t,s')
    f = lambda t,x:x
    html("Exact solution to $x' = x$, $x(0) = 1$ is $x = \exp(t)$<br>")
    pic = picard_iteration(f,0,1,n_iterations)
    html('The Picard iteration approximation after ' + str(n_iterations) + ' iterations is:<br>')
    html('$'+latex(pic)+'$')
    exact = plot(exp(t),(t,0,2))
    pic_plot = plot(pic,(t,0,2), rgbcolor = (1,0,0))
    show(exact + pic_plot)
︡1e2ecb4c-5b93-49b5-aa6a-0d6916a03982︡{"interact":{"style":"None","flicker":false,"layout":[[["n_iterations",12,null]],[["",12,null]]],"id":"acefc23b-36a7-49cb-bc43-4cb16eab0460","controls":[{"control_type":"slider","default":2,"var":"n_iterations","width":null,"vals":["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"],"animate":true,"label":"n_iterations","display_value":true}]}}︡
︠f6212a93-4d42-41b7-a2f1-f135534b5956︠










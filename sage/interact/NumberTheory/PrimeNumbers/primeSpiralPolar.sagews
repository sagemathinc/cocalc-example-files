︠020aab09-6a0d-4b78-85c4-8ef72768ffbf︠
@interact
def polar_prime_spiral(start=1, end=2000, show_factors = false, highlight_primes = false, show_curves=true, n = 0):

    #For more information about the factors in the spiral, visit http://www.dcs.gla.ac.uk/~jhw/spirals/index.html by John Williamson.

    if start < 1 or end <=start: print "invalid start or end value"
    if n > end: print "WARNING: n is greater than end value"
    def f(n):
        return (sqrt(n)*cos(2*pi*sqrt(n)), sqrt(n)*sin(2*pi*sqrt(n)))

    list =[]
    list2=[]
    if show_factors == false:
        for i in [start..end]:
            if i.is_pseudoprime(): list.append(f(i-start+1)) #Primes list
            else: list2.append(f(i-start+1)) #Composites list
        P = points(list)
        R = points(list2, alpha = .1) #Faded Composites
    else:
        for i in [start..end]:
            list.append(disk((f(i-start+1)),0.05*pow(2,len(factor(i))-1), (0,2*pi))) #resizes each of the dots depending of the number of factors of each number
            if i.is_pseudoprime() and highlight_primes: list2.append(f(i-start+1))
        P = plot(list)
        p_size = 5 #the orange dot size of the prime markers
        if not highlight_primes: list2 = [(f(n-start+1))]
        R=points(list2, hue = .1, pointsize = p_size)

    if n > 0:
        print 'n =', factor(n)

        p = 1
    #The X which marks the given n
        W1 = disk((f(n-start+1)), p, (pi/6, 2*pi/6))
        W2 = disk((f(n-start+1)), p, (4*pi/6, 5*pi/6))
        W3 = disk((f(n-start+1)), p, (7*pi/6, 8*pi/6))
        W4 = disk((f(n-start+1)), p, (10*pi/6, 11*pi/6))
        Q = plot(W1+W2+W3+W4, alpha = .1)

        n=n-start+1        #offsets the n for different start values to ensure accurate plotting
        if show_curves:
            begin_curve = 0
            t = var('t')
            a=1
            b=0
            if n > (floor(sqrt(n)))^2 and n <= (floor(sqrt(n)))^2 + floor(sqrt(n)):
                c = -((floor(sqrt(n)))^2 - n)
                c2= -((floor(sqrt(n)))^2 + floor(sqrt(n)) - n)
            else:
                c = -((ceil(sqrt(n)))^2 - n)
                c2= -((floor(sqrt(n)))^2 + floor(sqrt(n)) - n)
            print 'Pink Curve:  n^2 +', c
            print 'Green Curve: n^2 + n +', c2
            def g(m): return (a*m^2+b*m+c);
            def r(m) : return sqrt(g(m))
            def theta(m) : return r(m)- m*sqrt(a)
            S1 = parametric_plot(((r(t))*cos(2*pi*(theta(t))),(r(t))*sin(2*pi*(theta(t)))), begin_curve, ceil(sqrt(end-start)), rgbcolor=hue(0.8), thickness = .2) #Pink Line

            b=1
            c= c2;
            S2 = parametric_plot(((r(t))*cos(2*pi*(theta(t))),(r(t))*sin(2*pi*(theta(t)))), begin_curve, ceil(sqrt(end-start)), rgbcolor=hue(0.6), thickness = .2) #Green Line

            show(R+P+S1+S2+Q, aspect_ratio = 1, axes = false)
        else: show(R+P+Q, aspect_ratio = 1, axes = false)
    else: show(R+P, aspect_ratio = 1, axes = false)
︡80410b15-900d-45fe-bd43-e6bb305d57ad︡{"interact":{"style":"None","flicker":false,"layout":[[["start",12,null]],[["end",12,null]],[["show_factors",12,null]],[["highlight_primes",12,null]],[["show_curves",12,null]],[["n",12,null]],[["",12,null]]],"id":"584cf3fd-4b4d-4c53-b308-956b8d5d642b","controls":[{"control_type":"input-box","default":1,"label":"start","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"start","type":null},{"control_type":"input-box","default":2000,"label":"end","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"end","type":null},{"default":false,"var":"show_factors","readonly":false,"control_type":"checkbox","label":"show_factors"},{"default":false,"var":"highlight_primes","readonly":false,"control_type":"checkbox","label":"highlight_primes"},{"default":true,"var":"show_curves","readonly":false,"control_type":"checkbox","label":"show_curves"},{"control_type":"input-box","default":0,"label":"n","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"n","type":null}]}}︡
︠24888d69-9306-404e-b899-a1c2de570659︠










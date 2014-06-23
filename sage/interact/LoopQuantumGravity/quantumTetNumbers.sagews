︠e9816ae9-a2e5-430c-a0e9-cee4cf0e939b︠
import numpy



@interact




def _(j1 = input_box(6.0, 'J1'),
      j2= input_box(6.0, 'J2'),
      j3= input_box(6.0, 'J3'),
      j4= input_box(7.0, 'J1'), auto_update=False):
    if (j1+j2)<= (j3+j4):
        html('<h3>Value of Angle eigenvalue in radians</h3>')
        d2=j3*(j3+1)
        d3=j1*(j1+1)
        d4=j2*(j2+1)
        d5=d2-d3-d4
        d6=2*sqrt(d3*d4)
        d7=d5/d6
        d8=arccos(d7)
        d8a=numerical_approx(d8, digits=4)
        angle = numerical_approx(d8*180/pi, digits=4)
        if angle != NaN:
             print 'angle between faces 1 and 2 in quantum tetrahedron = ',d8a, 'radians'
             print 'angle between faces 1 and 2 in quantum tetrahedron = ',angle,'degrees'        

        html('<h3>main sequence Area eigenvalues</h3>')
        lp=1.61619926*10^-35
        main1=numerical_approx(sqrt(j1*(j1+1)),digits=4)
        areamain1 =0.5*lp^2*main1
        print 'Area of face 1=', areamain1, 'm2' 
        main2=numerical_approx(sqrt(j2*(j2+1)),digits=4)
        areamain2 =0.5*lp^2*main2
        print 'Area of face 2=', areamain2, 'm2' 
        main3=numerical_approx(sqrt(j3*(j3+1)),digits=4)
        areamain3 =0.5*lp^2*main3
        print 'Area of face 3=', areamain3, 'm2' 
        main4=numerical_approx(sqrt(j4*(j4+1)),digits=4)
        areamain4 =0.5*lp^2*main4
        print 'Area of face 4=', areamain4, 'm2' 
        area = areamain1 + areamain3 +areamain3+areamain4
        print 'Total area of quantum tetrahedron =', area, 'm2'









        html('<h3>Values of Volume Eigenvalue</h3>')
        kmin = int(max(abs(j1-j2),abs(j3 -j4)))
        kmax = int(min((j1+j2),(j3 +j4)))
        d = kmax -kmin + 1
        y=numpy.arange(kmin,kmax+1,1)
        kmatrix = matrix(CDF,int(d), int(d))
        r=list()
        for j in range(d):
            k=int(y[j])
            c1 = -i*k
            c2 = sqrt(4*k*k - 1)
            c3 = sqrt(j1*(j1+1))
            c4 = sqrt((2*j1+1))
            c5 = sqrt(j3*(j3+1))
            c6 = sqrt((2*j3+1))
            c7 = wigner_6j(j1,1,j1,k,j2,k-1)
            c8 = wigner_6j(j3,1,j3,k,j4,k-1)
            a = c1*c2*c3*c4*c5*c6*c7*c8
            r.append(a)
            q=numerical_approx(a, digits=10)
            #print r
        for j in range(d-1):
            kmatrix[[j],[j+1]]=r[j+1]
            kmatrix[[j+1],[j]]=-r[j+1]
            #print kmatrix
    
        M = (2/9)*kmatrix
        #print M
        s=M.eigenvalues()
        #print s    
        lp3=6*10^-104
        for j in range(d):
            e= sqrt(s[j])
            vol = lp3*e
            volume = numerical_approx(vol, digits=2)
            if e.imag() ==0:
                print "volume eigenvalue =",(e)
                print "volume of tetrahedron =", volume, 'm3'
︡78f2f7d4-b552-415b-9da3-733615fae257︡{"interact":{"style":"None","flicker":false,"layout":[[["j1",12,null]],[["j2",12,null]],[["j3",12,null]],[["j4",12,null]],[["auto_update",12,null]],[["",12,null]]],"id":"15db7fd9-d696-40d0-b183-f92f45f12c3a","controls":[{"control_type":"input-box","default":"6.00000000000000","label":"J1","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"j1","type":null},{"control_type":"input-box","default":"6.00000000000000","label":"J2","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"j2","type":null},{"control_type":"input-box","default":"6.00000000000000","label":"J3","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"j3","type":null},{"control_type":"input-box","default":"7.00000000000000","label":"J1","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"j4","type":null},{"default":false,"var":"auto_update","readonly":false,"control_type":"checkbox","label":"auto_update"}]}}︡
︠f56a89d3-ddb4-449c-b876-ab5bfdfb4f30︠










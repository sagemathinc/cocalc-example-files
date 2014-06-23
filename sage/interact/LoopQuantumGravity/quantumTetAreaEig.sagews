︠de102178-7b8f-4c9b-9409-13dc366d3f40i︠
html('<h3>Quantum tetrahedron Volume and Angle Eigenvalues</h3>')
html('Enter the four J values into the input boxes')
html('k values k ranges from kmin to kmax in integer steps')
html('The dimension d of the Hilbert space H4,  d = kmax - kmin + 1')
html('kmin = max(|j1-j2|,|j3 -j4|) kmax = min(j1+j2,j3 +j4)')
html('The the dimension of the hilbert space is given by d = kmax -kmin + 1') 
html('V^2 =M = 2/9(real antisymmetrix matrix))')
html('Spins must satisfy (j1+j2)<= (j3+j4)')
html('Reference: Bohr-Sommerfeld Quantization of Space by Eugenio Bianchi and Hal M. Haggard ')
html('Reference: Shape in an atom of space: exploring quantum geometry phenomenology by Seth A. Major ')






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
        print "Angle eigenvalue in radians=",(d8)


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
                print "volume of tetrahedron in m3 =", volume
︡b8c23b7a-6ea2-4e73-b87e-6bf451c1d6ce︡{"html":"<h3>Quantum tetrahedron Volume and Angle Eigenvalues</h3>"}︡{"html":"Enter the four J values into the input boxes"}︡{"html":"k values k ranges from kmin to kmax in integer steps"}︡{"html":"The dimension d of the Hilbert space H4,  d = kmax - kmin + 1"}︡{"html":"kmin = max(|j1-j2|,|j3 -j4|) kmax = min(j1+j2,j3 +j4)"}︡{"html":"The the dimension of the hilbert space is given by d = kmax -kmin + 1"}︡{"html":"V^2 =M = 2/9(real antisymmetrix matrix))"}︡{"html":"Spins must satisfy (j1+j2)<= (j3+j4)"}︡{"html":"Reference: Bohr-Sommerfeld Quantization of Space by Eugenio Bianchi and Hal M. Haggard "}︡{"html":"Reference: Shape in an atom of space: exploring quantum geometry phenomenology by Seth A. Major "}︡{"interact":{"style":"None","flicker":false,"layout":[[["j1",12,null]],[["j2",12,null]],[["j3",12,null]],[["j4",12,null]],[["auto_update",12,null]],[["",12,null]]],"id":"ae41ec29-3cd6-4ffa-a532-10fc9c9e586d","controls":[{"control_type":"input-box","default":"6.00000000000000","label":"J1","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"j1","type":null},{"control_type":"input-box","default":"6.00000000000000","label":"J2","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"j2","type":null},{"control_type":"input-box","default":"6.00000000000000","label":"J3","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"j3","type":null},{"control_type":"input-box","default":"7.00000000000000","label":"J1","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"j4","type":null},{"default":false,"var":"auto_update","readonly":false,"control_type":"checkbox","label":"auto_update"}]}}︡
︠6b25b010-789d-4df3-9f27-99a663a9b4af︠










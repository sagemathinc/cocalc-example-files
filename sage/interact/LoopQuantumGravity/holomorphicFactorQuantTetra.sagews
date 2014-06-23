︠a63ebe0f-e0b4-4e14-80d7-d933c816bc7f︠
# -*- coding: utf-8 -*-
"""
Created on Mon Feb 10 20:05:11 2014

@author: David Horgan
"""

from scipy.optimize import fsolve
import math



#scene.range = 10

#cylinder(pos=(0,0,0), radius=1.0,axis=(0,0,1), color=color.white)

#scene2 = display(title='Examples of Tetrahedrons',
    # x=0, y=0, width=600, height=600,
    # center=(0,0,0), background=(1,1,1))

#scene2.visible = True
#scene2.range = 10




#unit circle plot
C = circle((0,0), 1)





#input points from unit circle

p1=0.6
p2=0.7


#face1
a1=(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 + 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
a2=(((1 - p2**2)/(2*(1 + p1)))**(1/4),  (1/2)*(p2 - 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0 )
a3=(((1/2)*( (1 + p1)**3)* (1 - p2**2))**(1/4),p2*((2*(1 + p1))/(1 - p2**2))**(1/4), sqrt(1 - p1**2)*((1 - p2**2)/(2*(1 + p1)))**(1/4) )
a=[a1,a2,a3]


#face2

b1=(0, 0, 0)
b2=(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 - 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
b3=(((1/2)*((1 + p1)**3)*(1 - p2**2))**(1/4),p2*((2*(1 + p1))/(1 - p2**2))**(1/4), sqrt(1-p1**2)*((1-p2**2)/(2*(1+p1)))**(1/4)  )
b=[b1,b2,b3]

#face3
c1=(0, 0, 0)
c2=( ((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 + 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
c3=(((1/2)*((1 + p1)**3)*(1 - p2**2))**(1/4), p2*((2*(1 + p1))/(1 - p2**2))**(1/4),  sqrt(1 - p1**2)*((1 - p2**2)/(2*(1 + p1)))**(1/4) )
c=[c1,c2,c3]


#face4
d1=(0, 0, 0)
d2=(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 + 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
d3 =(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 - 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
d=[d1,d2,d3]

#printresults
print 'a1=', a1
print 'a2=', a2
print 'a3=', a3

print 'b1=', b1
print 'b2=', b2
print 'b3=', b3

print 'c1=', c1
print 'c2=', c2
print 'c3=', c3

print 'd1=', d1
print 'd2=', d2
print 'd3=', d3



G = Graphics()

#tetrahedron faces - coloured
P1=polygon([a1,a2, a3], color='red')
P2=polygon([b1,b2, b3],color='yellow')
P3=polygon([c1,c2, c3],color='blue')
P4=polygon([d1,d2, d3],color='green')

#polygon faces
#P1=polygon([a1,a2, a3])
#P2=polygon([b1,b2, b3])
#P3=polygon([c1,c2, c3])
#P4=polygon([d1,d2, d3])

#polygon([a1,a2, a3])
#polygon([b1,b2, b3])
#polygon([c1,c2, c3])
#polygon([d1,d2, d3])

g=G+P1+P2+P3+P4
show(g, title='tet(w)', viewer='tachyon')
show(C, title='w plane')
︡0be0dd2d-e276-4c2d-be41-251f7a3c6a23︡{"stdout":"'\\nCreated on Mon Feb 10 20:05:11 2014\\n\\n@author: David Horgan\\n'\n"}︡{"stdout":"a1= (0.631836992876155, 1.34528368801383, 0)\n"}︡{"stdout":"a2= (0.631836992876155, -0.237403003767146, 0)\n"}︡{"stdout":"a3= (1.01093918860185, 1.10788068424668, 0.505469594300924)\n"}︡{"stdout":"b1= (0, 0, 0)\n"}︡{"stdout":"b2= (0.631836992876155, -0.237403003767146, 0)\n"}︡{"stdout":"b3= (1.01093918860185, 1.10788068424668, 0.505469594300924)\n"}︡{"stdout":"c1= (0, 0, 0)\n"}︡{"stdout":"c2= (0.631836992876155, 1.34528368801383, 0)\n"}︡{"stdout":"c3= (1.01093918860185, 1.10788068424668, 0.505469594300924)\n"}︡{"stdout":"d1= (0, 0, 0)\n"}︡{"stdout":"d2= (0.631836992876155, 1.34528368801383, 0)\n"}︡{"stdout":"d3= (0.631836992876155, -0.237403003767146, 0)\n"}︡{"once":false,"file":{"show":true,"uuid":"1d9d1d97-3d27-4b44-a1e1-920703be252a","filename":"/projects/c26db83a-7fa2-44a4-832b-579c18fac65f/.sage/temp/compute15dc0/9115/tmp_QtOI75.png"}}︡{"once":false,"file":{"show":true,"uuid":"18a19c17-9fe7-412a-b46e-cb5831ad45e9","filename":"/projects/c26db83a-7fa2-44a4-832b-579c18fac65f/.sage/temp/compute15dc0/9115/tmp_bAMZTI.svg"}}︡
︠f2da800d-819e-4524-bcc8-e0f9960e8896︠










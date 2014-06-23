︠140fd368-bd98-4669-947e-bb755383a2dci︠
def point_txt(P,name,rgbcolor):
    if (P.xy()[1]) < 0:
        r = text(name,[float(P.xy()[0]),float(P.xy()[1])-1],rgbcolor=rgbcolor)
    elif P.xy()[1] == 0:
        r = text(name,[float(P.xy()[0]),float(P.xy()[1])+1],rgbcolor=rgbcolor)
    else:
        r = text(name,[float(P.xy()[0]),float(P.xy()[1])+1],rgbcolor=rgbcolor)
    return r

E = EllipticCurve('37a')
list_of_points = E.integral_points()
html("Graphical addition of two points $P$ and $Q$ on the curve $ E: %s $"%latex(E))

def line_from_curve_points(E,P,Q,style='-',rgb=(1,0,0),length=25):
        """
        P,Q two points on an elliptic curve.
        Output is a graphic representation of the straight line intersecting with P,Q.
        """
        # The function tangent to P=Q on E
        if P == Q:
                if P[2]==0:
                        return line([(1,-length),(1,length)],linestyle=style,rgbcolor=rgb)
                else:
                        # Compute slope of the curve E in P
                        l=-(3*P[0]^2 + 2*E.a2()*P[0] + E.a4() - E.a1()*P[1])/((-2)*P[1] - E.a1()*P[0] - E.a3())
                        f(x) = l * (x - P[0]) + P[1]
                        return plot(f(x),-length,length,linestyle=style,rgbcolor=rgb)
        # Trivial case of P != R where P=O or R=O then we get the vertical line from the other point
        elif P[2] == 0:
                return line([(Q[0],-length),(Q[0],length)],linestyle=style,rgbcolor=rgb)
        elif Q[2] == 0:
                return line([(P[0],-length),(P[0],length)],linestyle=style,rgbcolor=rgb)
        # Non trivial case where P != R
        else:
                # Case where x_1 = x_2 return vertical line evaluated in Q
                if P[0] == Q[0]:
                        return line([(P[0],-length),(P[0],length)],linestyle=style,rgbcolor=rgb)

                #Case where x_1 != x_2 return line trough P,R evaluated in Q"
                l=(Q[1]-P[1])/(Q[0]-P[0])
                f(x) = l * (x - P[0]) + P[1]
                return plot(f(x),-length,length,linestyle=style,rgbcolor=rgb)

@interact
def _(P=selector(list_of_points,label='Point P'),Q=selector(list_of_points,label='Point Q'), marked_points = checkbox(default=True,label = 'Points'), Lines = selector([0..2],nrows=1), Axes=True):
        curve = E.plot(rgbcolor = (0,0,1),xmin=-5,xmax=5,plot_points=300)
        R = P + Q
        Rneg = -R
        l1 = line_from_curve_points(E,P,Q)
        l2 = line_from_curve_points(E,R,Rneg,style='--')
        p1 = plot(P,rgbcolor=(1,0,0),pointsize=40)
        p2 = plot(Q,rgbcolor=(1,0,0),pointsize=40)
        p3 = plot(R,rgbcolor=(1,0,0),pointsize=40)
        p4 = plot(Rneg,rgbcolor=(1,0,0),pointsize=40)
        textp1 = point_txt(P,"$P$",rgbcolor=(0,0,0))
        textp2 = point_txt(Q,"$Q$",rgbcolor=(0,0,0))
        textp3 = point_txt(R,"$P+Q$",rgbcolor=(0,0,0))
        if Lines==0:
                g=curve
        elif Lines ==1:
                g=curve+l1
        elif Lines == 2:
                g=curve+l1+l2
        if marked_points:
                g=g+p1+p2+p3+p4
        if P != Q:
                g=g+textp1+textp2+textp3
        else:
                g=g+textp1+textp3
        g.axes_range(xmin=-5,xmax=5,ymin=-13,ymax=13)
        show(g,axes = Axes)
︡454b56b6-8f33-472d-8b08-28990d73682f︡{"html":"Graphical addition of two points $P$ and $Q$ on the curve $ E: y^2 + y = x^{3} -  x  $"}︡{"interact":{"style":"None","flicker":false,"layout":[[["P",12,null]],[["Q",12,null]],[["marked_points",12,null]],[["Lines",12,null]],[["Axes",12,null]],[["",12,null]]],"id":"6f89764c-0562-46cf-bd82-20896cd147bb","controls":[{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["(-1 : 0 : 1)","(0 : 0 : 1)","(1 : 0 : 1)","(2 : 2 : 1)","(6 : 14 : 1)"],"label":"Point P","nrows":null,"width":null,"var":"P"},{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["(-1 : 0 : 1)","(0 : 0 : 1)","(1 : 0 : 1)","(2 : 2 : 1)","(6 : 14 : 1)"],"label":"Point Q","nrows":null,"width":null,"var":"Q"},{"default":true,"var":"marked_points","readonly":false,"control_type":"checkbox","label":"Points"},{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["0","1","2"],"label":"Lines","nrows":1,"width":null,"var":"Lines"},{"default":true,"var":"Axes","readonly":false,"control_type":"checkbox","label":"Axes"}]}}︡
︠9c7c63ef-7733-483d-904c-800f5a582bcd︠










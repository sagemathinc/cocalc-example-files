︠81dcbd3d-b8c3-457c-893b-d647a1216c69︠
@interact
def _(m=selector([1..15],nrows=2), n=(7,(3..10))):
    G = DirichletGroup(m)
    s = "<h3>First n=%s Bernoulli numbers attached to characters with modulus m=%s</h3>"%(n,m)
    s += '<table border=1>'
    s += '<tr bgcolor="#edcc9c"><td align=center>$\\chi$</td><td>Conductor</td>' + \
           ''.join('<td>$B_{%s,\chi}$</td>'%k for k in [1..n]) + '</tr>'
    for eps in G.list():
        v = ''.join(['<td align=center bgcolor="#efe5cd">$%s$</td>'%latex(eps.bernoulli(k)) for k in [1..n]])
        s += '<tr><td bgcolor="#edcc9c">%s</td><td bgcolor="#efe5cd" align=center>%s</td>%s</tr>\n'%(
             eps, eps.conductor(), v)
    s += '</table>'
    html(s)
︡6dc6bb50-7d55-4b81-bc14-06705b4816b7︡{"interact":{"style":"None","flicker":false,"layout":[[["m",12,null]],[["n",12,null]],[["",12,null]]],"id":"581b8e90-face-420f-bc2a-9296057aab19","controls":[{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"],"label":"m","nrows":2,"width":null,"var":"m"},{"control_type":"slider","default":4,"var":"n","width":null,"vals":["3","4","5","6","7","8","9","10"],"animate":true,"label":"n","display_value":true}]}}︡
︠f23f67a4-73ca-4d35-87d4-a75a97713ee7︠










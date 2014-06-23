︠dbb53311-ee3f-464f-a79f-e1125a92b5d5︠
A = matrix([[0,0,2],[1,0,1],[0,1,-1]])
D = '[[0,0,0],[1,0,0]]'

def Dn(D,A,k):
    ans = []
    for d in Tuples(D, k):
        s = sum(A^n*d[n] for n in range(k))
        ans.append(s)
    return ans

@interact
def f(A = matrix([[0,0,2],[1,0,1],[0,1,-1]]), D = '[[0,0,0],[1,0,0]]', k=(3..15), labels=True):
    print "Det = ", A.det()
    D = matrix(eval(D)).rows()
    print "D:"
    print D
    G = point3d([v.list() for v in Dn(D,A,k)], size=8)#, opacity=.85)
    if labels:
        G += sum([text3d(str(v),v) for v in Dn(D,A,k)])
    show(G, axes=False, frame=False)
︡abfad67f-4b12-48a6-83ba-dc7ece90d6f4︡{"interact":{"style":"None","flicker":false,"layout":[[["A",12,null]],[["D",12,null]],[["k",12,null]],[["labels",12,null]],[["",12,null]]],"id":"77faa5bc-2ca3-49b0-a583-5c9910c20e50","controls":[{"control_type":"input-grid","ncols":3,"default":[["0","0","2"],["1","0","1"],["0","1","-1"]],"label":"A","nrows":3,"width":5,"var":"A"},{"control_type":"input-box","default":"[[0,0,0],[1,0,0]]","label":"D","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"D","type":"<type 'str'>"},{"control_type":"slider","default":0,"var":"k","width":null,"vals":["3","4","5","6","7","8","9","10","11","12","13","14","15"],"animate":true,"label":"k","display_value":true},{"default":true,"var":"labels","readonly":false,"control_type":"checkbox","label":"labels"}]}}︡
︠2459e05d-17de-46ee-a8e2-28926d519647︠










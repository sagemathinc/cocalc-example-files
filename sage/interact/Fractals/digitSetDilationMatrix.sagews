︠8d83f61f-89f2-4b73-b4de-27d430c03c7a︠
A = matrix([[1,1],[-1,1]])
D = [vector([0,0]), vector([1,0])]

@interact
def f(A = matrix([[1,1],[-1,1]]), D = '[[0,0],[1,0]]', k=(3..17)):
    print "Det = ", A.det()
    D = matrix(eval(D)).rows()
    def Dn(k):
        ans = []
        for d in Tuples(D, k):
            s = sum(A^n*d[n] for n in range(k))
            ans.append(s)
        return ans

    G = points([v.list() for v in Dn(k)],size=50)

    show(G, frame=True, axes=False)
︡0370de21-6ecd-4c30-bb71-9a25fc76eaa0︡{"interact":{"style":"None","flicker":false,"layout":[[["A",12,null]],[["D",12,null]],[["k",12,null]],[["",12,null]]],"id":"083b4f22-6282-4c03-b721-0332d339fa4c","controls":[{"control_type":"input-grid","ncols":2,"default":[["1","1"],["-1","1"]],"label":"A","nrows":2,"width":5,"var":"A"},{"control_type":"input-box","default":"[[0,0],[1,0]]","label":"D","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"D","type":"<type 'str'>"},{"control_type":"slider","default":0,"var":"k","width":null,"vals":["3","4","5","6","7","8","9","10","11","12","13","14","15","16","17"],"animate":true,"label":"k","display_value":true}]}}︡
︠b8300312-f4c8-4b4b-8205-8974d8d5588f︠










︠188a9912-9adc-4dd0-97c0-4411620bc1e7︠
A = matrix([[1,1],[-1,1]])
D = [vector([0,0]), vector([1,0])]

@interact
def f(A = matrix([[1,1],[-1,1]]), D = '[[0,0],[1,0]]', k=(3..17)):
    print "Det = ", A.det()
    D = matrix(eval(D)).rows()
    def Dn(k):
        ans = []
        for d in Tuples(D, k):
            s = sum(A^(-n)*d[n] for n in range(k))
            ans.append(s)
        return ans

    G = points([v.list() for v in Dn(k)])

    show(G, frame=True, axes=False)
︡0c52f821-72c0-4808-aa95-5e5e8f5660d7︡{"interact":{"style":"None","flicker":false,"layout":[[["A",12,null]],[["D",12,null]],[["k",12,null]],[["",12,null]]],"id":"826ce711-2f07-4040-bc9d-a070850d9008","controls":[{"control_type":"input-grid","ncols":2,"default":[["1","1"],["-1","1"]],"label":"A","nrows":2,"width":5,"var":"A"},{"control_type":"input-box","default":"[[0,0],[1,0]]","label":"D","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"D","type":"<type 'str'>"},{"control_type":"slider","default":0,"var":"k","width":null,"vals":["3","4","5","6","7","8","9","10","11","12","13","14","15","16","17"],"animate":true,"label":"k","display_value":true}]}}︡
︠bc1b89b2-281a-4d82-a6da-d150e4d3d582︠










︠f440ad67-5c50-428c-85ec-44a459f33d48︠
import random
def ftree(rows, v, i, F):
    if len(v) > 0: # add a row to g at the ith level.
        rows.append(v)
    w = []
    for i in range(len(v)):
        k, _, _ = v[i]
        if k is None or is_prime(k):
            w.append((None,None,None))
        else:
            d = random.choice(divisors(k)[1:-1])
            w.append((d,k,i))
            e = k//d
            if e == 1:
                w.append((None,None))
            else:
                w.append((e,k,i))
    if len(w) > len(v):
        ftree(rows, w, i+1, F)
def draw_ftree(rows,font):
    g = Graphics()
    for i in range(len(rows)):
        cur = rows[i]
        for j in range(len(cur)):
            e, f, k = cur[j]
            if not e is None:
                if is_prime(e):
                     c = (1,0,0)
                else:
                     c = (0,0,.4)
                g += text(str(e), (j*2-len(cur),-i), fontsize=font, rgbcolor=c)
                if not k is None and not f is None:
                    g += line([(j*2-len(cur),-i), ((k*2)-len(rows[i-1]),-i+1)],
                    alpha=0.5)
    return g

@interact
def factor_tree(n=100, font=(10, (8..20)), redraw=['Redraw']):
    n = Integer(n)
    rows = []
    v = [(n,None,0)]
    ftree(rows, v, 0, factor(n))
    show(draw_ftree(rows, font), axes=False)
︡50ead4a3-87f6-4110-9d3d-fc47dc2db929︡{"interact":{"style":"None","flicker":false,"layout":[[["n",12,null]],[["font",12,null]],[["redraw",12,null]],[["",12,null]]],"id":"6aa1f909-3d36-49fa-a71d-34352bb2ae48","controls":[{"control_type":"input-box","default":100,"label":"n","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"n","type":null},{"control_type":"slider","default":2,"var":"font","width":null,"vals":["8","9","10","11","12","13","14","15","16","17","18","19","20"],"animate":true,"label":"font","display_value":true},{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["Redraw"],"label":"redraw","nrows":null,"width":null,"var":"redraw"}]}}︡
︠94d58344-79e5-4470-a4d9-df4c0a7e1dc7︠










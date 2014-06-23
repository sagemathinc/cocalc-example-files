︠b350e176-4159-4907-8a4d-db86a179a5cfi︠
import random

def init():
    global B,Br,n,round,tm,t,v
    B = 40
    Br = 15
    n = 1
    round = 0
    tm = 0
    t = walltime()
    
    
init()    

html("<h1 align=center>Zeros</h1>")
html("<h2 align=center><font color='blue'>How many zeros?</font></h2>")
    
@interact
def zeros(a=selector(buttons=True, nrows=1, values=['Reset'] + [1..B], default=1)):
    if a == 'Reset': 
        init()
    html("<center>")
    global B,Br,n,round,tm,t,v
    if a == n:
        if round > 0:
           html("<font size=+3 color='red'>RIGHT</font>")
        r = walltime() - t
        tm += r
        round += 1
        t = walltime()
        while True:
           n2 = random.randrange(1,Br)
           if n2 != n:
               n = n2
               break
        if Br < B:
            Br += 2
    elif round > 0:
        html("<font size=+2 color='blue'>Wrong. Try again...</font>")
    html("</center>")
    html("<font size=+%s color='#333'>"%random.randrange(-2,5))
    print  ' '*random.randrange(20) + '0'*n
    html("</font>")
    if round > 0:
        html("<br><br><center>Score: %s rounds, Average time: %.1f seconds</center>"%(
                 round, float(tm)/round))
︡cb488e1d-c1c6-46ca-8682-06d8ca50dc47︡{"html":"<h1 align=center>Zeros</h1>"}︡{"html":"<h2 align=center><font color='blue'>How many zeros?</font></h2>"}︡{"interact":{"style":"None","flicker":false,"layout":[[["a",12,null]],[["",12,null]]],"id":"45649c9a-e135-4924-85b1-4aa88f565385","controls":[{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":1,"lbls":["Reset","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40"],"label":"a","nrows":1,"width":null,"var":"a"}]}}︡
︠9a989cb7-91cf-4454-bb8a-c741e2129a94︠










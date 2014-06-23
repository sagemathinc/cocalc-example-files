︠f15ae216-ce83-410c-b6f7-e0a656cc82edi︠
from scipy import linalg
html('<h2>The Gerschgorin circle theorem</h2>')
@interact
def Gerschgorin(Ain = input_box(default='[[10,1,1/10,0],[-1,9,0,1],[1,0,2,3/10],[-.5,0,-.3,1]]', type = str, label = 'A = '), an_size = slider(1,100,1,1.0)):
    A = sage_eval(Ain)
    size = len(A)
    html('$A = ' + latex(matrix(RealField(10),A))+'$')
    A = matrix(RealField(10),A)
    B = [[0 for i in range(size)] for j in range(size)]
    for i in range(size):
        B[i][i] = A[i][i]
    B = matrix(B)
    frames = []

    centers = [(real(q),imag(q)) for q in [A[i][i] for i in range(size)]]
    radii_row = [sum([abs(A[i][j]) for j in range(i)+range(i+1,size)]) for i in range(size)]
    radii_col = [sum([abs(A[j][i]) for j in range(i)+range(i+1,size)]) for i in range(size)]
    x_min = min([centers[i][0]-radii_row[i] for i in range(size)]+[centers[i][0]-radii_col[i] for i in range(size)])
    x_max = max([centers[i][0]+radii_row[i] for i in range(size)]+[centers[i][0]+radii_col[i] for i in range(size)])
    y_min = min([centers[i][1]-radii_row[i] for i in range(size)]+[centers[i][1]-radii_col[i] for i in range(size)])
    y_max = max([centers[i][1]+radii_row[i] for i in range(size)]+[centers[i][1]+radii_col[i] for i in range(size)])

    if an_size > 1: 
        t_range= srange(0,1+1/an_size,1/an_size)
    else:
        t_range = [1]
    for t in t_range:
        C = t*A + (1-t)*B
        eigs = [CDF(x) for x in linalg.eigvals(C.numpy())]
        eigpoints = points([(real(q),imag(q)) for q in eigs],pointsize = 10, rgbcolor = (0,0,0))
        centers = [(real(q),imag(q)) for q in [A[i][i] for i in range(size)]]
        radii_row = [sum([abs(C[i][j]) for j in range(i)+range(i+1,size)]) for i in range(size)]
        radii_col = [sum([abs(C[j][i]) for j in range(i)+range(i+1,size)]) for i in range(size)]
        scale = max([(x_max-x_min),(y_max-y_min)])
        scale = 7/scale
        row_circles = sum([circle(centers[i],radii_row[i],fill=True, alpha = .3) for i in range(size)])
        col_circles = sum([circle(centers[i],radii_col[i],fill=True, rgbcolor = (1,0,0), alpha = .3) for i in range(size)])
        ft = eigpoints+row_circles+col_circles
        frames.append(ft)
    show(animate(frames,figsize = [(x_max-x_min)*scale,(y_max-y_min)*scale], xmin = x_min, xmax=x_max, ymin = y_min, ymax = y_max))
︡31423c29-cb0a-46fb-9388-3a588f182adc︡{"html":"<h2>The Gerschgorin circle theorem</h2>"}︡{"interact":{"style":"None","flicker":false,"layout":[[["Ain",12,null]],[["an_size",12,null]],[["",12,null]]],"id":"a9b0f9ee-b87f-4dc1-a755-9cfe057b9ad0","controls":[{"control_type":"input-box","default":"[[10,1,1/10,0],[-1,9,0,1],[1,0,2,3/10],[-.5,0,-.3,1]]","label":"A = ","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"Ain","type":"<type 'str'>"},{"control_type":"slider","default":0,"var":"an_size","width":null,"vals":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"],"animate":true,"label":"an_size","display_value":true}]}}︡
︠2501ff14-7706-414c-bd0a-388469930574︠










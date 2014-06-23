︠a4027af1-d620-490e-9606-d830011de71f︠
from numpy import zeros
from random import randint

def cellular(rule, N, initial='Single-cell'):
    '''Yields a matrix showing the evolution of a Wolfram's cellular automaton
    
    rule:     determines how a cell's value is updated, depending on its neighbors
    N:        number of iterations
    initial:  starting condition; can be either single-cell or a random binary row
    '''
    M=zeros( (N,2*N+2), dtype=int)
    if initial=='Single-cell':
        M[0,N]=1
    else:
        M[0]=[randint(0,1) for a in range(0,2*N+2)]
    
    for j in range(1,N):
        for k in range(0,2*N):
            l = 4*M[j-1,k-1] + 2*M[j-1,k] + M[j-1,k+1]
            M[j,k]=rule[ l ]
    return M[:,:-1]
    
def num2rule(number):
    if not 0 <= number <= 255:
        raise Exception('Invalid rule number')
    binary_digits = number.digits(base=2)
    return binary_digits + [0]*(8-len(binary_digits))

@interact
def _( initial=selector(['Single-cell', 'Random'], label='Starting condition'), N=input_box(label='Number of iterations',default=100),
       rule_number=input_box(label='Rule number',default=110),
       size = slider(1, 11, label= 'Size', step_size=1, default=6 ), auto_update=False):
    rule = num2rule(rule_number)
    M = cellular(rule, N, initial)
    plot_M = matrix_plot(M, cmap='binary')
    plot_M.show( figsize=[size,size])
︡36ac1a8e-f0e1-494a-a5cd-e6b784eb1c39︡{"interact":{"style":"None","flicker":false,"layout":[[["initial",12,null]],[["N",12,null]],[["rule_number",12,null]],[["size",12,null]],[["auto_update",12,null]],[["",12,null]]],"id":"c343f4a6-bded-45a2-bba5-c0b869ea0026","controls":[{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["Single-cell","Random"],"label":"Starting condition","nrows":null,"width":null,"var":"initial"},{"control_type":"input-box","default":100,"label":"Number of iterations","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"N","type":null},{"control_type":"input-box","default":110,"label":"Rule number","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"rule_number","type":null},{"control_type":"slider","default":5,"var":"size","width":null,"vals":["1","2","3","4","5","6","7","8","9","10","11"],"animate":true,"label":"Size","display_value":true},{"default":false,"var":"auto_update","readonly":false,"control_type":"checkbox","label":"auto_update"}]}}︡
︠63b776f1-2994-4bbb-95f6-823b4b4f873a︠










︠d0254607-e783-4125-b566-28b505277f7a︠
def sierpinski(N):
   '''Generates the Sierpinski triangle by taking the modulo-2 of each element in Pascal's triangle'''
   return [([0] * (N // 2 - a // 2)) + [binomial(a, b) % 2 for b in range(a + 1)] + ([0] * (N // 2 - a // 2)) for a in range(0, N, 2)]

@interact
def _(N=slider([2 ** a for a in range(12)], label='Number of iterations', default=64), size=slider(1, 20, label='Size', step_size=1, default=9)):
    M = sierpinski(2 * N)
    matrix_plot(M, cmap='binary').show(figsize=[size, size])
︡35fca000-924c-4ef6-99bd-a69f230711c4︡{"interact":{"style":"None","flicker":false,"layout":[[["N",12,null]],[["size",12,null]],[["",12,null]]],"id":"bf13980b-3c14-4915-8b10-49093e0c8c80","controls":[{"control_type":"slider","default":6,"var":"N","width":null,"vals":["1","2","4","8","16","32","64","128","256","512","1024","2048"],"animate":true,"label":"Number of iterations","display_value":true},{"control_type":"slider","default":8,"var":"size","width":null,"vals":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"],"animate":true,"label":"Size","display_value":true}]}}︡
︠76b537f2-054c-49c4-8687-854cbf83ca04︠

︠0cefdbd8-ee2b-4380-83ca-bc75de8afb2b︠
m = hmm.DiscreteHiddenMarkovModel([[0.8,0.2],[0.1,0.9]], [[1/10,1/10,1/10,1/10,1/10,1/2],[1/6,1/6,1/6,1/6,1/6,1/6]], [.2,.8],emission_symbols=[1,2,3,4,5,6])
@interact
def dishonest_casino(auto_update=False):
    test = list(m.generate_sequence(80))
    vit_test = list(m.viterbi(test[0])[0])
    html('<h3>The Occasionally Dishonest Casino</h3>')
    html('Emissions:'+str(test[0]).replace(',','').replace(' ','')[1:-1])
    vit_str = str(vit_test).replace(',','').replace(' ','')
    vit_str = vit_str.replace('1','F').replace('0','<font color="#FF0000">L</font>')[1:-1]
    html('Viterbi:  '+vit_str)
    actual_str = str(list(test[1])).replace(',','').replace(' ','')
    actual_str = actual_str.replace('1','F').replace('0','<font color="#FF0000">L</font>')[1:-1]
    html('Actual:   '+ actual_str)
︡f505104f-9518-4b23-bae5-5142ae00fde9︡{"interact":{"style":"None","flicker":false,"layout":[[["auto_update",12,null]],[["",12,null]]],"id":"b02c368e-3df3-4567-9c00-041cfce3bf89","controls":[{"default":false,"var":"auto_update","readonly":false,"control_type":"checkbox","label":"auto_update"}]}}︡
︠e7d203ba-55e4-482a-bc1d-3a4c9e2984d3︠










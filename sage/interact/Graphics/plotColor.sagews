︠c21a4a38-efbf-4a93-9259-4ed7b43bbb04︠
@interact
def color_experimenter(expression=input_box('x^2', 'Expression', str), color=Color('red')):
    if expression:
        try:
            plot(SR(expression), rgbcolor=color).show()
        except TypeError:
            print "There's a problem with your expression."
︡6c5392c1-3f6a-4b80-b95f-80889edd0da9︡{"interact":{"style":"None","flicker":false,"layout":[[["expression",12,null]],[["color",12,null]],[["",12,null]]],"id":"2dc156e6-4c8b-44f0-91c5-bb1d3beb0687","controls":[{"control_type":"input-box","default":"x^2","label":"Expression","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"expression","type":"<type 'str'>"},{"widget":null,"control_type":"color-selector","hide_box":false,"Color":"<class 'sage.plot.colors.Color'>","label":"color","default":"#ff0000","readonly":false,"var":"color"}]}}︡
︠55f52e17-fef2-482d-b4a7-ac16c1e7bc2b︠

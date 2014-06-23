︠bc620323-5702-4803-ba2f-92b59e8d88f3︠
# Google Chart API: http://code.google.com/apis/chart
import urllib2 as inet
from pylab import imshow
@interact
def gChart(title="Google Chart API plots Pie Charts!", color1=Color('purple'), color2=Color('black'), color3=Color('yellow'), val1=slider(0,1,.05,.5), val2=slider(0,1,.05,.3), val3=slider(0,1,.05,0.1), label=("Maths Physics Chemistry")):
    url = "http://chart.apis.google.com/chart?cht=p3&chs=600x300"
    url += '&chtt=%s&chts=000000,25'%title.replace(" ","+")
    url += '&chco=%s'%(','.join([color1.html_color()[1:],color2.html_color()[1:],color3.html_color()[1:]]))
    url += '&chl=%s'%label.replace(" ","|")
    url += '&chd=t:%s'%(','.join(map(str,[val1,val2,val3])))
    print url
    html('<div style="border:3px dashed;text-align:center;padding:50px 0 50px 0"><img src="%s"></div>'%url)
︡51a55c78-21bb-4101-aa4b-10384e391ec2︡{"interact":{"style":"None","flicker":false,"layout":[[["title",12,null]],[["color1",12,null]],[["color2",12,null]],[["color3",12,null]],[["val1",12,null]],[["val2",12,null]],[["val3",12,null]],[["label",12,null]],[["",12,null]]],"id":"231d3a91-6389-4dda-8252-9c56d21e9d98","controls":[{"control_type":"input-box","default":"Google Chart API plots Pie Charts!","label":"title","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"title","type":"<type 'str'>"},{"widget":null,"control_type":"color-selector","hide_box":false,"Color":"<class 'sage.plot.colors.Color'>","label":"color1","default":"#800080","readonly":false,"var":"color1"},{"widget":null,"control_type":"color-selector","hide_box":false,"Color":"<class 'sage.plot.colors.Color'>","label":"color2","default":"#000000","readonly":false,"var":"color2"},{"widget":null,"control_type":"color-selector","hide_box":false,"Color":"<class 'sage.plot.colors.Color'>","label":"color3","default":"#ffff00","readonly":false,"var":"color3"},{"control_type":"slider","default":10,"var":"val1","width":null,"vals":["0.000000000000000","0.0500000000000000","0.100000000000000","0.150000000000000","0.200000000000000","0.250000000000000","0.300000000000000","0.350000000000000","0.400000000000000","0.450000000000000","0.500000000000000","0.550000000000000","0.600000000000000","0.650000000000000","0.700000000000000","0.750000000000000","0.800000000000000","0.850000000000000","0.900000000000000","0.950000000000000","1.00000000000000"],"animate":true,"label":"val1","display_value":true},{"control_type":"slider","default":6,"var":"val2","width":null,"vals":["0.000000000000000","0.0500000000000000","0.100000000000000","0.150000000000000","0.200000000000000","0.250000000000000","0.300000000000000","0.350000000000000","0.400000000000000","0.450000000000000","0.500000000000000","0.550000000000000","0.600000000000000","0.650000000000000","0.700000000000000","0.750000000000000","0.800000000000000","0.850000000000000","0.900000000000000","0.950000000000000","1.00000000000000"],"animate":true,"label":"val2","display_value":true},{"control_type":"slider","default":2,"var":"val3","width":null,"vals":["0.000000000000000","0.0500000000000000","0.100000000000000","0.150000000000000","0.200000000000000","0.250000000000000","0.300000000000000","0.350000000000000","0.400000000000000","0.450000000000000","0.500000000000000","0.550000000000000","0.600000000000000","0.650000000000000","0.700000000000000","0.750000000000000","0.800000000000000","0.850000000000000","0.900000000000000","0.950000000000000","1.00000000000000"],"animate":true,"label":"val3","display_value":true},{"control_type":"input-box","default":"Maths Physics Chemistry","label":"label","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"label","type":"<type 'str'>"}]}}︡
︠66964a3a-2742-4f29-bc87-c94a96ee23aa︠










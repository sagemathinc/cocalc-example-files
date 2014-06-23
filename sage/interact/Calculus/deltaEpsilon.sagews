︠3d2255c0-982a-47e5-80fc-5c5f7a3fdb9ei︠
html("<h2>Limits: <i>ε-δ</i></h2>")
html("This allows you to estimate which values of <i>δ</i> guarantee that <i>f</i> is within <i>ε</i> units of a limit.")
html("<ul><li>Modify the value of <i>f</i> to choose a function.</li>")
html("<li>Modify the value of <i>a</i> to change the <i>x</i>-value where the limit is being estimated.</li>")
html("<li>Modify the value of <i>L</i> to change your guess of the limit.</li>")
html("<li>Modify the values of <i>δ</i> and <i>ε</i> to modify the rectangle.</li></ul>")
html("If the blue curve passes through the pink boxes, your values for <i>δ</i> and/or <i>ε</i> are probably wrong.")
@interact
def delta_epsilon(f = input_box(default=(x^2-x)/(x-1)), a=input_box(default=1), L = input_box(default=1), delta=input_box(label="δ",default=0.1), epsilon=input_box(label="ε",default=0.1), xm=input_box(label="<i>x</i><sub>min</sub>",default=-1), xM=input_box(label="<i>x</i><sub>max</sub>",default=4)):
    f_left_plot = plot(f,xm,a-delta/3,thickness=2)
    f_right_plot = plot(f,a+delta/3,xM,thickness=2)
    epsilon_line_1 = line([(xm,L-epsilon),(xM,L-epsilon)], rgbcolor=(0.5,0.5,0.5),linestyle='--')
    epsilon_line_2 = line([(xm,L+epsilon),(xM,L+epsilon)], rgbcolor=(0.5,0.5,0.5),linestyle='--')
    ym = min(f_right_plot.ymin(),f_left_plot.ymin())
    yM = max(f_right_plot.ymax(),f_left_plot.ymax())
    bad_region_1 = polygon([(a-delta,L+epsilon),(a-delta,yM),(a+delta,yM),(a+delta,L+epsilon)], rgbcolor=(1,0.6,0.6))
    bad_region_2 = polygon([(a-delta,L-epsilon),(a-delta,ym),(a+delta,ym),(a+delta,L-epsilon)], rgbcolor=(1,0.6,0.6))
    aL_point = point((a,L),rgbcolor=(1,0,0),pointsize=20)
    delta_line_1 = line([(a-delta,ym),(a-delta,yM)],rgbcolor=(0.5,0.5,0.5),linestyle='--')
    delta_line_2 = line([(a+delta,ym),(a+delta,yM)],rgbcolor=(0.5,0.5,0.5),linestyle='--')
    (f_left_plot +f_right_plot +epsilon_line_1 +epsilon_line_2 +delta_line_1 +delta_line_2 +aL_point +bad_region_1 +bad_region_2).show(xmin=xm,xmax=xM)
︡b67384a1-4e12-40a6-ac4d-227e727e5c9f︡{"html":"<h2>Limits: <i>ε-δ</i></h2>"}︡{"html":"This allows you to estimate which values of <i>δ</i> guarantee that <i>f</i> is within <i>ε</i> units of a limit."}︡{"html":"<ul><li>Modify the value of <i>f</i> to choose a function.</li>"}︡{"html":"<li>Modify the value of <i>a</i> to change the <i>x</i>-value where the limit is being estimated.</li>"}︡{"html":"<li>Modify the value of <i>L</i> to change your guess of the limit.</li>"}︡{"html":"<li>Modify the values of <i>δ</i> and <i>ε</i> to modify the rectangle.</li></ul>"}︡{"html":"If the blue curve passes through the pink boxes, your values for <i>δ</i> and/or <i>ε</i> are probably wrong."}︡{"interact":{"style":"None","flicker":false,"layout":[[["f",12,null]],[["a",12,null]],[["L",12,null]],[["delta",12,null]],[["epsilon",12,null]],[["xm",12,null]],[["xM",12,null]],[["",12,null]]],"id":"ab558510-d13d-4e35-8a88-85de8b662987","controls":[{"control_type":"input-box","default":"(x^2 - x)/(x - 1)","label":"f","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"f","type":null},{"control_type":"input-box","default":1,"label":"a","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"a","type":null},{"control_type":"input-box","default":1,"label":"L","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"L","type":null},{"control_type":"input-box","default":"0.100000000000000","label":"δ","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"delta","type":null},{"control_type":"input-box","default":"0.100000000000000","label":"ε","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"epsilon","type":null},{"control_type":"input-box","default":-1,"label":"<i>x</i><sub>min</sub>","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"xm","type":null},{"control_type":"input-box","default":4,"label":"<i>x</i><sub>max</sub>","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"xM","type":null}]}}︡
︠9e66f474-94a9-4c80-b6fd-4f60a0be5813︠










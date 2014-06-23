︠afcdea30-a98f-4dc3-8136-497c075905ab︠
def error_msg(msg):
    print '<html><p style="font-family:Arial, sans-serif;color:#000"><span style="color:red;font-weight:bold">Error</span>: %s</p></html>' % msg

@interact
def interactive_2d_plotter(expression=input_box('sin(x)', 'Expression', str), x_range=range_slider(-10,10,1,(0,10), label='X Range'), square=checkbox(True, 'Square'), axes=checkbox(True, 'Show Axes')):
    if expression:
        try:
            expression = SR(expression) # turn string into a Sage expression
        except TypeError:
            print error_msg('This is not an expression.')
            return
        try:
                xmin, xmax = x_range
                if square or not axes:
                    print "var('%s')\nplot(%s).show(%s%s%s)" % (expression.variables()[0], repr(expression), 'aspect_ratio=1' if square else '', ', ' if square and not axes else '', 'axes=False' if not axes else '')
                    if square:
                        plot(expression, xmin, xmax).show(aspect_ratio=1, axes=axes)
                    else:
                        plot(expression, xmin, xmax).show(axes=axes)
                else:
                    print "var('%s')\nplot(%s)" % (expression.variables()[0], repr(expression))
                    plot(expression, xmin, xmax).show(axes=axes)
        except ValueError:
            print error_msg('This expression has more than one variable.')
            return
        except TypeError:
            print error_msg("This expression contains an unknown function.")
            return
︡89516b34-686a-48a6-9454-e1c81b214719︡{"interact":{"style":"None","flicker":false,"layout":[[["expression",12,null]],[["x_range",12,null]],[["square",12,null]],[["axes",12,null]],[["",12,null]]],"id":"85092596-6dd6-4f5c-8f79-b2323d437fc7","controls":[{"control_type":"input-box","default":"sin(x)","label":"Expression","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"expression","type":"<type 'str'>"},{"control_type":"range-slider","default":[10,20],"var":"x_range","width":null,"vals":["-10","-9","-8","-7","-6","-5","-4","-3","-2","-1","0","1","2","3","4","5","6","7","8","9","10"],"animate":true,"label":"X Range","display_value":true},{"default":true,"var":"square","readonly":false,"control_type":"checkbox","label":"Square"},{"default":true,"var":"axes","readonly":false,"control_type":"checkbox","label":"Show Axes"}]}}︡
︠add6f5b2-484a-4a31-8723-a6d189a6a9b4︠










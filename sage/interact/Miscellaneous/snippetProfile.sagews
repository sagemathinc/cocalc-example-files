︠8620d518-7e80-47e1-877f-20fedab0b795i︠
html('<h2>Profile the given input</h2>')
import cProfile; import profile
@interact
def _(cmd = ("Statement", '2 + 2'), 
      do_preparse=("Preparse?", True), cprof =("cProfile?", False)):
    if do_preparse: cmd = preparse(cmd)
    if cprof:
        cProfile.runctx(cmd,globals(), locals())
    else:
        profile.runctx(cmd,globals(), locals())
︡f616bec1-e8b4-416d-af48-375b8fade9c5︡{"html":"<h2>Profile the given input</h2>"}︡{"interact":{"style":"None","flicker":false,"layout":[[["cmd",12,null]],[["do_preparse",12,null]],[["cprof",12,null]],[["",12,null]]],"id":"0a033359-cbb0-419b-b114-13fb4b144278","controls":[{"control_type":"input-box","default":"2 + 2","label":"Statement","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"cmd","type":"<type 'str'>"},{"default":true,"var":"do_preparse","readonly":false,"control_type":"checkbox","label":"Preparse?"},{"default":false,"var":"cprof","readonly":false,"control_type":"checkbox","label":"cProfile?"}]}}︡
︠d4802a82-220d-41d7-b614-19f0a7455818︠










︠5d43b5f2-4453-4dd0-a1ae-624232547c5a︠
@interact
def _(N=[1..100], k=selector([2,4,..,12],nrows=1), prec=(3..40),
      group=[(Gamma0, 'Gamma0'), (Gamma1, 'Gamma1')]):
    M = CuspForms(group(N),k)
    print M; print '\n'*3
    print "Computing basis...\n\n"
    if M.dimension() == 0:
         print "Space has dimension 0"
    else:
        prec = max(prec, M.dimension()+1)
        for f in M.basis():
             view(f.q_expansion(prec))
    print "\n\n\nDone computing basis."
︡3d047c57-920f-4760-b5ed-0652ac8f42f6︡{"interact":{"style":"None","flicker":false,"layout":[[["N",12,null]],[["k",12,null]],[["prec",12,null]],[["group",12,null]],[["",12,null]]],"id":"5f64ac8e-3d95-4149-8156-aa7c0df50d09","controls":[{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"],"label":"N","nrows":null,"width":null,"var":"N"},{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["2","4","6","8","10","12"],"label":"k","nrows":1,"width":null,"var":"k"},{"control_type":"slider","default":0,"var":"prec","width":null,"vals":["3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40"],"animate":true,"label":"prec","display_value":true},{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["Gamma0","Gamma1"],"label":"group","nrows":null,"width":null,"var":"group"}]}}︡
︠04589819-3590-4f8f-9e4b-6acaa17c0fc6︠










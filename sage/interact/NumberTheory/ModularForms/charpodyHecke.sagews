︠ec7ac4aa-63fa-4f56-8925-d0d16073dea9︠
# Note -- in Sage-2.10.3; multiedges are missing in plots; loops are missing in 3d plots
@interact
def f(N = prime_range(11,400),
      p = selector(prime_range(2,12),nrows=1),
      three_d = ("Three Dimensional", False)):
    S = SupersingularModule(N)
    T = S.hecke_matrix(p)
    G = DiGraph(T, multiedges=not three_d)
    if three_d:
        G.remove_loops()
    html("<h1>Charpoly and Hecke Graph: Level %s, T_%s</h1>"%(N,p))
    show(T.charpoly().factor())
    if three_d:
        show(G.plot3d(), aspect_ratio=[1,1,1])
    else:
        show(G.plot(),figsize=7)
︡c8907817-4198-4bea-bdf3-662606ee6af8︡{"interact":{"style":"None","flicker":false,"layout":[[["N",12,null]],[["p",12,null]],[["three_d",12,null]],[["",12,null]]],"id":"3632091c-4e0d-4fed-8f16-95eac8870730","controls":[{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["11","13","17","19","23","29","31","37","41","43","47","53","59","61","67","71","73","79","83","89","97","101","103","107","109","113","127","131","137","139","149","151","157","163","167","173","179","181","191","193","197","199","211","223","227","229","233","239","241","251","257","263","269","271","277","281","283","293","307","311","313","317","331","337","347","349","353","359","367","373","379","383","389","397"],"label":"N","nrows":null,"width":null,"var":"N"},{"buttons":false,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["2","3","5","7","11"],"label":"p","nrows":1,"width":null,"var":"p"},{"default":false,"var":"three_d","readonly":false,"control_type":"checkbox","label":"Three Dimensional"}]}}︡
︠b8f19e4a-4e0c-4e9b-8c2e-5564169df82f︠










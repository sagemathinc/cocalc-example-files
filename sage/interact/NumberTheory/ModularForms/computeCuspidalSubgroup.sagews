︠2eaa79c2-899e-42e7-8d69-91d13227f7fa︠
html('<h1>Cuspidal Subgroups of Modular Jacobians J0(N)</h1>')
@interact
def _(N=selector([1..8*13], ncols=8, width=10, default=10)):
    A = J0(N)
    print A.cuspidal_subgroup()
︡e80f1dca-339c-4d56-bd80-52965cff0cca︡{"html":"<h1>Cuspidal Subgroups of Modular Jacobians J0(N)</h1>"}︡{"interact":{"style":"None","flicker":false,"layout":[[["N",12,null]],[["",12,null]]],"id":"a77b85cb-0bf4-4a92-bb1c-becad472fe50","controls":[{"buttons":false,"control_type":"selector","ncols":8,"button_classes":null,"default":9,"lbls":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104"],"label":"N","nrows":null,"width":10,"var":"N"}]}}︡
︠e810ab42-37b8-442d-89d3-b3aab1a08db2︠

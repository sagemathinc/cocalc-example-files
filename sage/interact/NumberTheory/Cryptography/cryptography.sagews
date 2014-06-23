︠a0bf1713-02ed-4da4-aac1-330dbd3597b2︠
@interact
def diffie_hellman(bits=slider(8, 513, 4, 8, 'Number of bits', False),
    button=selector(["Show new example"],label='',buttons=True)):
    maxp = 2 ^ bits
    p = random_prime(maxp)
    k = GF(p)
    if bits > 100:
        g = k(2)
    else:
        g = k.multiplicative_generator()
    a = ZZ.random_element(10, maxp)
    b = ZZ.random_element(10, maxp)

    html("""
<style>
.gamodp, .gbmodp {
color:#000;
padding:5px
}
.gamodp {
background:#846FD8
}
.gbmodp {
background:#FFFC73
}
.dhsame {
color:#000;
font-weight:bold
}
</style>
<h2 style="color:#000;font-family:Arial, Helvetica, sans-serif">%s-Bit Diffie-Hellman Key Exchange</h2>
<ol style="color:#000;font-family:Arial, Helvetica, sans-serif">
<li>Alice and Bob agree to use the prime number p = %s and base g = %s.</li>
<li>Alice chooses the secret integer a = %s, then sends Bob (<span class="gamodp">g<sup>a</sup> mod p</span>):<br/>%s<sup>%s</sup> mod %s = <span class="gamodp">%s</span>.</li>
<li>Bob chooses the secret integer b=%s, then sends Alice (<span class="gbmodp">g<sup>b</sup> mod p</span>):<br/>%s<sup>%s</sup> mod %s = <span class="gbmodp">%s</span>.</li>
<li>Alice computes (<span class="gbmodp">g<sup>b</sup> mod p</span>)<sup>a</sup> mod p:<br/>%s<sup>%s</sup> mod %s = <span class="dhsame">%s</span>.</li>
<li>Bob computes (<span class="gamodp">g<sup>a</sup> mod p</span>)<sup>b</sup> mod p:<br/>%s<sup>%s</sup> mod %s = <span class="dhsame">%s</span>.</li>
</ol>
    """ % (bits, p, g, a, g, a, p, (g^a), b, g, b, p, (g^b), (g^b), a, p,
       (g^ b)^a, g^a, b, p, (g^a)^b))
︡72a5019d-3492-4d1d-b91c-963c72c26ad8︡{"interact":{"style":"None","flicker":false,"layout":[[["bits",12,null]],[["button",12,null]],[["",12,null]]],"id":"49b2c506-9020-4c2c-8abb-c76b5d7a06a9","controls":[{"control_type":"slider","default":0,"var":"bits","width":null,"vals":["8","12","16","20","24","28","32","36","40","44","48","52","56","60","64","68","72","76","80","84","88","92","96","100","104","108","112","116","120","124","128","132","136","140","144","148","152","156","160","164","168","172","176","180","184","188","192","196","200","204","208","212","216","220","224","228","232","236","240","244","248","252","256","260","264","268","272","276","280","284","288","292","296","300","304","308","312","316","320","324","328","332","336","340","344","348","352","356","360","364","368","372","376","380","384","388","392","396","400","404","408","412","416","420","424","428","432","436","440","444","448","452","456","460","464","468","472","476","480","484","488","492","496","500","504","508","512"],"animate":true,"label":"Number of bits","display_value":false},{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["Show new example"],"label":"","nrows":null,"width":null,"var":"button"}]}}︡
︠12f911b6-895d-493b-b0a0-d8e5dfd8a751︠










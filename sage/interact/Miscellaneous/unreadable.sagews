︠94eb447d-4f60-418c-b215-fe5ecc458ccb︠
@interact
def _(h=(20,(1,36,1))):
    print (lambda f:f(0,f))(
        lambda n,f:'%s\n%s'%(
            ('*'*(2*n+1)).join([' '*(h-n-1)]*2),
            ((n<h-1 and f(n+1,f)) or '')
        )
    )
︡405ab106-0497-48c2-a5c0-cefa0b93f004︡{"interact":{"style":"None","flicker":false,"layout":[[["h",12,null]],[["",12,null]]],"id":"5f159fb9-0361-4d29-a9d5-36df45b3cfaa","controls":[{"control_type":"slider","default":19,"var":"h","width":null,"vals":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36"],"animate":true,"label":"h","display_value":true}]}}︡
︠67cfa3b5-1f66-479f-b9e0-8bb020f05a35︠

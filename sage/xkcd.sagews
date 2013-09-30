︠8ec79a7a-f821-4cbd-adec-d6c01f8f5008a︠
%auto

# AUTHOR: Maarten Derickx
import urllib2
import json
@interact
def xkcd(n=""):
    file = None
    data = None
    url = "http://dynamic.xkcd.com/api-0/jsonp/comic/%s"%n
    try:
        file = urllib2.urlopen(url)
        data=file.read()
    except urllib2.HTTPError:
        pass
    finally:
        if file:
            file.close()
    if data:
        data=json.loads(data)
        img=data['img']
        alt=data['alt']
        title=data['safe_title']
        link="http://xkcd.com/%s"%n
        html('<h1>%s</h1><img src="%s" title="%s" ><div>Source: <a href="%s" target="_blank">%s</a></div>'%(title,img,alt,link,link))
        return
    raise RuntimeError,"Could not obtain comic data from %s . Maybe you should enable time travel!"%url
︡9f7171bb-1a96-48f4-a042-d694d494674f︡{"auto":true}︡{"interact":{"style":"None","flicker":false,"layout":[[["n",12,null]],[["",12,null]]],"id":"d865106f-f5b8-4776-951b-de465305a950","controls":[{"control_type":"input-box","default":"","label":"n","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"n","type":"<type 'str'>"}]}}︡
︠d034ea97-4f45-4bc1-8bd8-bee75d11730b︠










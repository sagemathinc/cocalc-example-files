#!/usr/bin/env python
# -*- coding: utf-8 -*-
# This runs a demo-webservice inside SMC

def get_tun0ip():
    import subprocess as sp
    ifconfig = sp.check_output(["ifconfig", "tun0" ])
    tun0ip = ifconfig.split("\n")[1].split(":")[1].split(" ")[0]
    print "tun0 IP address is '%s'" % tun0ip
    return tun0ip

def projectid():
    import json
    import os
    info = json.load(open(os.path.join("..", ".sagemathcloud", "info.json"), 'r'))
    return info['project_id']

from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    from datetime import datetime
    return 'Hello World!\nThe current time is %s' % datetime.utcnow()

if __name__ == "__main__":
    for i in range(10):
        import random
        port = random.randint(2000, 32000)
        try:
            print "Tying to open https://cloud.sagemath.org/%s/port/%s/" % (projectid(), port)
            #app.run(host = get_tun0ip(), port = port)
            app.run(host = "0.0.0.0", port = port)
            import sys; sys.exit(0)
        except Exception as e:
            print "... failed, trying other port\n%s" % e

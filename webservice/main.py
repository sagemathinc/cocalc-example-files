#!/usr/bin/env python
# -*- coding: utf-8 -*-
# This runs a demo-webservice inside SMC.
# Run by typing
#      sage -python main.py

import json
import os

from flask import Flask, request
app = Flask(__name__)
#app.debug = True  # Uncomment this if you wish to debug

port = 8765
info = json.load(
    open(os.path.join(os.environ['HOME'], ".smc", "info.json"), 'r'))
base_url = "/%s/port/%s" % (info['project_id'], port)

html_template = """
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<title>%(title)s</title>
</head>

<body>

<p>%(content)s</p>

</body>
</html>
"""


@app.route(base_url + '/', strict_slashes=False)
def info():
    content = """<p>SMC Webservice running</p>
    <p><b>Routes:</b></p>

    <ul>
    <li><a href="%(route)s/">%(route)s/ - list of routes</a></li>
    <li><a href="%(route)s/get">%(route)s/get - simple get request</a></li>
    </ul>""" % {'route': base_url}
    return html_template % {'title': 'Info', 'content': content}


@app.route(base_url + '/get', methods=['GET'])
def get_something():
    content = """<p>Try something like <a href="%(base_url)s/get?something=foo">%(base_url)s/get?something=foo</a></p>""" % {
        'base_url': base_url}
    if request.method == 'GET':
        something = request.args.get("something", "")
        if len(something) > 0:
            content = "Got " + something
    return html_template % {'title': 'Info', 'content': content}

if __name__ == "__main__":
    try:
        info = json.load(
            open(os.path.join(os.environ['HOME'], ".smc", "info.json"), 'r'))
        print("Try to open https://cloud.sagemath.com" + base_url + '/')
        app.run(host='0.0.0.0', port=port)
        import sys
        sys.exit(0)
    except Exception as e:
        print "... failed, try another port (change the port= line in the script) \n%s" % e

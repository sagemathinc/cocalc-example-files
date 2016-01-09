#!/usr/bin/env python3
# coding: utf8

'''
This creates an index file `index.js` such that SageMathCloud (https://cloud.sagemath.com)
knows about each relevant file, information in it, etc.

The format of `index.js` is standard JSON, such that a node.js process can read it easily.
'''

from json import dump
from codecs import open
from glob import glob
from os.path import isdir

index = []

for fn in glob("*"):
    if isdir(fn):
        index.append(fn)

with open("index.js", "w", "utf8") as out:
    dump(index, out)


#!/usr/bin/env python
import sys, os
print("run-sagetex.py -- START".center(80, "-"))
dir, file = sys.argv[1].split("/")
os.system("cd %s && sage %s" % (dir, file))
print("run-sagetex.py -- END".center(80, "-"))

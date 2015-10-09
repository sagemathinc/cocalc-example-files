#!/usr/bin/env python
# This is a small wrapper script, because running sage on a
# *.sagetex.sage file in a subdirectory is broken. Once this
# works fine, and produces the sout file in the subdirectory,
# this script is no longer necessary -> modify latexmkrc !
import sys, os
print("run-sagetex.py -- START".center(80, "-"))
dir, file = sys.argv[1].split(os.path.sep)
os.system("cd %s && sage %s" % (dir, file))
print("run-sagetex.py -- END".center(80, "-"))

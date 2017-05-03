#!/bin/env

import os
import sys

def add_handler(n):

    def real(s):
        return n+s

    return real

"""
python m.py appname device 0.1.2.3.4
"""
app = "demo"
device = "fr735xt"
r_number = "0.3.4".split(".")

if len(sys.argv) >= 2 :
    app = sys.argv[1]

if len(sys.argv) >= 3 :
    device = sys.argv[2]

if len(sys.argv) >= 4 :
    r_number = sys.argv[3].split(".")


s_files = os.listdir("source")
r_files = os.listdir("resources")


s_files = map(add_handler("source/"),s_files)
r_files = filter( lambda v:( v != "images") , r_files)
r_files = map(add_handler("resources/"),r_files)


m_file = "manifest.xml"

print "\n"
cmds = [
    "connectiq",
    "openssl genrsa -out developer_key.pem 4096",
    "openssl pkcs8 -topk8 -inform PEM -outform DER -in developer_key.pem -out developer_key.der -nocrypt",
    "monkeyc -o %s.prg -y developer_key.der -m %s -z %s %s" % (app,m_file ,":".join(r_files) ," ".join(s_files)) ,
    "monkeydo %s.prg  %s" %(app,device)
]

for num in r_number:
    cmd = cmds[int(num)]
    print cmd
    os.system(cmd)

print "\n"

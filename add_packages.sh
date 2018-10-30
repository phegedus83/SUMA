#!/bin/bash 

set -e 

zypper --non-interactive --gpg-auto-import-keys ref 
zypper --non-interactive in python python-xml

zypper up -y
zypper clean

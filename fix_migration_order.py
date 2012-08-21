#! /usr/bin/python

import argparse, os, re, subprocess

parser = argparse.ArgumentParser(description="change the order of the migration files")

parser.add_argument("anchor", help="previous file")
parser.add_argument("file", help="target file")
parser.add_argument("classname", help="class and file name")

args = parser.parse_args()

if not os.path.isfile(args.anchor) or not os.path.isfile(args.file): 
    raise Exception("check file arguments")

#finds the timestamp
match = re.match("(?P<prefix>\d+)_.*", os.path.basename(args.anchor))

if not match:
    raise Exception("bad formated anchor file")

#format the new prefix
new_filename = "{0}_{1}.php".format(str(int(match.group("prefix")) + 1), args.classname.lower())

new_filename = "{0}/{1}".format(os.path.dirname(os.path.abspath(args.file)), new_filename)

subprocess.call(["mv", os.path.abspath(args.file), new_filename])
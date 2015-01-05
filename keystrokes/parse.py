#!/usr/bin/env python

import json, sys, scipy.io

infile = sys.argv[1]

def deltas(items):
	v = sorted(items)
	for i in range(2, len(v)):
		yield(int(v[i]) - int(v[i - 1]))

jdata = json.loads(open(infile).read());

items = {}
for i in jdata['request']['records'].split(";"):
	id, time, what, keycode = i.split(",")
	k = id + what
	if not k in items:
		items[k] = []
	items[k].append(time)

for k, v in items.items():
	items[k] = list(deltas(v))

# vectors:
# f1up, f1down, f1pressed, ... f5pressed

scipy.io.savemat(infile[:-3] + "mat", mdict = items, oned_as = "row")

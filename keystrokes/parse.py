#!/usr/bin/env python

import json, sys, scipy.io

ofile = sys.argv[1]

def deltas(items):
	v = sorted(items)
	for i in range(2, len(v)):
		yield float(int(v[i]) - int(v[i - 1]))

data = json.loads(sys.stdin.read());

items = {}
for i in data:
	id, time, what, keycode = i.split(",")
	k = id + what
	if not k in items:
		items[k] = []
	items[k].append(time)

for k, v in items.items():
	items[k] = list(deltas(v))

# vectors:
# f1up, f1down, f1pressed, ... f5pressed

scipy.io.savemat(ofile, mdict = items, oned_as = "row")

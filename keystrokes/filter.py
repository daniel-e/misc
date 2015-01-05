#!/usr/bin/env python

import json, sys

data = json.loads(sys.stdin.read());
print json.dumps(data['request']['records'].split(";"))

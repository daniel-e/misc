#!/bin/sh

if [ ! -e memmv ]; then
	make
fi

if [ ! -e memmv ]; then
	echo "Could not find memmv."
fi

type octave >/dev/null 2>&1 || { echo >&2 "octave not found"; exit 1; }

t=`./memmv`
echo $t milliseconds to copy 512MB memory
octave -q --eval "printf('theoretical GFLOPS: %f\n', 8192^2/($t/1000)/1e9)"
octave -q gflops.m


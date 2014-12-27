#!/bin/bash

ATLASDST=/tmp/atlas3.10.2
OPENBLASDST=/tmp/openblas0.2.13

function installatlas {
	echo "installing atlas..."
	tar xjf atlas3.10.2.tar.bz2
	cd ATLAS
	mkdir build
	cd build
	../configure -b 64 --shared -D -c -DPentiumCPS=2200 --with-netlib-lapack-tarfile=../../lapack-3.5.0.tgz --prefix=$ATLASDST
	make -j8 build 
	make install
	cd ../..
	rm -rf ATLAS

	for i in libsatlas.so libtatlas.so; do
		if [ ! -e $ATLASDST/lib/$i ]; then
			echo $ATLASDST/lib/$i does not exist.
			exit 1
		fi
	done
}

function installopenblas {
	mkdir openblas && tar xzf xianyi-OpenBLAS-v0.2.13-0-g51ce5ef.tar.gz -C openblas --strip-components=1
	cd openblas/
	make -j8
	make PREFIX=$OPENBLASDST install
	cd ..
	rm -rf openblas

	if [ ! -e $OPENBLASDST/lib/libopenblas.so ]; then
		echo $OPENBLASDST/lib/libopenblas.so does not exist.
		exit 1
	fi
}


#installatlas
#installopenblas

rm -f allresults.csv

for i in "" "$ATLASDST/lib/libsatlas.so" "$ATLASDST/lib/libtatlas.so" "$OPENBLASDST/lib/libopenblas.so"; do
	if [ "$i" == "" ]; then
		echo "-> plain octave"
		octave -q perf.m
	else
		echo "->" $i
		LD_PRELOAD=$i octave -q perf.m
	fi
	cat result.csv >> allresults.csv
	rm -f result.csv
done

octave -q plotresults.m




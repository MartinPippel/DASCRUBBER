DEST_DIR = ~/bin

CFLAGS = -O3 -Wall -Wextra -Wno-unused-result -fno-strict-aliasing

ALL = DAScover DASqv DAStrim DASpatch DASedit DASmap DASrealign REPcover REPqv REPtrim

all: $(ALL)

DAScover: DAScover.c align.c align.h DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) -o DAScover DAScover.c align.c DB.c QV.c -lm

REPcover: REPcover.c DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) -o REPcover REPcover.c DB.c QV.c -lm

DASqv: DASqv.c align.c align.h DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) -o DASqv DASqv.c align.c DB.c QV.c -lm

REPqv: REPqv.c DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) -o REPqv REPqv.c DB.c QV.c -lm

DAStrim: DAStrim.c align.c align.h DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) -o DAStrim DAStrim.c align.c DB.c QV.c -lm

REPtrim: REPtrim.c DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) -o REPtrim REPtrim.c DB.c QV.c -lm

DASpatch: DASpatch.c align.h align.c DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) -o DASpatch DASpatch.c align.c DB.c QV.c -lm

DASedit: DASedit.c align.c align.h DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) -o DASedit DASedit.c align.c DB.c QV.c -lm

DASmap: DASmap.c DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) -o DASmap DASmap.c DB.c QV.c -lm

DASrealign: DASrealign.c align.c align.h DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) -o DASrealign DASrealign.c align.c DB.c QV.c -lm

clean:
	rm -f $(ALL)
	rm -fr *.dSYM
	rm -f scrubber.tar.gz

install:
	cp $(ALL) $(DEST_DIR)

package:
	make clean
	tar -zcf scrubber.tar.gz README.md Makefile *.h *.c

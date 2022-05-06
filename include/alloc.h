/*

Some tools to work with memory

Symbols:
    alloc
    free
    init_heap

*/

#ifndef ALLOC_H
#define ALLOC_H

#ifndef HEAP_ADDR
    #define HEAP_ADDR 0x80
#endif

/*

Allocates bytes on "heap"

alloc {heap addr} {bytes count} -> r0 contains pointer to block

*/
macro alloc/2
    ldi r2, $1
    ld r2, r3
    move r3, r0
    push r2
    ldi r2, $2
    add r2, r3
    pop r2
    st r2, r3
mend

/*

Frees bytes on "heap"

free {heap addr} {bytes count}

*/
macro free/2
    ldi r2, $1
    ld r2, r3
    push r2
	ldi r2, $2
	sub r3, r2
	pop r3
	st r3, r2
mend

/*

Init heap at given address

init_heap {addr}

*/
macro init_heap/1
    ldi r2, $1
	ldi r3, 1
	add r2, r3
    st r2, r3
mend

#endif

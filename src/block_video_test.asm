#include "util.h"

asect 0

main:
    addsp STACK_OFFSET

    call 4, 0x42

    ldi r0, 0x05
    ldi r1, 0x06

    ldi r2, 0xfb
    ldi r3, 0xf0
    st r2, r3
    st r2, r1
    st r2, r0

    ldi r3, 0b11000111
    st r2, r3

	ldi r3, 0xff
loop:
	dec r3
	bnz loop

	ldi r3, 0x0f
	
    st r2, r3
    st r2, r1
    st r2, r0

    ldi r3, 0b11000111
    st r2, r3
    
    halt

end.

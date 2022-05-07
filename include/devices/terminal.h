/*
Summary:

    printc
    prints
    lprints
    cprints
    lcprints

*/

#ifndef TERMINAL_H
#define TERMINAL_H

#include <devices.h>
    
#define TERM_CLEAR  0x80 // clear command for terminal
#define TERM_RETURN 0x0a // LF code
#define TERM_LF     0x0a // LF code

//
// Macros
//

// print char to terminal
macro printc/1
    ldi r2, TERMINAL_ADDR
    ldi r3, $1
    st r2, r3
mend

// macro for func_prints
// prints addr, len
macro prints/1

func_prints: ext

    ldi r0, $1
    jsr func_prints

mend

// macro for func_cprints
// cprints addr, len
macro cprints/1

func_cprints: ext

    ldi r0, $1
    jsr func_cprints

mend

// macro for func_lcprints
// lcprints addr, len
macro lcprints/2

func_lcprints: ext

    ldi r0, $1
    ldi r1, $2
    jsr func_lcprints

mend

// macro for func_lprints
// prints addr, len
macro lprints/2

func_lprints: ext

    ldi r0, $1
    ldi r1, $2
    jsr func_lprints

mend

//
// Subroutines
//

// print null-terminated string from rom
// at given addres to terminal
// r0 - address
rsect func_cprints

func_cprints>
    ldi r2, TERMINAL_ADDR

loop:
    ldc r0, r3
    st r2, r3
    inc r0 
    tst r3
    bnz loop

    rts

// print null-terminated string from ram
// at given addres to terminal
// r0 - address
rsect func_prints

func_prints>
    ldi r2, TERMINAL_ADDR

loop:
    ld r0, r3
    st r2, r3
    inc r0 
    tst r3
    bnz loop

    rts

// print string of given length from rom
// at given addres to terminal
// r0 - address
// r1 - length
rsect func_lcprints

func_lcprints>
    ldi r2, TERMINAL_ADDR

    while
        tst r1
    stays nz
        ldc r0, r3
        st r2, r3
        inc r0 
        dec r1
    wend

    rts

// print string of given length from ram
// at given addres to terminal
// r0 - address
// r1 - length
rsect func_lprints

func_lprints>
    ldi r2, TERMINAL_ADDR

    while
        tst r1
    stays nz
        ld r0, r3
        st r2, r3
        inc r0 
        dec r1
    wend

    rts

#endif

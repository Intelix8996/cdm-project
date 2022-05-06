/*
Summary:

    printc_t
    prints_t
    lprints_t
    cprints_t
    lcprints_t

    TODO: Auto length
*/

#ifndef TERMINAL_H
#define TERMINAL_H

#include <devices.h>
    
#define TERM_CLEAR  0x80 // clear command for terminal
#define TERM_RETURN 0x0a // LF code
#define TERM_LF     0x0a // LF code

// print char to terminal
macro printc_t/1
    ldi r2, TERMINAL_ADDR
    ldi r3, $1
    st r2, r3
mend

// macro for func_cprints_t
// cprints_t addr, len
macro lcprints_t/2

func_lcprints_t: ext

    ldi r0, $1
    ldi r1, $2
    jsr func_lcprints_t

mend

// macro for func_prints_t
// prints_t addr, len
macro lprints_t/2

func_lprints_t: ext

    ldi r0, $1
    ldi r1, $2
    jsr func_lprints_t

mend

// print string of given length from rom
// at given addres to terminal
// r0 - address
// r1 - length
rsect func_lcprints_t

func_lcprints_t>
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
rsect func_lprints_t

func_lprints_t>
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

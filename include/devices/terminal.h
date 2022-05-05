#ifndef TERMINAL_H
#define TERMINAL_H


// TODO: Auto length

#include <devices.h>
    
#define TERM_CLEAR 0x80 // clear command for terminal

// print char to terminal
macro printchar_t/1
    ldi r2, TERMINAL_ADDR
    ldi r3, $1
    st r2, r3
mend

// macro for func_printconststring_t
// printconststring_t addr, len
macro printconststring_t/2

func_printconststring_t: ext

    ldi r0, $1
    ldi r1, $2
    jsr func_printconststring_t

mend

// macro for func_printtring_t
// printstring_t addr, len
macro printstring_t/2

func_printstring_t: ext

    ldi r0, $1
    ldi r1, $2
    jsr func_printstring_t

mend

// print string of given length from rom
// at given addres to terminal
// r0 - address
// r1 - length
rsect func_printconststring_t

func_printconststring_t>
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
rsect func_printstring_t

func_printstring_t>
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

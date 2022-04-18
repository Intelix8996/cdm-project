#include <devices.h>

asect 0   
/*
   b7 - UP
   b6 - DOWN
   b5 - LEFT
   b4 - RIGHT
*/
main:
    ldi r3, 0                               //
    ld r3, r1 // x-coordinate in r1         //
    inc r3                                  //
    ld r3, r2 // y-coordinate in r2         //
    ldi r3, DISP_A_ADDR                     // clears current cursor position
    st r3, r1                               //
    st r3, r2                               //
    ldi r0, 0b10100000                      //
    st r3, r0                               //

    ldi r0, KEYPAD_ADDR
    ld r0, r0 //KEYPAD data in r0
    if
        shla r0
    is cs
        inc r2
        inc r2
        inc r2
    fi
    if
        shla r0
    is cs
        dec r2
        dec r2
        dec r2
    fi
    if
        shla r0
    is cs
        dec r1
        dec r1
        dec r1
    fi
    if
        shla r0
    is cs
        inc r1
        inc r1
        inc r1
    fi

    st r3, r1           //
    st r3, r2           // printing new cursor position
    ldi r0, 0b10100111  //
    st r3, r0           //
    ldi r3, 0               //
    st r3, r1               //
    inc r3                  // storing new cursor coordinates at 0 and 1 data cells
    st r3, r2               //
    ldi r3, 0xf8       //
    ldi r2, 0x80       // return from interrupt
    st r3, r2          //
    rti                //
end.

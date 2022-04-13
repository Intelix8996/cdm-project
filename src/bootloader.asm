#include <devices.h>
#include "util.h"
asect 0
main:
    addsp STACK_OFFSET
    ei                       // Enable interrupts
    ldi r0, IR_BUFFER_ADDR  // Init IR buffer
    ldi r1, 0xff
    st r0, r1

                         
    ldi r3, 0         //
    ldi r1, 10        //
    st r3, r1         // stores original cursor coordinates ad 0 and 1 data cells
    inc r3            //
    ldi r1, 15        // 
    st r3, r1         //

    ldi r3, DISP_A_ADDR    //
    ldi r1, 10             //
    ldi r2, 15             //
    st r3, r1              //
    st r3, r2              // prints cursor in original position
    ldi r0, 0b10100111     //
    st r3, r0              //

    
    ldi r2, ROM_CONTROLLER_ADDR  //
    ldi r3, 1                    //
    st r2, r3                    // jump to 1st ROM bank 
    jsr 0                        //
    halt                        

end.

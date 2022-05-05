#include <devices.h>
#include <call.h>

#define STACK_OFFSET    -128    // Stack offset

asect 0

main:
    addsp STACK_OFFSET        // Move SP

    ei                       // Enable interrupts
    
    ldi r0, IR_BUFFER_ADDR  // 
    ldi r1, 0x00            // Init IR buffer
    st r0, r1               //

    //call 2, APP_ENTRY
    //halt

    ldi r1, 0x0a            // return ascii code
    ldi r2, TERMINAL_ADDR

loop:
    ld r2, r3               // read char from keyboard
    st r2, r3               // loopback to terminal

    if
        tst r3              // if read a proper char
    is pl
        if
            cmp r1, r3      // if char == return
        is eq
            ldi r0, 0x00    // read last char 
            ld r0, r0       // 
            ldi r3, "0"     // convert ascii code
            sub r0, r3      // to number

            ldi r0, ROM_CONTROLLER_ADDR //
            st r0, r3                   // call module with number
            jsr APP_ENTRY               // in r3

            ldi r2, TERMINAL_ADDR       // restore r2
        else
            ldi r0, 0x00                // else save
            st r0, r3                   // char to 0x00
        fi
    fi

    br loop                             // back to loop

    halt
end.

#include <devices.h>
#include <call.h>
#include <devices/terminal.h>

#define STACK_OFFSET    -144    // Stack offset

asect 0

main:
    addsp STACK_OFFSET        // Move SP

    ei                       // Enable interrupts
    
    ldi r0, IR_BUFFER_ADDR  // 
    ldi r1, 0x00            // Init IR buffer
    st r0, r1               //

    cprints sample_message
    printc TERM_LF
    cprints battleship_message
    printc TERM_LF

    ldi r1, 0x0a            // return ascii code
    ldi r2, TERMINAL_ADDR

loop:
    ld r2, r3               // read char from keyboard

    if
        tst r3              // if read a proper char
    is pl
        st r2, r3           // loopback to terminal
        if
            cmp r1, r3      // if char == return
        is eq
            ldi r0, 0x00    // read last char 
            ld r0, r0       // 
            ldi r3, "0"     // convert ascii code
            sub r0, r3      // to number

            pushall         // save registers

            ldi r0, ROM_CONTROLLER_ADDR //
            st r0, r3                   // call module with number
            jsr APP_ENTRY               // in r3

            popall                      // restore registers
        else
            ldi r0, 0x00                // else save
            st r0, r3                   // char to 0x00
        fi
    fi

    br loop                             // back to loop

    halt

sample_message:
    dc "enter 2 to run sample program", 0

battleship_message:
    dc "enter 4 to run battleship", 0
end.

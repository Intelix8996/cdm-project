#include <devices.h>
#include <call.h>

#define STACK_OFFSET    -128    // Stack offset

asect 0

main:
    addsp STACK_OFFSET        // Move SP

    ei                       // Enable interrupts
    
    ldi r0, IR_BUFFER_ADDR  // Init IR buffer
    ldi r1, 0x00
    st r0, r1

    ldi r2, 0xf6
    ldi r3, 0xff
    st r2, r3

    //call 2, APP_ENTRY

    ldi r2, TERMINAL_ADDR
    ldi r1, 0x80
    ldi r0, 0x0a
loop:
    ld r2, r3
    if
        tst r3
    is pl
        if
            cmp r0, r3
        is eq
            st r2, r0
            dec r1
            ld r1, r3
            ldi r1, "0"
            sub r3, r1

            ldi r2, ROM_CONTROLLER_ADDR
            st r2, r1
            jsr GENERIC_ENTRY

            ldi r2, TERMINAL_ADDR
            ldi r1, 0x80
            ldi r0, 0x0a
            
        else
            st r2, r3
            st r1, r3
            inc r1
        fi
    fi

    br loop

    halt
end.

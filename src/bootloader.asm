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

    call 2, APP_ENTRY
    halt
end.

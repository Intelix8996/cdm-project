#include <devices.h>
#include <call.h>

asect 0x00

main:
    pushall

    ldi r0, 0x80
    ld r0, r1

    ldi r2, TERMINAL_ADDR
    ld r2, r3

    while
        tst r3
    stays pl
        st r1, r3
        inc r1

        ld r2, r3
    wend

    st r0, r1

    iretp

end.

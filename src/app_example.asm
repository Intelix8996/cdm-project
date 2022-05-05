#include <call.h>
#include <devices.h>

asect 0

main:
    ldi r2, TERMINAL_ADDR
    ldi r3, "s"
    st r2, r3

    mret     

end.

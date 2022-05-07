#include <call.h>
#include <devices.h>

#include <devices/terminal.h>

asect 0

main:
    printc "s"
    printc TERM_LF

    cprints str

    printc TERM_RETURN

    mret    

asect 0x50
str:
    dc "func_printstring_t", 0

end.

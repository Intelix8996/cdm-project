#include <call.h>
#include <devices.h>

#include <devices/terminal.h>

asect 0

main:
    printc_t "s"
    printc_t TERM_LF

    cprints_t str

    printc_t TERM_RETURN

    mret    

asect 0x50
str:
    dc "func_printstring_t", 0

end.

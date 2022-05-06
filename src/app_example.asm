#include <call.h>
#include <devices.h>

#include <devices/terminal.h>

asect 0

main:
    printc_t "s"
    printc_t 0x0a
    
    lcprints_t str, 18

    lcprints_t str, 5

    printc_t TERM_CLEAR

    mret    

asect 0x50
str:
    dc "func_printstring_t" 

end.

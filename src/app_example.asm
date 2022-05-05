#include <call.h>
#include <devices.h>

#include <devices/terminal.h>

asect 0

main:
    printchar_t "s"
    printchar_t 0x0a
    
    printconststring_t str, 18

    printconststring_t str, 5

    mret    

asect 0x50
str:
    dc "func_printstring_t" 

end.

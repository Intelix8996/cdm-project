#include <call.h>
#include <devices/terminal.h>

asect 0

main:
    cprints str     // print null-ternianted string str
    printc TERM_LF  // print "line feed" symbol

    mret            // return from module

asect 0x50
str:
    dc "Hello world!", 0

end.

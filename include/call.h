#ifndef CALL_H
#define CALL_H

#include "devices.h"

macro call/2
    ldi r2, ROM_CONTROLLER_ADDR
    ldi r3, $1
    st r2, r3
    jsr $2
mend

#endif

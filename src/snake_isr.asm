#include <call.h>

#include "snake/vars.h"

asect 0
up:
    pushall 

    ldi r0, DIRECTION
    ldi r1, 2
    st r0, r1

    br exit

down:    
    pushall 

    ldi r0, DIRECTION
    ldi r1, 3
    st r0, r1

    br exit

left:
    pushall 

    ldi r0, DIRECTION
    ldi r1, 1
    st r0, r1

    br exit

right:
    pushall 

    ldi r0, DIRECTION
    ldi r1, 0
    st r0, r1

    br exit

exit:
    iretp

asect 0xf0
dc up, 0, down, 0, left, 0, right

end.

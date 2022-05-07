#include <devices.h>
#include <call.h>
#include <battleship/global_vars.h>
#include <battleship/map_constants.h>

asect 0
main:
    ldi r2, PLAYERS_TURN
    ld r2, r3
    if
        tst r3             // r3 contains information about Player's turn
    is z
        br main
    fi


end.
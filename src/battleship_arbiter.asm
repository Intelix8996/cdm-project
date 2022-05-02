#include <devices.h>
#include <call.h>
#include <battleship/global_vars.h>
#include <battleship/map_constants.h>

asect 0
main:
    ldi r2, COMP_SHIPS   // 
    ldi r3, 20          //
    st r2, r3          // saving the number of ships in RAM
    inc r2            //
    st r2, r3        //
    
    ldi r2, RANDOM_GEN_ADDR       // Determining whose turn is first by random
    ld r2, r3                    // First player in r3
    ldi r0, 0b00000001          // 0 - Computer, 1 - Player
    and r0, r3                 //  




end. 
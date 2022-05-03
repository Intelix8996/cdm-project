#include <devices.h>
#include <call.h>
#include <battleship/global_vars.h>
#include <battleship/map_constants.h>

asect 0

main:
    ldi r2, IR_PAGE_REG_ADDR     // 
    ldi r3, 1                   // IR bank is 1
    st r2, r3                  //
    
    ldi r2, IR_BUFFER_ADDR   //
    ldi r3, 0xff            // enable interrupts
    st r2, r3              //
    
    ldi r3, 1             //
    ldi r1, X_CURSOR     //
    st r1, r3           //  initial position of a cursos is on field (0,0) [ x and y coordinates are 1 ]
    inc r1             //
    st r1, r3         //   



    ldi r2, RANDOM_GEN_ADDR          //
    ld r2, r0                       //
    ldi r1, 0x0f                   // choosing random map (1-16) for Computer and storing it in r3
    and r1, r0                    // 

    ldi r1, P_COMP_MAP
    ldi r2, ROM_CONTROLLER_ADDR    //
    ldi r3, FIRST_MAP             //
    add r0, r3                   // call for copying Computer's map to RAM
    st r2, r3                   //
    jsr 0                      //



    ldi r2, RANDOM_GEN_ADDR          //
    ld r2, r0                       //
    ldi r1, 0x0f                   // choosing random map (1-16) for Player and storing it in r3
    and r1, r0                    // 

    ldi r1, P_PLAYER_MAP
    ldi r2, ROM_CONTROLLER_ADDR    //
    ldi r3, FIRST_MAP             //
    add r0, r3                   // call for copying Player's map to RAM
    st r2, r3                   //
    jsr 0                      //


    ldi r0, P_PLAYER_MAP     //
    rcall 1, 0              // Drawing a Player's map

    rcall 2, 0          // Calling the Arbiter module

    halt

    

end.
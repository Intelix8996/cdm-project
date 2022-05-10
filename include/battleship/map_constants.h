#ifndef MAP_CONST_H
#define MAP_CONST_H

#define E_CELL                  0b00000000  // Empty cell
#define S1_CELL                 0b00010001  // Single-deck ship cell
#define S2_CELL                 0b00100001  // Two-deck ship cell
#define S3_CELL                 0b00110001  // Three-deck ship cell
#define S4_CELL                 0b01000001  // Four-deck ship cell
#define H_EMP_CELL              0b10000000  // Hit empty cell
#define K_CELL                  0b10000001  // Killed ship cell

#define P_COMP_MAP              0x00        // Number of a RAM page with Computer map
#define P_PLAYER_MAP            0x01        // Number of a RAM page with player map
#define FIRST_MAP               100         // Number of a bank that holds firts map

#endif

#ifndef MAP_CONST_H
#define MAP_CONST_H

#define E_CELL                  0b00000000 // Empty cell
#define S1_CELL                 0b00010001 // Single-deck ship cell
#define S2_CELL                 0b00100001 // Two-deck ship cell
#define S3_CELL                 0b00110001 // Three-deck ship cell
#define S4_CELL                 0b01000001 // Four-deck ship cell
#define K1_CELL                 0b10010001 // Killed single-deck ship cell
#define K2_CELL                 0b10100001 // Killed two-deck ship cell
#define K3_CELL                 0b10110001 // Killed three-deck ship cell
#define K4_CELL                 0b11000001 // Killed four-deck ship cell
#define H_EMP_CELL              0b10000000 // Hit empty cell
#define P_COMP_MAP              0x00 // Number of a RAM page with Computer map
#define P_PLAYER_MAP            0x01 // Number of a RAM page with player map
#define FIRST_MAP               100  // Number of a bank that holds firts map

#endif

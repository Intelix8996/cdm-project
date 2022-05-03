#ifndef MAP_CONST_H
#define MAP_CONST_H

#define E_CELL         0b00000000 // Empty cell
#define S_CELL         0b00000001 // Ship cell
#define N_CELL         0b00000011 // Cells next to ship cells
#define K_CELL         0b00000010 // Killed ship
#define P_COMP_MAP     0x00 // Number of a RAM page with Computer map
#define P_PLAYER_MAP   0x01 // Number of a RAM page with player map
#define FIRST_MAP      100  // Number of a bank that holds firts map

#endif

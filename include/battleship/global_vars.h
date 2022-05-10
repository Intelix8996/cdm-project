#ifndef GLOB_VARS_H
#define GLOB_VARS_H

#define X_CURSOR        0x00 // Addr of a X-coordinate of cursor.  1 <= *X_CURSOR <= 28
#define Y_CURSOR        0x01 // Addr of a Y-coordinate of cursor.  1 <= *Y_CURSOR <= 28
#define COMP_SHIPS      0x02 // Addr of a number of Computer's live ships. 0 <= *COMP_SHIPS <= 20
#define PLAYER_SHIPS    0x03 // Addr of a number of Player's live ships. 0 <= *PLAYER_SHIPS <= 20

#define NUM_CELL        0x04 // Addr of a number of a cell a cursos is pointing to. 0x80 <= *NUM_CELL <= 0xe4
#define PLAYERS_TURN    0x05 // Contains a cell, that Player have chose
#define SIZE_OF_SHIP    0x06 // Contains information about a size of a ship to which a hit cell belongs
#define DIR_OF_HITS     0x07 // Contains information about direction of a ship relative to a first hit cell

#define NUM_OF_HITS     0x08 // Contains a number of hit cells of attacked ship
#define PREVIOUS_HIT    0x09 // Contains number of cell that was hit in previous turn
#define HIT_CELL1       0x0a // Number of a cell that was hit the first
#define HIT_CELL2       0x0b // Number of a cell that was hit the second

#define HIT_CELL3       0x0c // Number of a cell that was hit the third
#define HIT_CELL4       0x0d // Number of a cell that was hit the fourth
#define HIT_X_COORD1    0x0e // X coordinate of a cell that was hit the first
#define HIT_X_COORD2    0x0f // X coordinate of a cell that was hit the second

#define HIT_X_COORD3    0x10 // X coordinate of a cell that was hit the third
#define HIT_X_COORD4    0x11 // X coordinate of a cell that was hit the fourth
#define HIT_Y_COORD1    0x12 // Y coordinate of a cell that was hit the first
#define HIT_Y_COORD2    0x13 // Y coordinate of a cell that was hit the second

#define HIT_Y_COORD3    0x14 // Y coordinate of a cell that was hit the third
#define HIT_Y_COORD4    0x15 // Y coordinate of a cell that was hit the fourth


#endif

#ifndef GLOB_VARS_H
#define GLOB_VARS_H

#define X_CURSOR       0x00 // Addr of a X-coordinate of cursor.  1 <= *X_CURSOR <= 28
#define Y_CURSOR       0x01 // Addr of a Y-coordinate of cursor.  1 <= *Y_CURSOR <= 28
#define COMP_SHIPS     0x02 // Addr of a number of Computer's live ships. 0 <= *COMP_SHIPS <= 20
#define PLAYER_SHIPS   0x03 // Addr of a number of Player's live ships. 0 <= *PLAYER_SHIPS <= 20
#define NUM_CELL       0x04 // Addr of a number of a cell a cursos is pointing to. 0x80 <= *NUM_CELL <= 0xe4



#endif

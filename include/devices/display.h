/*

Defines constants for display    

*/

#ifndef DISPLAY_H
#define DISPLAY_H

// Colors
#define COLOR_BLACK                 0b00000000
#define COLOR_B                     0b00000100
#define COLOR_G                     0b00000010
#define COLOR_GB                    0b00000110
#define COLOR_R                     0b00000001
#define COLOR_RB                    0b00000101
#define COLOR_RG                    0b00000011
#define COLOR_RGB                   0b00000111

// Clear command
#define CMD_CLEAR                   0b10010000

// Write single pixel
#define CMD_WRITE_BLACK             0b10100000
#define CMD_WRITE_B                 0b10100100
#define CMD_WRITE_G                 0b10100010
#define CMD_WRITE_GB                0b10100110
#define CMD_WRITE_R                 0b10100001
#define CMD_WRITE_RB                0b10100101
#define CMD_WRITE_RG                0b10100011
#define CMD_WRITE_RGB               0b10100111

// Write column of pixels
#define CMD_WRITE_BLOCK_BLACK       0b11100000
#define CMD_WRITE_BLOCK_B           0b11100100
#define CMD_WRITE_BLOCK_G           0b11100010
#define CMD_WRITE_BLOCK_GB          0b11100110
#define CMD_WRITE_BLOCK_R           0b11100001
#define CMD_WRITE_BLOCK_RB          0b11100101
#define CMD_WRITE_BLOCK_RG          0b11100011
#define CMD_WRITE_BLOCK_RGB         0b11100111

// Clear display and write a single pixel 
#define CMD_WRITE_CLEAR_BLACK       0b10110000
#define CMD_WRITE_CLEAR_B           0b10110100
#define CMD_WRITE_CLEAR_G           0b10110010
#define CMD_WRITE_CLEAR_GB          0b10110110
#define CMD_WRITE_CLEAR_R           0b10110001
#define CMD_WRITE_CLEAR_RB          0b10110101
#define CMD_WRITE_CLEAR_RG          0b10110011
#define CMD_WRITE_CLEAR_RGB         0b10110111

// Clear display and write column lof pixels 
#define CMD_WRITE_BLOCK_CLEAR_BLACK 0b11110000
#define CMD_WRITE_BLOCK_CLEAR_B     0b11110100
#define CMD_WRITE_BLOCK_CLEAR_G     0b11110010
#define CMD_WRITE_BLOCK_CLEAR_GB    0b11110110
#define CMD_WRITE_BLOCK_CLEAR_R     0b11110001
#define CMD_WRITE_BLOCK_CLEAR_RB    0b11110101
#define CMD_WRITE_BLOCK_CLEAR_RG    0b11110011
#define CMD_WRITE_BLOCK_CLEAR_RGB   0b11110111

#endif

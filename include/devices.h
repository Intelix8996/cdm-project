/*

Define addresses of all devices

*/

#ifndef DEVICES_H
#define DEVICES_H

#define ROM_CONTROLLER_ADDR     0x78    // ROM controller address
#define RAM_CONTROLLER_ADDR     0x7e    // RAM controller address
#define DISP_A_ADDR             0x7a    // First (A) display address
#define DISP_B_ADDR             0x7b    // Second (B) display address
#define IR_BUFFER_ADDR          0x70    // IR enable buffer address
#define RANDOM_GEN_ADDR         0x71    // Random number generator address
#define IR_PAGE_REG_ADDR        0x72    // IR page register address
#define JOYSICK_ADDR            0x73    // Joystick address
#define KEYPAD_ADDR             0x7c    // Keypad address
#define TERMINAL_ADDR           0x74    // Terminal and keybaord address
#define MATH_COPROC_ADDR        0x75    // Math coprocessor address
#define USER_DISP_A_ADDR        0x76    // First seven segment display address
#define USER_DISP_B_ADDR        0x77    // Second seven segment display address
#define STATUS_DISP_ADDR        0x79    // Status hex display address

#endif

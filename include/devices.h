#ifndef DEVICES_H
#define DEVICES_H

#define ROM_CONTROLLER_ADDR     0xf8    // ROM controller address
#define RAM_CONTROLLER_ADDR     0xfe    // RAM controller address
#define DISP_A_ADDR             0xfa    // First (A) display address
#define DISP_B_ADDR             0xfb    // Second (B) display address
#define IR_BUFFER_ADDR          0xf0    // IR enable buffer address
#define RANDOM_GEN_ADDR         0xf1    // Random number generator address
#define IR_PAGE_REG_ADDR        0xf2    // IR page register address
#define JOYSICK_ADDR            0xf3    // Joystick address
#define KEYPAD_ADDR             0xfc    // Keypad address
#define TERMINAL_ADDR           0xf4    // Terminal and keybaord address
#define MATH_COPROC_ADDR        0xf5    // Math coprocessor address
#define USER_DISP_A_ADDR        0xf6    // First seven segment display address
#define USER_DISP_B_ADDR        0xf7    // Second seven segment display address
#define STATUS_DISP_ADDR        0xf9    // Status hex display address

#endif

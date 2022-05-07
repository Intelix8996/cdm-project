asect 0   
addsp -16               
ei
ldi r2, 0xfb 

ldi r3, 25 // y координата
push r3
ldi r3, 1 // x координата
push r3
ldi r3, lB // адрес буквы
jsr printChar 

ldi r3, 25 
push r3
ldi r3, 5 
push r3
ldi r3, lA // адрес буквы
jsr printChar 

ldi r3, 25 // y координата
push r3
ldi r3, 9 // x координата
push r3
ldi r3, lT // адрес буквы
jsr printChar 

ldi r3, 25 // y координата
push r3
ldi r3, 13 // x координата
push r3
ldi r3, lT // адрес буквы
jsr printChar 

ldi r3, 25 // y координата
push r3
ldi r3, 17 // x координата
push r3
ldi r3, lL // адрес буквы
jsr printChar

ldi r3, 25 // y координата
push r3
ldi r3, 21 // x координата
push r3
ldi r3, lE // адрес буквы
jsr printChar   

halt

printChar:
    addsp 1
    ldc r3, r0 
    st r2, r0  
    pop r0 
    st r2, r0
    pop r0
    st r2, r0
    ldi r1, 0b11100111 
    st r2, r1

    inc r3
    ldc r3, r0
    jsr pixToRight

    inc r3
    ldc r3, r0
    jsr pixToRight
    addsp -3
    rts
pixToRight: 
    st r2, r0
    ld r2, r0
    inc r0
    st r2, r0
    ld r2, r0
    st r2, r0
    ld r2, r0
    st r2, r0
    rts

lA: dc 0b00001111, 0b00010010, 0b00001111
lB: dc 0b00011111, 0b00010101, 0b00001010
lC: dc 0b00011111, 0b00010001, 0b00010001
lD: dc 0b00011111, 0b00010001, 0b00001110
lE: dc 0b00011111, 0b00010101, 0b00010001
lF: dc 0b00011111, 0b00010100, 0b00010000
lG: dc 0b00001111, 0b00010001, 0b00010010
lH: dc 0b00011111, 0b00000100, 0b00011111
lI: dc 0b00010001, 0b00011111, 0b00010001
lJ: dc 0b00010001, 0b00011111, 0b00010000
lK: dc 0b00011111, 0b00000100, 0b00011011
lL: dc 0b00011111, 0b00000001, 0b00000001
lM: dc 0b00011111, 0b00001000, 0b00011111
lN: dc 0b00011111, 0b00001110, 0b00011111
lO: dc 0b00001110, 0b00010001, 0b00001110
lP: dc 0b00011111, 0b00010100, 0b00001000
lQ: dc 0b00001100, 0b00010010, 0b00001101
lR: dc 0b00011111, 0b00010100, 0b00001011
lS: dc 0b00001001, 0b00010101, 0b00010010
lT: dc 0b00010000, 0b00011111, 0b00010000
lU: dc 0b00011110, 0b00000001, 0b00011110
lV: dc 0b00011100, 0b00000011, 0b00011100
lW: dc 0b00011111, 0b00000010, 0b00011111
lX: dc 0b00011011, 0b00000100, 0b00011011 
lY: dc 0b00011000, 0b00000111, 0b00011000 
lZ: dc 0b00010011, 0b00010101, 0b00011001

end

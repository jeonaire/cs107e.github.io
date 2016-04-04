.global _start
_start:

#define FSEL2 0x20200008
#define SET0  0x2020001C
#define CLR0  0x20200028
#define DELAY 0x3F0000

// configure GPIO 20 for output
ldr r0, =FSEL2
mov r1, #1
str r1, [r0]

mov r1, #(1<<20)

loop: 

// set GPIO 20 high
ldr r0, =SET0
str r1, [r0] 

// delay
mov r2, #DELAY
wait1:
subs r2, #1
bne wait1

// set GPIO 20 low
ldr r0, =CLR0
str r1, [r0] 

// delay
mov r2, #DELAY
wait2:
subs r2, #1
bne wait2

b loop
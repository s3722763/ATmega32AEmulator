avr-gcc -x assembler main.asm
avr-objcopy -O binary a.out main.bin

srec_cat.exe main.bin -binary -fill 0x00 0x0 16384 -output main.hex -Intel

XCOPY main.hex sim /y
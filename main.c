__attribute__((aligned(16)))
char stack0[4096];

void start(void) {
    volatile unsigned char *uart =
        (volatile unsigned char *)0x10000000;

    // UART initialization
    uart[1] = 0x00;  // close UART interrupt
    uart[3] = 0x80;   
    uart[0] = 0x03;   
    uart[1] = 0x00;  
    uart[3] = 0x03;  
    uart[2] = 0x07; 

    const char *s = "hello\r\n";

    while (*s != '\0') {
        while ((uart[5] & 0x20) == 0) {
        }

        uart[0] = *s;
        s++;
    }

    while (1) {
    }
}

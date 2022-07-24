#include <briey.h>

void print(char *str){
	while(*str){
		uart_write(UART,*(str++));
	}
}

void print16bit(uint32_t n)
{

    int i = 0;
    char outbuf_inv[8]="";
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
        i++;
        n = n/16;
    }while( n > 0);
    if(i<8) {
    	for(int j=7;j>=i;j--){
    		outbuf_inv[j]="0"[0];
    	}
    }
    for(int j=3;j>=0;j--)
    {
    	uart_write(UART,outbuf_inv[j]);
    }
    print(" ");
}
void print32bit(uint32_t n)
{

    int i = 0;
    char outbuf_inv[8]="";
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
        i++;
        n = n/16;
    }while( n > 0);
    if(i<8) {
    	for(int j=7;j>=i;j--){
    		outbuf_inv[j]="0"[0];
    	}
    }
    for(int j=7;j>=0;j--)
    {
    	uart_write(UART,outbuf_inv[j]);
    }
    print(" ");
}

void print64bit(char *message,uint32_t *num)
{
	print("\r\t");
	print(message);
	print32bit(num[1]);
	print32bit(num[0]);
	print("\r\n");
}
void print128bit(char *message, uint32_t *num)
{
	print("\r\t");
	print(message);
	print32bit(num[3]);
	print32bit(num[2]);
	print32bit(num[1]);
	print32bit(num[0]);
	print("\r\n");
}
void print80bit(char *message,uint32_t *num)
{
	print("\r\t");
	print(message);
	print32bit(num[2]);
	print32bit(num[1]);
	print16bit(num[0]);
	print("\r\n");
}
void print256bit(char *message, uint32_t *num)
{
	print("\r\t");
	print(message);
	print32bit(num[7]);
	print32bit(num[6]);
	print32bit(num[5]);
	print32bit(num[4]);
	print32bit(num[3]);
	print32bit(num[2]);
	print32bit(num[1]);
	print32bit(num[0]);
	print("\r\n");
}

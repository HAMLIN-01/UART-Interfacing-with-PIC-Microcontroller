#include<pic.h>
#include<htc.h>
void ser_int();
void tx(unsigned char);
unsigned char rx();
void txstr(unsigned char *);
void main()
{
	TRISC6=0;
	TRISC7=1;
	ser_int();
	txstr("(EmbeTronicX): Enter the letters in keyboard\n\r\r");
	while(1){
		tx(rx());
		}}
		void ser_int()
		{
			TXSTA=0X20;
			RCSTA=0b10010000;
			SPBRG=17;
			TXIF=RCIF=0;
			}
			void tx(unsigned char a)
			{
				TXREG=a;
				while(!TXIF);
				TXIF=0;
				}
				unsigned char rx()
				{
					while(!RCIF);
					RCIF=0;
					return RCREG;
					}
					void txstr(unsigned char *s)
					{
						while(*s){
							tx(*s++);
							}
							}
#ifndef AES_H_
#define AES_H_
//-------------------AES ADDRESS---------------
#define AES_ADDR_CTRL     		0x08
#define AES_ADDR_STATUS   		0x09
#define AES_ADDR_CONFIG   		0x0A

#define AES_ADDR_KEY_BASE  		0x10
#define AES_ADDR_BLOCK_BASE 	0x20
#define AES_ADDR_RESULT_BASE	0x30


#define AES_CONFIG_128_KEY  	0x00    // Config value for key expansion 128
#define AES_CONFIG_256_KEY  	0x02    // Config value for key expansion 256

#define AES_CONFIG_128_EN  		0x01    // Config value for encryption process (key 128-bit)
#define AES_CONFIG_128_DE  		0x00    // Config value for decryption process (key 128-bit)

#define AES_CONFIG_256_EN  		0x03    // Config value for encryption process (key 256-bit)
#define AES_CONFIG_256_DE  		0x02    // Config value for decryption process (key 256-bit)

#define AES_CTRL_INIT_KEY 		0x01    // Control value for starting key expansion
#define AES_CTRL_START 			0x02    // Control value for starting cipher process

#define AES_OP_EN          		0x01    // General "bit value convention" for encryption and decryption aes128
#define AES_OP_DE           	0x00

typedef struct
{
  volatile uint32_t CHIP_SELECT;
  volatile uint32_t WRITE_ENABLE;
  volatile uint32_t ADDRESS;
  volatile uint32_t IDATA;
  volatile uint32_t ODATA;
} Aes_Reg;

#endif /* AES_H_ */

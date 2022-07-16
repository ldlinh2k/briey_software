#pragma once
#include "riscv.h"

#define ALU_custom_add(rs1,rs2) opcode_R(0x2B,0x0,0x00,rs1,rs2)
#define ALU_custom_sub(rs1,rs2) opcode_R(0x2B,0x1,0x00,rs1,rs2)
#define ALU_custom_sll(rs1,rs2) opcode_R(0x2B,0x2,0x00,rs1,rs2)
#define ALU_custom_srl(rs1,rs2) opcode_R(0x2B,0x3,0x00,rs1,rs2)

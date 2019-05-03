andi $v0, $v0, 0
addi $v0, $v0, 128
andi $v1, $v1, 0
addi $v1, $v1, 127
andi $at, $at, 0
addi $at, $at, 128
rst:
sub $at, $at, $v1
addi $v0, $v0, 0
loop:
sll $at, $at, 1
beq $at, $v0, rst
j loop

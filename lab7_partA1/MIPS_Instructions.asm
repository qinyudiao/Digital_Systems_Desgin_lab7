andi $0, $0, 0
addi $1, $0, 6    ; $1 = 6
ori  $2, $0, 18   ; $2 = 18
add  $3, $1, $2   ; $3 = 24
sub  $4, $2, $1   ; $4 = 12
and  $5, $1, $2   ; $5 = 2
or   $6, $1, $2   ; $6 = 22
slt  $7, $1, $2   ; $7 = 1
sll  $8, $2, 4    ; $8 = 288
srl  $9, $1, 1    ; $9 = 3
beq  $1, $2, 1    ; not taken  check pc value after this instruction, expected to be 11
lw   $10, 4($0)   ; $10 = 4268066
bne  $1, $2, 1    ; taken, new pc should be 14
andi $1, $1, 0    ; this should be skipped so $1 should remain 6
j    16           ; PC = 16
andi $2, $2, 0    ; skipped, $2 should still be 18
jr   $2           ; PC = 18
andi $3, $3, 0    ; skipped, $3 should still be 24
sw   $1, 64($0)   ; mem(64) = 6
sw   $2, 65($0)   ; mem(65) = 18
sw   $3, 66($0)   ; mem(66) = 24
sw   $4, 67($0)   ; mem(67) = 12
sw   $5, 68($0)   ; mem(68) = 2
lw   $6, 64($0)   ; $6 = 6
lw   $7, 65($0)   ; $7 = 18
lw   $8, 66($0)   ; $8 = 24
lw   $9, 67($0)   ; $9 = 12
lw   $10, 68($0)  ; $10 = 2

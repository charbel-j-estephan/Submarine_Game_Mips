.data
DISPLAY_WIDTH:     .word 256
DISPLAY_HEIGHT:    .word 256
BITMAP_BASE:       .word 0x10040000

fish_width:        .word 16       
fish_height:       .word 16      

fish_color_array:
.word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xFFFF00, 0xFFFF00, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0x000000, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0x000000, 0x000000, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0x000000, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0x000000, 0x0066FF, 0x0066FF, 0x000000, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0x000000, 0x0066FF, 0x0066FF, 0x000000, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0x000000, 0x000000, 0x000000, 0x000000, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0x000000, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0x000000, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0xFFFF00, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x0066FF, 0x0066FF, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x0066FF, 0x0066FF, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
.word 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000

fish1_x: .word 240         
fish1_y: .word 5

fish2_x: .word 215         
fish2_y: .word 5

fish3_x: .word 190        
fish3_y: .word 5
player_lives: .word 1

.text
.globl main

main:
    lw $s7, player_lives 
    beq $s7, 3, three_lives
    beq $s7, 2, two_lives
    beq $s7, 1, one_live

draw_fish:
    addi $sp, $sp, -16
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)
    sw $s2, 12($sp)

    lw $s0, 0($a0)         # $s0 = x
    lw $s1, 0($a1)         # $s1 = y
    lw $s2, fish_width

    li $t3, 0              # row = 0
    lw $t4, fish_height

fish_row_loop:
    sub $t7, $t3, $t4
    beq $t7, $zero, fish_done
    li $t5, 0              # col = 0
    la $t6, fish_color_array
    mul $t7, $t3, $s2
    sll $t7, $t7, 2
    add $t6, $t6, $t7

fish_col_loop:
    sub $t7, $t5, $s2
    beq $t7, $zero, next_fish_row

    sll $t7, $t5, 2
    add $t8, $t6, $t7
    lw $t9, 0($t8)

    li $t7, 0
    beq $t9, $t7, skip_fish_pixel

    add $a2, $s0, $t5      # x
    add $a3, $s1, $t3      # y

    li $t7, 0
    slt $t8, $a2, $t7
    bne $t8, $zero, skip_fish_pixel

    lw $t7, DISPLAY_WIDTH
    slt $t8, $a2, $t7
    beq $t8, $zero, skip_fish_pixel

    li $t7, 0
    slt $t8, $a3, $t7
    bne $t8, $zero, skip_fish_pixel

    lw $t7, DISPLAY_HEIGHT
    slt $t8, $a3, $t7
    beq $t8, $zero, skip_fish_pixel

    move $a0, $a2
    move $a1, $a3
    jal calc_fish_position
    sw $t9, 0($v0)

skip_fish_pixel:
    addi $t5, $t5, 1
    j fish_col_loop

next_fish_row:
    addi $t3, $t3, 1
    j fish_row_loop

fish_done:
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    lw $s2, 12($sp)
    addi $sp, $sp, 16
    jr $ra

calc_fish_position:
    addi $sp, $sp, -8
    sw $t0, 0($sp)
    sw $t1, 4($sp)

    lw $t0, DISPLAY_WIDTH
    mul $t1, $a1, $t0
    add $t1, $t1, $a0
    sll $t1, $t1, 2

    lw $t0, BITMAP_BASE
    add $v0, $t0, $t1

    lw $t0, 0($sp)
    lw $t1, 4($sp)
    addi $sp, $sp, 8
    jr $ra

three_lives:
    la $a0, fish1_x
    la $a1, fish1_y
    jal draw_fish

    la $a0, fish2_x
    la $a1, fish2_y
    jal draw_fish

    la $a0, fish3_x
    la $a1, fish3_y
    jal draw_fish

    li $v0, 10
    syscall
    
two_lives:
    la $a0, fish1_x
    la $a1, fish1_y
    jal draw_fish

    la $a0, fish2_x
    la $a1, fish2_y
    jal draw_fish

    li $v0, 10
    syscall

one_live:
    la $a0, fish1_x
    la $a1, fish1_y
    jal draw_fish

    li $v0, 10
    syscall

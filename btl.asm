.data
    num_7: .word 7
        byebye: .asciiz "Goodbye! Thank for playing the game! \n"
	welcome: .asciiz "Battleship game\n"
	space: .asciiz " "
	enter: .asciiz "\n"
	turn_fisrt_player: .asciiz "This is the turn of first player. \n"
	turn_second_player: .asciiz "This is the turn of second player. \n"
	Rule_1: .asciiz "The game take places on the 7x7 board like this.\n"
	Board: .asciiz "   0 1 2 3 4 5 6 \n 0 0 0 0 0 0 0 0\n 1 0 0 0 0 0 0 0\n 2 0 0 0 0 0 0 0\n 3 0 0 0 0 0 0 0\n 4 0 0 0 0 0 0 0\n 5 0 0 0 0 0 0 0\n 6 0 0 0 0 0 0 0\n"
	Rule_2: .asciiz "Player have 6 ship included: 3 ship 2x1, 2 ship 3x1 and 1 ship 4x1\n"
	Rule_3: .asciiz "The 1st turn 2 player will input the address of the ship by the first address and the last address of ships \n"
	Rule_4: .asciiz "Example: when the player input for the ship 2x1 by input 1 4 2 4 - x_start(1), y_start(4), x_end(2), y_end(4) \n"
	Rule_5: .asciiz "The player must input a right number (0-6) and the address of the ship must be in the same row or column \n"
        Rule_6: .asciiz "The player can't put the ship on the other ship \n"
        hit: .asciiz "HIT!\n"
        miss: .asciiz "MISS!\n"
        input_2x1: .asciiz "Please input the address of the 2x1 ship \n"
        input_3x1: .asciiz "Please input the address of the 3x1 ship \n"
        input_4x1: .asciiz "Please input the address of the 4x1 ship \n"
        Rule_input_ship: .asciiz "When players input the address of the 2x1, the (x_end=x_start+-1 and y_end=y_start) or ( y_end=y_start+-1 and x_end=x_start) and all of them must be in 0 to 6. \n"
        Rule_hit1: .asciiz "Please input x and y and they must be in 0 to 6 \n"
        Rule_hit2: .asciiz "When you hit the ship, the board will show HIT! and when you miss the ship, the board will show MISS! \n"
        Error_input_ship: .asciiz "Please input again the address of the ship again \n"
        Error_hit: .asciiz " Please input the address again \n"
        x_start: .asciiz "x_start: "
        y_start: .asciiz "y_start: "
        x_end: .asciiz "x_end: "
        y_end: .asciiz "y_end: "
        input_x: .asciiz "Please input x: "
        input_y: .asciiz "Please input y: "
        player1_win: .asciiz "Player 1 win!"
        player2_win: .asciiz "Player 2 win!"

        player_1_inputship: .asciiz "Player 1 input the address of the ship \n"
        player_2_inputship: .asciiz "Player 2 input the address of the ship \n"
        Player1_turn: .asciiz "Player 1 turn \n"
        Player2_turn: .asciiz "Player 2 turn \n"
         First_Player_Board: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        Second_Player_Board: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        Play_again: .asciiz "Do you want to play again? (Y/N) Yes-1 No-0 \n"
.text
	li $t9, 1
	
    li $v0, 4
    la $a0, welcome
    syscall

    li $v0, 4
    la $a0, Rule_1
    syscall

    li $v0,4
    la $a0, Board
    syscall
    
    li $v0, 4
    la $a0, Rule_2
    syscall

    li $v0, 4
    la $a0, Rule_3
    syscall

    li $v0, 4
    la $a0, Rule_4
    syscall

    li $v0, 4
    la $a0, Rule_5
    syscall

    li $v0, 4
    la $a0, Rule_6
    syscall


start_game:
	
	la $s0, First_Player_Board
	la $s1, Second_Player_Board
        li $v0, 4
        la $a0, Rule_input_ship
        syscall

        li $v0, 4 
        la $a0, player_1_inputship
        syscall

        li $v0, 4
        la $a0, input_2x1
        syscall
        la $s2, First_Player_Board
        li $s3, 1
        jal input_ship

        li $v0, 4
        la $a0, input_2x1
        syscall
        la $s2, First_Player_Board
        li $s3, 1
        jal input_ship
        
        li $v0, 4
        la $a0, input_2x1
        syscall
        la $s2, First_Player_Board
        li $s3, 1
        jal input_ship

        li $v0, 4
        la $a0, input_3x1
        syscall
        la $s2, First_Player_Board
        li $s3, 2
        jal input_ship

        li $v0, 4
        la $a0, input_3x1
        syscall
        la $s2, First_Player_Board
        li $s3, 2
        jal input_ship

        li $v0, 4
        la $a0, input_4x1
        syscall
        la $s2,First_Player_Board
        li $s3, 3
        jal input_ship

        li $v0, 4
        la $a0, player_2_inputship
        syscall 

        li $v0, 4
        la $a0, input_2x1
        syscall
        la $s2, Second_Player_Board
        li $s3, 1
        jal input_ship

        li $v0, 4
        la $a0, input_2x1
        syscall
        la $s2, Second_Player_Board
        li $s3, 1
        jal input_ship

        li $v0, 4
        la $a0, input_2x1
        syscall
        la $s2, Second_Player_Board
        li $s3, 1
        jal input_ship

        li $v0, 4
        la $a0, input_3x1
        syscall
        la $s2, Second_Player_Board
        li $s3,2
        jal input_ship

        li $v0, 4
        la $a0, input_3x1
        syscall
        la $s2, Second_Player_Board
        li $s3, 2
        jal input_ship

        li $v0, 4
        la $a0, input_4x1
        syscall
        la $s2, Second_Player_Board
        li $s3, 3
        jal input_ship

        j Hit

#làm function ?? nh?p ki?m tra 
        
input_ship:

        li $v0, 4
        la $a0, x_start
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        li $v0, 4
        la $a0, y_start
        syscall

        li $v0, 5
        syscall
        move $t1, $v0

        li $v0, 4
        la $a0, x_end
        syscall

        li $v0, 5
        syscall
        move $t2, $v0

        li $v0, 4
        la $a0, y_end
        syscall

        li $v0, 5
        syscall
        move $t3, $v0

         # Ki?m tra t?a ?? nh?p vào có h?p l? không
    blt $t0, 0, invalid_coordinates
    bgt $t0, 6, invalid_coordinates
    blt $t1, 0, invalid_coordinates
    bgt $t1, 6, invalid_coordinates
    blt $t2, 0, invalid_coordinates
    bgt $t2, 6, invalid_coordinates
    blt $t3, 0, invalid_coordinates
    bgt $t3, 6, invalid_coordinates


compare_x:
        ble $t0,$t2,compare_y 
        move $t4, $t0
        move $t0, $t2
        move $t2, $t4

compare_y:
        ble $t1,$t3,check_ship
        move $t4, $t1 
        move $t1, $t3
        move $t3, $t4

check_ship:
        sub $t4, $t2, $t0
        sub $t5, $t3, $t1
        seq $t6, $t4, $s3
        seq $t7, $t5, $s3
        xor $t8, $t6, $t7
        beq $t8, $zero, invalid_coordinates # check the exact cordinate òf ship

        add $t5, $t0, $zero
check_row:
        add $t4, $t1, $zero
check_col:
        mul $t6, $t5,7 
        add $t6, $t6, $t4
        sll $t6, $t6, 2
        add $t6, $t6, $s2
        beq $t6, 1, invalid_coordinates

end_check_col:
        addi $t4, $t4, 1
        ble $t4, $t3, check_col
end_check_row:
        addi $t5, $t5, 1
        ble $t5, $t2, check_row
        
		add $t4, $0, $0
        	add $t5, $0, $0
        
start_row:
        add $t4, $t1, $zero
start_col:
        mul $t5, $t0, 7
        add $t5, $t5, $t4
        sll $t5, $t5, 2
        add $t5, $t5, $s2
        beq $t5, 1, invalid_coordinates
        sw $t9, 0($t5)
end_col:
        addi $t4, $t4, 1
        ble $t4, $t3,start_col
end_row:
        addi $t0, $t0, 1
        ble $t0, $t2, start_row
        jr $ra

invalid_coordinates:
    # Hi?n th? thông báo v? t?a ?? không h?p l?
    li $v0, 4
    la $a0, Error_input_ship
    syscall
    j input_ship



# bây gi? là lúc b?n t?o vào l?p ròi check bên ngoài là xong.

Hit:
        li $v0, 4
        la $a0, Rule_hit1
        syscall

        li $v0, 4
        la $a0, Rule_hit2
        syscall

        First_hit:
                li $v0, 4
                la $a0, Player1_turn
                syscall

                la $s2, Second_Player_Board
                
                jal hit_ship

                jal check_end_game

        Second_hit:
                li $v0, 4
                la $a0, Player2_turn
                syscall

                la $s2, First_Player_Board
                
                jal hit_ship

                jal check_end_game

                j First_hit

hit_ship:      
                li $v0, 4
                la $a0, input_x
                syscall

                li $v0, 5
                syscall
                move $t0, $v0

                li $v0, 4
                la $a0, input_y
                syscall

                li $v0, 5
                syscall
                move $t1, $v0

                blt $t0, 0, invalid_hit
                bgt $t0, 6, invalid_hit
                blt $t1, 0, invalid_hit
                bgt $t1, 6, invalid_hit

                mul $t3, $t0, 7
                add $t3, $t3, $t1
                sll $t3, $t3, 2
                add $t3, $t3, $s2
                lw $t4, 0($t3)
                beq $t4, 1, print_hit
                jr $ra
print_hit:
                li $v0, 4
                la $a0, hit
                syscall
                sw $zero, 0($t3)
                jr $ra

invalid_hit:
        li $v0, 4
        la $a0, Error_hit
        syscall
        j hit_ship
jump_ra:
        jr $ra

check_end_game:
        li $t0, 0
        
        loop_check_end_game:
                sll $t1, $t0, 2
                add $t1, $t1, $s2
                lw $t8, 0($t1)
                beq $t8, 1, jump_ra
                addi $t0, $t0, 1
                bgt $t0, 48, end_game
                j loop_check_end_game


Playagain:
        la $s0, First_Player_Board
        la $s1, Second_Player_Board
        li $t0, 0
        loop_reset: 
                bgt $t0, 48, out_reset
                sll $t3, $t0, 2
                add $t1, $s0, $t3
                add $t2, $s1, $t3
                sw $zero, 0($t1)
                sw $zero, 0($t2)
                addi $t0, $t0, 1
                j loop_reset
        out_reset:
                j start_game

end_game:
        li $v0, 4
        la $a0, Play_again
        syscall

        li $v0, 5
        syscall
        move $t0, $v0
        beq $t0,1, Playagain

        li $v0, 4
        la $a0, byebye
        syscall
        
        



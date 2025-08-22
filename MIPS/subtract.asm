        .data
num1:   .word 0x01A      # 26 in decimal
num2:   .word 20
diff:   .word 0
msg:    .asciiz "The difference is: "

        .text
        .globl main
main:
        # load num1 -> $t1
        la   $t0, num1        
        lw   $t1, 0($t0)      

        # load num2 -> $t2
        la   $t0, num2        
        lw   $t2, 0($t0)

        # subtract -> $t3 and store to memory
        sub  $t3, $t1, $t2    # $t3 = num1 - num2
        la   $t0, diff
        sw   $t3, 0($t0)      

        # print message
        li   $v0, 4           
        la   $a0, msg
        syscall

        # print the integer result
        li   $v0, 1           
        move $a0, $t3
        syscall

        # exit
        li   $v0, 10          
        syscall

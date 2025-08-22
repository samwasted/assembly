        .data
num1:   .word 0x01A
num2:   .word 20
sum:    .word 0
msg:    .asciiz "The sum is: "

        .text
        .globl main
main:
        # load num1 -> $t1
        la   $t0, num1        
        lw   $t1, 0($t0)      

        # load num2 -> $t2
        la   $t0, num2        
        lw   $t2, 0($t0)      

        # sum -> $t3 and store to memory
        add  $t3, $t1, $t2    
        la   $t0, sum
        sw   $t3, 0($t0)      

        # print message
        li   $v0, 4           
        la   $a0, msg
        syscall

        # print integer result
        li   $v0, 1           
        move $a0, $t3
        syscall

        # exit
        li   $v0, 10          
        syscall

.data
x: .word 20
y: .word 6

.text
.globl main
main:
    lw   $t0, x        # $t0 = 20
    lw   $t1, y        # $t1 = 6

    div  $t0, $t1      # divide $t0 / $t1
    mflo $t2           # $t2 = quotient (20 / 6 = 3)
    mfhi $t3           # $t3 = remainder (20 % 6 = 2)

    # print quotient
    li   $v0, 1
    move $a0, $t2
    syscall

    # print newline
    li   $v0, 11
    li   $a0, 10
    syscall

    # print remainder
    li   $v0, 1
    move $a0, $t3
    syscall

    li   $v0, 10       # exit
    syscall

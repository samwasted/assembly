.data
a: .word 6
b: .word 7

.text
.globl main
main:
    lw   $t0, a        # $t0 = 6
    lw   $t1, b        # $t1 = 7

    mult $t0, $t1      # multiply $t0 * $t1
    mflo $t2           # $t2 = low 32 bits of result (also called LO)
    mfhi $t3           # $t3 = high 32 bits (if overflow) (also called HI)

    # print result ($t2)
    li   $v0, 1
    move $a0, $t2
    syscall

    li   $v0, 10       # exit
    syscall


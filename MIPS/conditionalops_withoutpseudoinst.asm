main:

        # li $t0, 1   -> ori $t0, $zero, 1
        # li $t1, 0   -> ori $t1, $zero, 0
        ori     $t0, $zero, 1       # OR Immediate
        ori     $t1, $zero, 0       # OR Immediate

        #  if ($t0 = $t1)
        #       print "Hello"
        #  print "world!"
        .data
Hello:  .asciiz "Hello "
world:  .asciiz "world!\n"
        .text
        bne     $t0, $t1, print_world   # BNE = Branch on Not Equal

        ori     $v0, $zero, 4           # OR Immediate
        la      $a0, Hello              # LA = Load Address (pseudo → LUI+ORI)
        syscall                         # System Call

print_world:    
        ori     $v0, $zero, 4
        la      $a0, world
        syscall


        #  if ($t0 != $t1)
        #       print "Hello"
        #  print "world!"
        beq     $t0, $t1, end_if        # BEQ = Branch on Equal

        ori     $v0, $zero, 4
        la      $a0, Hello
        syscall

end_if:        
        ori     $v0, $zero, 4
        la      $a0, world
        syscall


        #  if ($t0 < $t1)
        #       print "If"
        #   else
        #       print "Else"
        .data
if:     .asciiz "If\n"
else:   .asciiz "Else\n"
        .text
        # bge $t0,$t1,else1 → BGE = Branch on Greater or Equal
        # expansion: slt + beq
        slt     $at, $t0, $t1           # SLT = Set on Less Than ($at=1 if $t0<$t1)
        beq     $at, $zero, else1       # BEQ = Branch on Equal (if not less → >=)

        ori     $v0, $zero, 4
        la      $a0, if
        syscall

        j       end_else                # J = Jump

else1:        
        ori     $v0, $zero, 4
        la      $a0, else
        syscall

end_else:


        #  if ($t0 <= $t1)
        #       print "If 2"
        #   else
        #       print "Else 2"
        .data
if2:    .asciiz "If 2\n"
else2:  .asciiz "Else 2\n"
        .text
        # bgt $t0,$t1,else3 → BGT = Branch on Greater Than
        # expansion: slt + bne
        slt     $at, $t1, $t0           # SLT = Set on Less Than ($at=1 if $t1<$t0 → $t0>$t1)
        bne     $at, $zero, else3       # BNE = Branch on Not Equal (branch if true)

        ori     $v0, $zero, 4
        la      $a0, if2
        syscall

        j       end_else2
else3:
        ori     $v0, $zero, 4
        la      $a0, else2
        syscall

end_else2:


        #  if ($t0 > $t1)
        #       print "Greater"
        #   else
        #       print "Not greater"
        .data
g:      .asciiz "Greater\n"
ng:     .asciiz "Not greater\n"
        .text
        # ble $t0,$t1,else4 → BLE = Branch on Less or Equal
        # expansion: slt + bne + beq
        slt     $at, $t0, $t1           # SLT = Set on Less Than ($at=1 if $t0<$t1)
        bne     $at, $zero, else4       # BNE = Branch on Not Equal (branch if $t0<$t1)
        beq     $t0, $t1, else4         # BEQ = Branch on Equal (branch if $t0==$t1)

        ori     $v0, $zero, 4
        la      $a0, g
        syscall

        j       end_else3
else4:  
        ori     $v0, $zero, 4
        la      $a0, ng
        syscall

end_else3:


        #  if ($t0 >= $t1)
        #       print "Greater or equal"
        #   else
        #       print "Not greater or equal"
        .data
ge:     .asciiz "Greater or equal\n"
nge:    .asciiz "Not greater or equal\n"
        .text
        # blt $t0,$t1,else5 → BLT = Branch on Less Than
        # expansion: slt + bne
        slt     $at, $t0, $t1           # SLT = Set on Less Than ($at=1 if $t0<$t1)
        bne     $at, $zero, else5       # BNE = Branch on Not Equal (branch if less)

        ori     $v0, $zero, 4
        la      $a0, ge
        syscall

        j       end_else4
else5:  
        ori     $v0, $zero, 4
        la      $a0, nge
        syscall

end_else4:


        # exit
        ori     $v0, $zero, 10          # OR Immediate → syscall code 10 (exit)
        syscall                         # System Call

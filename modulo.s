.text                          # declare where we're gonna place instructions
main:                          # our main 'class'
    li   $v0, 5                # load syscall equivalent to scanf("%d", num)
    syscall                    # execute syscall
    move $a0, $v0              # save entered value to $a0
    li   $v0, 5                # load syscall equivalent to scanf("%d", num)
    syscall                    # execute syscall
    move $a1, $v0              # save entered value to $a1
    jal sizeOrder              # call size order
    jal modulus                # call modulus
    li $v0, 1                  # load syscall equivalent to printf("%d", num)
    syscall                    # execute syscall (answer is already in $a0 for printing)
    li $v0, 10                 # load syscall for exit
    syscall                    # execute syscall

sizeOrder:                     # sort values $a0 and $a1 by size
    slt $t0, $a0, $a1          # set $t0 to 1 if $a0 < $a1
    beq $t0, $zero, return     # if $t0 == 0, they're already sorted
    move $t0, $a0              # store $a0 temporarily
    move $a0, $a1              # $a1 is larger, move it to $a0
    move $a1, $t0              # $a0 is smaller, move it to $a1
return:
    jr $ra                     # return

modulus:                       # find $a0 % $a1. $a0 should be larger
    slt $t1, $a0, $a1          # check if $t0 < $a1
    bne $t1, $zero, end        # if $t0 < $a1, we are done
    sub $a0, $a0, $a1          # subtract $a1 from $t0
    j modulus                  # repeat the loop
end:
    jr $ra                     # return

.data                                   # declare where we're gonna place data
str1:   .asciiz     "Enter dividend: "  # set str1
str2:   .asciiz     "Enter divisor: "   # set str2
str3:   .asciiz     " mod "             # set str3   
str4:   .asciiz     " = "               # set str4

.text                                   # declare where we're gonna place instructions
main:                                   # our main 'class'
    la $a0, str1                        # load str1 into $a0
    li $v0, 4                           # load syscall equivalent to printf("%s", str)
    syscall                             # execute syscall
    li $v0, 5                           # load syscall equivalent to scanf("%d", num)
    syscall                             # execute syscall
    move $a1, $v0                       # save entered value to $a1
    la $a0, str2                        # load str2 into $a0
    li $v0, 4                           # load syscall equivalent to printf("%s", str)
    syscall                             # execute syscall
    li $v0, 5                           # load syscall equivalent to scanf("%d", num)
    syscall                             # execute syscall
    move $a2, $v0                       # save entered value to $a2
    jal sizeOrder                       # call size order
    move $t3, $a1                       # copy $a1 to $t3 for later printing
    move $t4, $a2                       # copy $a2 to $t4 for later printing
    jal modulus                         # call modulus
    move $a0, $t3                       # load the first value from $t3 to $a0
    li $v0, 1                           # load syscall equivalent to printf("%d", num)
    syscall                             # execute syscall
    la $a0, str3                        # load str3 into $a0
    li $v0, 4                           # load syscall equivalent to printf("%s", str)
    syscall                             # execute syscall
    move $a0, $t4                       # load the second value from $t4 to $a0
    li $v0, 1                           # load syscall equivalent to printf("%d", num)
    syscall                             # execute syscall
    la $a0, str4                        # load str4 into $a0
    li $v0, 4                           # load syscall equivalent to printf("%s", str)
    syscall                             # execute syscall    
    move $a0, $a1                       # load our answer from $a1 to $a0
    li $v0, 1                           # load syscall equivalent to printf("%d", num)
    syscall                             # execute syscall
    li $v0, 10                          # load syscall for exit
    syscall                             # execute syscall

sizeOrder:                              # sort values $a1 and $a2 by size
    slt $t0, $a1, $a2                   # set $t0 to 1 if $a1 < $a2
    beq $t0, $zero, return              # if $t0 == 0, they're already sorted
    move $t0, $a1                       # store $a1 temporarily
    move $a1, $a2                       # $a2 is larger, move it to $a1
    move $a2, $t0                       # $a1 is smaller, move it to $a2
return:
    jr $ra                              # return

modulus:                                # find $a1 % $a2. $a1 should be larger
    slt $t1, $a1, $a2                   # check if $t0 < $a2
    bne $t1, $zero, end                 # if $t0 < $a2, we are done
    sub $a1, $a1, $a2                   # subtract $a2 from $t0
    j modulus                           # repeat the loop
end:
    jr $ra                              # return

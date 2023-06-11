.data
N1: .word 4
N2: .word 8
str1: .string "GCD value of "
str2: .string " and "
str3: .string " is "

.text
main:
        lw       s0, N1 
				lw       s1, N2  
        jal      ra, gcd       

        jal      ra, printResult

        li       a0, 10
        ecall

gcd:
        addi     sp, sp, -32
        sw       ra, 24(sp)
				sw       s2, 16(sp)
				sw       s1, 8(sp)
        sw       s0, 0(sp)
        mv       t0, s1
        blt      zero, t0, ngcd
				mv       a0, s0
        addi     sp, sp, 32
        jalr     x0, x1, 0

ngcd:
				rem			 s2, s0, s1
        mv       s0, s1
				mv       s1, s2
        jal      ra, gcd

        lw       s0, 0(sp)
				lw       s1, 8(sp)
				lw       s2, 16(sp)
        lw       ra, 24(sp)
        addi     sp, sp, 32     
        ret

printResult:
        mv       t0, a0
        mv       t1, a1

        la       a1, str1
        li       a0, 4
        ecall

        mv       a1, s0
        li       a0, 1
        ecall

        la       a1, str2
        li       a0, 4
        ecall

        mv       a1, s1
        li       a0, 1
        ecall

				la       a1, str3
        li       a0, 4
        ecall

				mv       a1, t0
        li       a0, 1
        ecall
        ret

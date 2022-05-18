.data
A:  .word  10
B:  .word  8
.code
ld r4, A(r0)
ld r5, B(r0)
halt
global    main
extern    printf

section   .text
main:
          ; Set up stack frame
          push   rbp
          mov    rbp, rsp

          ; Align stack to 16 bytes (printf requires 16-byte alignment for SSE registers)
          and    rsp, -16

          ; Load the floating-point number into xmm0
          movss  xmm0, [number]    ; Load the number into xmm0

          ; Call printf
          mov    rdi, format       ; Load the format string address into rdi
          call   printf            ; Call printf

          ; Clean up stack and exit
          mov    rsp, rbp
          pop    rbp
          mov    rax, 60           ; syscall: exit
          xor    rdi, rdi          ; status: 0
          syscall

section   .data
number:  dd  0x40020000  ; 2.25 in IEEE 754 single-precision format
format:  db  "BRUH %f", 10, 0  ; Format string with newline and null terminator

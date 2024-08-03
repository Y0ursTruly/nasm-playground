          global    main
          extern    printf

          section   .text
main:
          movss xmm0, dword [number]         ; load the number for quake 3
          call  quake                        ; call quake 3 function
          
          ;------ printf code start --------
          cvtss2sd xmm0, xmm0
          push  rbp
          mov   rdi,  format
          mov   al,   1
          call  printf
          pop   rbp
          ;------ printf code stop --------
          
          ;------ exit code start --------
          mov   rax,  60
          xor   rdi,  rdi
          syscall
          ;------ exit code stop ----------
          

quake:
          mov   r8d,  dword [myconst]
          movss xmm1, dword [threehalfs]    ; const float threehalfs = 1.5F
          movss xmm2, dword [half]
          movss xmm3, xmm0                  ; y  = number
          mulss xmm2, xmm3                  ; x2 = number * 0.5F
          movq  rcx,  xmm3                  ; i  = * ( long * ) &y //invalid so far
          mov   r9,   rcx
          shr   r9,   1
          sub   r8,   r9
          mov   rcx,  r8                    ; i  = 0x5f3759df - ( i >> 1 )
          movq  xmm3, rcx                   ; y  = * ( float * ) &i //invalid so far
          mulss xmm2, xmm3
          mulss xmm2, xmm3
          subss xmm1, xmm2
          mulss xmm3, xmm1                  ; y  = y * ( threehalfs - ( x2 * y * y ) )
          movss xmm0, xmm3                  ; return xmm0 instead of xmm3 for printf printing conventions
          ret                               ; quake 3 takes xmm0 and returns xmm0



          section   .data
number:            dd          2.25                ; yes, quake would be inverse square root of number
myconst:           dd          0x5f3759df          ; that constant lol
threehalfs:        dd          1.5
half:              dd          0.5
format:            db          "BRUH %f",10,0
;length:            equ         $-format
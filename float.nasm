          global    main
          extern    printf

          section   .text
main:
          movss xmm0, dword [number]         ; load the number
          
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
          


          section   .data
number:            dd          2.25
format:            db          "BRUH %f",10,0
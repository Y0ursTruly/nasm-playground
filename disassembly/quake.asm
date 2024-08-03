; Disassembly of file: quake.o
; Wed Jul 31 15:39:25 2024
; Type: ELF64
; Syntax: NASM
; Instruction set: SSE2, x64

default rel

global Q_rsqrt: function
global main: function

extern __printf_chk                                     ; near


SECTION .text   align=16 execute                        ; section number 1, code

Q_rsqrt:; Function begin
        movss   dword [rsp-4H], xmm0                    ; 0000 _ F3: 0F 11. 44 24, FC
        mulss   xmm0, dword [rel .LC0]                  ; 0006 _ F3: 0F 59. 05, 00000000(rel)
        mov     rdx, qword [rsp-4H]                     ; 000E _ 48: 8B. 54 24, FC
        mov     eax, 1597463007                         ; 0013 _ B8, 5F3759DF
        movss   xmm1, dword [rel .LC1]                  ; 0018 _ F3: 0F 10. 0D, 00000000(rel)
        sar     rdx, 1                                  ; 0020 _ 48: D1. FA
        sub     eax, edx                                ; 0023 _ 29. D0
        movd    xmm2, eax                               ; 0025 _ 66: 0F 6E. D0
        mulss   xmm0, xmm2                              ; 0029 _ F3: 0F 59. C2
        mulss   xmm0, xmm2                              ; 002D _ F3: 0F 59. C2
        subss   xmm1, xmm0                              ; 0031 _ F3: 0F 5C. C8
        mulss   xmm1, xmm2                              ; 0035 _ F3: 0F 59. CA
        movaps  xmm0, xmm1                              ; 0039 _ 0F 28. C1
        ret                                             ; 003C _ C3
; Q_rsqrt End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata.str1.1 align=1 noexecute                ; section number 4, const

.LC3:                                                   ; byte
        db 42H, 52H, 55H, 48H, 20H, 25H, 66H, 00H       ; 0000 _ BRUH %f.


SECTION .text.startup align=16 execute                  ; section number 5, code

main:   ; Function begin
        sub     rsp, 8                                  ; 0000 _ 48: 83. EC, 08
        movss   xmm0, dword [rel .LC2]                  ; 0004 _ F3: 0F 10. 05, 00000000(rel)
        call    Q_rsqrt                                 ; 000C _ E8, 00000000(PLT r)
        mov     edi, 2                                  ; 0011 _ BF, 00000002
        mov     eax, 1                                  ; 0016 _ B8, 00000001
        lea     rsi, [rel .LC3]                         ; 001B _ 48: 8D. 35, 00000000(rel)
        cvtss2sd xmm0, xmm0                             ; 0022 _ F3: 0F 5A. C0
        call    __printf_chk                            ; 0026 _ E8, 00000000(PLT r)
        xor     eax, eax                                ; 002B _ 31. C0
        add     rsp, 8                                  ; 002D _ 48: 83. C4, 08
        ret                                             ; 0031 _ C3
; main End of function


SECTION .rodata.cst4 align=4 noexecute                  ; section number 6, const

.LC0:   dd 3F000000H                                    ; 0000 _ 0.5 

.LC1:   dd 3FC00000H                                    ; 0004 _ 1.5 

.LC2:   dd 40100000H                                    ; 0008 _ 2.25 


SECTION .note.gnu.property align=8 noexecute            ; section number 7, const

        db 04H, 00H, 00H, 00H, 20H, 00H, 00H, 00H       ; 0000 _ .... ...
        db 05H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0008 _ ....GNU.
        db 02H, 00H, 01H, 0C0H, 04H, 00H, 00H, 00H      ; 0010 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0018 _ ........
        db 01H, 00H, 01H, 0C0H, 04H, 00H, 00H, 00H      ; 0020 _ ........
        db 09H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0028 _ ........



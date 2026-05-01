; =======================================================
;  LCP_STARTER.ASM - Russian Assembler Language for NASM
;  (c) LCP CORPORATION
;  Architecture: x86-64, Windows
; =======================================================

; --- SCREEN ---
%define нвхярхрэ_щйпюм             mov ax, 0x0003

; --- LOAD REGISTERS ---
%define гюцпсгхрэ_AX               mov ax,
%define гюцпсгхрэ_BX               mov bx,
%define гюцпсгхрэ_CX               mov cx,
%define гюцпсгхрэ_DX               mov dx,
%define гюцпсгхрэ_SI               mov si,
%define гюцпсгхрэ_DI               mov di,
%define гюцпсгхрэ_BP               mov bp,
%define гюцпсгхрэ_SP               mov sp,
%define гюцпсгхрэ_DS               mov ds,
%define гюцпсгхрэ_ES               mov es,
%define гюцпсгхрэ_SS               mov ss,
%define гюцпсгхрэ_аюир             mov byte
%define гюцпсгхрэ_якнбн             mov word
%define гюцпсгхрэ_дбнимне           mov dword

; --- ARITHMETIC ---
%define опхаюбхрэ_AX               add ax,
%define опхаюбхрэ_BX               add bx,
%define опхаюбхрэ_CX               add cx,
%define опхаюбхрэ_DX               add dx,
%define бшвеярэ_AX                 sub ax,
%define бшвеярэ_BX                 sub bx,
%define бшвеярэ_CX                 sub cx,
%define бшвеярэ_DX                 sub dx,
%define сбекхвхрэ_AX               inc ax
%define сбекхвхрэ_BX               inc bx
%define сбекхвхрэ_CX               inc cx
%define сбекхвхрэ_DX               inc dx
%define слемэьхрэ_AX               dec ax
%define слемэьхрэ_BX               dec bx
%define слемэьхрэ_CX               dec cx
%define слемэьхрэ_DX               dec dx
%define слмнфхрэ_AX                mul ax
%define пюгдекхрэ_AX               div ax

; --- LOGIC ---
%define х_AX                       and ax,
%define хкх_AX                     or ax,
%define хяйк_хкх_AX                xor ax,
%define ме_AX                      not ax
%define ядбхц_бкебн_AX             shl ax,
%define ядбхц_бопюбн_AX            shr ax,

; --- COMPARE & JUMP ---
%define япюбмхрэ_AX                cmp ax,
%define япюбмхрэ_BX                cmp bx,
%define япюбмхрэ_CX                cmp cx,
%define япюбмхрэ_DX                cmp dx,
%define оепеирх                    jmp
%define оепеирх_еякх_пюбмн         je
%define оепеирх_еякх_мепюбмн       jne
%define оепеирх_еякх_анкэье        jg
%define оепеирх_еякх_лемэье        jl
%define оепеирх_еякх_бшье          ja
%define оепеирх_еякх_мхфе          jb
%define оепеирх_еякх_анкэье_пюбмн  jge
%define оепеирх_еякх_лемэье_пюбмн  jle
%define жхйк                       loop
%define жхйк_еякх_пюбмн            loope
%define жхйк_еякх_мепюбмн          loopne

; --- STACK ---
%define бкнфхрэ_AX                 push ax
%define бкнфхрэ_BX                 push bx
%define бкнфхрэ_CX                 push cx
%define бкнфхрэ_DX                 push dx
%define бкнфхрэ_SI                 push si
%define бкнфхрэ_DI                 push di
%define бкнфхрэ_BP                 push bp
%define бкнфхрэ_DS                 push ds
%define бкнфхрэ_ES                 push es
%define бкнфхрэ_ткюцх              pushf
%define хгбкевэ_AX                 pop ax
%define хгбкевэ_BX                 pop bx
%define хгбкевэ_CX                 pop cx
%define хгбкевэ_DX                 pop dx
%define хгбкевэ_SI                 pop si
%define хгбкевэ_DI                 pop di
%define хгбкевэ_BP                 pop bp
%define хгбкевэ_DS                 pop ds
%define хгбкевэ_ES                 pop es
%define хгбкевэ_ткюцх              popf

; --- PROCEDURES ---
%define бшгбюрэ                    call
%define бепмсрэяъ                  ret
%define бепмсрэяъ_дюкэмхи          retf
%define опепшбюмхе                 int
%define бнгбпюр_хг_опепшбюмхъ      iret

; --- STRING OPERATIONS ---
%define гюцпсгхрэ_аюир_хг_SI       lodsb
%define гюцпсгхрэ_якнбн_хг_SI      lodsw
%define янупюмхрэ_аюир_б_DI        stosb
%define янупюмхрэ_якнбн_б_DI       stosw
%define япюбмхрэ_аюирш_SI_DI       cmpsb
%define япюбмхрэ_якнбю_SI_DI       cmpsw
%define оепеякюрэ_аюир             movsb
%define оепеякюрэ_якнбн             movsw

; --- FLAGS ---
%define бйкчвхрэ_оепемня           stc
%define бшйкчвхрэ_оепемня          clc
%define хмбепрхпнбюрэ_оепемня      cmc
%define бйкчвхрэ_мюопюбкемхе       std
%define бшйкчвхрэ_мюопюбкемхе      cld
%define бйкчвхрэ_опепшбюмхъ        sti
%define бшйкчвхрэ_опепшбюмхъ       cli

; --- EXCHANGE ---
%define налемърэ_AX_BX             xchg ax, bx
%define налемърэ_AX_CX             xchg ax, cx
%define налемърэ_AX_DX             xchg ax, dx

; --- PORT I/O ---
%define ббеярх_хг_онпрю            in al, dx
%define бшбеярх_б_онпр             out dx, al

; --- MISCELLANEOUS ---
%define осярн                      nop
%define нярюмнб                    hlt

; --- WAIT FOR KEY ---
%macro фдюрэ_мюфюрхъ 0
    mov ah, 0x00
    int 0x16
%endmacro

; --- BOOT SECTOR END (AA55) ---
%macro йнмеж_гюцпсгвхйю 0
    times 510-($-$$) db 0x00
    dw 0xAA55
%endmacro

; =======================================================
;  (c) LCP CORPORATION
; =======================================================
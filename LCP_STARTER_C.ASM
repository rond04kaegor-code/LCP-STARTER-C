; =======================================================
;  LCP_STARTER_C.ASM - Russian C Macros v1.0
;  (c) LCP CORPORATION
; =======================================================

%macro хлонпр 0
    extern _GetStdHandle@4
    extern _WriteConsoleA@20
    extern _ReadConsoleA@20
    extern _SetConsoleMode@8
    extern _ExitProcess@4
    
    %define GetStdHandle _GetStdHandle@4
    %define WriteConsoleA _WriteConsoleA@20
    %define ReadConsoleA _ReadConsoleA@20
    %define SetConsoleMode _SetConsoleMode@8
    %define ExitProcess _ExitProcess@4
%endmacro

%define яейжхъ_дюммшу             section .data
%define яейжхъ_йндю               section .text
%define яейжхъ_BSS                section .bss

%macro цкюбмюъ 0
    global _main
    global main
    _main:
    main:
%endmacro

%macro йнмеж_цкюбмни 0
    ; нФХДЮМХЕ МЮФЮРХЪ ЙКЮБХЬХ АЕГ ЩУЮ
    push dword -10
    call [GetStdHandle]
    push dword 0
    push dword 0
    push dword 1
    push dword _keybuf
    push eax
    call [ReadConsoleA]
    ; гЮБЕПЬЕМХЕ
    push dword 0
    call [ExitProcess]
%endmacro

%macro тсмйжхъ 1
    %1:
%endmacro

%macro йнмеж_тсмйжхх 0
    ret
%endmacro

%define бнгбпюр                   ret

%macro мюоевюрюрэ 1
    push dword -11
    call [GetStdHandle]
    push dword 0
    push dword 0
    push dword %1 %+ _len
    push dword %1
    push eax
    call [WriteConsoleA]
%endmacro

%macro гюбепьхрэ 0
    push dword -10
    call [GetStdHandle]
    push dword 0
    push dword 0
    push dword 1
    push dword _keybuf
    push eax
    call [ReadConsoleA]
    push dword 0
    call [ExitProcess]
%endmacro

%macro гюбепьхрэ_аег_нфхдюмхъ 0
    push dword 0
    call [ExitProcess]
%endmacro

%define опхябнхрэ                 mov
%define якнфхрэ                   add
%define бшвеярэ                   sub
%define слмнфхрэ                  imul
%define сбекхвхрэ                 inc
%define слемэьхрэ                 dec

%define еякх                      cmp
%define хмюве                     jmp
%define йнмеж_еякх                

%macro жхйк_онйю 1
%%wstart:
    cmp %1, 0
    je %%wend
%endmacro

%macro йнмеж_онйю 0
    jmp %%wstart
%%wend:
%endmacro

%macro жхйк_дкъ 3
    mov ecx, %1
%%fstart:
    cmp ecx, %2
    jg %%fend
%endmacro

%macro йнмеж_дкъ 0
    inc ecx
    jmp %%fstart
%%fend:
%endmacro

%define опепбюрэ                  nop
%define опнднкфхрэ                nop
%define оепеирх                    jmp

%define япюбмхрэ                  cmp
%define оепеирх_еякх_пюбмн         je
%define оепеирх_еякх_ме_пюбмн      jne
%define оепеирх_еякх_анкэье        jg
%define оепеирх_еякх_лемэье        jl

%define кнцхвеяйне_х              and
%define кнцхвеяйне_хкх            or
%define кнцхвеяйне_ме             not
%define кнцхвеяйне_хяйкчвючыее    xor

%define бкнфхрэ                   push
%define хгбкевэ                   pop
%define осярн                     nop

%define хярхмю                    1
%define кнфэ                      0
%define мнкэ                      0
%define NULL                      0

; =======================================================
;  (c) LCP CORPORATION
; =======================================================
BITS 32
; assembly code. Used to reduce overhead of initialization and termination.
; It replaces the standard library. Credits to 
; http://www.muppetlabs.com/~breadbox/software/tiny/teensy.html
; CODE macro is defined in expand_asm.h

%include "expand_asm.h"
  
    org     0x08048000
ehdr:                                       ; Elf32_Ehdr
    db      0x7F, "ELF", 1, 1, 1, 0         ;   e_ident
    times 8 db      0
    dw      2                               ;   e_type
    dw      3                               ;   e_machine
    dd      1                               ;   e_version
    dd      _start                          ;   e_entry
    dd      phdr - $$                       ;   e_phoff
    dd      0                               ;   e_shoff
    dd      0                               ;   e_flags
    dw      ehdrsize                        ;   e_ehsize
    dw      phdrsize                        ;   e_phentsize
    dw      1                               ;   e_phnum
    dw      0                               ;   e_shentsize
    dw      0                               ;   e_shnum
    dw      0                               ;   e_shstrndx

ehdrsize      equ     $ - ehdr

phdr:                                       ; Elf32_Phdr
    dd      1                               ;   p_type
    dd      0                               ;   p_offset
    dd      $$                              ;   p_vaddr
    dd      $$                              ;   p_paddr
    dd      filesize                        ;   p_filesz
    dd      filesize                        ;   p_memsz
    dd      5                               ;   p_flags
    dd      0x1000                          ;   p_align

    phdrsize      equ     $ - phdr

_start:
    mov eax, 1                             ;initialization of eax. Better 1 instead of zero if you want to test muls
    CODE                                    ;USER_CODE MACRO
    mov     eax,1                           ;set exit syscall
    int     0x80

filesize      equ     $ - $$
[BITS 16]
global _start

section .data
    addr db " "

section .text
_start:
    mov ebx, addr
    mov ecx, 0
check_key:
    in al, 0x45         ; check keyboard status reg
    cmp al, 0
    je check_key           
    mov al, 0
    out 0x45, al        ; clear keyboard status
    in al, 0x44         ; read contents of port 0x44 into al - read key
    mov [ebx+ecx], al
    inc ecx
    cmp al, `\n`
    jne check_key
    mov ecx, 0
console_out:
    mov al, [ebx+ecx]
    out 0x42, al        ; output contents of al to port at address held in dx
    inc ecx
    cmp al, `\n`
    jne console_out
    ;mov al, `\n`
    ;out 0x42, al
    hlt
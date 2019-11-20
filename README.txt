To run program:

~> make
~> sudo ./basic-vmm smallkern

Prerequisites : ncurses, nasm

Note:	The time is currently set to 127 ms. To change it, open smallkern_nasm.asm and change the value in line 25(marked with a comment).
        Binaries are provided in the bin folder.

Known issues:
    1. Prints diagonally as (I think) the cursor isn't being reset.
    2. The buffer for port 0x42 in the vmm is fixed to 500 characters.
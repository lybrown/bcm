all:
	xasm /t:bcm.lab /l:bcm.lst bcm.asm /o:bcm.xex && altirra bcm.xex

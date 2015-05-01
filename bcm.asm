    org $4000
    org r:$0700
    dta $0		; 0700: 00
    dta $71		; 0701: 71 Access: 124D
    dta $0		; 0702: 00
    dta $7		; 0703: 07
    dta $8E		; 0704: 8E
    dta $1D		; 0705: 1D
u706			; Callers: -c 0706 3FA8
    jsr l1D8E		; 0706: 20 8E 1D
    dta $3		; 0709: 03 Access: 0840
    dta $F		; 070A: 0F Access: 07EA
    dta $0		; 070B: 00
    dta $7C		; 070C: 7C Access: 07E0 128D
    dta $1A		; 070D: 1A Access: 07E5 1284
    dta $1		; 070E: 01 Access: 121B 125C 0714 0730
    dta $4		; 070F: 04 Access: 1253 072C
    dta $0		; 0710: 00 Access: 1256 0729
    dta $7D		; 0711: 7D Access: 1262 075A 0738
    dta $CB		; 0712: CB Access: 1267 0719
    dta $7		; 0713: 07 Access: 126C 0721
u714			; Callers: -c 0714
    ldy $070E		; 0714: AC 0E 07
    beq l074F		; 0717: F0 36
    lda $0712		; 0719: AD 12 07
    sta z:FMSZPG		; 071C: 85 43
    sta DBUFLO		; 071E: 8D 04 03
    lda $0713		; 0721: AD 13 07
    sta z:FMSZPG+1		; 0724: 85 44
    sta DBUFHI		; 0726: 8D 05 03
    lda $0710		; 0729: AD 10 07
    ldy $070F		; 072C: AC 0F 07
l072F			; Callers: 074C
    clc    		; 072F: 18
    ldx $070E		; 0730: AE 0E 07
    jsr l076C		; 0733: 20 6C 07
    bmi l074F		; 0736: 30 17
    ldy $0711		; 0738: AC 11 07
    lda (FMSZPG),y		; 073B: B1 43
    and #$03		; 073D: 29 03
    pha    		; 073F: 48
    iny    		; 0740: C8
    ora (FMSZPG),y		; 0741: 11 43
    beq l0753		; 0743: F0 0E
    lda (FMSZPG),y		; 0745: B1 43
    tay    		; 0747: A8
    jsr l0757		; 0748: 20 57 07
    pla    		; 074B: 68
    jmp l072F		; 074C: 4C 2F 07
l074F			; Callers: 0717 0736
    lda #$C0		; 074F: A9 C0
    bne l0754		; 0751: D0 01
l0753			; Callers: 0743
    pla    		; 0753: 68
l0754			; Callers: 0751
    asl @		; 0754: 0A
    tay    		; 0755: A8
    rts    		; 0756: 60
l0757			; Callers: 1281 0748
    clc    		; 0757: 18
    lda z:FMSZPG		; 0758: A5 43
    adc $0711		; 075A: 6D 11 07
    sta DBUFLO		; 075D: 8D 04 03
    sta z:FMSZPG		; 0760: 85 43
    lda z:FMSZPG+1		; 0762: A5 44
    adc #$00		; 0764: 69 00
    sta DBUFHI		; 0766: 8D 05 03
    sta z:FMSZPG+1		; 0769: 85 44
    rts    		; 076B: 60
l076C			; Callers: 10AF 1206 0733
    sta DAUX2		; 076C: 8D 0B 03
    sty DAUX1		; 076F: 8C 0A 03
l0772			; Callers: 1236
    lda #$52		; 0772: A9 52
    ldy #$40		; 0774: A0 40
    bcc l077C		; 0776: 90 04
    lda #$57		; 0778: A9 57
    ldy #$80		; 077A: A0 80
l077C			; Callers: 0776
    sta DCOMND		; 077C: 8D 02 03
    sty DSTATS		; 077F: 8C 03 03
    lda #$31		; 0782: A9 31
    ldy #$0F		; 0784: A0 0F
l0786			; Callers: 0D34
    sta DDEVIC		; 0786: 8D 00 03
    sty DTIMLO		; 0789: 8C 06 03
    lda #$03		; 078C: A9 03
    sta $12FF		; 078E: 8D FF 12
    lda #$00		; 0791: A9 00
    ldy #$80		; 0793: A0 80
    dex    		; 0795: CA
    beq l079C		; 0796: F0 04
    lda #$01		; 0798: A9 01
    ldy #$00		; 079A: A0 00
l079C			; Callers: 0796
    sta DBYTHI		; 079C: 8D 09 03
    sty DBYTLO		; 079F: 8C 08 03
l07A2			; Callers: 07C1
    jsr SIOV		; 07A2: 20 59 E4
    bpl l07C4		; 07A5: 10 1D
    dec $12FF		; 07A7: CE FF 12
    bmi l07C4		; 07AA: 30 18
    ldx #$40		; 07AC: A2 40
    lda #$52		; 07AE: A9 52
    cmp DCOMND		; 07B0: CD 02 03
    beq l07BE		; 07B3: F0 09
    lda #$21		; 07B5: A9 21
    cmp DCOMND		; 07B7: CD 02 03
    beq l07BE		; 07BA: F0 02
    ldx #$80		; 07BC: A2 80
l07BE			; Callers: 07B3 07BA
    stx DSTATS		; 07BE: 8E 03 03
    jmp l07A2		; 07C1: 4C A2 07
l07C4			; Callers: 07A5 07AA
    ldx $1301		; 07C4: AE 01 13
    lda DSTATS		; 07C7: AD 03 03
    rts    		; 07CA: 60
    dta $AA		; 07CB: AA
    dta $8		; 07CC: 08
    dta $14		; 07CD: 14
    dta $B		; 07CE: 0B
    dta $BE		; 07CF: BE
    dta $A		; 07D0: 0A
    dta $CB		; 07D1: CB
    dta $9		; 07D2: 09
    dta $0		; 07D3: 00
    dta $B		; 07D4: 0B
    dta $A6		; 07D5: A6
    dta $B		; 07D6: 0B
    dta $7		; 07D7: 07
    dta $85		; 07D8: 85
    dta $44		; 07D9: 44
    dta $AD		; 07DA: AD
    dta $A		; 07DB: 0A
    dta $7		; 07DC: 07
    dta $8D		; 07DD: 8D
    dta $D6		; 07DE: D6
    dta $12		; 07DF: 12
l07E0			; Callers: l1D8E 1521 1561
    lda $070C		; 07E0: AD 0C 07
    sta z:FMSZPG		; 07E3: 85 43
    lda $070D		; 07E5: AD 0D 07
    sta z:FMSZPG+1		; 07E8: 85 44
    lda $070A		; 07EA: AD 0A 07
    sta $130C		; 07ED: 8D 0C 13
    ldx #$07		; 07F0: A2 07
l07F2			; Callers: 083E
    stx $130D		; 07F2: 8E 0D 13
    asl $130C		; 07F5: 0E 0C 13
    bcs l0807		; 07F8: B0 0D
    lda #$00		; 07FA: A9 00
    sta $1311,x		; 07FC: 9D 11 13
    sta $1329,x		; 07FF: 9D 29 13
    sta $1331,x		; 0802: 9D 31 13
    beq l083D		; 0805: F0 36
l0807			; Callers: 07F8
    ldy #$05		; 0807: A0 05
    lda #$00		; 0809: A9 00
    sta (FMSZPG),y		; 080B: 91 43
    inx    		; 080D: E8
    stx DUNIT		; 080E: 8E 01 03
    lda #$53		; 0811: A9 53
    sta DCOMND		; 0813: 8D 02 03
    jsr DSKINV		; 0816: 20 53 E4
    ldy #$02		; 0819: A0 02
    lda DVSTAT		; 081B: AD EA 02
    and #$20		; 081E: 29 20
    bne l0823		; 0820: D0 01
    dey    		; 0822: 88
l0823			; Callers: 0820
    tya    		; 0823: 98
    ldx $130D		; 0824: AE 0D 13
    sta $1311,x		; 0827: 9D 11 13
    lda z:FMSZPG		; 082A: A5 43
    sta $1329,x		; 082C: 9D 29 13
    lda z:FMSZPG+1		; 082F: A5 44
    sta $1331,x		; 0831: 9D 31 13
    jsr l0870		; 0834: 20 70 08
    dey    		; 0837: 88
    beq l083D		; 0838: F0 03
    jsr l0870		; 083A: 20 70 08
l083D			; Callers: 0838 0805
    dex    		; 083D: CA
    bpl l07F2		; 083E: 10 B2
    ldy $0709		; 0840: AC 09 07
    ldx #$00		; 0843: A2 00
l0845			; Callers: 0861
    lda #$00		; 0845: A9 00
    dey    		; 0847: 88
    bpl l084B		; 0848: 10 01
    tya    		; 084A: 98
l084B			; Callers: 0848
    sta $1319,x		; 084B: 9D 19 13
    tya    		; 084E: 98
    bmi l085E		; 084F: 30 0D
    lda z:FMSZPG		; 0851: A5 43
    sta $1339,x		; 0853: 9D 39 13
    lda z:FMSZPG+1		; 0856: A5 44
    sta $1349,x		; 0858: 9D 49 13
    jsr l0870		; 085B: 20 70 08
l085E			; Callers: 084F
    inx    		; 085E: E8
    cpx #$10		; 085F: E0 10
    bne l0845		; 0861: D0 E2
    lda z:FMSZPG		; 0863: A5 43
    sta MEMLO		; 0865: 8D E7 02
    lda z:FMSZPG+1		; 0868: A5 44
    sta MEMLO+1		; 086A: 8D E8 02
    jmp l087E		; 086D: 4C 7E 08
l0870			; Callers: 0834 085B 083A
    clc    		; 0870: 18
    lda z:FMSZPG		; 0871: A5 43
    adc #$80		; 0873: 69 80
    sta z:FMSZPG		; 0875: 85 43
    lda z:FMSZPG+1		; 0877: A5 44
    adc #$00		; 0879: 69 00
    sta z:FMSZPG+1		; 087B: 85 44
    rts    		; 087D: 60
l087E			; Callers: 086D
    ldy #$7F		; 087E: A0 7F
    lda #$00		; 0880: A9 00
l0882			; Callers: 0886
    sta $1381,y		; 0882: 99 81 13
    dey    		; 0885: 88
    bne l0882		; 0886: D0 FA
    ldy #$00		; 0888: A0 00
l088A			; Callers: 0898
    lda HATABS,y		; 088A: B9 1A 03
    beq l089B		; 088D: F0 0C
    cmp #$44		; 088F: C9 44
    beq l089B		; 0891: F0 08
    iny    		; 0893: C8
    iny    		; 0894: C8
    iny    		; 0895: C8
    cpy #$1E		; 0896: C0 1E
    bne l088A		; 0898: D0 F0
    dta $0		; 089A: 00
l089B			; Callers: 088D 0891
    lda #$44		; 089B: A9 44
    sta HATABS,y		; 089D: 99 1A 03
    lda #$CB		; 08A0: A9 CB
    sta HATABS+1,y		; 08A2: 99 1B 03
    lda #$07		; 08A5: A9 07
    sta HATABS+2,y		; 08A7: 99 1C 03
    rts    		; 08AA: 60
u8AB			; Callers: -c 08AB
    jsr l1164		; 08AB: 20 64 11
    jsr l0E9E		; 08AE: 20 9E 0E
    lda ICAX1,x		; 08B1: BD 4A 03
    sta $1382,x		; 08B4: 9D 82 13
    and #$02		; 08B7: 29 02
    beq l08BE		; 08B9: F0 03
    jmp l0DAD		; 08BB: 4C AD 0D
l08BE			; Callers: 08B9
    jsr l0F21		; 08BE: 20 21 0F
    php    		; 08C1: 08
    lda $1382,x		; 08C2: BD 82 13
    cmp #$04		; 08C5: C9 04
    beq l08D8		; 08C7: F0 0F
    cmp #$08		; 08C9: C9 08
    beq l0911		; 08CB: F0 44
    cmp #$0C		; 08CD: C9 0C
    beq l08DD		; 08CF: F0 0C
    cmp #$09		; 08D1: C9 09
    beq l08EC		; 08D3: F0 17
    jmp l12BF		; 08D5: 4C BF 12
l08D8			; Callers: 08C7
    plp    		; 08D8: 28
    bcs l08E9		; 08D9: B0 0E
    bcc l08E3		; 08DB: 90 06
l08DD			; Callers: 08CF
    plp    		; 08DD: 28
    bcs l08E9		; 08DE: B0 09
    jsr l0CAC		; 08E0: 20 AC 0C
l08E3			; Callers: 08DB
    jsr l09AE		; 08E3: 20 AE 09
    jmp l12F0		; 08E6: 4C F0 12
l08E9			; Callers: 08D9 08DE 08ED
    jmp l12BB		; 08E9: 4C BB 12
l08EC			; Callers: 08D3
    plp    		; 08EC: 28
    bcs l08E9		; 08ED: B0 FA
    ldy $1305		; 08EF: AC 05 13
    lda $1401,y		; 08F2: B9 01 14
    and #$02		; 08F5: 29 02
    beq l090E		; 08F7: F0 15
    jsr l0CAC		; 08F9: 20 AC 0C
    jsr l10BF		; 08FC: 20 BF 10
    jsr l1106		; 08FF: 20 06 11
    sta $138E,x		; 0902: 9D 8E 13
    lda $138B,x		; 0905: BD 8B 13
    sta $138D,x		; 0908: 9D 8D 13
    jmp l097C		; 090B: 4C 7C 09
l090E			; Callers: 08F7
    jmp l12B7		; 090E: 4C B7 12
l0911			; Callers: 08CB
    plp    		; 0911: 28
    bcs l091D		; 0912: B0 09
    jsr l0C53		; 0914: 20 53 0C
    ldy $1305		; 0917: AC 05 13
    jmp l0948		; 091A: 4C 48 09
l091D			; Callers: 0912
    lda $1302		; 091D: AD 02 13
    bmi l0992		; 0920: 30 70
    sta $1306		; 0922: 8D 06 13
    jsr l106E		; 0925: 20 6E 10
    lda $1303		; 0928: AD 03 13
    sta $1305		; 092B: 8D 05 13
    lda $1304		; 092E: AD 04 13
    sta $1307		; 0931: 8D 07 13
    jsr l10BF		; 0934: 20 BF 10
    ldy $1305		; 0937: AC 05 13
    ldx #$0A		; 093A: A2 0A
    lda #$20		; 093C: A9 20
l093E			; Callers: 0943
    sta $1406,y		; 093E: 99 06 14
    iny    		; 0941: C8
    dex    		; 0942: CA
    bpl l093E		; 0943: 10 F9
    ldx $1301		; 0945: AE 01 13
l0948			; Callers: 091A
    jsr l1106		; 0948: 20 06 11
    ldy $1305		; 094B: AC 05 13
    sta $1405,y		; 094E: 99 05 14
    lda $138B,x		; 0951: BD 8B 13
    sta $1404,y		; 0954: 99 04 14
    lda #$43		; 0957: A9 43
    sta $1401,y		; 0959: 99 01 14
    lda #$00		; 095C: A9 00
    sta $1403,y		; 095E: 99 03 14
    sta $1402,y		; 0961: 99 02 14
    ldx #$00		; 0964: A2 00
l0966			; Callers: 0974
    lda $1359,x		; 0966: BD 59 13
    cmp #$3F		; 0969: C9 3F
    beq l0970		; 096B: F0 03
    sta $1406,y		; 096D: 99 06 14
l0970			; Callers: 096B
    iny    		; 0970: C8
    inx    		; 0971: E8
    cpx #$0B		; 0972: E0 0B
    bcc l0966		; 0974: 90 F0
    ldx $1301		; 0976: AE 01 13
    jsr l1071		; 0979: 20 71 10
l097C			; Callers: 090B
    jsr l0995		; 097C: 20 95 09
    jsr l0FE2		; 097F: 20 E2 0F
    lda #$80		; 0982: A9 80
    sta $1385,x		; 0984: 9D 85 13
    jsr l129B		; 0987: 20 9B 12
    bne l098F		; 098A: D0 03
    jmp l120A		; 098C: 4C 0A 12
l098F			; Callers: 098A
    jmp l12F0		; 098F: 4C F0 12
l0992			; Callers: 0920
    jsr l12BD		; 0992: 20 BD 12
l0995			; Callers: l09AE 097C
    lda #$00		; 0995: A9 00
    sta $1385,x		; 0997: 9D 85 13
    lda $1307		; 099A: AD 07 13
    asl @		; 099D: 0A
    asl @		; 099E: 0A
    sta $1381,x		; 099F: 9D 81 13
    lda #$00		; 09A2: A9 00
    sta $1387,x		; 09A4: 9D 87 13
    sta $138F,x		; 09A7: 9D 8F 13
    sta $1390,x		; 09AA: 9D 90 13
    rts    		; 09AD: 60
l09AE			; Callers: 0C61 l08E3 0B39
    jsr l0995		; 09AE: 20 95 09
    ldy $1305		; 09B1: AC 05 13
    lda $1401,y		; 09B4: B9 01 14
    and #$02		; 09B7: 29 02
    sta $1384,x		; 09B9: 9D 84 13
    lda $1404,y		; 09BC: B9 04 14
    sta $138B,x		; 09BF: 9D 8B 13
    lda $1405,y		; 09C2: B9 05 14
    sta $138C,x		; 09C5: 9D 8C 13
    jsr l1017		; 09C8: 20 17 10
    rts    		; 09CB: 60
u9CC			; Callers: -c 09CC
    sta $1308		; 09CC: 8D 08 13
    lda ICDNO,x		; 09CF: BD 41 03
    sta z:ICDNOZ		; 09D2: 85 21
    jsr l1164		; 09D4: 20 64 11
    ldy $1300		; 09D7: AC 00 13
    lda $0102,y		; 09DA: B9 02 01
    cmp #$DF		; 09DD: C9 DF
    bcs l09E5		; 09DF: B0 04
    lda #$00		; 09E1: A9 00
    sta z:ICCOMZ		; 09E3: 85 22
l09E5			; Callers: 09DF
    lda $1382,x		; 09E5: BD 82 13
    and #$08		; 09E8: 29 08
    beq l0A19		; 09EA: F0 2D
    ldy $1387,x		; 09EC: BC 87 13
    tya    		; 09EF: 98
    cmp $1386,x		; 09F0: DD 86 13
    bcc l0A06		; 09F3: 90 11
    jsr l0F94		; 09F5: 20 94 0F
    bcs l0A1C		; 09F8: B0 22
    jsr l0A1F		; 09FA: 20 1F 0A
    ldy #$00		; 09FD: A0 00
    bcs l0A06		; 09FF: B0 05
    lda (ICBALZ),y		; 0A01: B1 24
    sta $1308		; 0A03: 8D 08 13
l0A06			; Callers: 09F3 09FF
    inc $1387,x		; 0A06: FE 87 13
    lda $1308		; 0A09: AD 08 13
    sta (FMSZPG+4),y		; 0A0C: 91 47
    lda #$40		; 0A0E: A9 40
    ora $1385,x		; 0A10: 1D 85 13
    sta $1385,x		; 0A13: 9D 85 13
    jmp l12F0		; 0A16: 4C F0 12
l0A19			; Callers: 09EA
    jmp l12BF		; 0A19: 4C BF 12
l0A1C			; Callers: 09F8
    jmp l12F4		; 0A1C: 4C F4 12
l0A1F			; Callers: 09FA
    lda $1385,x		; 0A1F: BD 85 13
    bpl l0A4A		; 0A22: 10 26
    bmi l0A28		; 0A24: 30 02
l0A26			; Callers: 0AD4
    lda #$00		; 0A26: A9 00
l0A28			; Callers: 0A24
    sta $1310		; 0A28: 8D 10 13
    lda z:ICCOMZ		; 0A2B: A5 22
    and #$02		; 0A2D: 29 02
    beq l0A4A		; 0A2F: F0 19
    jsr l0AAE		; 0A31: 20 AE 0A
    bcs l0A4A		; 0A34: B0 14
    lda z:ICBALZ		; 0A36: A5 24
    sta z:FMSZPG+4		; 0A38: 85 47
    lda z:ICBAHZ		; 0A3A: A5 25
    sta z:FMSZPG+5		; 0A3C: 85 48
l0A3E			; Callers: 0A9B
    lda $1310		; 0A3E: AD 10 13
    bmi l0A4C		; 0A41: 30 09
    jsr l100F		; 0A43: 20 0F 10
    bcc l0A7B		; 0A46: 90 33
    bcs l0A9D		; 0A48: B0 53
l0A4A			; Callers: 0A22 0A2F 0A34
    sec    		; 0A4A: 38
    rts    		; 0A4B: 60
l0A4C			; Callers: 0A41
    lda $12F8		; 0A4C: AD F8 12
    sta $1387,x		; 0A4F: 9D 87 13
    tay    		; 0A52: A8
    lda (FMSZPG+4),y		; 0A53: B1 47
    sta $1309		; 0A55: 8D 09 13
    iny    		; 0A58: C8
    lda (FMSZPG+4),y		; 0A59: B1 47
    sta $130A		; 0A5B: 8D 0A 13
    iny    		; 0A5E: C8
    lda (FMSZPG+4),y		; 0A5F: B1 47
    sta $130B		; 0A61: 8D 0B 13
    jsr l0F94		; 0A64: 20 94 0F
    ldy $12F8		; 0A67: AC F8 12
    lda $1309		; 0A6A: AD 09 13
    sta (FMSZPG+4),y		; 0A6D: 91 47
    iny    		; 0A6F: C8
    lda $130A		; 0A70: AD 0A 13
    sta (FMSZPG+4),y		; 0A73: 91 47
    iny    		; 0A75: C8
    lda $130B		; 0A76: AD 0B 13
    sta (FMSZPG+4),y		; 0A79: 91 47
l0A7B			; Callers: 0A46
    clc    		; 0A7B: 18
    lda z:FMSZPG+4		; 0A7C: A5 47
    adc $1386,x		; 0A7E: 7D 86 13
    sta z:FMSZPG+4		; 0A81: 85 47
    lda z:FMSZPG+5		; 0A83: A5 48
    adc #$00		; 0A85: 69 00
    sta z:FMSZPG+5		; 0A87: 85 48
    sec    		; 0A89: 38
    lda z:ICBLLZ		; 0A8A: A5 28
    sbc $1386,x		; 0A8C: FD 86 13
    sta z:ICBLLZ		; 0A8F: 85 28
    lda z:ICBLHZ		; 0A91: A5 29
    sbc #$00		; 0A93: E9 00
    nop    		; 0A95: EA
    sta z:ICBLHZ		; 0A96: 85 29
    jsr l0AAE		; 0A98: 20 AE 0A
    bcc l0A3E		; 0A9B: 90 A1
l0A9D			; Callers: 0A48
    lda z:FMSZPG+4		; 0A9D: A5 47
    sta z:ICBALZ		; 0A9F: 85 24
    lda z:FMSZPG+5		; 0AA1: A5 48
    sta z:ICBAHZ		; 0AA3: 85 25
    ldy $1388,x		; 0AA5: BC 88 13
    dey    		; 0AA8: 88
    jsr l11D0		; 0AA9: 20 D0 11
l0AAC			; Callers: 0ABB 0AB7
    clc    		; 0AAC: 18
    rts    		; 0AAD: 60
l0AAE			; Callers: 0A31 0A98
    lda $12FE		; 0AAE: AD FE 12
    cmp #$01		; 0AB1: C9 01
    bne l0AB9		; 0AB3: D0 04
    lda z:ICBLLZ		; 0AB5: A5 28
    bmi l0AAC		; 0AB7: 30 F3
l0AB9			; Callers: 0AB3
    lda z:ICBLHZ		; 0AB9: A5 29
    bne l0AAC		; 0ABB: D0 EF
    sec    		; 0ABD: 38
    rts    		; 0ABE: 60
uABF			; Callers: -c 0ABF
    jsr l1164		; 0ABF: 20 64 11
    lda $1382,x		; 0AC2: BD 82 13
    and #$02		; 0AC5: 29 02
    beq l0ACC		; 0AC7: F0 03
    jmp l0DB9		; 0AC9: 4C B9 0D
l0ACC			; Callers: 0AC7 0ADA
    lda $1387,x		; 0ACC: BD 87 13
    cmp $1386,x		; 0ACF: DD 86 13
    bcc l0ADF		; 0AD2: 90 0B
    jsr l0A26		; 0AD4: 20 26 0A
    jsr l100F		; 0AD7: 20 0F 10
    bcc l0ACC		; 0ADA: 90 F0
    jmp l12F4		; 0ADC: 4C F4 12
l0ADF			; Callers: 0AD2
    tay    		; 0ADF: A8
    lda (FMSZPG+4),y		; 0AE0: B1 47
    sta $1308		; 0AE2: 8D 08 13
    iny    		; 0AE5: C8
    tya    		; 0AE6: 98
    sta $1387,x		; 0AE7: 9D 87 13
    ldy $138B,x		; 0AEA: BC 8B 13
    bne l0AFE		; 0AED: D0 0F
    ldy $138C,x		; 0AEF: BC 8C 13
    bne l0AFE		; 0AF2: D0 0A
    cmp $1386,x		; 0AF4: DD 86 13
    bcc l0AFE		; 0AF7: 90 05
    lda #$03		; 0AF9: A9 03
    jmp l12D3		; 0AFB: 4C D3 12
l0AFE			; Callers: 0AED 0AF2 0AF7
    jmp l12F0		; 0AFE: 4C F0 12
uB01			; Callers: -c 0B01
    jsr l1164		; 0B01: 20 64 11
    jsr l0E9E		; 0B04: 20 9E 0E
    jsr l0F21		; 0B07: 20 21 0F
    bcs l0B12		; 0B0A: B0 06
    jsr l0CAC		; 0B0C: 20 AC 0C
    jmp l12F0		; 0B0F: 4C F0 12
l0B12			; Callers: 0B0A
    jmp l12BB		; 0B12: 4C BB 12
uB15			; Callers: -c 0B15
    jsr l1164		; 0B15: 20 64 11
    lda $1382,x		; 0B18: BD 82 13
    and #$08		; 0B1B: 29 08
    beq l0B6D		; 0B1D: F0 4E
    rol $1385,x		; 0B1F: 3E 85 13
    bcc l0B75		; 0B22: 90 51
    jsr l0FAB		; 0B24: 20 AB 0F
    jsr l0B80		; 0B27: 20 80 0B
    lda $1390,x		; 0B2A: BD 90 13
    pha    		; 0B2D: 48
    lda $138F,x		; 0B2E: BD 8F 13
    pha    		; 0B31: 48
    lda $1382,x		; 0B32: BD 82 13
    and #$01		; 0B35: 29 01
    beq l0B50		; 0B37: F0 17
    jsr l09AE		; 0B39: 20 AE 09
l0B3C			; Callers: 0B3F
    jsr l100F		; 0B3C: 20 0F 10
    bcc l0B3C		; 0B3F: 90 FB
    lda $138D,x		; 0B41: BD 8D 13
    sta $138B,x		; 0B44: 9D 8B 13
    lda $138E,x		; 0B47: BD 8E 13
    sta $138C,x		; 0B4A: 9D 8C 13
    jsr l0FB3		; 0B4D: 20 B3 0F
l0B50			; Callers: 0B37
    ldy $1305		; 0B50: AC 05 13
    clc    		; 0B53: 18
    pla    		; 0B54: 68
    adc $1402,y		; 0B55: 79 02 14
    sta $1402,y		; 0B58: 99 02 14
    pla    		; 0B5B: 68
    adc $1403,y		; 0B5C: 79 03 14
    sta $1403,y		; 0B5F: 99 03 14
    lda #$42		; 0B62: A9 42
    sta $1401,y		; 0B64: 99 01 14
    jsr l1071		; 0B67: 20 71 10
    jsr l1095		; 0B6A: 20 95 10
l0B6D			; Callers: 0B1D 0B78 0B7D
    lda #$00		; 0B6D: A9 00
    sta $1382,x		; 0B6F: 9D 82 13
    jmp l12EA		; 0B72: 4C EA 12
l0B75			; Callers: 0B22
    rol $1385,x		; 0B75: 3E 85 13
    bcc l0B6D		; 0B78: 90 F3
    jsr l0FF8		; 0B7A: 20 F8 0F
    jmp l0B6D		; 0B7D: 4C 6D 0B
l0B80			; Callers: 0B27
    lda $1381,x		; 0B80: BD 81 13
    lsr @		; 0B83: 4A
    lsr @		; 0B84: 4A
    sta $1307		; 0B85: 8D 07 13
    jsr l0B9B		; 0B88: 20 9B 0B
    sta $1306		; 0B8B: 8D 06 13
    jsr l0B9B		; 0B8E: 20 9B 0B
    jsr l0B9D		; 0B91: 20 9D 0B
    asl @		; 0B94: 0A
    sta $1305		; 0B95: 8D 05 13
    jmp l106E		; 0B98: 4C 6E 10
l0B9B			; Callers: 0B88 0B8E
    lda #$00		; 0B9B: A9 00
l0B9D			; Callers: 0B91
    ldy #$03		; 0B9D: A0 03
l0B9F			; Callers: 0BA4
    asl $1381,x		; 0B9F: 1E 81 13
    rol @		; 0BA2: 2A
    dey    		; 0BA3: 88
    bne l0B9F		; 0BA4: D0 F9
    rts    		; 0BA6: 60
uBA7			; Callers: -c 0BA7
    jsr l1164		; 0BA7: 20 64 11
    lda ICCOM,x		; 0BAA: BD 42 03
    cmp #$FE		; 0BAD: C9 FE
    beq l0BD6		; 0BAF: F0 25
    cmp #$27		; 0BB1: C9 27
    bcs l0BD3		; 0BB3: B0 1E
    sec    		; 0BB5: 38
    sbc #$20		; 0BB6: E9 20
    bcc l0BD3		; 0BB8: 90 19
    asl @		; 0BBA: 0A
    tay    		; 0BBB: A8
    lda $0BC5,y		; 0BBC: B9 C5 0B
    pha    		; 0BBF: 48
    lda $0BC6,y		; 0BC0: B9 C6 0B
    pha    		; 0BC3: 48
    rts    		; 0BC4: 60
    dta $B		; 0BC5: 0B Access: 0BBC
    dta $D8		; 0BC6: D8 Access: 0BC0
    dta $C		; 0BC7: 0C
    dta $31		; 0BC8: 31
    dta $B		; 0BC9: 0B
    dta $D2		; 0BCA: D2
    dta $C		; 0BCB: 0C
    dta $7B		; 0BCC: 7B
    dta $C		; 0BCD: 0C
    dta $82		; 0BCE: 82
    dta $C		; 0BCF: 0C
    dta $B9		; 0BD0: B9
    dta $D		; 0BD1: 0D
    dta $2		; 0BD2: 02
l0BD3			; Callers: 0BB3 0BB8
    jmp l12BF		; 0BD3: 4C BF 12
l0BD6			; Callers: 0BAF
    jmp l0D18		; 0BD6: 4C 18 0D
uBD9			; Callers: -c 0BD9
    jsr l0E9E		; 0BD9: 20 9E 0E
    sty $130D		; 0BDC: 8C 0D 13
    jsr l0F21		; 0BDF: 20 21 0F
    bcc l0BE7		; 0BE2: 90 03
    jmp l12BB		; 0BE4: 4C BB 12
l0BE7			; Callers: 0BE2 0C2D
    jsr l0CAC		; 0BE7: 20 AC 0C
    jsr l129B		; 0BEA: 20 9B 12
    bne l0BF2		; 0BED: D0 03
    jsr l1219		; 0BEF: 20 19 12
l0BF2			; Callers: 0BED
    ldy $130D		; 0BF2: AC 0D 13
    jsr l0EB4		; 0BF5: 20 B4 0E
    jsr l129B		; 0BF8: 20 9B 12
    bne l0C0C		; 0BFB: D0 0F
    ldy $1305		; 0BFD: AC 05 13
    lda $1405,y		; 0C00: B9 05 14
    pha    		; 0C03: 48
    lda $1404,y		; 0C04: B9 04 14
    tay    		; 0C07: A8
    pla    		; 0C08: 68
    jsr l1253		; 0C09: 20 53 12
l0C0C			; Callers: 0BFB
    ldx #$00		; 0C0C: A2 00
    ldy $1305		; 0C0E: AC 05 13
l0C11			; Callers: 0C1F
    lda $1359,x		; 0C11: BD 59 13
    cmp #$3F		; 0C14: C9 3F
    beq l0C1B		; 0C16: F0 03
    sta $1406,y		; 0C18: 99 06 14
l0C1B			; Callers: 0C16
    iny    		; 0C1B: C8
    inx    		; 0C1C: E8
    cpx #$0B		; 0C1D: E0 0B
    bcc l0C11		; 0C1F: 90 F0
    ldx $1301		; 0C21: AE 01 13
    jsr l1071		; 0C24: 20 71 10
    jsr l0E9E		; 0C27: 20 9E 0E
    jsr l0F31		; 0C2A: 20 31 0F
    bcc l0BE7		; 0C2D: 90 B8
    jmp l12EA		; 0C2F: 4C EA 12
uC32			; Callers: -c 0C32
    jsr l0E9E		; 0C32: 20 9E 0E
    jsr l0F21		; 0C35: 20 21 0F
    bcs l0C79		; 0C38: B0 3F
l0C3A			; Callers: 0C4B
    jsr l0C53		; 0C3A: 20 53 0C
    jsr l129B		; 0C3D: 20 9B 12
    bne l0C45		; 0C40: D0 03
    jsr l1219		; 0C42: 20 19 12
l0C45			; Callers: 0C40
    jsr l1071		; 0C45: 20 71 10
    jsr l0F31		; 0C48: 20 31 0F
    bcc l0C3A		; 0C4B: 90 ED
    jsr l1095		; 0C4D: 20 95 10
    jmp l12EA		; 0C50: 4C EA 12
l0C53			; Callers: 0C3A 0914
    jsr l10BF		; 0C53: 20 BF 10
    ldy $1305		; 0C56: AC 05 13
    jsr l0CAC		; 0C59: 20 AC 0C
    lda #$80		; 0C5C: A9 80
    sta $1401,y		; 0C5E: 99 01 14
    jsr l09AE		; 0C61: 20 AE 09
    jmp l0C6C		; 0C64: 4C 6C 0C
l0C67			; Callers: 0C6F
    jsr l100F		; 0C67: 20 0F 10
    bcs l0C72		; 0C6A: B0 06
l0C6C			; Callers: 0C64
    jsr l10C5		; 0C6C: 20 C5 10
    jmp l0C67		; 0C6F: 4C 67 0C
l0C72			; Callers: 0C6A
    ldy #$05		; 0C72: A0 05
    lda #$FF		; 0C74: A9 FF
    sta (FMSZPG+2),y		; 0C76: 91 45
    rts    		; 0C78: 60
l0C79			; Callers: 0C38
    jmp l12BB		; 0C79: 4C BB 12
uC7C			; Callers: -c 0C7C
    lda #$20		; 0C7C: A9 20
    sta $130F		; 0C7E: 8D 0F 13
    bne l0C88		; 0C81: D0 05
    lda #$00		; 0C83: A9 00
    sta $130F		; 0C85: 8D 0F 13
l0C88			; Callers: 0C81
    jsr l0E9E		; 0C88: 20 9E 0E
    jsr l0F21		; 0C8B: 20 21 0F
    bcc l0C93		; 0C8E: 90 03
    jmp l12BB		; 0C90: 4C BB 12
l0C93			; Callers: 0C8E 0CA7
    ldy $1305		; 0C93: AC 05 13
    lda $1401,y		; 0C96: B9 01 14
    and #$DF		; 0C99: 29 DF
    ora $130F		; 0C9B: 0D 0F 13
    sta $1401,y		; 0C9E: 99 01 14
    jsr l1071		; 0CA1: 20 71 10
    jsr l0F31		; 0CA4: 20 31 0F
    bcc l0C93		; 0CA7: 90 EA
    jmp l12EA		; 0CA9: 4C EA 12
l0CAC			; Callers: 0C59 0B0C l0BE7 08E0 08F9
    ldy $1305		; 0CAC: AC 05 13
    lda $1401,y		; 0CAF: B9 01 14
    and #$20		; 0CB2: 29 20
    bne l0CB7		; 0CB4: D0 01
    rts    		; 0CB6: 60
l0CB7			; Callers: 0CB4
    jmp l12C1		; 0CB7: 4C C1 12
uCBA			; Callers: -c 0CBA
    lda $1385,x		; 0CBA: BD 85 13
    bmi l0D00		; 0CBD: 30 41
    lda $034D,x		; 0CBF: BD 4D 03
    cmp $138A,x		; 0CC2: DD 8A 13
    bne l0CCF		; 0CC5: D0 08
    lda ICSPR,x		; 0CC7: BD 4C 03
    cmp $1389,x		; 0CCA: DD 89 13
    beq l0CED		; 0CCD: F0 1E
l0CCF			; Callers: 0CC5
    lda $1385,x		; 0CCF: BD 85 13
    beq l0CDC		; 0CD2: F0 08
    jsr l0FF8		; 0CD4: 20 F8 0F
    lda #$00		; 0CD7: A9 00
    sta $1385,x		; 0CD9: 9D 85 13
l0CDC			; Callers: 0CD2
    lda $034D,x		; 0CDC: BD 4D 03
    sta $138C,x		; 0CDF: 9D 8C 13
    lda ICSPR,x		; 0CE2: BD 4C 03
    sta $138B,x		; 0CE5: 9D 8B 13
    jsr l1017		; 0CE8: 20 17 10
    bcs l0CF7		; 0CEB: B0 0A
l0CED			; Callers: 0CCD
    lda $034E,x		; 0CED: BD 4E 03
    cmp $1386,x		; 0CF0: DD 86 13
    bcc l0CFA		; 0CF3: 90 05
    beq l0CFA		; 0CF5: F0 03
l0CF7			; Callers: 0CEB
    jmp l12C3		; 0CF7: 4C C3 12
l0CFA			; Callers: 0CF3 0CF5
    sta $1387,x		; 0CFA: 9D 87 13
    jmp l12F0		; 0CFD: 4C F0 12
l0D00			; Callers: 0CBD
    jmp l12B9		; 0D00: 4C B9 12
uD03			; Callers: -c 0D03
    lda $1387,x		; 0D03: BD 87 13
    sta $034E,x		; 0D06: 9D 4E 03
    lda $1389,x		; 0D09: BD 89 13
    sta ICSPR,x		; 0D0C: 9D 4C 03
    lda $138A,x		; 0D0F: BD 8A 13
    sta $034D,x		; 0D12: 9D 4D 03
    jmp l12F0		; 0D15: 4C F0 12
l0D18			; Callers: l0BD6
    lda z:FMSZPG+5		; 0D18: A5 48
    sta DBUFHI		; 0D1A: 8D 05 03
    lda z:FMSZPG+4		; 0D1D: A5 47
    sta DBUFLO		; 0D1F: 8D 04 03
    lda #$21		; 0D22: A9 21
    sta DCOMND		; 0D24: 8D 02 03
    lda #$40		; 0D27: A9 40
    sta DSTATS		; 0D29: 8D 03 03
    ldx $12FE		; 0D2C: AE FE 12
    lda #$31		; 0D2F: A9 31
    ldy DSKTIM		; 0D31: AC 46 02
    jsr l0786		; 0D34: 20 86 07
    bpl l0D52		; 0D37: 10 19
    cpy #$90		; 0D39: C0 90
    bne l0D4F		; 0D3B: D0 12
    ldy #$00		; 0D3D: A0 00
    lda (FMSZPG+4),y		; 0D3F: B1 47
    cmp #$FF		; 0D41: C9 FF
    bne l0D4C		; 0D43: D0 07
    iny    		; 0D45: C8
    lda (FMSZPG+4),y		; 0D46: B1 47
    cmp #$FF		; 0D48: C9 FF
    beq l0D4F		; 0D4A: F0 03
l0D4C			; Callers: 0D43
    jmp l12B5		; 0D4C: 4C B5 12
l0D4F			; Callers: 0D3B 0D4A
    jmp l12D3		; 0D4F: 4C D3 12
l0D52			; Callers: 0D37
    lda #$00		; 0D52: A9 00
    tay    		; 0D54: A8
l0D55			; Callers: 0D58
    sta (FMSZPG+2),y		; 0D55: 91 45
    iny    		; 0D57: C8
    bpl l0D55		; 0D58: 10 FB
    ldy #$00		; 0D5A: A0 00
    lda #$02		; 0D5C: A9 02
    sta (FMSZPG+2),y		; 0D5E: 91 45
    iny    		; 0D60: C8
    lda #$C3		; 0D61: A9 C3
    sta (FMSZPG+2),y		; 0D63: 91 45
    iny    		; 0D65: C8
    iny    		; 0D66: C8
    sta (FMSZPG+2),y		; 0D67: 91 45
    lda #$02		; 0D69: A9 02
    dey    		; 0D6B: 88
    sta (FMSZPG+2),y		; 0D6C: 91 45
    iny    		; 0D6E: C8
    iny    		; 0D6F: C8
    sta (FMSZPG+2),y		; 0D70: 91 45
    ldy #$0A		; 0D72: A0 0A
    lda #$FF		; 0D74: A9 FF
l0D76			; Callers: 0D7B
    sta (FMSZPG+2),y		; 0D76: 91 45
    iny    		; 0D78: C8
    cpy #$64		; 0D79: C0 64
    bne l0D76		; 0D7B: D0 F9
    lda #$0F		; 0D7D: A9 0F
    ldy #$0A		; 0D7F: A0 0A
    sta (FMSZPG+2),y		; 0D81: 91 45
    ldy #$37		; 0D83: A0 37
    lda #$00		; 0D85: A9 00
    sta (FMSZPG+2),y		; 0D87: 91 45
    iny    		; 0D89: C8
    lda #$7F		; 0D8A: A9 7F
    sta (FMSZPG+2),y		; 0D8C: 91 45
    jsr l1095		; 0D8E: 20 95 10
    lda #$00		; 0D91: A9 00
    tay    		; 0D93: A8
l0D94			; Callers: 0D98
    sta $1401,y		; 0D94: 99 01 14
    iny    		; 0D97: C8
    bpl l0D94		; 0D98: 10 FA
    lda #$07		; 0D9A: A9 07
    sta $1306		; 0D9C: 8D 06 13
l0D9F			; Callers: 0DA5
    jsr l1071		; 0D9F: 20 71 10
    dec $1306		; 0DA2: CE 06 13
    bpl l0D9F		; 0DA5: 10 F8
    jsr l1219		; 0DA7: 20 19 12
    jmp l12EA		; 0DAA: 4C EA 12
l0DAD			; Callers: 08BB
    lda #$00		; 0DAD: A9 00
    sta $130F		; 0DAF: 8D 0F 13
    jsr l0F21		; 0DB2: 20 21 0F
    bcc l0DE3		; 0DB5: 90 2C
    bcs l0DE9		; 0DB7: B0 30
l0DB9			; Callers: 0AC9
    bit $130F		; 0DB9: 2C 0F 13
    bmi l0E11		; 0DBC: 30 53
    ldy $130F		; 0DBE: AC 0F 13
    lda (FMSZPG+4),y		; 0DC1: B1 47
    sta $1308		; 0DC3: 8D 08 13
    inc $130F		; 0DC6: EE 0F 13
    cmp #$9B		; 0DC9: C9 9B
    bne l0DD6		; 0DCB: D0 09
    cpy #$11		; 0DCD: C0 11
    bcs l0DD9		; 0DCF: B0 08
    lda #$80		; 0DD1: A9 80
    sta $130F		; 0DD3: 8D 0F 13
l0DD6			; Callers: 0DCB
    jmp l12F0		; 0DD6: 4C F0 12
l0DD9			; Callers: 0DCF
    lda #$00		; 0DD9: A9 00
    sta $130F		; 0DDB: 8D 0F 13
    jsr l0F31		; 0DDE: 20 31 0F
    bcs l0DE9		; 0DE1: B0 06
l0DE3			; Callers: 0DB5
    jsr l0E21		; 0DE3: 20 21 0E
    jmp l12F0		; 0DE6: 4C F0 12
l0DE9			; Callers: 0DE1 0DB7
    jsr l108B		; 0DE9: 20 8B 10
    ldy #$04		; 0DEC: A0 04
    lda (FMSZPG+2),y		; 0DEE: B1 45
    pha    		; 0DF0: 48
    dey    		; 0DF1: 88
    lda (FMSZPG+2),y		; 0DF2: B1 45
    tay    		; 0DF4: A8
    pla    		; 0DF5: 68
    jsr l0E57		; 0DF6: 20 57 0E
    ldy #$03		; 0DF9: A0 03
    ldx #$0C		; 0DFB: A2 0C
l0DFD			; Callers: 0E04
    lda $0E14,x		; 0DFD: BD 14 0E
    sta (FMSZPG+4),y		; 0E00: 91 47
    iny    		; 0E02: C8
    dex    		; 0E03: CA
    bpl l0DFD		; 0E04: 10 F7
    jsr l0E67		; 0E06: 20 67 0E
    lda #$00		; 0E09: A9 00
    sta $130F		; 0E0B: 8D 0F 13
    jmp l12EA		; 0E0E: 4C EA 12
l0E11			; Callers: 0DBC
    jmp l12F4		; 0E11: 4C F4 12
    dta $53		; 0E14: 53 Access: 0DFD
    dta $52		; 0E15: 52
    dta $4F		; 0E16: 4F
    dta $54		; 0E17: 54
    dta $43		; 0E18: 43
    dta $45		; 0E19: 45
    dta $53		; 0E1A: 53
    dta $20		; 0E1B: 20
    dta $45		; 0E1C: 45
    dta $45		; 0E1D: 45
    dta $52		; 0E1E: 52
    dta $46		; 0E1F: 46
    dta $20		; 0E20: 20
l0E21			; Callers: 0DE3
    ldy #$00		; 0E21: A0 00
    lda #$20		; 0E23: A9 20
    sta (FMSZPG+4),y		; 0E25: 91 47
    ldx $1305		; 0E27: AE 05 13
    lda $1401,x		; 0E2A: BD 01 14
    and #$20		; 0E2D: 29 20
    beq l0E35		; 0E2F: F0 04
    lda #$2A		; 0E31: A9 2A
    sta (FMSZPG+4),y		; 0E33: 91 47
l0E35			; Callers: 0E2F
    iny    		; 0E35: C8
    lda #$20		; 0E36: A9 20
    sta (FMSZPG+4),y		; 0E38: 91 47
    iny    		; 0E3A: C8
l0E3B			; Callers: 0E44
    lda $1406,x		; 0E3B: BD 06 14
    sta (FMSZPG+4),y		; 0E3E: 91 47
    inx    		; 0E40: E8
    iny    		; 0E41: C8
    cpy #$0D		; 0E42: C0 0D
    bcc l0E3B		; 0E44: 90 F5
    lda #$20		; 0E46: A9 20
    sta (FMSZPG+4),y		; 0E48: 91 47
    iny    		; 0E4A: C8
    sty $130F		; 0E4B: 8C 0F 13
    ldx $1305		; 0E4E: AE 05 13
    ldy $1402,x		; 0E51: BC 02 14
    lda $1403,x		; 0E54: BD 03 14
l0E57			; Callers: 0DF6
    ldx #$64		; 0E57: A2 64
    jsr l0E71		; 0E59: 20 71 0E
    ldx #$0A		; 0E5C: A2 0A
    jsr l0E71		; 0E5E: 20 71 0E
    tya    		; 0E61: 98
    jsr l0E8D		; 0E62: 20 8D 0E
    ldy #$11		; 0E65: A0 11
l0E67			; Callers: 0E06
    lda #$9B		; 0E67: A9 9B
    sta (FMSZPG+4),y		; 0E69: 91 47
    ldy #$00		; 0E6B: A0 00
    sty $130F		; 0E6D: 8C 0F 13
    rts    		; 0E70: 60
l0E71			; Callers: 0E59 0E5E
    stx $130E		; 0E71: 8E 0E 13
    ldx #$FF		; 0E74: A2 FF
l0E76			; Callers: 0E8A
    sta $130D		; 0E76: 8D 0D 13
    sty $130C		; 0E79: 8C 0C 13
    inx    		; 0E7C: E8
    sec    		; 0E7D: 38
    lda $130C		; 0E7E: AD 0C 13
    sbc $130E		; 0E81: ED 0E 13
    tay    		; 0E84: A8
    lda $130D		; 0E85: AD 0D 13
    sbc #$00		; 0E88: E9 00
    bcs l0E76		; 0E8A: B0 EA
    txa    		; 0E8C: 8A
l0E8D			; Callers: 0E62
    ora #$30		; 0E8D: 09 30
    ldy $130F		; 0E8F: AC 0F 13
    sta (FMSZPG+4),y		; 0E92: 91 47
    inc $130F		; 0E94: EE 0F 13
    lda $130D		; 0E97: AD 0D 13
    ldy $130C		; 0E9A: AC 0C 13
    rts    		; 0E9D: 60
l0E9E			; Callers: uC32 l0C88 0B04 uBD9 0C27 08AE
    lda ICBAL,x		; 0E9E: BD 44 03
    sta z:FMSZPG		; 0EA1: 85 43
    lda ICBAH,x		; 0EA3: BD 45 03
    sta z:FMSZPG+1		; 0EA6: 85 44
    ldy #$02		; 0EA8: A0 02
l0EAA			; Callers: 0EB1
    lda (FMSZPG),y		; 0EAA: B1 43
    dey    		; 0EAC: 88
    bmi l0F07		; 0EAD: 30 58
    cmp #$3A		; 0EAF: C9 3A
    bne l0EAA		; 0EB1: D0 F7
    iny    		; 0EB3: C8
l0EB4			; Callers: 0BF5
    ldx #$0B		; 0EB4: A2 0B
    lda #$20		; 0EB6: A9 20
l0EB8			; Callers: 0EBC
    sta $1359,x		; 0EB8: 9D 59 13
    dex    		; 0EBB: CA
    bpl l0EB8		; 0EBC: 10 FA
    ldx #$00		; 0EBE: A2 00
    stx $130C		; 0EC0: 8E 0C 13
l0EC3			; Callers: 0F00 0EE3 0ED1
    iny    		; 0EC3: C8
    lda (FMSZPG),y		; 0EC4: B1 43
    cmp #$2A		; 0EC6: C9 2A
    bne l0ED5		; 0EC8: D0 0B
l0ECA			; Callers: 0ECF
    lda #$3F		; 0ECA: A9 3F
    jsr l0F0A		; 0ECC: 20 0A 0F
    bcc l0ECA		; 0ECF: 90 F9
    bpl l0EC3		; 0ED1: 10 F0
    bmi l0F03		; 0ED3: 30 2E
l0ED5			; Callers: 0EC8
    cmp #$2E		; 0ED5: C9 2E
    bne l0EE5		; 0ED7: D0 0C
    bit $130C		; 0ED9: 2C 0C 13
    bmi l0F03		; 0EDC: 30 25
    ldx #$08		; 0EDE: A2 08
    ror $130C		; 0EE0: 6E 0C 13
    bcc l0EC3		; 0EE3: 90 DE
l0EE5			; Callers: 0ED7
    cmp #$3F		; 0EE5: C9 3F
    beq l0EFD		; 0EE7: F0 14
    cmp #$41		; 0EE9: C9 41
    bcc l0EF1		; 0EEB: 90 04
    cmp #$5B		; 0EED: C9 5B
    bcc l0EFD		; 0EEF: 90 0C
l0EF1			; Callers: 0EEB
    cpx #$00		; 0EF1: E0 00
    beq l0F07		; 0EF3: F0 12
    cmp #$30		; 0EF5: C9 30
    bcc l0F03		; 0EF7: 90 0A
    cmp #$3A		; 0EF9: C9 3A
    bcs l0F03		; 0EFB: B0 06
l0EFD			; Callers: 0EE7 0EEF
    jsr l0F0A		; 0EFD: 20 0A 0F
    jmp l0EC3		; 0F00: 4C C3 0E
l0F03			; Callers: 0EF7 0EFB 0EDC 0ED3
    ldx $1301		; 0F03: AE 01 13
    rts    		; 0F06: 60
l0F07			; Callers: 0EAD 0EF3
    jmp l12C5		; 0F07: 4C C5 12
l0F0A			; Callers: l0EFD 0ECC
    cpx #$08		; 0F0A: E0 08
    bcc l0F1B		; 0F0C: 90 0D
    beq l0F15		; 0F0E: F0 05
    cpx #$0C		; 0F10: E0 0C
    bcc l0F1B		; 0F12: 90 07
    rts    		; 0F14: 60
l0F15			; Callers: 0F0E
    bit $130C		; 0F15: 2C 0C 13
    bmi l0F1B		; 0F18: 30 01
    rts    		; 0F1A: 60
l0F1B			; Callers: 0F0C 0F18 0F12
    sta $1359,x		; 0F1B: 9D 59 13
    inx    		; 0F1E: E8
    clc    		; 0F1F: 18
    rts    		; 0F20: 60
l0F21			; Callers: 0C35 0C8B 0B07 0BDF l08BE 0DB2
    lda #$FF		; 0F21: A9 FF
    sta $1302		; 0F23: 8D 02 13
    sta $1306		; 0F26: 8D 06 13
    sta $1307		; 0F29: 8D 07 13
    lda #$70		; 0F2C: A9 70
    sta $1305		; 0F2E: 8D 05 13
l0F31			; Callers: 0F8D 0F5A 0F68 0C48 0CA4 0C2A 0DDE
    inc $1307		; 0F31: EE 07 13
    clc    		; 0F34: 18
    lda $1305		; 0F35: AD 05 13
    adc #$10		; 0F38: 69 10
    bpl l0F4D		; 0F3A: 10 11
    inc $1306		; 0F3C: EE 06 13
    lda #$08		; 0F3F: A9 08
    cmp $1306		; 0F41: CD 06 13
    bcc l0F48		; 0F44: 90 02
    beq l0F90		; 0F46: F0 48
l0F48			; Callers: 0F44
    jsr l106E		; 0F48: 20 6E 10
    lda #$00		; 0F4B: A9 00
l0F4D			; Callers: 0F3A
    sta $1305		; 0F4D: 8D 05 13
    tay    		; 0F50: A8
    lda $1401,y		; 0F51: B9 01 14
    beq l0F73		; 0F54: F0 1D
    bmi l0F73		; 0F56: 30 1B
    and #$01		; 0F58: 29 01
    bne l0F31		; 0F5A: D0 D5
    ldx #$00		; 0F5C: A2 00
l0F5E			; Callers: 0F6E
    lda $1359,x		; 0F5E: BD 59 13
    cmp #$3F		; 0F61: C9 3F
    beq l0F6A		; 0F63: F0 05
    cmp $1406,y		; 0F65: D9 06 14
    bne l0F31		; 0F68: D0 C7
l0F6A			; Callers: 0F63
    inx    		; 0F6A: E8
    iny    		; 0F6B: C8
    cpx #$0B		; 0F6C: E0 0B
    bne l0F5E		; 0F6E: D0 EE
    clc    		; 0F70: 18
    bcc l0F90		; 0F71: 90 1D
l0F73			; Callers: 0F54 0F56
    lda $1302		; 0F73: AD 02 13
    bpl l0F8A		; 0F76: 10 12
    lda $1306		; 0F78: AD 06 13
    sta $1302		; 0F7B: 8D 02 13
    lda $1305		; 0F7E: AD 05 13
    sta $1303		; 0F81: 8D 03 13
    lda $1307		; 0F84: AD 07 13
    sta $1304		; 0F87: 8D 04 13
l0F8A			; Callers: 0F76
    lda $1401,y		; 0F8A: B9 01 14
    bmi l0F31		; 0F8D: 30 A2
    sec    		; 0F8F: 38
l0F90			; Callers: 0F71 0F46
    ldx $1301		; 0F90: AE 01 13
    rts    		; 0F93: 60
l0F94			; Callers: 1014 09F5 0A64 l1294
    lda $1385,x		; 0F94: BD 85 13
    bmi l0FA8		; 0F97: 30 0F
    asl @		; 0F99: 0A
    bpl l0FA5		; 0F9A: 10 09
    asl @		; 0F9C: 0A
    sta $1385,x		; 0F9D: 9D 85 13
    jsr l0FF8		; 0FA0: 20 F8 0F
    bmi l0FC9		; 0FA3: 30 24
l0FA5			; Callers: 0F9A
    jmp l100F		; 0FA5: 4C 0F 10
l0FA8			; Callers: 0F97
    jsr l1106		; 0FA8: 20 06 11
l0FAB			; Callers: 0B24
    lda $1387,x		; 0FAB: BD 87 13
    ldy $12FB		; 0FAE: AC FB 12
    sta (FMSZPG+4),y		; 0FB1: 91 47
l0FB3			; Callers: 0B4D
    lda $138C,x		; 0FB3: BD 8C 13
    ora $1381,x		; 0FB6: 1D 81 13
    ldy $12F8		; 0FB9: AC F8 12
    sta (FMSZPG+4),y		; 0FBC: 91 47
    iny    		; 0FBE: C8
    lda $138B,x		; 0FBF: BD 8B 13
    sta (FMSZPG+4),y		; 0FC2: 91 47
    jsr l0FF8		; 0FC4: 20 F8 0F
    bpl l0FDA		; 0FC7: 10 11
l0FC9			; Callers: 0FA3
    lda DSTATS		; 0FC9: AD 03 03
    sta $130F		; 0FCC: 8D 0F 13
    lda #$00		; 0FCF: A9 00
    sta $1382,x		; 0FD1: 9D 82 13
    lda $130F		; 0FD4: AD 0F 13
    jmp l12D3		; 0FD7: 4C D3 12
l0FDA			; Callers: 0FC7
    inc $138F,x		; 0FDA: FE 8F 13
    bne l0FE2		; 0FDD: D0 03
    inc $1390,x		; 0FDF: FE 90 13
l0FE2			; Callers: 0FDD 097F
    jsr l1002		; 0FE2: 20 02 10
    lda #$00		; 0FE5: A9 00
    sta $138B,x		; 0FE7: 9D 8B 13
    sta $138C,x		; 0FEA: 9D 8C 13
    sta $1387,x		; 0FED: 9D 87 13
    lda $12F8		; 0FF0: AD F8 12
    sta $1386,x		; 0FF3: 9D 86 13
    clc    		; 0FF6: 18
    rts    		; 0FF7: 60
l0FF8			; Callers: 0FC4 0FA0 0CD4 0B7A
    sec    		; 0FF8: 38
l0FF9			; Callers: 1025
    lda $138A,x		; 0FF9: BD 8A 13
    ldy $1389,x		; 0FFC: BC 89 13
    jmp l11F7		; 0FFF: 4C F7 11
l1002			; Callers: l1021 l0FE2
    lda $138B,x		; 1002: BD 8B 13
    sta $1389,x		; 1005: 9D 89 13
    lda $138C,x		; 1008: BD 8C 13
    sta $138A,x		; 100B: 9D 8A 13
    rts    		; 100E: 60
l100F			; Callers: l0C67 l0FA5 0A43 0AD7 0B3C
    lda $1385,x		; 100F: BD 85 13
    beq l1017		; 1012: F0 03
    jmp l0F94		; 1014: 4C 94 0F
l1017			; Callers: 09C8 1012 0CE8
    lda $138B,x		; 1017: BD 8B 13
    ora $138C,x		; 101A: 1D 8C 13
    bne l1021		; 101D: D0 02
    sec    		; 101F: 38
    rts    		; 1020: 60
l1021			; Callers: 101D
    jsr l1002		; 1021: 20 02 10
    clc    		; 1024: 18
    jsr l0FF9		; 1025: 20 F9 0F
    bmi l105F		; 1028: 30 35
    ldy $12F8		; 102A: AC F8 12
    lda (FMSZPG+4),y		; 102D: B1 47
    and #$FC		; 102F: 29 FC
    cmp $1381,x		; 1031: DD 81 13
    bne l1062		; 1034: D0 2C
    lda (FMSZPG+4),y		; 1036: B1 47
    and #$03		; 1038: 29 03
    sta $138C,x		; 103A: 9D 8C 13
    iny    		; 103D: C8
    lda (FMSZPG+4),y		; 103E: B1 47
    sta $138B,x		; 1040: 9D 8B 13
    iny    		; 1043: C8
    lda (FMSZPG+4),y		; 1044: B1 47
    pha    		; 1046: 48
    lda $1384,x		; 1047: BD 84 13
    bne l1054		; 104A: D0 08
    pla    		; 104C: 68
    bmi l1051		; 104D: 30 02
    lda #$7D		; 104F: A9 7D
l1051			; Callers: 104D
    and #$7F		; 1051: 29 7F
    pha    		; 1053: 48
l1054			; Callers: 104A
    pla    		; 1054: 68
    sta $1386,x		; 1055: 9D 86 13
    lda #$00		; 1058: A9 00
    sta $1387,x		; 105A: 9D 87 13
    clc    		; 105D: 18
    rts    		; 105E: 60
l105F			; Callers: 1028
    jsr l12E5		; 105F: 20 E5 12
l1062			; Callers: 1034
    lda ICCOM,x		; 1062: BD 42 03
    cmp #$21		; 1065: C9 21
    beq l106C		; 1067: F0 03
    jsr l12C7		; 1069: 20 C7 12
l106C			; Callers: 1067
    sec    		; 106C: 38
    rts    		; 106D: 60
l106E			; Callers: l0F48 0925 0B98
    clc    		; 106E: 18
    bcc l1072		; 106F: 90 01
l1071			; Callers: l0C45 0CA1 0C24 0D9F 0979 0B67
    sec    		; 1071: 38
l1072			; Callers: 106F
    php    		; 1072: 08
    lda #$14		; 1073: A9 14
    sta DBUFHI		; 1075: 8D 05 03
    lda #$01		; 1078: A9 01
    sta DBUFLO		; 107A: 8D 04 03
    clc    		; 107D: 18
    lda $1306		; 107E: AD 06 13
    adc #$69		; 1081: 69 69
    tay    		; 1083: A8
    lda #$01		; 1084: A9 01
    adc #$00		; 1086: 69 00
    jmp l10AB		; 1088: 4C AB 10
l108B			; Callers: l10BF l0DE9
    ldy #$05		; 108B: A0 05
    lda (FMSZPG+2),y		; 108D: B1 45
    beq l1092		; 108F: F0 01
    rts    		; 1091: 60
l1092			; Callers: 108F
    clc    		; 1092: 18
    bcc l109C		; 1093: 90 07
l1095			; Callers: 10C2 0C4D 0D8E 0B6A
    ldy #$05		; 1095: A0 05
    lda #$00		; 1097: A9 00
    sta (FMSZPG+2),y		; 1099: 91 45
    sec    		; 109B: 38
l109C			; Callers: 1093
    php    		; 109C: 08
    lda z:FMSZPG+3		; 109D: A5 46
    sta DBUFHI		; 109F: 8D 05 03
    lda z:FMSZPG+2		; 10A2: A5 45
    sta DBUFLO		; 10A4: 8D 04 03
    ldy #$68		; 10A7: A0 68
    lda #$01		; 10A9: A9 01
l10AB			; Callers: 1088
    plp    		; 10AB: 28
    ldx $12FE		; 10AC: AE FE 12
    jsr l076C		; 10AF: 20 6C 07
    bmi l10B5		; 10B2: 30 01
    rts    		; 10B4: 60
l10B5			; Callers: 10B2
    cmp #$83		; 10B5: C9 83
    beq l10BC		; 10B7: F0 03
    jmp l12E5		; 10B9: 4C E5 12
l10BC			; Callers: 10B7
    jmp l12C9		; 10BC: 4C C9 12
l10BF			; Callers: l0C53 0934 08FC
    jsr l108B		; 10BF: 20 8B 10
    jmp l1095		; 10C2: 4C 95 10
l10C5			; Callers: l0C6C
    lda $1389,x		; 10C5: BD 89 13
    ora $138A,x		; 10C8: 1D 8A 13
    beq l1105		; 10CB: F0 38
    lda #$00		; 10CD: A9 00
    ldy #$03		; 10CF: A0 03
l10D1			; Callers: 10D9
    lsr $138A,x		; 10D1: 5E 8A 13
    ror $1389,x		; 10D4: 7E 89 13
    ror @		; 10D7: 6A
    dey    		; 10D8: 88
    bne l10D1		; 10D9: D0 F6
    ldy #$05		; 10DB: A0 05
l10DD			; Callers: 10DF
    ror @		; 10DD: 6A
    dey    		; 10DE: 88
    bne l10DD		; 10DF: D0 FC
    tay    		; 10E1: A8
    lda #$00		; 10E2: A9 00
    sec    		; 10E4: 38
l10E5			; Callers: 10E7
    ror @		; 10E5: 6A
    dey    		; 10E6: 88
    bpl l10E5		; 10E7: 10 FC
    pha    		; 10E9: 48
    lda $1389,x		; 10EA: BD 89 13
    adc #$0A		; 10ED: 69 0A
    tay    		; 10EF: A8
    pla    		; 10F0: 68
    ora (FMSZPG+2),y		; 10F1: 11 45
    sta (FMSZPG+2),y		; 10F3: 91 45
    ldy #$03		; 10F5: A0 03
    lda (FMSZPG+2),y		; 10F7: B1 45
    clc    		; 10F9: 18
    adc #$01		; 10FA: 69 01
    sta (FMSZPG+2),y		; 10FC: 91 45
    iny    		; 10FE: C8
    lda (FMSZPG+2),y		; 10FF: B1 45
    adc #$00		; 1101: 69 00
    sta (FMSZPG+2),y		; 1103: 91 45
l1105			; Callers: 10CB
    rts    		; 1105: 60
l1106			; Callers: l0FA8 0948 08FF
    ldy #$09		; 1106: A0 09
l1108			; Callers: 110F
    iny    		; 1108: C8
    cpy #$64		; 1109: C0 64
    bcs l1161		; 110B: B0 54
    lda (FMSZPG+2),y		; 110D: B1 45
    beq l1108		; 110F: F0 F7
    sty $130C		; 1111: 8C 0C 13
    pha    		; 1114: 48
    sec    		; 1115: 38
    ldy #$03		; 1116: A0 03
    lda (FMSZPG+2),y		; 1118: B1 45
    sbc #$01		; 111A: E9 01
    sta (FMSZPG+2),y		; 111C: 91 45
    iny    		; 111E: C8
    lda (FMSZPG+2),y		; 111F: B1 45
    sbc #$00		; 1121: E9 00
    sta (FMSZPG+2),y		; 1123: 91 45
    iny    		; 1125: C8
    lda #$FF		; 1126: A9 FF
    sta (FMSZPG+2),y		; 1128: 91 45
    pla    		; 112A: 68
    ldy #$FF		; 112B: A0 FF
l112D			; Callers: 112F
    iny    		; 112D: C8
    asl @		; 112E: 0A
    bcc l112D		; 112F: 90 FC
    sty $130D		; 1131: 8C 0D 13
l1134			; Callers: 1136
    lsr @		; 1134: 4A
    dey    		; 1135: 88
    bpl l1134		; 1136: 10 FC
    ldy $130C		; 1138: AC 0C 13
    sta (FMSZPG+2),y		; 113B: 91 45
    sec    		; 113D: 38
    lda $130C		; 113E: AD 0C 13
    sbc #$0A		; 1141: E9 0A
    ldy #$00		; 1143: A0 00
    sty $130C		; 1145: 8C 0C 13
l1148			; Callers: 114F
    asl @		; 1148: 0A
    rol $130C		; 1149: 2E 0C 13
    iny    		; 114C: C8
    cpy #$03		; 114D: C0 03
    bcc l1148		; 114F: 90 F7
    clc    		; 1151: 18
    adc $130D		; 1152: 6D 0D 13
    sta $138B,x		; 1155: 9D 8B 13
    lda $130C		; 1158: AD 0C 13
    adc #$00		; 115B: 69 00
    sta $138C,x		; 115D: 9D 8C 13
    rts    		; 1160: 60
l1161			; Callers: 110B
    jmp l12CB		; 1161: 4C CB 12
l1164			; Callers: uB01 09D4 uABF uBA7 u8AB uB15
    lda #$9F		; 1164: A9 9F
    sta z:FMSZPG+6		; 1166: 85 49
    stx $1301		; 1168: 8E 01 13
    tsx    		; 116B: BA
    inx    		; 116C: E8
    inx    		; 116D: E8
    stx $1300		; 116E: 8E 00 13
    ldx $1301		; 1171: AE 01 13
    ldy z:ICDNOZ		; 1174: A4 21
    sty DUNIT		; 1176: 8C 01 03
    dey    		; 1179: 88
    lda $1329,y		; 117A: B9 29 13
    sta z:FMSZPG+2		; 117D: 85 45
    lda $1331,y		; 117F: B9 31 13
    sta z:FMSZPG+3		; 1182: 85 46
    lda $1311,y		; 1184: B9 11 13
    beq l11DB		; 1187: F0 52
    sta $12FE		; 1189: 8D FE 12
    tay    		; 118C: A8
    lda $12F8,y		; 118D: B9 F8 12
    sta $12F8		; 1190: 8D F8 12
    lda $12FB,y		; 1193: B9 FB 12
    sta $12FB		; 1196: 8D FB 12
    ldy $1388,x		; 1199: BC 88 13
    dey    		; 119C: 88
    bpl l11D0		; 119D: 10 31
    ldy #$00		; 119F: A0 00
l11A1			; Callers: 11A9
    lda $1319,y		; 11A1: B9 19 13
    beq l11AE		; 11A4: F0 08
l11A6			; Callers: 11BC
    iny    		; 11A6: C8
    cpy #$10		; 11A7: C0 10
    bcc l11A1		; 11A9: 90 F6
l11AB			; Callers: 11B7
    jmp l12CD		; 11AB: 4C CD 12
l11AE			; Callers: 11A4
    lda $12FE		; 11AE: AD FE 12
    lsr @		; 11B1: 4A
    bcs l11C4		; 11B2: B0 10
    iny    		; 11B4: C8
    cpy #$10		; 11B5: C0 10
    bcs l11AB		; 11B7: B0 F2
    lda $1319,y		; 11B9: B9 19 13
    bne l11A6		; 11BC: D0 E8
    dey    		; 11BE: 88
    lda #$80		; 11BF: A9 80
    sta $131A,y		; 11C1: 99 1A 13
l11C4			; Callers: 11B2
    lda #$80		; 11C4: A9 80
    sta $1319,y		; 11C6: 99 19 13
    tya    		; 11C9: 98
    sta $1388,x		; 11CA: 9D 88 13
    inc $1388,x		; 11CD: FE 88 13
l11D0			; Callers: 119D 0AA9
    lda $1339,y		; 11D0: B9 39 13
    sta z:FMSZPG+4		; 11D3: 85 47
    lda $1349,y		; 11D5: B9 49 13
    sta z:FMSZPG+5		; 11D8: 85 48
    rts    		; 11DA: 60
l11DB			; Callers: 1187
    jmp l12CF		; 11DB: 4C CF 12
l11DE			; Callers: 12ED
    ldy $1388,x		; 11DE: BC 88 13
    beq l11F6		; 11E1: F0 13
    dey    		; 11E3: 88
    lda #$00		; 11E4: A9 00
    sta $1388,x		; 11E6: 9D 88 13
    sta $1319,y		; 11E9: 99 19 13
    lda $12FE		; 11EC: AD FE 12
    lsr @		; 11EF: 4A
    bcs l11F6		; 11F0: B0 04
    lsr @		; 11F2: 4A
    sta $131A,y		; 11F3: 99 1A 13
l11F6			; Callers: 11E1 11F0
    rts    		; 11F6: 60
l11F7			; Callers: 0FFF
    pha    		; 11F7: 48
    lda z:FMSZPG+4		; 11F8: A5 47
    sta DBUFLO		; 11FA: 8D 04 03
    lda z:FMSZPG+5		; 11FD: A5 48
    sta DBUFHI		; 11FF: 8D 05 03
    pla    		; 1202: 68
    ldx $12FE		; 1203: AE FE 12
    jsr l076C		; 1206: 20 6C 07
    rts    		; 1209: 60
l120A			; Callers: 098C
    ldy $1389,x		; 120A: BC 89 13
    lda $138A,x		; 120D: BD 8A 13
    jsr l1253		; 1210: 20 53 12
    jsr l1267		; 1213: 20 67 12
    jmp l12F0		; 1216: 4C F0 12
l1219			; Callers: 0C42 0BEF 0DA7
    lda #$00		; 1219: A9 00
l121B			; Callers: 1265
    sta $070E		; 121B: 8D 0E 07
    lda #$07		; 121E: A9 07
    sta DBUFHI		; 1220: 8D 05 03
    lda #$00		; 1223: A9 00
    sta DBUFLO		; 1225: 8D 04 03
    lda #$00		; 1228: A9 00
    sta DAUX1		; 122A: 8D 0A 03
    sta DAUX2		; 122D: 8D 0B 03
l1230			; Callers: 1250
    inc DAUX1		; 1230: EE 0A 03
    ldx #$01		; 1233: A2 01
    sec    		; 1235: 38
    jsr l0772		; 1236: 20 72 07
    clc    		; 1239: 18
    lda DBUFLO		; 123A: AD 04 03
    adc #$80		; 123D: 69 80
    sta DBUFLO		; 123F: 8D 04 03
    lda DBUFHI		; 1242: AD 05 03
    adc #$00		; 1245: 69 00
    sta DBUFHI		; 1247: 8D 05 03
    lda DAUX1		; 124A: AD 0A 03
    cmp $0701		; 124D: CD 01 07
    bne l1230		; 1250: D0 DE
    rts    		; 1252: 60
l1253			; Callers: 0C09 1210
    sty $070F		; 1253: 8C 0F 07
    sta $0710		; 1256: 8D 10 07
    lda $12FE		; 1259: AD FE 12
    sta $070E		; 125C: 8D 0E 07
    ldy $12F8		; 125F: AC F8 12
    sty $0711		; 1262: 8C 11 07
    bne l121B		; 1265: D0 B4
l1267			; Callers: 1213
    lda $0712		; 1267: AD 12 07
    sta z:FMSZPG		; 126A: 85 43
    lda $0713		; 126C: AD 13 07
    sta z:FMSZPG+1		; 126F: 85 44
l1271			; Callers: 1297
    ldy #$00		; 1271: A0 00
l1273			; Callers: 127B
    lda (FMSZPG),y		; 1273: B1 43
    sta (FMSZPG+4),y		; 1275: 91 47
    iny    		; 1277: C8
    cpy $12F8		; 1278: CC F8 12
    bcc l1273		; 127B: 90 F6
    tya    		; 127D: 98
    sta $1387,x		; 127E: 9D 87 13
    jsr l0757		; 1281: 20 57 07
    cmp $070D		; 1284: CD 0D 07
    bcc l1294		; 1287: 90 0B
    bne l129A		; 1289: D0 0F
    lda z:FMSZPG		; 128B: A5 43
    cmp $070C		; 128D: CD 0C 07
    bcc l1294		; 1290: 90 02
    bne l129A		; 1292: D0 06
l1294			; Callers: 1287 1290
    jsr l0F94		; 1294: 20 94 0F
    jmp l1271		; 1297: 4C 71 12
l129A			; Callers: 1289 1292
    rts    		; 129A: 60
l129B			; Callers: 0C3D 0BEA 0BF8 0987
    ldy #$0B		; 129B: A0 0B
l129D			; Callers: 12A6
    lda $1358,y		; 129D: B9 58 13
    cmp $12A8,y		; 12A0: D9 A8 12
    bne l12A8		; 12A3: D0 03
    dey    		; 12A5: 88
    bne l129D		; 12A6: D0 F5
l12A8			; Callers: 12A3
    rts    		; 12A8: 60 Access: 12A0
    dta $44		; 12A9: 44
    dta $4F		; 12AA: 4F
    dta $53		; 12AB: 53
    dta $20		; 12AC: 20
    dta $20		; 12AD: 20
    dta $20		; 12AE: 20
    dta $20		; 12AF: 20
    dta $20		; 12B0: 20
    dta $53		; 12B1: 53
    dta $59		; 12B2: 59
    dta $53		; 12B3: 53
    dta $20		; 12B4: 20
l12B5			; Callers: l0D4C
    inc z:FMSZPG+6		; 12B5: E6 49
l12B7			; Callers: l090E
    inc z:FMSZPG+6		; 12B7: E6 49
l12B9			; Callers: l0D00
    inc z:FMSZPG+6		; 12B9: E6 49
l12BB			; Callers: l0C79 0C90 l0B12 0BE4 l08E9
    inc z:FMSZPG+6		; 12BB: E6 49
l12BD			; Callers: l0992
    inc z:FMSZPG+6		; 12BD: E6 49
l12BF			; Callers: l0A19 l0BD3 08D5
    inc z:FMSZPG+6		; 12BF: E6 49
l12C1			; Callers: l0CB7
    inc z:FMSZPG+6		; 12C1: E6 49
l12C3			; Callers: l0CF7
    inc z:FMSZPG+6		; 12C3: E6 49
l12C5			; Callers: l0F07
    inc z:FMSZPG+6		; 12C5: E6 49
l12C7			; Callers: 1069
    inc z:FMSZPG+6		; 12C7: E6 49
l12C9			; Callers: l10BC
    inc z:FMSZPG+6		; 12C9: E6 49
l12CB			; Callers: l1161
    inc z:FMSZPG+6		; 12CB: E6 49
l12CD			; Callers: l11AB
    inc z:FMSZPG+6		; 12CD: E6 49
l12CF			; Callers: l11DB
    inc z:FMSZPG+6		; 12CF: E6 49
    lda z:FMSZPG+6		; 12D1: A5 49
l12D3			; Callers: 12E8 12F2 12F6 0FD7 0AFB l0D4F
    ldx $1301		; 12D3: AE 01 13
    sta ICSTA,x		; 12D6: 9D 43 03
    ldx $1300		; 12D9: AE 00 13
    txs    		; 12DC: 9A
    ldx $1301		; 12DD: AE 01 13
    tay    		; 12E0: A8
    lda $1308		; 12E1: AD 08 13
    rts    		; 12E4: 60
l12E5			; Callers: 10B9 l105F
    lda DSTATS		; 12E5: AD 03 03
    bmi l12D3		; 12E8: 30 E9
l12EA			; Callers: 0C50 0CA9 0C2F 0E0E 0DAA 0B72
    ldx $1301		; 12EA: AE 01 13
    jsr l11DE		; 12ED: 20 DE 11
l12F0			; Callers: 0CFD 0B0F 0A16 0D15 l0AFE l0DD6 0DE6 08E6 l098F 1216
    lda #$01		; 12F0: A9 01
    bne l12D3		; 12F2: D0 DF
l12F4			; Callers: l0A1C 0ADC l0E11
    lda #$88		; 12F4: A9 88
    bmi l12D3		; 12F6: 30 DB
    adc $FD7D,x		; 12F8: 7D 7D FD Access: 102A 0FB9 0FF0 118D 1190 0A4C 0A67 125F 1278
    dta $7F		; 12FB: 7F Access: 0FAE 1193 1196
    dta $7F		; 12FC: 7F
    dta $FF		; 12FD: FF
    dta $1		; 12FE: 01 Access: 10AC 11EC 1203 1189 11AE 0AAE 1259 0D2C
    dta $3		; 12FF: 03 Access: 078E 07A7
    dta $F7		; 1300: F7 Access: 12D9 116E 09D7
    dta $10		; 1301: 10 Access: 12D3 12DD 0F03 0F90 07C4 12EA 1168 1171 0C21 0945 0976
    dta $FF		; 1302: FF Access: 0F23 0F73 0F7B 091D
    dta $50		; 1303: 50 Access: 0F81 0928
    dta $15		; 1304: 15 Access: 0F87 092E
    dta $0		; 1305: 00 Access: 0F2E 0F35 0F4D 0F7E 0C56 0CAC 09B1 0C93 0C0E 0BFD 0E27 0E4E 092B 0937 094B 0917 08EF 0B95 0B50
    dta $0		; 1306: 00 Access: 0F26 0F78 0F3C 0F41 107E 0D9C 0DA2 0922 0B8B
    dta $0		; 1307: 00 Access: 0F29 0F31 0F84 099A 0931 0B85
    dta $20		; 1308: 20 Access: 12E1 09CC 0A09 0A03 0AE2 0DC3
    dta $20		; 1309: 20 Access: 0A55 0A6A
    dta $48		; 130A: 48 Access: 0A5B 0A70
    dta $45		; 130B: 45 Access: 0A61 0A76
    dta $0		; 130C: 00 Access: 0EC0 0F15 0ED9 0EE0 1111 1138 113E 1145 1149 1158 07ED 07F5 0E79 0E7E 0E9A
    dta $0		; 130D: 00 Access: 1131 1152 07F2 0824 0BDC 0BF2 0E76 0E85 0E97
    dta $A		; 130E: 0A Access: 0E71 0E81
    dta $80		; 130F: 80 Access: 0FCC 0FD4 0C7E 0C9B 0C85 0DB9 0DBE 0DC6 0DDB 0E8F 0E94 0E6D 0E0B 0E4B 0DD3 0DAF
    dta $0		; 1310: 00 Access: 0A28 0A3E
    dta $1		; 1311: 01 Access: 0827 07FC 1184
    dta $1		; 1312: 01
    dta $1		; 1313: 01
    dta $1		; 1314: 01
    dta $0		; 1315: 00
    dta $0		; 1316: 00
    dta $0		; 1317: 00
    dta $0		; 1318: 00
    dta $0		; 1319: 00 Access: 11E9 084B 11A1 11C6 11B9
    dta $0		; 131A: 00 Access: 11F3 11C1
    dta $0		; 131B: 00
    dta $FF		; 131C: FF
    dta $FE		; 131D: FE
    dta $FD		; 131E: FD
    dta $FC		; 131F: FC
    dta $FB		; 1320: FB
    dta $FA		; 1321: FA
    dta $F9		; 1322: F9
    dta $F8		; 1323: F8
    dta $F7		; 1324: F7
    dta $F6		; 1325: F6
    dta $F5		; 1326: F5
    dta $F4		; 1327: F4
    dta $F3		; 1328: F3
    dta $FC		; 1329: FC Access: 082C 07FF 117A
    dta $7C		; 132A: 7C
    dta $FC		; 132B: FC
    dta $7C		; 132C: 7C
    dta $0		; 132D: 00
    dta $0		; 132E: 00
    dta $0		; 132F: 00
    dta $0		; 1330: 00
    dta $1B		; 1331: 1B Access: 0831 0802 117F
    dta $1B		; 1332: 1B
    dta $1A		; 1333: 1A
    dta $1A		; 1334: 1A
    dta $0		; 1335: 00
    dta $0		; 1336: 00
    dta $0		; 1337: 00
    dta $0		; 1338: 00
    dta $7C		; 1339: 7C Access: 0853 11D0
    dta $FC		; 133A: FC
    dta $7C		; 133B: 7C
    dta $CA		; 133C: CA
    dta $0		; 133D: 00
    dta $0		; 133E: 00
    dta $44		; 133F: 44
    dta $44		; 1340: 44
    dta $4F		; 1341: 4F
    dta $53		; 1342: 53
    dta $20		; 1343: 20
    dta $20		; 1344: 20
    dta $20		; 1345: 20
    dta $1C		; 1346: 1C
    dta $1C		; 1347: 1C
    dta $1D		; 1348: 1D
    dta $1C		; 1349: 1C Access: 0858 11D5
    dta $1C		; 134A: 1C
    dta $1D		; 134B: 1D
    dta $1B		; 134C: 1B
    dta $0		; 134D: 00
    dta $0		; 134E: 00
    dta $0		; 134F: 00
    dta $0		; 1350: 00
    dta $0		; 1351: 00
    dta $0		; 1352: 00
    dta $0		; 1353: 00
    dta $0		; 1354: 00
    dta $0		; 1355: 00
    dta $44		; 1356: 44
    dta $4F		; 1357: 4F
    dta $53		; 1358: 53 Access: 129D
    dta $44		; 1359: 44 Access: 0EB8 0F1B 0F5E 0C11 0966
    dta $4F		; 135A: 4F
    dta $53		; 135B: 53
    dta $20		; 135C: 20
    dta $20		; 135D: 20
    dta $20		; 135E: 20
    dta $20		; 135F: 20
    dta $20		; 1360: 20
    dta $53		; 1361: 53
    dta $59		; 1362: 59
    dta $53		; 1363: 53
    dta $20		; 1364: 20
    dta $20		; 1365: 20
    dta $0		; 1366: 00
    dta $0		; 1367: 00
    dta $0		; 1368: 00
    dta $0		; 1369: 00
    dta $0		; 136A: 00
    dta $0		; 136B: 00
    dta $0		; 136C: 00
    dta $0		; 136D: 00
    dta $0		; 136E: 00
    dta $0		; 136F: 00
    dta $0		; 1370: 00
    dta $0		; 1371: 00
    dta $0		; 1372: 00
    dta $0		; 1373: 00
    dta $0		; 1374: 00
    dta $0		; 1375: 00
    dta $0		; 1376: 00
    dta $0		; 1377: 00
    dta $0		; 1378: 00
    dta $8		; 1379: 08
    dta $0		; 137A: 00
    dta $0		; 137B: 00
    dta $80		; 137C: 80
    dta $7D		; 137D: 7D
    dta $0		; 137E: 00
    dta $0		; 137F: 00
    dta $0		; 1380: 00
    dta $0		; 1381: 00 Access: 099F 1031 0FB6 0882 0B80 0B9F
    dta $0		; 1382: 00 Access: 0FD1 09E5 0AC2 08B4 08C2 0B18 0B6F 0B32
    dta $0		; 1383: 00
    dta $0		; 1384: 00 Access: 09B9 1047
    dta $0		; 1385: 00 Access: 0997 100F 0F94 0F9D 0CBA 0CCF 0CD9 0A10 0A13 0A1F 0984 0B1F 0B75
    dta $0		; 1386: 00 Access: 1055 0FF3 0CF0 09F0 0A7E 0A8C 0ACF 0AF4
    dta $0		; 1387: 00 Access: 09A4 105A 0FAB 0FED 0CFA 09EC 0A06 0A4F 0D03 127E 0ACC 0AE7
    dta $0		; 1388: 00 Access: 11DE 11E6 1199 11CA 11CD 0AA5
    dta $0		; 1389: 00 Access: 1005 0FFC 10C5 10D4 10EA 0CCA 0D09 120A
    dta $0		; 138A: 00 Access: 100B 0FF9 10C8 10D1 0CC2 0D0F 120D
    dta $0		; 138B: 00 Access: 09BF 1017 1002 1040 1155 0FBF 0FE7 0CE5 0AEA 0951 0905 0B44
    dta $0		; 138C: 00 Access: 09C5 101A 1008 103A 115D 0FB3 0FEA 0CDF 0AEF 0B4A
    dta $0		; 138D: 00 Access: 0908 0B41
    dta $0		; 138E: 00 Access: 0902 0B47
    dta $0		; 138F: 00 Access: 09A7 0FDA 0B2E
    dta $0		; 1390: 00 Access: 09AA 0FDF 0B2A
    dta $0		; 1391: 00
    dta $0		; 1392: 00
    dta $0		; 1393: 00
    dta $0		; 1394: 00
    dta $0		; 1395: 00
    dta $0		; 1396: 00
    dta $0		; 1397: 00
    dta $0		; 1398: 00
    dta $0		; 1399: 00
    dta $0		; 139A: 00
    dta $0		; 139B: 00
    dta $0		; 139C: 00
    dta $0		; 139D: 00
    dta $0		; 139E: 00
    dta $0		; 139F: 00
    dta $0		; 13A0: 00
    dta $0		; 13A1: 00
    dta $0		; 13A2: 00
    dta $0		; 13A3: 00
    dta $0		; 13A4: 00
    dta $0		; 13A5: 00
    dta $0		; 13A6: 00
    dta $0		; 13A7: 00
    dta $0		; 13A8: 00
    dta $0		; 13A9: 00
    dta $0		; 13AA: 00
    dta $0		; 13AB: 00
    dta $0		; 13AC: 00
    dta $0		; 13AD: 00
    dta $0		; 13AE: 00
    dta $0		; 13AF: 00
    dta $0		; 13B0: 00
    dta $0		; 13B1: 00
    dta $0		; 13B2: 00
    dta $0		; 13B3: 00
    dta $0		; 13B4: 00
    dta $0		; 13B5: 00
    dta $0		; 13B6: 00
    dta $0		; 13B7: 00
    dta $0		; 13B8: 00
    dta $0		; 13B9: 00
    dta $0		; 13BA: 00
    dta $0		; 13BB: 00
    dta $0		; 13BC: 00
    dta $0		; 13BD: 00
    dta $0		; 13BE: 00
    dta $0		; 13BF: 00
    dta $0		; 13C0: 00
    dta $0		; 13C1: 00
    dta $0		; 13C2: 00
    dta $0		; 13C3: 00
    dta $0		; 13C4: 00
    dta $0		; 13C5: 00
    dta $0		; 13C6: 00
    dta $0		; 13C7: 00
    dta $0		; 13C8: 00
    dta $0		; 13C9: 00
    dta $0		; 13CA: 00
    dta $0		; 13CB: 00
    dta $0		; 13CC: 00
    dta $0		; 13CD: 00
    dta $0		; 13CE: 00
    dta $0		; 13CF: 00
    dta $0		; 13D0: 00
    dta $0		; 13D1: 00
    dta $0		; 13D2: 00
    dta $0		; 13D3: 00
    dta $0		; 13D4: 00
    dta $0		; 13D5: 00
    dta $0		; 13D6: 00
    dta $0		; 13D7: 00
    dta $0		; 13D8: 00
    dta $0		; 13D9: 00
    dta $0		; 13DA: 00
    dta $0		; 13DB: 00
    dta $0		; 13DC: 00
    dta $0		; 13DD: 00
    dta $0		; 13DE: 00
    dta $0		; 13DF: 00
    dta $0		; 13E0: 00
    dta $0		; 13E1: 00
    dta $0		; 13E2: 00
    dta $0		; 13E3: 00
    dta $0		; 13E4: 00
    dta $0		; 13E5: 00
    dta $0		; 13E6: 00
    dta $0		; 13E7: 00
    dta $0		; 13E8: 00
    dta $0		; 13E9: 00
    dta $0		; 13EA: 00
    dta $0		; 13EB: 00
    dta $0		; 13EC: 00
    dta $0		; 13ED: 00
    dta $0		; 13EE: 00
    dta $0		; 13EF: 00
    dta $0		; 13F0: 00
    dta $0		; 13F1: 00
    dta $0		; 13F2: 00
    dta $0		; 13F3: 00
    dta $0		; 13F4: 00
    dta $0		; 13F5: 00
    dta $0		; 13F6: 00
    dta $0		; 13F7: 00
    dta $0		; 13F8: 00
    dta $0		; 13F9: 00
    dta $0		; 13FA: 00
    dta $0		; 13FB: 00
    dta $0		; 13FC: 00
    dta $0		; 13FD: 00
    dta $0		; 13FE: 00
    dta $0		; 13FF: 00
    dta $0		; 1400: 00
    dta $43		; 1401: 43 Access: 0F51 0F8A 0CAF 0C5E 09B4 0C96 0C9E 0E2A 0D94 0959 08F2 0B64
    dta $0		; 1402: 00 Access: 0E51 0961 0B55 0B58
    dta $0		; 1403: 00 Access: 0E54 095E 0B5C 0B5F
    dta $4		; 1404: 04 Access: 09BC 0C04 0954
    dta $0		; 1405: 00 Access: 09C2 0C00 094E
    dta $44		; 1406: 44 Access: 0F65 0C18 0E3B 093E 096D
    dta $4F		; 1407: 4F
    dta $53		; 1408: 53
    dta $20		; 1409: 20
    dta $20		; 140A: 20
    dta $20		; 140B: 20
    dta $20		; 140C: 20
    dta $20		; 140D: 20
    dta $53		; 140E: 53
    dta $59		; 140F: 59
    dta $53		; 1410: 53
    dta $42		; 1411: 42
    dta $0		; 1412: 00
    dta $0		; 1413: 00
    dta $0		; 1414: 00
    dta $0		; 1415: 00
    dta $1		; 1416: 01
    dta $12		; 1417: 12
    dta $12		; 1418: 12
    dta $12		; 1419: 12
    dta $12		; 141A: 12
    dta $43		; 141B: 43
    dta $12		; 141C: 12
    dta $12		; 141D: 12
    dta $12		; 141E: 12
    dta $12		; 141F: 12
    dta $4		; 1420: 04
    dta $42		; 1421: 42
    dta $0		; 1422: 00
    dta $0		; 1423: 00
    dta $0		; 1424: 00
    dta $0		; 1425: 00
    dta $1		; 1426: 01
    dta $12		; 1427: 12
    dta $12		; 1428: 12
    dta $12		; 1429: 12
    dta $12		; 142A: 12
    dta $61		; 142B: 61
    dta $12		; 142C: 12
    dta $12		; 142D: 12
    dta $12		; 142E: 12
    dta $12		; 142F: 12
    dta $4		; 1430: 04
    dta $42		; 1431: 42
    dta $0		; 1432: 00
    dta $0		; 1433: 00
    dta $0		; 1434: 00
    dta $0		; 1435: 00
    dta $1		; 1436: 01
    dta $12		; 1437: 12
    dta $42		; 1438: 42
    dta $12		; 1439: 12
    dta $12		; 143A: 12
    dta $73		; 143B: 73
    dta $12		; 143C: 12
    dta $12		; 143D: 12
    dta $4D		; 143E: 4D
    dta $12		; 143F: 12
    dta $4		; 1440: 04
    dta $42		; 1441: 42
    dta $0		; 1442: 00
    dta $0		; 1443: 00
    dta $0		; 1444: 00
    dta $0		; 1445: 00
    dta $1		; 1446: 01
    dta $12		; 1447: 12
    dta $6F		; 1448: 6F
    dta $12		; 1449: 12
    dta $12		; 144A: 12
    dta $73		; 144B: 73
    dta $12		; 144C: 12
    dta $12		; 144D: 12
    dta $61		; 144E: 61
    dta $12		; 144F: 12
    dta $4		; 1450: 04
    dta $42		; 1451: 42
    dta $0		; 1452: 00
    dta $0		; 1453: 00
    dta $0		; 1454: 00
    dta $0		; 1455: 00
    dta $1		; 1456: 01
    dta $12		; 1457: 12
    dta $6F		; 1458: 6F
    dta $12		; 1459: 12
    dta $12		; 145A: 12
    dta $65		; 145B: 65
    dta $12		; 145C: 12
    dta $12		; 145D: 12
    dta $6B		; 145E: 6B
    dta $12		; 145F: 12
    dta $4		; 1460: 04
    dta $42		; 1461: 42
    dta $0		; 1462: 00
    dta $0		; 1463: 00
    dta $0		; 1464: 00
    dta $0		; 1465: 00
    dta $1		; 1466: 01
    dta $12		; 1467: 12
    dta $74		; 1468: 74
    dta $12		; 1469: 12
    dta $12		; 146A: 12
    dta $74		; 146B: 74
    dta $12		; 146C: 12
    dta $12		; 146D: 12
    dta $65		; 146E: 65
    dta $12		; 146F: 12
    dta $4		; 1470: 04
    dta $42		; 1471: 42
    dta $0		; 1472: 00
    dta $0		; 1473: 00
    dta $0		; 1474: 00
    dta $0		; 1475: 00
    dta $1		; 1476: 01
    dta $12		; 1477: 12
    dta $12		; 1478: 12
    dta $12		; 1479: 12
    dta $12		; 147A: 12
    dta $74		; 147B: 74
    dta $12		; 147C: 12
    dta $12		; 147D: 12
    dta $72		; 147E: 72
    dta $12		; 147F: 12
    dta $4		; 1480: 04
    dta $0		; 1481: 00
    dta $0		; 1482: 00
    dta $0		; 1483: 00
    dta $0		; 1484: 00
    dta $0		; 1485: 00
    dta $0		; 1486: 00
    dta $0		; 1487: 00
    dta $0		; 1488: 00
    dta $0		; 1489: 00
    dta $0		; 148A: 00
    dta $0		; 148B: 00
    dta $0		; 148C: 00
    dta $0		; 148D: 00
    dta $0		; 148E: 00
    dta $0		; 148F: 00
    dta $0		; 1490: 00
    dta $0		; 1491: 00
    dta $0		; 1492: 00
    dta $0		; 1493: 00
    dta $0		; 1494: 00
    dta $0		; 1495: 00
    dta $0		; 1496: 00
    dta $0		; 1497: 00
    dta $0		; 1498: 00
    dta $0		; 1499: 00
    dta $0		; 149A: 00
    dta $0		; 149B: 00
    dta $0		; 149C: 00
    dta $0		; 149D: 00
    dta $0		; 149E: 00
    dta $0		; 149F: 00
    dta $0		; 14A0: 00
    dta $0		; 14A1: 00
    dta $0		; 14A2: 00
    dta $0		; 14A3: 00
    dta $0		; 14A4: 00
    dta $0		; 14A5: 00
    dta $0		; 14A6: 00
    dta $0		; 14A7: 00
    dta $0		; 14A8: 00
    dta $0		; 14A9: 00
    dta $0		; 14AA: 00
    dta $0		; 14AB: 00
    dta $0		; 14AC: 00
    dta $0		; 14AD: 00
    dta $0		; 14AE: 00
    dta $0		; 14AF: 00
    dta $0		; 14B0: 00
    dta $0		; 14B1: 00
    dta $0		; 14B2: 00
    dta $0		; 14B3: 00
    dta $0		; 14B4: 00
    dta $0		; 14B5: 00
    dta $0		; 14B6: 00
    dta $0		; 14B7: 00
    dta $0		; 14B8: 00
    dta $0		; 14B9: 00
    dta $0		; 14BA: 00
    dta $0		; 14BB: 00
    dta $0		; 14BC: 00
    dta $0		; 14BD: 00
    dta $0		; 14BE: 00
    dta $0		; 14BF: 00
    dta $0		; 14C0: 00
    dta $0		; 14C1: 00
    dta $0		; 14C2: 00
    dta $0		; 14C3: 00
    dta $0		; 14C4: 00
    dta $0		; 14C5: 00
    dta $0		; 14C6: 00
    dta $0		; 14C7: 00
    dta $0		; 14C8: 00
    dta $0		; 14C9: 00
    dta $0		; 14CA: 00
    dta $0		; 14CB: 00
    dta $0		; 14CC: 00
    dta $0		; 14CD: 00
    dta $0		; 14CE: 00
    dta $0		; 14CF: 00
    dta $0		; 14D0: 00
    dta $0		; 14D1: 00
    dta $0		; 14D2: 00
u14D3			; Callers: -c 14D3
    jsr l168D		; 14D3: 20 8D 16
    bmi l14ED		; 14D6: 30 15
    ldy #$00		; 14D8: A0 00
    rts    		; 14DA: 60
l14DB			; Callers: 14F8
    lda #$03		; 14DB: A9 03
    sta ICCOM,x		; 14DD: 9D 42 03
    lda #$9B		; 14E0: A9 9B
    sta ICBAL,x		; 14E2: 9D 44 03
    lda #$14		; 14E5: A9 14
    sta ICBAH,x		; 14E7: 9D 45 03
    jmp CIOV		; 14EA: 4C 56 E4
l14ED			; Callers: 14D6
    sty $14FC		; 14ED: 8C FC 14
    jsr l168D		; 14F0: 20 8D 16
    lda #$21		; 14F3: A9 21
    sta ICCOM,x		; 14F5: 9D 42 03
    jsr l14DB		; 14F8: 20 DB 14
    ldy #$00		; 14FB: A0 00
    rts    		; 14FD: 60
    dta $4C		; 14FE: 4C
    dta $56		; 14FF: 56
u1500			; Callers: -c 1500
    lda #$00		; 1500: A9 00
    sta $1555		; 1502: 8D 55 15
    lda #$51		; 1505: A9 51
    sta z:DOSVEC		; 1507: 85 0A
    lda #$17		; 1509: A9 17
    sta z:DOSVEC+1		; 150B: 85 0B
    lda #$9A		; 150D: A9 9A
    sta VSERIN		; 150F: 8D 0A 02
    lda #$19		; 1512: A9 19
    sta VSERIN+1		; 1514: 8D 0B 02
    lda #$5D		; 1517: A9 5D
    sta VSEROR		; 1519: 8D 0C 02
    lda #$19		; 151C: A9 19
    sta VSEROR+1		; 151E: 8D 0D 02
    jsr l07E0		; 1521: 20 E0 07
    lda z:WARMST		; 1524: A5 08
    bne l153D		; 1526: D0 15
    lda #$C0		; 1528: A9 C0
    sta $0354		; 152A: 8D 54 03
    lda #$16		; 152D: A9 16
    sta $0355		; 152F: 8D 55 03
    jsr l154A		; 1532: 20 4A 15
    lda #$C0		; 1535: A9 C0
    jsr l155D		; 1537: 20 5D 15
    jmp l1921		; 153A: 4C 21 19
l153D			; Callers: 1526
    lda $1554		; 153D: AD 54 15
    lda #$00		; 1540: A9 00
    sta $159E		; 1542: 8D 9E 15
    lda #$9F		; 1545: A9 9F
    sta z:DOSVEC		; 1547: 85 0A
l154A equ *+1			; Callers: 1532
    lda #$17		; 1549: A9 17
    sta z:DOSVEC+1		; 154B: 85 0B
    lda #$23		; 154D: A9 23
    sta VSERIN		; 154F: 8D 0A 02
    lda #$1A		; 1552: A9 1A
    sta VSERIN+1		; 1554: 8D 0B 02 Access: 153D
    lda #$E6		; 1557: A9 E6
    sta VSEROR		; 1559: 8D 0C 02
l155D equ *+1			; Callers: 1537
    lda #$19		; 155C: A9 19
    sta VSEROR+1		; 155E: 8D 0D 02
    jsr l07E0		; 1561: 20 E0 07
    lda z:WARMST		; 1564: A5 08
    bne l157D		; 1566: D0 15
    lda #$0C		; 1568: A9 0C
    sta $0354		; 156A: 8D 54 03
    lda #$17		; 156D: A9 17
    sta $0355		; 156F: 8D 55 03
    jsr l1593		; 1572: 20 93 15
    lda #$C0		; 1575: A9 C0
    jsr l15A6		; 1577: 20 A6 15
    jmp l19AA		; 157A: 4C AA 19
l157D			; Callers: 1566
    lda $159D		; 157D: AD 9D 15
    beq l1593		; 1580: F0 11
    lda $179E		; 1582: AD 9E 17
    beq l1599		; 1585: F0 12
    jsr l193F		; 1587: 20 3F 19
    jsr l192E		; 158A: 20 2E 19
    jsr l1593		; 158D: 20 93 15
    jsr WARMSV		; 1590: 20 74 E4
l1593			; Callers: 1580 159B 158D 1572
    lda #$00		; 1593: A9 00
    sta $159D		; 1595: 8D 9D 15
    rts    		; 1598: 60
l1599			; Callers: 1585
    sta z:WARMST		; 1599: 85 08
    beq l1593		; 159B: F0 F6
    dta $0		; 159D: 00 Access: 19D3 157D 1595 1917
    dta $0		; 159E: 00 Access: 1542
    dta $C0		; 159F: C0 Access: 15A6
    dta $0		; 15A0: 00
    dta $6		; 15A1: 06
    dta $3B		; 15A2: 3B
    dta $6		; 15A3: 06
    dta $A9		; 15A4: A9
    dta $80		; 15A5: 80
l15A6			; Callers: 1577
    sta $159F		; 15A6: 8D 9F 15
    lda #$CE		; 15A9: A9 CE
    sta $CB		; 15AB: 85 CB
    lda #$15		; 15AD: A9 15
    sta $CC		; 15AF: 85 CC
l15B1			; Callers: 15C5 15CB
    ldy #$00		; 15B1: A0 00
    lda ($CB),y		; 15B3: B1 CB
    eor #$FF		; 15B5: 49 FF
    sta ($CB),y		; 15B7: 91 CB
    inc $CB		; 15B9: E6 CB
    lda $CB		; 15BB: A5 CB
    bne l15C1		; 15BD: D0 02
    inc $CC		; 15BF: E6 CC
l15C1			; Callers: 15BD
    lda $CC		; 15C1: A5 CC
    cmp #$18		; 15C3: C9 18
    bne l15B1		; 15C5: D0 EA
    lda $CB		; 15C7: A5 CB
    cmp #$2E		; 15C9: C9 2E
    bne l15B1		; 15CB: D0 E4
    nop    		; 15CD: EA
    lda #$70		; 15CE: A9 70
    sta a:POKMSK		; 15D0: 8D 10 00
    sta IRQEN		; 15D3: 8D 0E D2
    jsr l17A5		; 15D6: 20 A5 17
    lda #$01		; 15D9: A9 01
    sta DUNIT		; 15DB: 8D 01 03
    lda #$52		; 15DE: A9 52
    sta DCOMND		; 15E0: 8D 02 03
    lda #$D4		; 15E3: A9 D4
    sta DAUX1		; 15E5: 8D 0A 03
    lda #$01		; 15E8: A9 01
    sta DAUX2		; 15EA: 8D 0B 03
    lda #$00		; 15ED: A9 00
    sta DBUFLO		; 15EF: 8D 04 03
    lda #$06		; 15F2: A9 06
    sta DBUFHI		; 15F4: 8D 05 03
l15F7			; Callers: 15FA
    jsr DSKINV		; 15F7: 20 53 E4
    bmi l15F7		; 15FA: 30 FB
    jsr l17AB		; 15FC: 20 AB 17
    ldx #$00		; 15FF: A2 00
    stx $D0		; 1601: 86 D0
    stx $D1		; 1603: 86 D1
l1605			; Callers: 1614
    clc    		; 1605: 18
    lda $0600,x		; 1606: BD 00 06
    adc $D0		; 1609: 65 D0
    sta $D0		; 160B: 85 D0
    bcc l1611		; 160D: 90 02
    inc $D1		; 160F: E6 D1
l1611			; Callers: 160D
    inx    		; 1611: E8
    cpx #$80		; 1612: E0 80
    bne l1605		; 1614: D0 EF
    lda $D1		; 1616: A5 D1
    cmp #$4E		; 1618: C9 4E
    bne l1625		; 161A: D0 09
    lda $D0		; 161C: A5 D0
    cmp #$C3		; 161E: C9 C3
    bne l1625		; 1620: D0 03
    jmp l1642		; 1622: 4C 42 16
l1625			; Callers: 161A 1620
    ldx #$00		; 1625: A2 00
    stx $CF		; 1627: 86 CF
    lda #$0B		; 1629: A9 0B
    sta a:ROWCRS		; 162B: 8D 54 00
l162E			; Callers: 163C
    ldx $CF		; 162E: A6 CF
    lda $1801,x		; 1630: BD 01 18
    cmp #$FF		; 1633: C9 FF
    beq l163F		; 1635: F0 08
    inc $CF		; 1637: E6 CF
    jsr EOUTCH		; 1639: 20 A4 F6
    jmp l162E		; 163C: 4C 2E 16
l163F			; Callers: 1635
    jmp IRQVEC		; 163F: 4C FE FF
l1642			; Callers: 1622
    lda #$00		; 1642: A9 00
    tax    		; 1644: AA
    tay    		; 1645: A8
l1646			; Callers: 164C 164F
    lda $BFFC		; 1646: AD FC BF
    bne l167D		; 1649: D0 32
    inx    		; 164B: E8
    bne l1646		; 164C: D0 F8
    iny    		; 164E: C8
    bne l1646		; 164F: D0 F5
    lda #$01		; 1651: A9 01
    sta $BFFC		; 1653: 8D FC BF
    lda $BFFC		; 1656: AD FC BF
    beq l165E		; 1659: F0 03
    jmp l167D		; 165B: 4C 7D 16
l165E			; Callers: 1659
    lda #$08		; 165E: A9 08
    sta z:ROWCRS		; 1660: 85 54
    lda #$01		; 1662: A9 01
    sta z:COLCRS		; 1664: 85 55
    ldx #$00		; 1666: A2 00
l1668			; Callers: 1677
    lda $17D9,x		; 1668: BD D9 17
    cmp #$FF		; 166B: C9 FF
    beq l167A		; 166D: F0 0B
    stx $CF		; 166F: 86 CF
    jsr EOUTCH		; 1671: 20 A4 F6
    ldx $CF		; 1674: A6 CF
    inx    		; 1676: E8
    jmp l1668		; 1677: 4C 68 16
l167A			; Callers: 166D
    jmp IRQVEC		; 167A: 4C FE FF
l167D			; Callers: 1649 165B
    lda #$00		; 167D: A9 00
    sta SDLSTL		; 167F: 8D 30 02
    lda #$1F		; 1682: A9 1F
    sta SDLSTH		; 1684: 8D 31 02
    ldx #$00		; 1687: A2 00
l1689			; Callers: 1691
    lda #$00		; 1689: A9 00
l168D equ *+2			; Callers: u14D3 14F0
    sta COLOR0,x		; 168B: 9D C4 02
    inx    		; 168E: E8
    cpx #$05		; 168F: E0 05
    bne l1689		; 1691: D0 F6
    lda #$00		; 1693: A9 00
    sta $CB		; 1695: 85 CB
    lda #$1F		; 1697: A9 1F
    sta $CC		; 1699: 85 CC
    lda #$32		; 169B: A9 32
    sta $CD		; 169D: 85 CD
    lda #$00		; 169F: A9 00
    sta $CE		; 16A1: 85 CE
l16A3			; Callers: 16D5
    lda #$01		; 16A3: A9 01
    sta DUNIT		; 16A5: 8D 01 03
    lda #$52		; 16A8: A9 52
    sta DCOMND		; 16AA: 8D 02 03
    lda $CB		; 16AD: A5 CB
    sta DBUFLO		; 16AF: 8D 04 03
    lda $CC		; 16B2: A5 CC
    sta DBUFHI		; 16B4: 8D 05 03
    lda $CD		; 16B7: A5 CD
    sta DAUX1		; 16B9: 8D 0A 03
    lda $CE		; 16BC: A5 CE
    sta DAUX2		; 16BE: 8D 0B 03
    jsr DSKINV		; 16C1: 20 53 E4
    inc $CD		; 16C4: E6 CD
    clc    		; 16C6: 18
    lda $CB		; 16C7: A5 CB
    adc #$80		; 16C9: 69 80
    sta $CB		; 16CB: 85 CB
    bne l16D1		; 16CD: D0 02
    inc $CC		; 16CF: E6 CC
l16D1			; Callers: 16CD
    lda $CC		; 16D1: A5 CC
    cmp #$40		; 16D3: C9 40
    bne l16A3		; 16D5: D0 CC
    ldx #$00		; 16D7: A2 00
l16D9			; Callers: 16E2
    lda $182A,x		; 16D9: BD 2A 18
    sta COLOR0,x		; 16DC: 9D C4 02
    inx    		; 16DF: E8
    cpx #$04		; 16E0: E0 04
    bne l16D9		; 16E2: D0 F5
    lda #$00		; 16E4: A9 00
    tax    		; 16E6: AA
    tay    		; 16E7: A8
l16E8			; Callers: 16E9 16EC
    iny    		; 16E8: C8
    bne l16E8		; 16E9: D0 FD
    inx    		; 16EB: E8
    bne l16E8		; 16EC: D0 FA
    jsr l17A5		; 16EE: 20 A5 17
    lda #$00		; 16F1: A9 00
    sta $CF		; 16F3: 85 CF
l16F5			; Callers: 1721
    lda #$01		; 16F5: A9 01
    sta DUNIT		; 16F7: 8D 01 03
    lda #$52		; 16FA: A9 52
    sta DCOMND		; 16FC: 8D 02 03
    lda #$00		; 16FF: A9 00
    sta DBUFLO		; 1701: 8D 04 03
    lda #$FF		; 1704: A9 FF
    sta DBUFHI		; 1706: 8D 05 03
    lda $CF		; 1709: A5 CF
    sta DAUX1		; 170B: 8D 0A 03
    lda #$01		; 170E: A9 01
    sta DAUX2		; 1710: 8D 0B 03
l1713			; Callers: 1716
    jsr DSKINV		; 1713: 20 53 E4
    bmi l1713		; 1716: 30 FB
    clc    		; 1718: 18
    lda $CF		; 1719: A5 CF
    adc #$04		; 171B: 69 04
    sta $CF		; 171D: 85 CF
    beq l1724		; 171F: F0 03
    jmp l16F5		; 1721: 4C F5 16
l1724			; Callers: 171F
    ldx #$00		; 1724: A2 00
    lda #$0C		; 1726: A9 0C
    sta ICCOM,x		; 1728: 9D 42 03
    jsr CIOV		; 172B: 20 56 E4
    ldx #$00		; 172E: A2 00
    lda #$03		; 1730: A9 03
    sta ICCOM,x		; 1732: 9D 42 03
    lda #$27		; 1735: A9 27
    sta ICBAL,x		; 1737: 9D 44 03
    lda #$18		; 173A: A9 18
    sta ICBAH,x		; 173C: 9D 45 03
    lda #$0C		; 173F: A9 0C
    sta ICAX1,x		; 1741: 9D 4A 03
    lda #$00		; 1744: A9 00
    sta ICAX2,x		; 1746: 9D 4B 03
    jsr CIOV		; 1749: 20 56 E4
    lda #$00		; 174C: A9 00
    sta $CF		; 174E: 85 CF
    lda #$00		; 1750: A9 00
    sta $CB		; 1752: 85 CB
    lda #$1D		; 1754: A9 1D
    sta $CC		; 1756: 85 CC
l1758			; Callers: l1792
    lda #$01		; 1758: A9 01
    sta DUNIT		; 175A: 8D 01 03
    lda #$52		; 175D: A9 52
    sta DCOMND		; 175F: 8D 02 03
    lda $CB		; 1762: A5 CB
    sta DBUFLO		; 1764: 8D 04 03
    lda $CC		; 1767: A5 CC
    sta DBUFHI		; 1769: 8D 05 03
    ldx $CF		; 176C: A6 CF
    lda $17B1,x		; 176E: BD B1 17
    sta DAUX1		; 1771: 8D 0A 03
    inx    		; 1774: E8
    lda $17B1,x		; 1775: BD B1 17
    cmp #$FF		; 1778: C9 FF
    beq l1795		; 177A: F0 19
    sta DAUX2		; 177C: 8D 0B 03
    inx    		; 177F: E8
    stx $CF		; 1780: 86 CF
l1782			; Callers: 1785
    jsr DSKINV		; 1782: 20 53 E4
    bmi l1782		; 1785: 30 FB
    clc    		; 1787: 18
    lda $CB		; 1788: A5 CB
    adc #$80		; 178A: 69 80
    sta $CB		; 178C: 85 CB
    bne l1792		; 178E: D0 02
    inc $CC		; 1790: E6 CC
l1792			; Callers: 178E
    jmp l1758		; 1792: 4C 58 17
l1795			; Callers: 177A
    lda #$C0		; 1795: A9 C0
    sta a:POKMSK		; 1797: 8D 10 00
    lda #$F7		; 179A: A9 F7
    sta IRQEN		; 179C: 8D 0E D2 Access: 192E
    jsr l17AB		; 179F: 20 AB 17
    jmp l264C		; 17A2: 4C 4C 26
l17A5			; Callers: 15D6 16EE
    lda #$00		; 17A5: A9 00
    sta a:SOUNDR		; 17A7: 8D 41 00
    rts    		; 17AA: 60
l17AB			; Callers: 15FC 179F
    lda #$03		; 17AB: A9 03
    sta a:SOUNDR		; 17AD: 8D 41 00
    rts    		; 17B0: 60
    dta $38		; 17B1: 38 Access: 176E 1775
    dta $1		; 17B2: 01
    dta $D4		; 17B3: D4
    dta $1		; 17B4: 01
    dta $5F		; 17B5: 5F
    dta $2		; 17B6: 02
    dta $DF		; 17B7: DF
    dta $0		; 17B8: 00
    dta $A6		; 17B9: A6
    dta $1		; 17BA: 01
    dta $B3		; 17BB: B3
    dta $0		; 17BC: 00
    dta $F6		; 17BD: F6
    dta $1		; 17BE: 01
    dta $2C		; 17BF: 2C
    dta $2		; 17C0: 02
    dta $B2		; 17C1: B2
    dta $0		; 17C2: 00
    dta $B3		; 17C3: B3
    dta $2		; 17C4: 02
    dta $BE		; 17C5: BE
    dta $0		; 17C6: 00
    dta $1		; 17C7: 01
    dta $2		; 17C8: 02
    dta $82		; 17C9: 82
    dta $1		; 17CA: 01
    dta $3C		; 17CB: 3C
    dta $2		; 17CC: 02
    dta $4D		; 17CD: 4D
    dta $2		; 17CE: 02
    dta $8E		; 17CF: 8E
    dta $0		; 17D0: 00
    dta $24		; 17D1: 24
    dta $1		; 17D2: 01
    dta $CA		; 17D3: CA
    dta $0		; 17D4: 00
    dta $A1		; 17D5: A1
    dta $0		; 17D6: 00
    dta $FF		; 17D7: FF
    dta $FF		; 17D8: FF
    dta $E3		; 17D9: E3 Access: 1668
    dta $E1		; 17DA: E1
    dta $F2		; 17DB: F2
    dta $F4		; 17DC: F4
    dta $F2		; 17DD: F2
    dta $E9		; 17DE: E9
    dta $E4		; 17DF: E4
    dta $E7		; 17E0: E7
    dta $E5		; 17E1: E5
    dta $A0		; 17E2: A0
    dta $E9		; 17E3: E9
    dta $EE		; 17E4: EE
    dta $F3		; 17E5: F3
    dta $F4		; 17E6: F4
    dta $E1		; 17E7: E1
    dta $EC		; 17E8: EC
    dta $EC		; 17E9: EC
    dta $E5		; 17EA: E5
    dta $E4		; 17EB: E4
    dta $AC		; 17EC: AC
    dta $A0		; 17ED: A0
    dta $F2		; 17EE: F2
    dta $E5		; 17EF: E5
    dta $ED		; 17F0: ED
    dta $EF		; 17F1: EF
    dta $F6		; 17F2: F6
    dta $E5		; 17F3: E5
    dta $A0		; 17F4: A0
    dta $E1		; 17F5: E1
    dta $EE		; 17F6: EE
    dta $E4		; 17F7: E4
    dta $A0		; 17F8: A0
    dta $F2		; 17F9: F2
    dta $E5		; 17FA: E5
    dta $E2		; 17FB: E2
    dta $EF		; 17FC: EF
    dta $EF		; 17FD: EF
    dta $74		; 17FE: 74
    dta $1E		; 17FF: 1E
    dta $FF		; 1800: FF
    dta $FD		; 1801: FD Access: 1630
    dta $A0		; 1802: A0
    dta $F3		; 1803: F3
    dta $F9		; 1804: F9
    dta $F3		; 1805: F3
    dta $F4		; 1806: F4
    dta $E5		; 1807: E5
    dta $ED		; 1808: ED
    dta $A0		; 1809: A0
    dta $E5		; 180A: E5
    dta $F2		; 180B: F2
    dta $F2		; 180C: F2
    dta $EF		; 180D: EF
    dta $F2		; 180E: F2
    dta $AC		; 180F: AC
    dta $A0		; 1810: A0
    dta $F2		; 1811: F2
    dta $E5		; 1812: E5
l1813			; Callers: 18E9
    dta $E2		; 1813: E2
    dta $EF		; 1814: EF
    dta $EF		; 1815: EF
    dta $F4		; 1816: F4
    dta $A0		; 1817: A0
    dta $E1		; 1818: E1
    dta $EE		; 1819: EE
    dta $E4		; 181A: E4
    dta $A0		; 181B: A0
    dta $F4		; 181C: F4
    dta $F2		; 181D: F2
    dta $F9		; 181E: F9
    dta $A0		; 181F: A0
    dta $E1		; 1820: E1
    dta $E7		; 1821: E7
    dta $E1		; 1822: E1
    dta $E9		; 1823: E9
    dta $EE		; 1824: EE
    dta $FD		; 1825: FD
    dta $FF		; 1826: FF
    dta $9B		; 1827: 9B
    dta $3A		; 1828: 3A
    dta $9B		; 1829: 9B
    dta $28		; 182A: 28 Access: 16D9
    dta $F		; 182B: 0F
    dta $0		; 182C: 00
    dta $46		; 182D: 46
    dta $9B		; 182E: 9B
    dta $44		; 182F: 44
    dta $31		; 1830: 31
    dta $3A		; 1831: 3A
    dta $44		; 1832: 44
    dta $55		; 1833: 55
    dta $50		; 1834: 50
    dta $2E		; 1835: 2E
    dta $53		; 1836: 53
    dta $59		; 1837: 59
    dta $53		; 1838: 53
    dta $9B		; 1839: 9B
    dta $45		; 183A: 45
    dta $52		; 183B: 52
    dta $52		; 183C: 52
    dta $4F		; 183D: 4F
    dta $52		; 183E: 52
    dta $2D		; 183F: 2D
    dta $53		; 1840: 53
    dta $41		; 1841: 41
    dta $56		; 1842: 56
    dta $49		; 1843: 49
    dta $4E		; 1844: 4E
    dta $47		; 1845: 47
    dta $20		; 1846: 20
    dta $55		; 1847: 55
    dta $53		; 1848: 53
    dta $45		; 1849: 45
    dta $52		; 184A: 52
    dta $20		; 184B: 20
    dta $4D		; 184C: 4D
    dta $45		; 184D: 45
    dta $4D		; 184E: 4D
    dta $4F		; 184F: 4F
    dta $52		; 1850: 52
    dta $59		; 1851: 59
    dta $20		; 1852: 20
    dta $4F		; 1853: 4F
    dta $4E		; 1854: 4E
    dta $20		; 1855: 20
    dta $44		; 1856: 44
    dta $49		; 1857: 49
    dta $53		; 1858: 53
    dta $4B		; 1859: 4B
    dta $9B		; 185A: 9B
    dta $54		; 185B: 54
    dta $59		; 185C: 59
    dta $50		; 185D: 50
    dta $45		; 185E: 45
    dta $20		; 185F: 20
    dta $59		; 1860: 59
    dta $20		; 1861: 20
    dta $54		; 1862: 54
    dta $4F		; 1863: 4F
    dta $20		; 1864: 20
    dta $53		; 1865: 53
    dta $54		; 1866: 54
    dta $49		; 1867: 49
    dta $4C		; 1868: 4C
    dta $4C		; 1869: 4C
    dta $20		; 186A: 20
    dta $52		; 186B: 52
    dta $55		; 186C: 55
    dta $4E		; 186D: 4E
    dta $20		; 186E: 20
    dta $44		; 186F: 44
    dta $4F		; 1870: 4F
    dta $53		; 1871: 53
    dta $9B		; 1872: 9B
l1873			; Callers: l193F
    jsr l19B4		; 1873: 20 B4 19
    lda #$03		; 1876: A9 03
    sta ICCOM,x		; 1878: 9D 42 03
    lda #$3B		; 187B: A9 3B
    sta ICBAL,x		; 187D: 9D 44 03
    lda #$17		; 1880: A9 17
    sta ICBAH,x		; 1882: 9D 45 03
    lda #$0C		; 1885: A9 0C
    sta ICAX1,x		; 1887: 9D 4A 03
    jsr CIOV		; 188A: 20 56 E4
    php    		; 188D: 08
    jsr l19B4		; 188E: 20 B4 19
    plp    		; 1891: 28
    rts    		; 1892: 60
u1893			; Callers: -c 1893
    lda #$00		; 1893: A9 00
    beq l189A		; 1895: F0 03
    jsr l1939		; 1897: 20 39 19
l189A			; Callers: 1895
    ldx #$10		; 189A: A2 10
    jsr CIOV		; 189C: 20 56 E4
    lda #$00		; 189F: A9 00
    beq l18BD		; 18A1: F0 1A
    inc $18A0		; 18A3: EE A0 18
    lda $02E2		; 18A6: AD E2 02
    sta $19E4		; 18A9: 8D E4 19
    lda $02E3		; 18AC: AD E3 02
    sta $19E5		; 18AF: 8D E5 19
    lda #$E2		; 18B2: A9 E2
    tax    		; 18B4: AA
    sta $19E0		; 18B5: 8D E0 19
    lda #$02		; 18B8: A9 02
    jsr l18EF		; 18BA: 20 EF 18
l18BD			; Callers: 18A1
    lda #$00		; 18BD: A9 00
    beq l18DB		; 18BF: F0 1A
    inc $18BE		; 18C1: EE BE 18
    lda GLBABS		; 18C4: AD E0 02
    sta $19E4		; 18C7: 8D E4 19
    lda $02E1		; 18CA: AD E1 02
    sta $19E5		; 18CD: 8D E5 19
    lda #$E0		; 18D0: A9 E0
    tax    		; 18D2: AA
    sta $19E0		; 18D3: 8D E0 19
    lda #$02		; 18D6: A9 02
    jsr l18EF		; 18D8: 20 EF 18
l18DB			; Callers: 18BF
    jsr l19AA		; 18DB: 20 AA 19
    lda $179E		; 18DE: AD 9E 17
    and $1894		; 18E1: 2D 94 18
    beq l18EC		; 18E4: F0 06
    inc $1894		; 18E6: EE 94 18
    jmp l1813		; 18E9: 4C 13 18
l18EC			; Callers: 18E4
    jmp l2075		; 18EC: 4C 75 20
l18EF			; Callers: 18D8 18BA
    sta $19E1		; 18EF: 8D E1 19
    inx    		; 18F2: E8
    stx $19E2		; 18F3: 8E E2 19
    sta $19E3		; 18F6: 8D E3 19
    ldx #$10		; 18F9: A2 10
    lda #$E0		; 18FB: A9 E0
    sta ICBAL,x		; 18FD: 9D 44 03
    lda #$19		; 1900: A9 19
    sta ICBAH,x		; 1902: 9D 45 03
    lda #$06		; 1905: A9 06
    sta ICBLL,x		; 1907: 9D 48 03
    lda #$00		; 190A: A9 00
    sta ICBLH,x		; 190C: 9D 49 03
    jmp CIOV		; 190F: 4C 56 E4
u1912			; Callers: -c 1912
    jsr l1939		; 1912: 20 39 19
    lda #$00		; 1915: A9 00
    sta $159D		; 1917: 8D 9D 15
    jsr l192E		; 191A: 20 2E 19
    jmp ($BFFA)		; 191D: 6C FA BF
    dta $20		; 1920: 20
l1921			; Callers: 153A
    and $A919,y		; 1921: 39 19 A9
    dta $0		; 1924: 00
    dta $8D		; 1925: 8D
    dta $9D		; 1926: 9D
    dta $15		; 1927: 15
    dta $20		; 1928: 20
    dta $2E		; 1929: 2E
    dta $19		; 192A: 19
    dta $6C		; 192B: 6C
    dta $1A		; 192C: 1A
    dta $0		; 192D: 00
l192E			; Callers: 158A 191A
    lda $179C		; 192E: AD 9C 17
    sta z:DOSINI		; 1931: 85 0C
    lda $179D		; 1933: AD 9D 17
    sta z:DOSINI+1		; 1936: 85 0D
    rts    		; 1938: 60
l1939			; Callers: u1912 1897
    lda $179E		; 1939: AD 9E 17
    bne l193F		; 193C: D0 01
    rts    		; 193E: 60
l193F			; Callers: 1587 193C
    jsr l1873		; 193F: 20 73 18
    bpl l194A		; 1942: 10 06
    lda #$00		; 1944: A9 00
    sta z:WARMST		; 1946: 85 08
    beq l196E		; 1948: F0 24
l194A			; Callers: 1942
    lda #$03		; 194A: A9 03
    sta ICCOM,x		; 194C: 9D 42 03
    jsr CIOV		; 194F: 20 56 E4
    lda #$07		; 1952: A9 07
    sta ICCOM,x		; 1954: 9D 42 03
    lda #$8A		; 1957: A9 8A
    sta ICBLL,x		; 1959: 9D 48 03
    lda #$15		; 195C: A9 15
    sta ICBLH,x		; 195E: 9D 49 03
    lda #$7C		; 1961: A9 7C
    sta ICBAL,x		; 1963: 9D 44 03
    lda #$1D		; 1966: A9 1D
    sta ICBAH,x		; 1968: 9D 45 03
    jsr CIOV		; 196B: 20 56 E4
l196E			; Callers: 1948
    lda #$0C		; 196E: A9 0C
    sta ICCOM,x		; 1970: 9D 42 03
    jmp CIOV		; 1973: 4C 56 E4
u1976			; Callers: -c 1976
    jsr CIOINV		; 1976: 20 6E E4
    ldx #$00		; 1979: A2 00
    lda #$03		; 197B: A9 03
    sta ICCOM,x		; 197D: 9D 42 03
    lda #$2C		; 1980: A9 2C
    sta ICBAL,x		; 1982: 9D 44 03
    lda #$18		; 1985: A9 18
    sta ICBAH,x		; 1987: 9D 45 03
    lda #$0C		; 198A: A9 0C
    sta ICAX1,x		; 198C: 9D 4A 03
    jsr CIOV		; 198F: 20 56 E4
    ldx #$00		; 1992: A2 00
    stx CDTMV3		; 1994: 8E 1C 02
    stx CDTMV3+1		; 1997: 8E 1D 02
    ldy #$01		; 199A: A0 01
    lda #$03		; 199C: A9 03
    sta CDTMF3		; 199E: 8D 2A 02
    jsr SETVBV		; 19A1: 20 5C E4
l19A4			; Callers: 19A7
    lda CDTMF3		; 19A4: AD 2A 02
    bne l19A4		; 19A7: D0 FB
    rts    		; 19A9: 60
l19AA			; Callers: 157A l18DB
    lda #$0C		; 19AA: A9 0C
    ldx #$10		; 19AC: A2 10
    sta ICCOM,x		; 19AE: 9D 42 03
    jsr CIOV		; 19B1: 20 56 E4
l19B4			; Callers: l1873 188E
    ldx #$20		; 19B4: A2 20
    lda #$0C		; 19B6: A9 0C
    sta ICCOM,x		; 19B8: 9D 42 03
    jmp CIOV		; 19BB: 4C 56 E4
u19BE			; Callers: -c 19BE
    sta ICBAL		; 19BE: 8D 44 03
    stx ICBAH		; 19C1: 8E 45 03
    lda #$80		; 19C4: A9 80
    sta ICBLL		; 19C6: 8D 48 03
    ldx #$00		; 19C9: A2 00
    stx ICBLH		; 19CB: 8E 49 03
    lda #$09		; 19CE: A9 09
    sta ICCOM		; 19D0: 8D 42 03
    lda $159D		; 19D3: AD 9D 15
    bne l19DB		; 19D6: D0 03
    jmp CIOV		; 19D8: 4C 56 E4
l19DB			; Callers: 19D6
    jmp l31AA		; 19DB: 4C AA 31
    dta $FF		; 19DE: FF
    dta $FF		; 19DF: FF
    dta $E0		; 19E0: E0 Access: 18D3 18B5
    dta $2		; 19E1: 02 Access: 18EF
    dta $E1		; 19E2: E1 Access: 18F3
    dta $2		; 19E3: 02 Access: 18F6
    dta $75		; 19E4: 75 Access: 18C7 18A9
    dta $20		; 19E5: 20 Access: 18CD 18AF
u19E6			; Callers: -c 19E6
    tya    		; 19E6: 98
    pha    		; 19E7: 48
    inc z:BUNRLO		; 19E8: E6 32
    bne l19EE		; 19EA: D0 02
    inc z:BUFRHI		; 19EC: E6 33
l19EE			; Callers: 19EA
    lda z:BUNRLO		; 19EE: A5 32
    cmp z:BFENLO		; 19F0: C5 34
    lda z:BUFRHI		; 19F2: A5 33
    sbc z:BNENHI		; 19F4: E5 35 Access: 1B1B 1B29
    bcc l1A12		; 19F6: 90 1A
    lda z:CHKSNT		; 19F8: A5 3B
    bne l1A05		; 19FA: D0 09
    lda z:CHKSUM		; 19FC: A5 31
    sta SEROUT		; 19FE: 8D 0D D2
    dec z:CHKSNT		; 1A01: C6 3B
    bne l1A0E		; 1A03: D0 09
l1A05			; Callers: 19FA
    lda z:POKMSK		; 1A05: A5 10
    ora #$08		; 1A07: 09 08
    sta z:POKMSK		; 1A09: 85 10
    sta IRQEN		; 1A0B: 8D 0E D2
l1A0E			; Callers: 1BB9 1A20 1A03
    pla    		; 1A0E: 68
    tay    		; 1A0F: A8
    pla    		; 1A10: 68
    rti    		; 1A11: 40
l1A12			; Callers: 19F6
    ldy #$00		; 1A12: A0 00
    lda (BUNRLO),y		; 1A14: B1 32
    sta SEROUT		; 1A16: 8D 0D D2
    clc    		; 1A19: 18
    adc z:CHKSUM		; 1A1A: 65 31
    adc #$00		; 1A1C: 69 00
    sta z:CHKSUM		; 1A1E: 85 31
    jmp l1A0E		; 1A20: 4C 0E 1A
u1A23			; Callers: -c 1A23
    tya    		; 1A23: 98
    pha    		; 1A24: 48
    lda SKCTL		; 1A25: AD 0F D2
    sta SKREST		; 1A28: 8D 0A D2
    bmi l1A31		; 1A2B: 30 04
    ldy #$8C		; 1A2D: A0 8C
    sty z:STATUS		; 1A2F: 84 30
l1A31			; Callers: 1A2B
    and #$20		; 1A31: 29 20
    bne l1A39		; 1A33: D0 04
    ldy #$8E		; 1A35: A0 8E
    sty z:STATUS		; 1A37: 84 30
l1A39			; Callers: 1A33
    lda z:BUFRFL		; 1A39: A5 38
    beq l1A50		; 1A3B: F0 13
    lda SEROUT		; 1A3D: AD 0D D2
    cmp z:CHKSUM		; 1A40: C5 31
    beq l1A48		; 1A42: F0 04
    ldy #$8F		; 1A44: A0 8F
    sty z:STATUS		; 1A46: 84 30
l1A48			; Callers: 1A76 1A42
    lda #$FF		; 1A48: A9 FF
    sta z:RECVDN		; 1A4A: 85 39
l1A4C			; Callers: 1A6C 1A7A
    pla    		; 1A4C: 68
    tay    		; 1A4D: A8
    pla    		; 1A4E: 68
    rti    		; 1A4F: 40
l1A50			; Callers: 1A3B
    lda SEROUT		; 1A50: AD 0D D2
    ldy #$00		; 1A53: A0 00
    sta (BUNRLO),y		; 1A55: 91 32
    clc    		; 1A57: 18
l1A59 equ *+1			; Callers: 1B7A
    adc z:CHKSUM		; 1A58: 65 31
    adc #$00		; 1A5A: 69 00
    sta z:CHKSUM		; 1A5C: 85 31
    inc z:BUNRLO		; 1A5E: E6 32
    bne l1A64		; 1A60: D0 02
    inc z:BUFRHI		; 1A62: E6 33
l1A64			; Callers: 1A60
    lda z:BUNRLO		; 1A64: A5 32
    cmp z:BFENLO		; 1A66: C5 34
    lda z:BUFRHI		; 1A68: A5 33
l1A6B equ *+1			; Callers: l1B48
    sbc z:BNENHI		; 1A6A: E5 35
    bcc l1A4C		; 1A6C: 90 DE
    lda z:NOCKSM		; 1A6E: A5 3C
    beq l1A78		; 1A70: F0 06
    lda #$00		; 1A72: A9 00
    sta z:NOCKSM		; 1A74: 85 3C
    beq l1A48		; 1A76: F0 D0
l1A78			; Callers: 1A70
    dec z:BUFRFL		; 1A78: C6 38
    bne l1A4C		; 1A7A: D0 D0
    dta $0		; 1A7C: 00
    dta $0		; 1A7D: 00
    dta $0		; 1A7E: 00
    dta $0		; 1A7F: 00
    dta $0		; 1A80: 00
    dta $0		; 1A81: 00
    dta $0		; 1A82: 00
    dta $0		; 1A83: 00
    dta $0		; 1A84: 00
l1A85			; Callers: 1C1E 1BB2 1B87
    dta $0		; 1A85: 00
    dta $0		; 1A86: 00
    dta $0		; 1A87: 00
    dta $0		; 1A88: 00
    dta $0		; 1A89: 00
    dta $0		; 1A8A: 00
    dta $0		; 1A8B: 00
    dta $0		; 1A8C: 00
    dta $0		; 1A8D: 00
    dta $0		; 1A8E: 00
    dta $0		; 1A8F: 00
    dta $0		; 1A90: 00
    dta $0		; 1A91: 00
    dta $0		; 1A92: 00
    dta $0		; 1A93: 00
    dta $0		; 1A94: 00
    dta $0		; 1A95: 00
    dta $0		; 1A96: 00
    dta $0		; 1A97: 00
    dta $0		; 1A98: 00
    dta $0		; 1A99: 00
    dta $0		; 1A9A: 00
    dta $0		; 1A9B: 00
    dta $0		; 1A9C: 00
    dta $0		; 1A9D: 00
    dta $0		; 1A9E: 00
l1A9F			; Callers: 1BDC
    dta $0		; 1A9F: 00
    dta $0		; 1AA0: 00
    dta $0		; 1AA1: 00
    dta $0		; 1AA2: 00
    dta $0		; 1AA3: 00
    dta $0		; 1AA4: 00
    dta $0		; 1AA5: 00
    dta $0		; 1AA6: 00
    dta $0		; 1AA7: 00
    dta $0		; 1AA8: 00 Access: 1BC4 1BCB
    dta $0		; 1AA9: 00
    dta $0		; 1AAA: 00
    dta $0		; 1AAB: 00
    dta $0		; 1AAC: 00
    dta $0		; 1AAD: 00
l1AAE			; Callers: 1B45
    dta $0		; 1AAE: 00
    dta $0		; 1AAF: 00
    dta $0		; 1AB0: 00
    dta $0		; 1AB1: 00
    dta $0		; 1AB2: 00
    dta $0		; 1AB3: 00
    dta $0		; 1AB4: 00
    dta $0		; 1AB5: 00
    dta $0		; 1AB6: 00
    dta $0		; 1AB7: 00
    dta $0		; 1AB8: 00 Access: 1BE5
    dta $0		; 1AB9: 00
    dta $0		; 1ABA: 00
    dta $0		; 1ABB: 00
    dta $0		; 1ABC: 00
    dta $0		; 1ABD: 00
    dta $0		; 1ABE: 00
    dta $0		; 1ABF: 00
    dta $0		; 1AC0: 00
    dta $0		; 1AC1: 00
    dta $0		; 1AC2: 00
    dta $0		; 1AC3: 00
    dta $0		; 1AC4: 00
    dta $0		; 1AC5: 00
    dta $0		; 1AC6: 00
    dta $0		; 1AC7: 00
    dta $0		; 1AC8: 00
    dta $0		; 1AC9: 00
    dta $0		; 1ACA: 00
    dta $0		; 1ACB: 00
    dta $0		; 1ACC: 00
    dta $0		; 1ACD: 00
    dta $0		; 1ACE: 00
    dta $0		; 1ACF: 00
    dta $0		; 1AD0: 00
    dta $0		; 1AD1: 00
    dta $0		; 1AD2: 00
    dta $0		; 1AD3: 00
    dta $0		; 1AD4: 00
    dta $0		; 1AD5: 00
    dta $0		; 1AD6: 00
    dta $0		; 1AD7: 00
    dta $7D		; 1AD8: 7D
    dta $0		; 1AD9: 00
    dta $0		; 1ADA: 00
    dta $0		; 1ADB: 00
    dta $0		; 1ADC: 00
    dta $0		; 1ADD: 00
    dta $0		; 1ADE: 00
    dta $0		; 1ADF: 00
    dta $0		; 1AE0: 00
u1AE1			; Callers: -c 1AE1
    lda #$2F		; 1AE1: A9 2F
    sta $EF		; 1AE3: 85 EF
    bit $93		; 1AE5: 24 93
    bpl l1AF0		; 1AE7: 10 07
    lda #$C0		; 1AE9: A9 C0
    sta AUDF2		; 1AEB: 8D 02 D2
    lda #$A2		; 1AEE: A9 A2
l1AF0			; Callers: 1C19 1BAF 1AE7
    sta AUDC1		; 1AF0: 8D 01 D2
    sta AUDC2		; 1AF3: 8D 03 D2
    ldx #$23		; 1AF6: A2 23
    lda #$01		; 1AF8: A9 01
l1AFA			; Callers: 1AFE
    sta $047E,x		; 1AFA: 9D 7E 04
    dex    		; 1AFD: CA
    bpl l1AFA		; 1AFE: 10 FA
    stx $E9		; 1B00: 86 E9
    stx $EA		; 1B02: 86 EA Access: 1C24
    inx    		; 1B04: E8 Access: 1C21
    stx $E5		; 1B05: 86 E5
    lda #$03		; 1B07: A9 03
l1B0A equ *+1			; Callers: 1B99
    sta $E6		; 1B09: 85 E6
    sta $E7		; 1B0B: 85 E7
    sta $E8		; 1B0D: 85 E8
    ldx #$0C		; 1B0F: A2 0C
    stx $EB		; 1B11: 86 EB
    rts    		; 1B13: 60
u1B14			; Callers: -c 1B14
    lda #$AA		; 1B14: A9 AA
    sta $19F3		; 1B16: 8D F3 19
    lda #$39		; 1B19: A9 39
    sta $19F4		; 1B1B: 8D F4 19
    ldy #$04		; 1B1E: A0 04
    lda #$00		; 1B20: A9 00
l1B22			; Callers: 1B2D
    tax    		; 1B22: AA
l1B23			; Callers: 1B27
    sta $3EAA,x		; 1B23: 9D AA 3E
    dex    		; 1B26: CA
    bne l1B23		; 1B27: D0 FA
    inc $19F4		; 1B29: EE F4 19
    dey    		; 1B2C: 88
    bpl l1B22		; 1B2D: 10 F3
    tax    		; 1B2F: AA
l1B30			; Callers: 1B36
    sta $3EAA,x		; 1B30: 9D AA 3E
    inx    		; 1B33: E8
    cpx #$F0		; 1B34: E0 F0
    bcc l1B30		; 1B36: 90 F8
    rts    		; 1B38: 60
u1B39			; Callers: -c 1B39
    lda #$00		; 1B39: A9 00
    sta $EE		; 1B3B: 85 EE
    ldx #$02		; 1B3D: A2 02
    lda $E9,x		; 1B3F: B5 E9
    bmi l1B48		; 1B41: 30 05
    bne l1B4B		; 1B43: D0 06
    jmp l1AAE		; 1B45: 4C AE 1A
l1B48			; Callers: 1B41
    jmp l1A6B		; 1B48: 4C 6B 1A
l1B4B			; Callers: 1B43
    clc    		; 1B4B: 18
    adc $EE		; 1B4C: 65 EE
    sta $EE		; 1B4E: 85 EE
    lda $E3,x		; 1B50: B5 E3
    cmp $E0,x		; 1B52: D5 E0
    bcs l1B8A		; 1B54: B0 34
    ldy $E0,x		; 1B56: B4 E0
    cpy #$09		; 1B58: C0 09
    beq l1B7E		; 1B5A: F0 22
    lda $1C62,y		; 1B5C: B9 62 1C
    cmp $E6,x		; 1B5F: D5 E6
    bne l1B8A		; 1B61: D0 27
    txa    		; 1B63: 8A
    cpy #$08		; 1B64: C0 08
    bcc l1B7D		; 1B66: 90 15
    inx    		; 1B68: E8
    cpx #$03		; 1B69: E0 03
    bcc l1B6F		; 1B6B: 90 02
    ldx #$00		; 1B6D: A2 00
l1B6F			; Callers: 1B6B
    ldy $E0,x		; 1B6F: B4 E0
    cpy #$04		; 1B71: C0 04
    bcc l1B7D		; 1B73: 90 08
    ldy $E9,x		; 1B75: B4 E9
    bmi l1B7D		; 1B77: 30 04
    tax    		; 1B79: AA
    jmp l1A59		; 1B7A: 4C 59 1A
l1B7D			; Callers: 1B66 1B73 1B77
    tax    		; 1B7D: AA
l1B7E			; Callers: 1B5A
    dec $E0,x		; 1B7E: D6 E0
    ldy $E0,x		; 1B80: B4 E0
    lda $1C62,y		; 1B82: B9 62 1C
    sta $E6,x		; 1B85: 95 E6
    jmp l1A85		; 1B87: 4C 85 1A
l1B8A			; Callers: 1B54 1B61
    inc $E6,x		; 1B8A: F6 E6
    ldy $E0,x		; 1B8C: B4 E0
    lda $E6,x		; 1B8E: B5 E6
    cmp $1C74,y		; 1B90: D9 74 1C
    bcc l1BB6		; 1B93: 90 21
    lda #$00		; 1B95: A9 00
    sta $E6,x		; 1B97: 95 E6
    jmp l1B0A		; 1B99: 4C 0A 1B
u1B9C			; Callers: -c 1B9C
    txa    		; 1B9C: 8A
    inx    		; 1B9D: E8
    cpx #$03		; 1B9E: E0 03
    bcc l1BA4		; 1BA0: 90 02
    ldx #$00		; 1BA2: A2 00
l1BA4			; Callers: 1BA0
    ldy $E0,x		; 1BA4: B4 E0
    cpy #$04		; 1BA6: C0 04
    bne l1BB5		; 1BA8: D0 0B
    tax    		; 1BAA: AA
    lda #$0C		; 1BAB: A9 0C
    sta $E9,x		; 1BAD: 95 E9
    jsr l1AF0		; 1BAF: 20 F0 1A
    jmp l1A85		; 1BB2: 4C 85 1A
l1BB5			; Callers: 1BA8
    tax    		; 1BB5: AA
l1BB6			; Callers: 1BE3 1B93
    dex    		; 1BB6: CA
    bmi l1BBC		; 1BB7: 30 03
    jmp l1A0E		; 1BB9: 4C 0E 1A
l1BBC			; Callers: 1BB7
    lda $EF		; 1BBC: A5 EF
    cmp $EE		; 1BBE: C5 EE
    beq l1BD0		; 1BC0: F0 0E
    bcs l1BDA		; 1BC2: B0 16
    dec $1AA8		; 1BC4: CE A8 1A
    bpl l1BD0		; 1BC7: 10 07
    lda #$02		; 1BC9: A9 02
    sta $1AA8		; 1BCB: 8D A8 1A
    inc $EF		; 1BCE: E6 EF
l1BD0			; Callers: 1BC0 1BC7
    lda $EF		; 1BD0: A5 EF
    asl @		; 1BD2: 0A
    adc #$38		; 1BD3: 69 38
    sta AUDF1		; 1BD5: 8D 00 D2
    rts    		; 1BD8: 60
    dta $1		; 1BD9: 01
l1BDA			; Callers: 1BC2
    dec $EF		; 1BDA: C6 EF
    jmp l1A9F		; 1BDC: 4C 9F 1A
u1BDF			; Callers: -c 1BDF
    lda $E3,x		; 1BDF: B5 E3
    cmp #$04		; 1BE1: C9 04
    bcs l1BB6		; 1BE3: B0 D1
    inc $1AB8		; 1BE5: EE B8 1A
    lda #$FF		; 1BE8: A9 FF
    lsr @		; 1BEA: 4A
    bcs l1BF0		; 1BEB: B0 03
    inc $2FA9		; 1BED: EE A9 2F
l1BF0			; Callers: 1BEB
    dec $E9,x		; 1BF0: D6 E9
    lda #$08		; 1BF2: A9 08
    sta $E3,x		; 1BF4: 95 E3
    sta $E0,x		; 1BF6: 95 E0
    lda #$03		; 1BF8: A9 03
    sta $E6,x		; 1BFA: 95 E6
    stx $1AEC		; 1BFC: 8E EC 1A
    dex    		; 1BFF: CA
    bpl l1C04		; 1C00: 10 02
    ldx #$02		; 1C02: A2 02
l1C04			; Callers: 1C00
    lda #$00		; 1C04: A9 00
    sta $E3,x		; 1C06: 95 E3
    dex    		; 1C08: CA
    bpl l1C0D		; 1C09: 10 02
    ldx #$02		; 1C0B: A2 02
l1C0D			; Callers: 1C09
    lda #$04		; 1C0D: A9 04
    sta $E3,x		; 1C0F: 95 E3
    lda $E9,x		; 1C11: B5 E9
    bne l1C1C		; 1C13: D0 07
    lda #$0C		; 1C15: A9 0C
    sta $E9,x		; 1C17: 95 E9
    jsr l1AF0		; 1C19: 20 F0 1A
l1C1C			; Callers: 1C13
    ldx #$FF		; 1C1C: A2 FF
    jmp l1A85		; 1C1E: 4C 85 1A
u1C21			; Callers: -c 1C21
    ldy $1B04,x		; 1C21: BC 04 1B
    stx $1B02		; 1C24: 8E 02 1B
    ldx #$0B		; 1C27: A2 0B
    lda #$01		; 1C29: A9 01
l1C2B			; Callers: 1C30
    sta $047E,y		; 1C2B: 99 7E 04
    dey    		; 1C2E: 88
    dex    		; 1C2F: CA
    bpl l1C2B		; 1C30: 10 F9
    ldx #$00		; 1C32: A2 00
    rts    		; 1C34: 60
    dta $B		; 1C35: 0B
    dta $17		; 1C36: 17
    dta $23		; 1C37: 23
    dta $0		; 1C38: 00
    dta $C		; 1C39: 0C
    dta $18		; 1C3A: 18
    dta $98		; 1C3B: 98
    dta $29		; 1C3C: 29
    dta $4		; 1C3D: 04
    dta $D0		; 1C3E: D0
    dta $22		; 1C3F: 22
    dta $BD		; 1C40: BD
    dta $7		; 1C41: 07
    dta $1B		; 1C42: 1B
    dta $8D		; 1C43: 8D
    dta $26		; 1C44: 26
    dta $1B		; 1C45: 1B
    dta $BC		; 1C46: BC
    dta $4		; 1C47: 04
    dta $1B		; 1C48: 1B
    dta $B9		; 1C49: B9
    dta $7E		; 1C4A: 7E
    dta $4		; 1C4B: 04
    dta $8D		; 1C4C: 8D
    dta $2A		; 1C4D: 2A
    dta $1B		; 1C4E: 1B
    dta $B9		; 1C4F: B9
    dta $7D		; 1C50: 7D
    dta $4		; 1C51: 04
    dta $99		; 1C52: 99
    dta $7E		; 1C53: 7E
    dta $4		; 1C54: 04
    dta $88		; 1C55: 88
    dta $C0		; 1C56: C0
    dta $0		; 1C57: 00
    dta $D0		; 1C58: D0
    dta $F5		; 1C59: F5
    dta $A9		; 1C5A: A9
    dta $1		; 1C5B: 01
    dta $99		; 1C5C: 99
    dta $7E		; 1C5D: 7E
    dta $4		; 1C5E: 04
    dta $4C		; 1C5F: 4C
    dta $85		; 1C60: 85
    dta $1A		; 1C61: 1A
    dta $BD		; 1C62: BD Access: 1B82 1B5C
    dta $4		; 1C63: 04
    dta $1B		; 1C64: 1B
    dta $8D		; 1C65: 8D
    dta $48		; 1C66: 48
    dta $1B		; 1C67: 1B
    dta $BC		; 1C68: BC
    dta $7		; 1C69: 07
    dta $1B		; 1C6A: 1B
    dta $B9		; 1C6B: B9
    dta $7E		; 1C6C: 7E
    dta $4		; 1C6D: 04
    dta $8D		; 1C6E: 8D
    dta $4C		; 1C6F: 4C
    dta $1B		; 1C70: 1B
    dta $B9		; 1C71: B9
    dta $7F		; 1C72: 7F
    dta $4		; 1C73: 04
    dta $99		; 1C74: 99 Access: 1B90
    dta $7E		; 1C75: 7E
    dta $4		; 1C76: 04
    dta $C8		; 1C77: C8
    dta $C0		; 1C78: C0
    dta $17		; 1C79: 17
    dta $D0		; 1C7A: D0
    dta $F5		; 1C7B: F5
    dta $A9		; 1C7C: A9
    dta $1		; 1C7D: 01
    dta $99		; 1C7E: 99
    dta $7E		; 1C7F: 7E
    dta $4		; 1C80: 04
    dta $4C		; 1C81: 4C
    dta $85		; 1C82: 85
    dta $1A		; 1C83: 1A
    dta $A2		; 1C84: A2
    dta $0		; 1C85: 00
    dta $86		; 1C86: 86
    dta $DF		; 1C87: DF
    dta $B5		; 1C88: B5
    dta $E9		; 1C89: E9
    dta $10		; 1C8A: 10
    dta $3		; 1C8B: 03
    dta $4C		; 1C8C: 4C
    dta $11		; 1C8D: 11
    dta $1C		; 1C8E: 1C
    dta $BD		; 1C8F: BD
    dta $7		; 1C90: 07
    dta $1B		; 1C91: 1B
    dta $85		; 1C92: 85
    dta $EC		; 1C93: EC
    dta $B4		; 1C94: B4
    dta $E0		; 1C95: E0
    dta $B5		; 1C96: B5
    dta $E6		; 1C97: E6
    dta $A		; 1C98: 0A
    dta $79		; 1C99: 79
    dta $6B		; 1C9A: 6B
    dta $1C		; 1C9B: 1C
    dta $AA		; 1C9C: AA
    dta $BD		; 1C9D: BD
    dta $32		; 1C9E: 32
    dta $1C		; 1C9F: 1C
    dta $85		; 1CA0: 85
    dta $8C		; 1CA1: 8C
    dta $BD		; 1CA2: BD
    dta $33		; 1CA3: 33
    dta $1C		; 1CA4: 1C
    dta $85		; 1CA5: 85
    dta $8D		; 1CA6: 8D
    dta $A0		; 1CA7: A0
    dta $0		; 1CA8: 00
    dta $84		; 1CA9: 84
    dta $ED		; 1CAA: ED
    dta $A6		; 1CAB: A6
    dta $EC		; 1CAC: EC
    dta $BD		; 1CAD: BD
    dta $7E		; 1CAE: 7E
    dta $4		; 1CAF: 04
    dta $C9		; 1CB0: C9
    dta $2		; 1CB1: 02
    dta $90		; 1CB2: 90
    dta $9		; 1CB3: 09
    dta $A9		; 1CB4: A9
    dta $0		; 1CB5: 00
    dta $9D		; 1CB6: 9D
    dta $7E		; 1CB7: 7E
    dta $4		; 1CB8: 04
    dta $A6		; 1CB9: A6
    dta $DF		; 1CBA: DF
    dta $D6		; 1CBB: D6
    dta $E9		; 1CBC: E9
    dta $AA		; 1CBD: AA
    dta $BD		; 1CBE: BD
    dta $2C		; 1CBF: 2C
    dta $1C		; 1CC0: 1C
    dta $8D		; 1CC1: 8D
    dta $B9		; 1CC2: B9
    dta $1B		; 1CC3: 1B
    dta $8D		; 1CC4: 8D
    dta $D		; 1CC5: 0D
    dta $1C		; 1CC6: 1C
    dta $BD		; 1CC7: BD
    dta $2E		; 1CC8: 2E
    dta $1C		; 1CC9: 1C
    dta $8D		; 1CCA: 8D
    dta $BA		; 1CCB: BA
    dta $1B		; 1CCC: 1B
    dta $8D		; 1CCD: 8D
    dta $E9		; 1CCE: E9
    dta $1B		; 1CCF: 1B
    dta $8D		; 1CD0: 8D
    dta $E		; 1CD1: 0E
    dta $1C		; 1CD2: 1C
    dta $BD		; 1CD3: BD
    dta $30		; 1CD4: 30
    dta $1C		; 1CD5: 1C
    dta $8D		; 1CD6: 8D
    dta $E8		; 1CD7: E8
    dta $1B		; 1CD8: 1B
    dta $A2		; 1CD9: A2
    dta $0		; 1CDA: 00
    dta $B1		; 1CDB: B1
    dta $8C		; 1CDC: 8C
    dta $85		; 1CDD: 85
    dta $8E		; 1CDE: 8E
    dta $C8		; 1CDF: C8
    dta $B1		; 1CE0: B1
    dta $0		; 1CE1: 00
    dta $0		; 1CE2: 00
    dta $0		; 1CE3: 00
    dta $0		; 1CE4: 00
    dta $0		; 1CE5: 00
    dta $0		; 1CE6: 00
    dta $0		; 1CE7: 00
    dta $0		; 1CE8: 00
    dta $0		; 1CE9: 00
    dta $0		; 1CEA: 00
    dta $0		; 1CEB: 00
    dta $0		; 1CEC: 00
    dta $0		; 1CED: 00
    dta $0		; 1CEE: 00
    dta $0		; 1CEF: 00
    dta $0		; 1CF0: 00
    dta $0		; 1CF1: 00
    dta $0		; 1CF2: 00
    dta $0		; 1CF3: 00
    dta $0		; 1CF4: 00
    dta $0		; 1CF5: 00
    dta $0		; 1CF6: 00
    dta $0		; 1CF7: 00
    dta $0		; 1CF8: 00
    dta $0		; 1CF9: 00
    dta $0		; 1CFA: 00
    dta $0		; 1CFB: 00
    dta $0		; 1CFC: 00
    dta $0		; 1CFD: 00
    dta $0		; 1CFE: 00
    dta $0		; 1CFF: 00
    dta $6		; 1D00: 06
    dta $FD		; 1D01: FD
    dta $7D		; 1D02: 7D
    dta $21		; 1D03: 21
    dta $9D		; 1D04: 9D
    dta $4B		; 1D05: 4B
    dta $2E		; 1D06: 2E
l1D07			; Callers: 2674
    lda #$01		; 1D07: A9 01
    sta COLDST		; 1D09: 8D 44 02
    ora ($CC,x)		; 1D0C: 01 CC
    jsr l1D75		; 1D0E: 20 75 1D
    lda #$01		; 1D11: A9 01
    sta a:$00D2		; 1D13: 8D D2 00
l1D16			; Callers: 1D25 1D21
    lda SKREST		; 1D16: AD 0A D2
    cmp #$68		; 1D19: C9 68
    bmi l1D24		; 1D1B: 30 07
    cmp #$71		; 1D1D: C9 71
    bpl l1D24		; 1D1F: 10 03
    jmp l1D16		; 1D21: 4C 16 1D
l1D24			; Callers: 1D1B 1D1F
    ror @		; 1D24: 6A
    bcc l1D16		; 1D25: 90 EF
    rol @		; 1D27: 2A
    sta a:$00D1		; 1D28: 8D D1 00
    lda SKREST		; 1D2B: AD 0A D2
    ror @		; 1D2E: 6A
    bcs l1D44		; 1D2F: B0 13
l1D31			; Callers: 1D36 1D3A
    lda SKREST		; 1D31: AD 0A D2
    cmp #$6C		; 1D34: C9 6C
    bmi l1D31		; 1D36: 30 F9
    cmp #$A1		; 1D38: C9 A1
    bpl l1D31		; 1D3A: 10 F5
    sta a:$00D1		; 1D3C: 8D D1 00
    lda #$02		; 1D3F: A9 02
    sta a:$00D2		; 1D41: 8D D2 00
l1D44			; Callers: 1D2F
    jsr l25E8		; 1D44: 20 E8 25
    jsr l1D69		; 1D47: 20 69 1D
    bcs l1D4F		; 1D4A: B0 03
    jmp l2051		; 1D4C: 4C 51 20
l1D4F			; Callers: 1D4A 1D53
    lda SKREST		; 1D4F: AD 0A D2
    ror @		; 1D52: 6A
    bcs l1D4F		; 1D53: B0 FA
    rol @		; 1D55: 2A
    sta a:$00D1		; 1D56: 8D D1 00
    lda #$01		; 1D59: A9 01
    sta a:$00D2		; 1D5B: 8D D2 00
    jsr l25E8		; 1D5E: 20 E8 25
    bpl l1D66		; 1D61: 10 03
    jmp l2051		; 1D63: 4C 51 20
l1D66			; Callers: 1D61
    jmp l1D91		; 1D66: 4C 91 1D
l1D69			; Callers: 1D47
    cpy #$8B		; 1D69: C0 8B
    beq l1D71		; 1D6B: F0 04
    cpy #$90		; 1D6D: C0 90
    bne l1D73		; 1D6F: D0 02
l1D71			; Callers: 1D6B
    sec    		; 1D71: 38
    rts    		; 1D72: 60
l1D73			; Callers: 1D6F
    clc    		; 1D73: 18
    rts    		; 1D74: 60
l1D75			; Callers: 1D0E
    jsr l1D83		; 1D75: 20 83 1D
    lda #$8B		; 1D78: A9 8B
    sta $1D6A		; 1D7A: 8D 6A 1D
    lda #$90		; 1D7D: A9 90
    sta $1D6E		; 1D7F: 8D 6E 1D
    rts    		; 1D82: 60
l1D83			; Callers: l1D75
    lda #$8B		; 1D83: A9 8B
    sta $1D79		; 1D85: 8D 79 1D
    lda #$90		; 1D88: A9 90
    sta $1D7E		; 1D8A: 8D 7E 1D
    rts    		; 1D8D: 60
l1D8E			; Callers: u706 3FAB
    jsr l07E0		; 1D8E: 20 E0 07
l1D91			; Callers: l1D66
    lda #$8E		; 1D91: A9 8E
    sta a:DOSINI		; 1D93: 8D 0C 00
    lda #$1D		; 1D96: A9 1D
    sta a:DOSINI+1		; 1D98: 8D 0D 00
    lda a:SAVMSC		; 1D9B: AD 58 00
    sta $262F		; 1D9E: 8D 2F 26
    lda a:SAVMSC+1		; 1DA1: AD 59 00
    sta $2630		; 1DA4: 8D 30 26
    lda #$2B		; 1DA7: A9 2B
    sta SDLSTL		; 1DA9: 8D 30 02
    lda #$26		; 1DAC: A9 26
    sta SDLSTH		; 1DAE: 8D 31 02
    lda #$0C		; 1DB1: A9 0C
    sta VDSLST		; 1DB3: 8D 00 02
    lda #$26		; 1DB6: A9 26
    sta VDSLST+1		; 1DB8: 8D 01 02
l1DBB			; Callers: 2003
    lda #$40		; 1DBB: A9 40
    sta NMIEN		; 1DBD: 8D 0E D4
    lda #$00		; 1DC0: A9 00
    sta $262A		; 1DC2: 8D 2A 26
    lda #$C0		; 1DC5: A9 C0
    sta NMIEN		; 1DC7: 8D 0E D4
    lda #$01		; 1DCA: A9 01
    sta a:LMARGN		; 1DCC: 8D 52 00
    lda #$89		; 1DCF: A9 89
    sta a:$00CA		; 1DD1: 8D CA 00
    lda #$26		; 1DD4: A9 26
    sta a:$00CB		; 1DD6: 8D CB 00
    lda #$87		; 1DD9: A9 87
    sta a:$00CC		; 1DDB: 8D CC 00
    lda #$26		; 1DDE: A9 26
    sta a:$00CD		; 1DE0: 8D CD 00
    lda #$64		; 1DE3: A9 64
    sta a:$00CE		; 1DE5: 8D CE 00
    lda #$20		; 1DE8: A9 20
    sta a:$00CF		; 1DEA: 8D CF 00
    jsr l2006		; 1DED: 20 06 20
l1DF0			; Callers: 1E66 1E1B
    lda #$B3		; 1DF0: A9 B3
    sta a:$00CE		; 1DF2: 8D CE 00
    lda #$20		; 1DF5: A9 20
    sta a:$00CF		; 1DF7: 8D CF 00
    jsr l2006		; 1DFA: 20 06 20
    ldx #$0D		; 1DFD: A2 0D
l1DFF			; Callers: 1E05
    lda #$00		; 1DFF: A9 00
    sta $2679,x		; 1E01: 9D 79 26
    dex    		; 1E04: CA
    bne l1DFF		; 1E05: D0 F8
    stx a:$00D0		; 1E07: 8E D0 00
l1E0A			; Callers: 1E52 1E5D 1E49 1E4D 1E44 1E23 1E2B
    lda #$40		; 1E0A: A9 40
    sta SHFLOK		; 1E0C: 8D BE 02
    jsr KGETCH		; 1E0F: 20 E2 F6
    ldx a:$00D0		; 1E12: AE D0 00
    cmp #$9B		; 1E15: C9 9B
    beq l1E60		; 1E17: F0 47
    cmp #$9C		; 1E19: C9 9C
    beq l1DF0		; 1E1B: F0 D3
    cmp #$7E		; 1E1D: C9 7E
    bne l1E2E		; 1E1F: D0 0D
    cpx #$00		; 1E21: E0 00
    beq l1E0A		; 1E23: F0 E5
    dec a:$00D0		; 1E25: CE D0 00
    jsr EOUTCH		; 1E28: 20 A4 F6
    jmp l1E0A		; 1E2B: 4C 0A 1E
l1E2E			; Callers: 1E1F
    and #$7F		; 1E2E: 29 7F
    cmp #$2E		; 1E30: C9 2E
    beq l1E4F		; 1E32: F0 1B
    cmp #$2A		; 1E34: C9 2A
    beq l1E4F		; 1E36: F0 17
    cmp #$3F		; 1E38: C9 3F
    beq l1E4F		; 1E3A: F0 13
    cmp #$3A		; 1E3C: C9 3A
    bmi l1E47		; 1E3E: 30 07
    cmp #$41		; 1E40: C9 41
    bpl l1E47		; 1E42: 10 03
    jmp l1E0A		; 1E44: 4C 0A 1E
l1E47			; Callers: 1E3E 1E42
    cmp #$30		; 1E47: C9 30
    bmi l1E0A		; 1E49: 30 BF
    cmp #$5B		; 1E4B: C9 5B
    bpl l1E0A		; 1E4D: 10 BB
l1E4F			; Callers: 1E32 1E36 1E3A
    inx    		; 1E4F: E8
    cpx #$0D		; 1E50: E0 0D
    beq l1E0A		; 1E52: F0 B6
    inc a:$00D0		; 1E54: EE D0 00
    sta $2679,x		; 1E57: 9D 79 26
    jsr EOUTCH		; 1E5A: 20 A4 F6
    jmp l1E0A		; 1E5D: 4C 0A 1E
l1E60			; Callers: 1E17
    inx    		; 1E60: E8
    sta $2679,x		; 1E61: 9D 79 26
    cpx #$01		; 1E64: E0 01
    beq l1DF0		; 1E66: F0 88
    lda #$C6		; 1E68: A9 C6
    sta a:$00CE		; 1E6A: 8D CE 00
    lda #$20		; 1E6D: A9 20
    sta a:$00CF		; 1E6F: 8D CF 00
    jsr l2006		; 1E72: 20 06 20
l1E75			; Callers: 1E7C 1E80
    jsr KGETCH		; 1E75: 20 E2 F6
    and #$7F		; 1E78: 29 7F
    cmp #$31		; 1E7A: C9 31
    bmi l1E75		; 1E7C: 30 F7
    cmp #$35		; 1E7E: C9 35
    bpl l1E75		; 1E80: 10 F3
    sta $22F2		; 1E82: 8D F2 22
    sta $2678		; 1E85: 8D 78 26
    sta $22E7		; 1E88: 8D E7 22
    jsr EOUTCH		; 1E8B: 20 A4 F6
    lda #$9B		; 1E8E: A9 9B
    jsr EOUTCH		; 1E90: 20 A4 F6
    lda #$40		; 1E93: A9 40
    sta NMIEN		; 1E95: 8D 0E D4
    ldx #$10		; 1E98: A2 10
    lda #$03		; 1E9A: A9 03
    sta ICCOM,x		; 1E9C: 9D 42 03
    lda #$77		; 1E9F: A9 77
    sta ICBAL,x		; 1EA1: 9D 44 03
    lda #$26		; 1EA4: A9 26
    sta ICBAH,x		; 1EA6: 9D 45 03
    lda #$04		; 1EA9: A9 04
    sta ICAX1,x		; 1EAB: 9D 4A 03
    jsr CIOV		; 1EAE: 20 56 E4
    bpl l1EB6		; 1EB1: 10 03
    jmp l253B		; 1EB3: 4C 3B 25
l1EB6			; Callers: 1EB1
    ldx #$10		; 1EB6: A2 10
    lda #$07		; 1EB8: A9 07
    sta ICCOM,x		; 1EBA: 9D 42 03
    lda #$02		; 1EBD: A9 02
    sta ICBLL,x		; 1EBF: 9D 48 03
    lda #$00		; 1EC2: A9 00
    sta ICBLH,x		; 1EC4: 9D 49 03
    lda #$87		; 1EC7: A9 87
    sta ICBAL,x		; 1EC9: 9D 44 03
    lda #$26		; 1ECC: A9 26
    sta ICBAH,x		; 1ECE: 9D 45 03
    jsr CIOV		; 1ED1: 20 56 E4
    ldx $2687		; 1ED4: AE 87 26
    ldy $2688		; 1ED7: AC 88 26
    cpx #$FF		; 1EDA: E0 FF
    bne l1EE5		; 1EDC: D0 07
    cpy #$FF		; 1EDE: C0 FF
    beq l1F00		; 1EE0: F0 1E
    jmp l1EED		; 1EE2: 4C ED 1E
l1EE5			; Callers: 1EDC
    cpx #$84		; 1EE5: E0 84
    bne l1EED		; 1EE7: D0 04
    cpy #$09		; 1EE9: C0 09
    beq l1F00		; 1EEB: F0 13
l1EED			; Callers: 1EE7 1EE2
    lda #$97		; 1EED: A9 97
    sta a:$00CE		; 1EEF: 8D CE 00
    lda #$22		; 1EF2: A9 22
    sta a:$00CF		; 1EF4: 8D CF 00
    jsr l2006		; 1EF7: 20 06 20
    jsr l2046		; 1EFA: 20 46 20
    jmp l2566		; 1EFD: 4C 66 25
l1F00			; Callers: 1EEB 1EE0
    lda #$C0		; 1F00: A9 C0
    sta a:$00CE		; 1F02: 8D CE 00
    lda #$22		; 1F05: A9 22
    sta a:$00CF		; 1F07: 8D CF 00
    jsr l2006		; 1F0A: 20 06 20
    ldx #$77		; 1F0D: A2 77
    ldy #$26		; 1F0F: A0 26
    jsr PUTLIN		; 1F11: 20 85 F3
l1F14			; Callers: 1F3D 1F45
    ldx #$10		; 1F14: A2 10
    lda #$07		; 1F16: A9 07
    sta ICCOM,x		; 1F18: 9D 42 03
    lda #$00		; 1F1B: A9 00
    sta ICBLL,x		; 1F1D: 9D 48 03
    sta ICBLH,x		; 1F20: 9D 49 03
    jsr CIOV		; 1F23: 20 56 E4
    bmi l1F5A		; 1F26: 30 32
    ldy #$00		; 1F28: A0 00
    sta ($CA),y		; 1F2A: 91 CA
    inc a:$00CA		; 1F2C: EE CA 00
    lda a:$00CA		; 1F2F: AD CA 00
    bne l1F37		; 1F32: D0 03
    inc a:$00CB		; 1F34: EE CB 00
l1F37			; Callers: 1F32
    lda a:$00CB		; 1F37: AD CB 00
    cmp MEMTOP+1		; 1F3A: CD E6 02
    bne l1F14		; 1F3D: D0 D5
    lda a:$00CA		; 1F3F: AD CA 00
    cmp MEMTOP		; 1F42: CD E5 02
    bmi l1F14		; 1F45: 30 CD
    jsr l2046		; 1F47: 20 46 20
    lda #$70		; 1F4A: A9 70
    sta a:$00CE		; 1F4C: 8D CE 00
    lda #$21		; 1F4F: A9 21
    sta a:$00CF		; 1F51: 8D CF 00
    jsr l2006		; 1F54: 20 06 20
    jmp l2566		; 1F57: 4C 66 25
l1F5A			; Callers: 1F26
    cpy #$88		; 1F5A: C0 88
    beq l1F61		; 1F5C: F0 03
    jmp l253B		; 1F5E: 4C 3B 25
l1F61			; Callers: 1F5C
    lda #$D9		; 1F61: A9 D9
    sta a:$00CE		; 1F63: 8D CE 00
    lda #$20		; 1F66: A9 20
    sta a:$00CF		; 1F68: 8D CF 00
    jsr l2006		; 1F6B: 20 06 20
    jsr l2046		; 1F6E: 20 46 20
    jsr l201D		; 1F71: 20 1D 20
    lda #$16		; 1F74: A9 16
    sta a:$00CE		; 1F76: 8D CE 00
    lda #$21		; 1F79: A9 21
    sta a:$00CF		; 1F7B: 8D CF 00
    jsr l2006		; 1F7E: 20 06 20
    ldx #$10		; 1F81: A2 10
    lda #$0B		; 1F83: A9 0B
    sta ICCOM,x		; 1F85: 9D 42 03
    lda #$07		; 1F88: A9 07
    sta ICBAL,x		; 1F8A: 9D 44 03
    lda #$23		; 1F8D: A9 23
    sta ICBAH,x		; 1F8F: 9D 45 03
    lda #$34		; 1F92: A9 34
    sta ICBLL,x		; 1F94: 9D 48 03
    lda #$02		; 1F97: A9 02
    sta ICBLH,x		; 1F99: 9D 49 03
    jsr CIOV		; 1F9C: 20 56 E4
    bpl l1FA4		; 1F9F: 10 03
    jmp l253B		; 1FA1: 4C 3B 25
l1FA4			; Callers: 1F9F
    jsr l2046		; 1FA4: 20 46 20
    lda #$0C		; 1FA7: A9 0C
    sta CH		; 1FA9: 8D FC 02
    jsr l201D		; 1FAC: 20 1D 20
l1FAF			; Callers: 1FD8 1FE0
    ldy #$00		; 1FAF: A0 00
    ldx #$10		; 1FB1: A2 10
    lda #$0B		; 1FB3: A9 0B
    sta ICCOM,x		; 1FB5: 9D 42 03
    lda #$00		; 1FB8: A9 00
    sta ICBLL,x		; 1FBA: 9D 48 03
    sta ICBLH,x		; 1FBD: 9D 49 03
    lda ($CC),y		; 1FC0: B1 CC
    jsr CIOV		; 1FC2: 20 56 E4
    bpl l1FCA		; 1FC5: 10 03
    jmp l253B		; 1FC7: 4C 3B 25
l1FCA			; Callers: 1FC5
    inc a:$00CC		; 1FCA: EE CC 00
    lda a:$00CC		; 1FCD: AD CC 00
    bne l1FD5		; 1FD0: D0 03
    inc a:$00CD		; 1FD2: EE CD 00
l1FD5			; Callers: 1FD0
    cmp a:$00CA		; 1FD5: CD CA 00
    bne l1FAF		; 1FD8: D0 D5
    lda a:$00CD		; 1FDA: AD CD 00
    cmp a:$00CB		; 1FDD: CD CB 00
    bne l1FAF		; 1FE0: D0 CD
    jsr l2046		; 1FE2: 20 46 20
    lda #$00		; 1FE5: A9 00
    sta a:ATRACT		; 1FE7: 8D 4D 00
    lda #$39		; 1FEA: A9 39
    sta a:$00CE		; 1FEC: 8D CE 00
    lda #$21		; 1FEF: A9 21
    sta a:$00CF		; 1FF1: 8D CF 00
    jsr l2006		; 1FF4: 20 06 20
l1FF7			; Callers: 2573 2001
    lda #$FF		; 1FF7: A9 FF
    sta CH		; 1FF9: 8D FC 02
    jsr KGETCH		; 1FFC: 20 E2 F6
    cmp #$9B		; 1FFF: C9 9B
    bne l1FF7		; 2001: D0 F4
    jmp l1DBB		; 2003: 4C BB 1D
l2006			; Callers: 1DED 2014 2019 1DFA 1E72 1EF7 2570 1F0A 1F6B 2580 2563 1F7E 1FF4 1F54 205B
    ldy #$00		; 2006: A0 00
    lda ($CE),y		; 2008: B1 CE
    cmp #$FF		; 200A: C9 FF
    beq l201C		; 200C: F0 0E
    jsr EOUTCH		; 200E: 20 A4 F6
    inc a:$00CE		; 2011: EE CE 00
    bne l2006		; 2014: D0 F0
    inc a:$00CF		; 2016: EE CF 00
    jmp l2006		; 2019: 4C 06 20
l201C			; Callers: 200C
    rts    		; 201C: 60
l201D			; Callers: 1F71 1FAC
    ldx #$10		; 201D: A2 10
    lda #$03		; 201F: A9 03
    sta ICCOM,x		; 2021: 9D 42 03
    lda #$61		; 2024: A9 61
    sta ICBAL,x		; 2026: 9D 44 03
    lda #$20		; 2029: A9 20
    sta ICBAH,x		; 202B: 9D 45 03
    lda #$08		; 202E: A9 08
    sta ICAX1,x		; 2030: 9D 4A 03
    lda #$80		; 2033: A9 80
    sta ICAX2,x		; 2035: 9D 4B 03
    jsr CIOV		; 2038: 20 56 E4
    bpl l2040		; 203B: 10 03
    jmp l253B		; 203D: 4C 3B 25
l2040			; Callers: 203B
    lda #$FE		; 2040: A9 FE
    sta a:ATRACT		; 2042: 8D 4D 00
    rts    		; 2045: 60
l2046			; Callers: 1EFA 1F6E 2583 l25E2 2541 l1FA4 1FE2 1F47
    ldx #$10		; 2046: A2 10
    lda #$0C		; 2048: A9 0C
    sta ICCOM,x		; 204A: 9D 42 03
    jsr CIOV		; 204D: 20 56 E4
    rts    		; 2050: 60
l2051			; Callers: 1D63 1D4C
    lda #$92		; 2051: A9 92
    sta a:$00CE		; 2053: 8D CE 00
    lda #$21		; 2056: A9 21
    sta a:$00CF		; 2058: 8D CF 00
    jsr l2006		; 205B: 20 06 20
    jmp IRQVEC		; 205E: 4C FE FF
    dta $43		; 2061: 43
    dta $3A		; 2062: 3A
    dta $9B		; 2063: 9B
    dta $7D		; 2064: 7D
    dta $9B		; 2065: 9B
    dta $9B		; 2066: 9B
    dta $20		; 2067: 20
    dta $20		; 2068: 20
    dta $20		; 2069: 20
    dta $42		; 206A: 42
    dta $6F		; 206B: 6F
    dta $6F		; 206C: 6F
    dta $74		; 206D: 74
    dta $20		; 206E: 20
    dta $43		; 206F: 43
    dta $61		; 2070: 61
    dta $73		; 2071: 73
    dta $73		; 2072: 73
    dta $65		; 2073: 65
    dta $74		; 2074: 74
l2075			; Callers: l18EC
    dta $74		; 2075: 74
    dta $65		; 2076: 65
    dta $20		; 2077: 20
    dta $4D		; 2078: 4D
    dta $61		; 2079: 61
    dta $6B		; 207A: 6B
    dta $65		; 207B: 65
    dta $72		; 207C: 72
    dta $20		; 207D: 20
    dta $76		; 207E: 76
    dta $65		; 207F: 65
    dta $72		; 2080: 72
    dta $73		; 2081: 73
    dta $69		; 2082: 69
    dta $6F		; 2083: 6F
    dta $6E		; 2084: 6E
    dta $20		; 2085: 20
    dta $31		; 2086: 31
    dta $2E		; 2087: 2E
    dta $30		; 2088: 30
    dta $9B		; 2089: 9B
    dta $43		; 208A: 43
    dta $6F		; 208B: 6F
    dta $70		; 208C: 70
    dta $79		; 208D: 79
    dta $72		; 208E: 72
    dta $69		; 208F: 69
    dta $67		; 2090: 67
    dta $68		; 2091: 68
    dta $74		; 2092: 74
    dta $20		; 2093: 20
    dta $31		; 2094: 31
    dta $39		; 2095: 39
    dta $38		; 2096: 38
    dta $32		; 2097: 32
    dta $20		; 2098: 20
    dta $28		; 2099: 28
    dta $63		; 209A: 63
    dta $29		; 209B: 29
    dta $20		; 209C: 20
    dta $62		; 209D: 62
    dta $79		; 209E: 79
    dta $20		; 209F: 20
    dta $4E		; 20A0: 4E
    dta $75		; 20A1: 75
    dta $64		; 20A2: 64
    dta $6D		; 20A3: 6D
    dta $65		; 20A4: 65
    dta $68		; 20A5: 68
    dta $69		; 20A6: 69
    dta $20		; 20A7: 20
    dta $53		; 20A8: 53
    dta $6F		; 20A9: 6F
    dta $66		; 20AA: 66
    dta $74		; 20AB: 74
    dta $77		; 20AC: 77
    dta $61		; 20AD: 61
    dta $72		; 20AE: 72
    dta $65		; 20AF: 65
    dta $9B		; 20B0: 9B
    dta $9B		; 20B1: 9B
    dta $FF		; 20B2: FF
    dta $9C		; 20B3: 9C
    dta $45		; 20B4: 45
    dta $6E		; 20B5: 6E
    dta $74		; 20B6: 74
    dta $65		; 20B7: 65
    dta $72		; 20B8: 72
    dta $20		; 20B9: 20
    dta $46		; 20BA: 46
    dta $69		; 20BB: 69
    dta $6C		; 20BC: 6C
    dta $65		; 20BD: 65
    dta $6E		; 20BE: 6E
    dta $61		; 20BF: 61
    dta $6D		; 20C0: 6D
    dta $65		; 20C1: 65
    dta $20		; 20C2: 20
    dta $3A		; 20C3: 3A
    dta $20		; 20C4: 20
    dta $FF		; 20C5: FF
    dta $9B		; 20C6: 9B
    dta $44		; 20C7: 44
    dta $72		; 20C8: 72
    dta $69		; 20C9: 69
    dta $76		; 20CA: 76
    dta $65		; 20CB: 65
    dta $20		; 20CC: 20
    dta $28		; 20CD: 28
    dta $31		; 20CE: 31
    dta $2E		; 20CF: 2E
    dta $2E		; 20D0: 2E
    dta $34		; 20D1: 34
    dta $29		; 20D2: 29
    dta $20		; 20D3: 20
    dta $20		; 20D4: 20
    dta $20		; 20D5: 20
    dta $3A		; 20D6: 3A
    dta $20		; 20D7: 20
    dta $FF		; 20D8: FF
    dta $9B		; 20D9: 9B
    dta $72		; 20DA: 72
    dta $65		; 20DB: 65
    dta $77		; 20DC: 77
    dta $69		; 20DD: 69
    dta $6E		; 20DE: 6E
    dta $64		; 20DF: 64
    dta $20		; 20E0: 20
    dta $63		; 20E1: 63
    dta $61		; 20E2: 61
    dta $73		; 20E3: 73
    dta $73		; 20E4: 73
    dta $65		; 20E5: 65
    dta $74		; 20E6: 74
    dta $74		; 20E7: 74
    dta $65		; 20E8: 65
    dta $2C		; 20E9: 2C
    dta $20		; 20EA: 20
    dta $64		; 20EB: 64
    dta $65		; 20EC: 65
    dta $70		; 20ED: 70
    dta $72		; 20EE: 72
    dta $65		; 20EF: 65
    dta $73		; 20F0: 73
    dta $73		; 20F1: 73
    dta $20		; 20F2: 20
    dta $50		; 20F3: 50
    dta $4C		; 20F4: 4C
    dta $41		; 20F5: 41
    dta $59		; 20F6: 59
    dta $9B		; 20F7: 9B
    dta $61		; 20F8: 61
    dta $6E		; 20F9: 6E
    dta $64		; 20FA: 64
    dta $20		; 20FB: 20
    dta $52		; 20FC: 52
    dta $45		; 20FD: 45
    dta $43		; 20FE: 43
    dta $4F		; 20FF: 4F
    dta $52		; 2100: 52
    dta $44		; 2101: 44
    dta $2C		; 2102: 2C
    dta $20		; 2103: 20
    dta $61		; 2104: 61
    dta $6E		; 2105: 6E
    dta $64		; 2106: 64
    dta $20		; 2107: 20
    dta $68		; 2108: 68
    dta $69		; 2109: 69
    dta $74		; 210A: 74
    dta $20		; 210B: 20
    dta $3C		; 210C: 3C
    dta $D2		; 210D: D2
    dta $C5		; 210E: C5
    dta $D4		; 210F: D4
    dta $D5		; 2110: D5
    dta $D2		; 2111: D2
    dta $CE		; 2112: CE
    dta $3E		; 2113: 3E
    dta $9B		; 2114: 9B
    dta $FF		; 2115: FF
    dta $9B		; 2116: 9B
    dta $77		; 2117: 77
    dta $72		; 2118: 72
    dta $69		; 2119: 69
    dta $74		; 211A: 74
    dta $69		; 211B: 69
    dta $6E		; 211C: 6E
    dta $67		; 211D: 67
    dta $20		; 211E: 20
    dta $63		; 211F: 63
    dta $61		; 2120: 61
    dta $73		; 2121: 73
    dta $73		; 2122: 73
    dta $65		; 2123: 65
    dta $74		; 2124: 74
    dta $74		; 2125: 74
    dta $65		; 2126: 65
    dta $20		; 2127: 20
    dta $62		; 2128: 62
    dta $6F		; 2129: 6F
    dta $6F		; 212A: 6F
    dta $74		; 212B: 74
    dta $20		; 212C: 20
    dta $74		; 212D: 74
    dta $61		; 212E: 61
    dta $70		; 212F: 70
    dta $65		; 2130: 65
    dta $20		; 2131: 20
    dta $2E		; 2132: 2E
    dta $2E		; 2133: 2E
    dta $2E		; 2134: 2E
    dta $2E		; 2135: 2E
    dta $2E		; 2136: 2E
    dta $20		; 2137: 20
    dta $FF		; 2138: FF
    dta $9B		; 2139: 9B
    dta $9B		; 213A: 9B
    dta $FD		; 213B: FD
    dta $42		; 213C: 42
    dta $6F		; 213D: 6F
    dta $6F		; 213E: 6F
    dta $74		; 213F: 74
    dta $20		; 2140: 20
    dta $43		; 2141: 43
    dta $61		; 2142: 61
    dta $73		; 2143: 73
    dta $73		; 2144: 73
    dta $65		; 2145: 65
    dta $74		; 2146: 74
    dta $74		; 2147: 74
    dta $65		; 2148: 65
    dta $20		; 2149: 20
    dta $43		; 214A: 43
    dta $6F		; 214B: 6F
    dta $6D		; 214C: 6D
    dta $70		; 214D: 70
    dta $6C		; 214E: 6C
    dta $65		; 214F: 65
    dta $74		; 2150: 74
    dta $65		; 2151: 65
    dta $64		; 2152: 64
    dta $FD		; 2153: FD
    dta $9B		; 2154: 9B
    dta $9B		; 2155: 9B
    dta $74		; 2156: 74
    dta $79		; 2157: 79
    dta $70		; 2158: 70
    dta $65		; 2159: 65
    dta $20		; 215A: 20
    dta $3C		; 215B: 3C
    dta $D2		; 215C: D2
    dta $C5		; 215D: C5
    dta $D4		; 215E: D4
    dta $D5		; 215F: D5
    dta $D2		; 2160: D2
    dta $CE		; 2161: CE
    dta $3E		; 2162: 3E
    dta $20		; 2163: 20
    dta $74		; 2164: 74
    dta $6F		; 2165: 6F
    dta $20		; 2166: 20
    dta $63		; 2167: 63
    dta $6F		; 2168: 6F
    dta $6E		; 2169: 6E
    dta $74		; 216A: 74
    dta $69		; 216B: 69
    dta $6E		; 216C: 6E
    dta $75		; 216D: 75
    dta $65		; 216E: 65
    dta $FF		; 216F: FF
    dta $9B		; 2170: 9B
    dta $FD		; 2171: FD
    dta $C9		; 2172: C9
    dta $CE		; 2173: CE
    dta $D3		; 2174: D3
    dta $D5		; 2175: D5
    dta $C6		; 2176: C6
    dta $C6		; 2177: C6
    dta $C9		; 2178: C9
    dta $C3		; 2179: C3
    dta $C9		; 217A: C9
    dta $C5		; 217B: C5
    dta $CE		; 217C: CE
    dta $D4		; 217D: D4
    dta $A0		; 217E: A0
    dta $CD		; 217F: CD
    dta $C5		; 2180: C5
    dta $CD		; 2181: CD
    dta $CF		; 2182: CF
    dta $D2		; 2183: D2
    dta $D9		; 2184: D9
    dta $A0		; 2185: A0
    dta $C6		; 2186: C6
    dta $CF		; 2187: CF
    dta $D2		; 2188: D2
    dta $A0		; 2189: A0
    dta $D3		; 218A: D3
    dta $CF		; 218B: CF
    dta $D2		; 218C: D2
    dta $D4		; 218D: D4
    dta $FD		; 218E: FD
    dta $9B		; 218F: 9B
    dta $9B		; 2190: 9B
    dta $FF		; 2191: FF
    dta $7D		; 2192: 7D
    dta $9B		; 2193: 9B
    dta $9B		; 2194: 9B
    dta $64		; 2195: 64
    dta $69		; 2196: 69
    dta $73		; 2197: 73
    dta $6B		; 2198: 6B
    dta $20		; 2199: 20
    dta $66		; 219A: 66
    dta $61		; 219B: 61
    dta $69		; 219C: 69
    dta $6C		; 219D: 6C
    dta $75		; 219E: 75
    dta $72		; 219F: 72
    dta $65		; 21A0: 65
    dta $2C		; 21A1: 2C
    dta $20		; 21A2: 20
    dta $66		; 21A3: 66
    dta $6F		; 21A4: 6F
    dta $72		; 21A5: 72
    dta $20		; 21A6: 20
    dta $69		; 21A7: 69
    dta $6E		; 21A8: 6E
    dta $66		; 21A9: 66
    dta $6F		; 21AA: 6F
    dta $72		; 21AB: 72
    dta $6D		; 21AC: 6D
    dta $61		; 21AD: 61
    dta $74		; 21AE: 74
    dta $69		; 21AF: 69
    dta $6F		; 21B0: 6F
    dta $6E		; 21B1: 6E
    dta $9B		; 21B2: 9B
    dta $63		; 21B3: 63
    dta $6F		; 21B4: 6F
    dta $6E		; 21B5: 6E
    dta $73		; 21B6: 73
    dta $75		; 21B7: 75
    dta $6C		; 21B8: 6C
    dta $74		; 21B9: 74
    dta $20		; 21BA: 20
    dta $75		; 21BB: 75
    dta $73		; 21BC: 73
    dta $65		; 21BD: 65
    dta $72		; 21BE: 72
    dta $27		; 21BF: 27
    dta $73		; 21C0: 73
    dta $20		; 21C1: 20
    dta $6D		; 21C2: 6D
    dta $61		; 21C3: 61
    dta $6E		; 21C4: 6E
    dta $75		; 21C5: 75
    dta $61		; 21C6: 61
    dta $6C		; 21C7: 6C
    dta $9B		; 21C8: 9B
    dta $9B		; 21C9: 9B
    dta $9B		; 21CA: 9B
    dta $20		; 21CB: 20
    dta $20		; 21CC: 20
    dta $20		; 21CD: 20
    dta $20		; 21CE: 20
    dta $20		; 21CF: 20
    dta $20		; 21D0: 20
    dta $20		; 21D1: 20
    dta $20		; 21D2: 20
    dta $20		; 21D3: 20
    dta $20		; 21D4: 20
    dta $4E		; 21D5: 4E
    dta $75		; 21D6: 75
    dta $64		; 21D7: 64
    dta $6D		; 21D8: 6D
    dta $65		; 21D9: 65
    dta $68		; 21DA: 68
    dta $69		; 21DB: 69
    dta $20		; 21DC: 20
    dta $53		; 21DD: 53
    dta $6F		; 21DE: 6F
    dta $66		; 21DF: 66
    dta $74		; 21E0: 74
    dta $77		; 21E1: 77
    dta $61		; 21E2: 61
    dta $72		; 21E3: 72
    dta $65		; 21E4: 65
    dta $9B		; 21E5: 9B
    dta $20		; 21E6: 20
    dta $20		; 21E7: 20
    dta $20		; 21E8: 20
    dta $20		; 21E9: 20
    dta $20		; 21EA: 20
    dta $20		; 21EB: 20
    dta $20		; 21EC: 20
    dta $20		; 21ED: 20
    dta $20		; 21EE: 20
    dta $20		; 21EF: 20
    dta $34		; 21F0: 34
    dta $39		; 21F1: 39
    dta $35		; 21F2: 35
    dta $20		; 21F3: 20
    dta $4F		; 21F4: 4F
    dta $6C		; 21F5: 6C
    dta $64		; 21F6: 64
    dta $20		; 21F7: 20
    dta $59		; 21F8: 59
    dta $6F		; 21F9: 6F
    dta $72		; 21FA: 72
    dta $6B		; 21FB: 6B
    dta $20		; 21FC: 20
    dta $52		; 21FD: 52
    dta $64		; 21FE: 64
    dta $2E		; 21FF: 2E
    dta $9B		; 2200: 9B
    dta $20		; 2201: 20
    dta $20		; 2202: 20
    dta $20		; 2203: 20
    dta $20		; 2204: 20
    dta $20		; 2205: 20
    dta $20		; 2206: 20
    dta $20		; 2207: 20
    dta $20		; 2208: 20
    dta $20		; 2209: 20
    dta $20		; 220A: 20
    dta $20		; 220B: 20
    dta $20		; 220C: 20
    dta $20		; 220D: 20
    dta $53		; 220E: 53
    dta $75		; 220F: 75
    dta $69		; 2210: 69
    dta $74		; 2211: 74
    dta $65		; 2212: 65
    dta $20		; 2213: 20
    dta $34		; 2214: 34
    dta $32		; 2215: 32
    dta $35		; 2216: 35
    dta $9B		; 2217: 9B
    dta $20		; 2218: 20
    dta $20		; 2219: 20
    dta $20		; 221A: 20
    dta $20		; 221B: 20
    dta $20		; 221C: 20
    dta $20		; 221D: 20
    dta $4A		; 221E: 4A
    dta $65		; 221F: 65
    dta $6E		; 2220: 6E
    dta $6B		; 2221: 6B
    dta $69		; 2222: 69
    dta $6E		; 2223: 6E
    dta $74		; 2224: 74
    dta $6F		; 2225: 6F
    dta $77		; 2226: 77
    dta $6E		; 2227: 6E
    dta $2C		; 2228: 2C
    dta $20		; 2229: 20
    dta $50		; 222A: 50
    dta $65		; 222B: 65
    dta $6E		; 222C: 6E
    dta $6E		; 222D: 6E
    dta $73		; 222E: 73
    dta $79		; 222F: 79
    dta $6C		; 2230: 6C
    dta $76		; 2231: 76
    dta $61		; 2232: 61
    dta $6E		; 2233: 6E
    dta $69		; 2234: 69
    dta $61		; 2235: 61
    dta $9B		; 2236: 9B
    dta $20		; 2237: 20
    dta $20		; 2238: 20
    dta $20		; 2239: 20
    dta $20		; 223A: 20
    dta $20		; 223B: 20
    dta $20		; 223C: 20
    dta $20		; 223D: 20
    dta $20		; 223E: 20
    dta $20		; 223F: 20
    dta $20		; 2240: 20
    dta $20		; 2241: 20
    dta $20		; 2242: 20
    dta $20		; 2243: 20
    dta $20		; 2244: 20
    dta $20		; 2245: 20
    dta $31		; 2246: 31
    dta $39		; 2247: 39
    dta $30		; 2248: 30
    dta $34		; 2249: 34
    dta $36		; 224A: 36
    dta $9B		; 224B: 9B
    dta $9B		; 224C: 9B
    dta $9B		; 224D: 9B
    dta $6F		; 224E: 6F
    dta $72		; 224F: 72
    dta $20		; 2250: 20
    dta $63		; 2251: 63
    dta $61		; 2252: 61
    dta $6C		; 2253: 6C
    dta $6C		; 2254: 6C
    dta $3A		; 2255: 3A
    dta $9B		; 2256: 9B
    dta $9B		; 2257: 9B
    dta $20		; 2258: 20
    dta $20		; 2259: 20
    dta $20		; 225A: 20
    dta $20		; 225B: 20
    dta $20		; 225C: 20
    dta $20		; 225D: 20
    dta $20		; 225E: 20
    dta $20		; 225F: 20
    dta $20		; 2260: 20
    dta $20		; 2261: 20
    dta $20		; 2262: 20
    dta $28		; 2263: 28
    dta $32		; 2264: 32
    dta $31		; 2265: 31
    dta $35		; 2266: 35
    dta $29		; 2267: 29
    dta $20		; 2268: 20
    dta $36		; 2269: 36
    dta $33		; 226A: 33
    dta $35		; 226B: 35
    dta $2D		; 226C: 2D
    dta $32		; 226D: 32
    dta $37		; 226E: 37
    dta $32		; 226F: 32
    dta $32		; 2270: 32
    dta $9B		; 2271: 9B
    dta $9B		; 2272: 9B
    dta $9B		; 2273: 9B
    dta $20		; 2274: 20
    dta $20		; 2275: 20
    dta $20		; 2276: 20
    dta $5B		; 2277: 5B
    dta $42		; 2278: 42
    dta $4F		; 2279: 4F
    dta $4F		; 227A: 4F
    dta $54		; 227B: 54
    dta $20		; 227C: 20
    dta $43		; 227D: 43
    dta $41		; 227E: 41
    dta $53		; 227F: 53
    dta $53		; 2280: 53
    dta $45		; 2281: 45
    dta $54		; 2282: 54
    dta $54		; 2283: 54
    dta $45		; 2284: 45
    dta $20		; 2285: 20
    dta $4D		; 2286: 4D
    dta $41		; 2287: 41
    dta $4B		; 2288: 4B
    dta $45		; 2289: 45
    dta $52		; 228A: 52
    dta $20		; 228B: 20
    dta $2D		; 228C: 2D
    dta $20		; 228D: 20
    dta $34		; 228E: 34
    dta $33		; 228F: 33
    dta $54		; 2290: 54
    dta $30		; 2291: 30
    dta $36		; 2292: 36
    dta $31		; 2293: 31
    dta $DD		; 2294: DD
    dta $1E		; 2295: 1E
    dta $FF		; 2296: FF
    dta $9B		; 2297: 9B
    dta $53		; 2298: 53
    dta $50		; 2299: 50
    dta $45		; 229A: 45
    dta $43		; 229B: 43
    dta $49		; 229C: 49
    dta $46		; 229D: 46
    dta $49		; 229E: 49
    dta $45		; 229F: 45
    dta $44		; 22A0: 44
    dta $20		; 22A1: 20
    dta $46		; 22A2: 46
    dta $49		; 22A3: 49
    dta $4C		; 22A4: 4C
    dta $45		; 22A5: 45
    dta $20		; 22A6: 20
    dta $49		; 22A7: 49
    dta $53		; 22A8: 53
    dta $20		; 22A9: 20
    dta $4E		; 22AA: 4E
    dta $4F		; 22AB: 4F
    dta $54		; 22AC: 54
    dta $20		; 22AD: 20
    dta $42		; 22AE: 42
    dta $49		; 22AF: 49
    dta $4E		; 22B0: 4E
    dta $41		; 22B1: 41
    dta $52		; 22B2: 52
    dta $59		; 22B3: 59
    dta $20		; 22B4: 20
    dta $4C		; 22B5: 4C
    dta $4F		; 22B6: 4F
    dta $41		; 22B7: 41
    dta $44		; 22B8: 44
    dta $41		; 22B9: 41
    dta $42		; 22BA: 42
    dta $4C		; 22BB: 4C
    dta $45		; 22BC: 45
    dta $9B		; 22BD: 9B
    dta $9B		; 22BE: 9B
    dta $FF		; 22BF: FF
    dta $9B		; 22C0: 9B
    dta $4C		; 22C1: 4C
    dta $4F		; 22C2: 4F
    dta $41		; 22C3: 41
    dta $44		; 22C4: 44
    dta $49		; 22C5: 49
    dta $4E		; 22C6: 4E
    dta $47		; 22C7: 47
    dta $20		; 22C8: 20
    dta $2E		; 22C9: 2E
    dta $2E		; 22CA: 2E
    dta $2E		; 22CB: 2E
    dta $2E		; 22CC: 2E
    dta $2E		; 22CD: 2E
    dta $2E		; 22CE: 2E
    dta $2E		; 22CF: 2E
    dta $20		; 22D0: 20
    dta $FF		; 22D1: FF
    dta $9B		; 22D2: 9B
    dta $74		; 22D3: 74
    dta $68		; 22D4: 68
    dta $65		; 22D5: 65
    dta $20		; 22D6: 20
    dta $66		; 22D7: 66
    dta $69		; 22D8: 69
    dta $6C		; 22D9: 6C
    dta $65		; 22DA: 65
    dta $73		; 22DB: 73
    dta $20		; 22DC: 20
    dta $6F		; 22DD: 6F
    dta $6E		; 22DE: 6E
    dta $20		; 22DF: 20
    dta $64		; 22E0: 64
    dta $72		; 22E1: 72
    dta $69		; 22E2: 69
    dta $76		; 22E3: 76
    dta $65		; 22E4: 65
    dta $20		; 22E5: 20
    dta $23		; 22E6: 23
    dta $0		; 22E7: 00 Access: 1E88
    dta $20		; 22E8: 20
    dta $61		; 22E9: 61
    dta $72		; 22EA: 72
    dta $65		; 22EB: 65
    dta $20		; 22EC: 20
    dta $3A		; 22ED: 3A
    dta $9B		; 22EE: 9B
    dta $9B		; 22EF: 9B
    dta $FF		; 22F0: FF
    dta $44		; 22F1: 44
    dta $31		; 22F2: 31 Access: 1E82
    dta $3A		; 22F3: 3A
    dta $2A		; 22F4: 2A
    dta $2E		; 22F5: 2E
    dta $2A		; 22F6: 2A
    dta $9B		; 22F7: 9B
    dta $9B		; 22F8: 9B
    dta $45		; 22F9: 45
    dta $52		; 22FA: 52
    dta $52		; 22FB: 52
    dta $4F		; 22FC: 4F
    dta $52		; 22FD: 52
    dta $20		; 22FE: 20
    dta $2D		; 22FF: 2D
    dta $20		; 2300: 20
    dta $23		; 2301: 23
    dta $31		; 2302: 31
    dta $0		; 2303: 00 Access: 2556
    dta $0		; 2304: 00 Access: 2553
    dta $9B		; 2305: 9B
    dta $FF		; 2306: FF
    dta $20		; 2307: 20
    dta $5		; 2308: 05
    dta $0		; 2309: 00
    dta $7		; 230A: 07
    dta $20		; 230B: 20
    dta $7		; 230C: 07
    dta $20		; 230D: 20
    dta $F4		; 230E: F4
    dta $8		; 230F: 08
    dta $4C		; 2310: 4C
    dta $ED		; 2311: ED
    dta $F2		; 2312: F2
    dta $56		; 2313: 56
    dta $FF		; 2314: FF
    dta $55		; 2315: 55
    dta $57		; 2316: 57
    dta $52		; 2317: 52
    dta $3		; 2318: 03
    dta $40		; 2319: 40
    dta $2F		; 231A: 2F
    dta $EF		; 231B: EF
    dta $17		; 231C: 17
    dta $2F		; 231D: 2F
    dta $7		; 231E: 07
    dta $37		; 231F: 37
    dta $2F		; 2320: 2F
    dta $A		; 2321: 0A
    dta $56		; 2322: 56
    dta $FE		; 2323: FE
    dta $72		; 2324: 72
    dta $3		; 2325: 03
    dta $40		; 2326: 40
    dta $52		; 2327: 52
    dta $3		; 2328: 03
    dta $40		; 2329: 40
    dta $F		; 232A: 0F
    dta $F9		; 232B: F9
    dta $E7		; 232C: E7
    dta $97		; 232D: 97
    dta $97		; 232E: 97
    dta $B3		; 232F: B3
    dta $AF		; 2330: AF
    dta $F8		; 2331: F8
    dta $56		; 2332: 56
    dta $FE		; 2333: FE
    dta $72		; 2334: 72
    dta $F		; 2335: 0F
    dta $FD		; 2336: FD
    dta $56		; 2337: 56
    dta $F8		; 2338: F8
    dta $72		; 2339: 72
    dta $AD		; 233A: AD
    dta $FF		; 233B: FF
    dta $56		; 233C: 56
    dta $F5		; 233D: F5
    dta $72		; 233E: 72
    dta $AA		; 233F: AA
    dta $FF		; 2340: FF
    dta $72		; 2341: 72
    dta $AB		; 2342: AB
    dta $FF		; 2343: FF
    dta $5D		; 2344: 5D
    dta $1		; 2345: 01
    dta $5F		; 2346: 5F
    dta $F7		; 2347: F7
    dta $DF		; 2348: DF
    dta $7A		; 2349: 7A
    dta $C		; 234A: 0C
    dta $DF		; 234B: DF
    dta $1D		; 234C: 1D
    dta $9		; 234D: 09
    dta $36		; 234E: 36
    dta $E4		; 234F: E4
    dta $2F		; 2350: 2F
    dta $6		; 2351: 06
    dta $97		; 2352: 97
    dta $97		; 2353: 97
    dta $B3		; 2354: B3
    dta $A4		; 2355: A4
    dta $F8		; 2356: F8
    dta $56		; 2357: 56
    dta $A4		; 2358: A4
    dta $72		; 2359: 72
    dta $F5		; 235A: F5
    dta $FF		; 235B: FF
    dta $56		; 235C: 56
    dta $F8		; 235D: F8
    dta $72		; 235E: 72
    dta $F4		; 235F: F4
    dta $FF		; 2360: FF
    dta $15		; 2361: 15
    dta $56		; 2362: 56
    dta $FD		; 2363: FD
    dta $72		; 2364: 72
    dta $AD		; 2365: AD
    dta $FF		; 2366: FF
    dta $56		; 2367: 56
    dta $FF		; 2368: FF
    dta $72		; 2369: 72
    dta $F		; 236A: 0F
    dta $FD		; 236B: FD
    dta $56		; 236C: 56
    dta $82		; 236D: 82
    dta $DF		; 236E: DF
    dta $5B		; 236F: 5B
    dta $9		; 2370: 09
    dta $DF		; 2371: DF
    dta $1A		; 2372: 1A
    dta $F7		; 2373: F7
    dta $5D		; 2374: 5D
    dta $EF		; 2375: EF
    dta $56		; 2376: 56
    dta $FC		; 2377: FC
    dta $62		; 2378: 62
    dta $BD		; 2379: BD
    dta $FC		; 237A: FC
    dta $56		; 237B: 56
    dta $4		; 237C: 04
    dta $62		; 237D: 62
    dta $BB		; 237E: BB
    dta $FC		; 237F: FC
    dta $56		; 2380: 56
    dta $F7		; 2381: F7
    dta $62		; 2382: 62
    dta $BA		; 2383: BA
    dta $FC		; 2384: FC
    dta $56		; 2385: 56
    dta $FB		; 2386: FB
    dta $62		; 2387: 62
    dta $B5		; 2388: B5
    dta $FC		; 2389: FC
    dta $56		; 238A: 56
    dta $7F		; 238B: 7F
    dta $62		; 238C: 62
    dta $B4		; 238D: B4
    dta $FC		; 238E: FC
    dta $56		; 238F: 56
    dta $F3		; 2390: F3
    dta $72		; 2391: 72
    dta $3		; 2392: 03
    dta $FD		; 2393: FD
    dta $DF		; 2394: DF
    dta $A9		; 2395: A9
    dta $1B		; 2396: 1B
    dta $56		; 2397: 56
    dta $FF		; 2398: FF
    dta $72		; 2399: 72
    dta $C9		; 239A: C9
    dta $F6		; 239B: F6
    dta $5D		; 239C: 5D
    dta $EF		; 239D: EF
    dta $56		; 239E: 56
    dta $CB		; 239F: CB
    dta $62		; 23A0: 62
    dta $BB		; 23A1: BB
    dta $FC		; 23A2: FC
    dta $56		; 23A3: 56
    dta $F6		; 23A4: F6
    dta $62		; 23A5: 62
    dta $BA		; 23A6: BA
    dta $FC		; 23A7: FC
    dta $56		; 23A8: 56
    dta $FD		; 23A9: FD
    dta $62		; 23AA: 62
    dta $B7		; 23AB: B7
    dta $FC		; 23AC: FC
    dta $56		; 23AD: 56
    dta $FF		; 23AE: FF
    dta $62		; 23AF: 62
    dta $B6		; 23B0: B6
    dta $FC		; 23B1: FC
    dta $56		; 23B2: 56
    dta $F8		; 23B3: F8
    dta $62		; 23B4: 62
    dta $BD		; 23B5: BD
    dta $FC		; 23B6: FC
    dta $DF		; 23B7: DF
    dta $A9		; 23B8: A9
    dta $1B		; 23B9: 1B
    dta $CF		; 23BA: CF
    dta $DA		; 23BB: DA
    dta $5D		; 23BC: 5D
    dta $EF		; 23BD: EF
    dta $56		; 23BE: 56
    dta $CF		; 23BF: CF
    dta $62		; 23C0: 62
    dta $BB		; 23C1: BB
    dta $FC		; 23C2: FC
    dta $56		; 23C3: 56
    dta $F6		; 23C4: F6
    dta $62		; 23C5: 62
    dta $BA		; 23C6: BA
    dta $FC		; 23C7: FC
    dta $56		; 23C8: 56
    dta $FB		; 23C9: FB
    dta $62		; 23CA: 62
    dta $B7		; 23CB: B7
    dta $FC		; 23CC: FC
    dta $56		; 23CD: 56
    dta $FF		; 23CE: FF
    dta $62		; 23CF: 62
    dta $B6		; 23D0: B6
    dta $FC		; 23D1: FC
    dta $DF		; 23D2: DF
    dta $A9		; 23D3: A9
    dta $1B		; 23D4: 1B
    dta $EF		; 23D5: EF
    dta $E6		; 23D6: E6
    dta $3F		; 23D7: 3F
    dta $77		; 23D8: 77
    dta $2F		; 23D9: 2F
    dta $F9		; 23DA: F9
    dta $DF		; 23DB: DF
    dta $1A		; 23DC: 1A
    dta $F7		; 23DD: F7
    dta $B3		; 23DE: B3
    dta $82		; 23DF: 82
    dta $F7		; 23E0: F7
    dta $67		; 23E1: 67
    dta $B7		; 23E2: B7
    dta $DF		; 23E3: DF
    dta $1A		; 23E4: 1A
    dta $F7		; 23E5: F7
    dta $97		; 23E6: 97
    dta $57		; 23E7: 57
    dta $F		; 23E8: 0F
    dta $F9		; 23E9: F9
    dta $DF		; 23EA: DF
    dta $7E		; 23EB: 7E
    dta $C		; 23EC: 0C
    dta $B3		; 23ED: B3
    dta $82		; 23EE: 82
    dta $F7		; 23EF: F7
    dta $52		; 23F0: 52
    dta $C9		; 23F1: C9
    dta $F6		; 23F2: F6
    dta $2F		; 23F3: 2F
    dta $F0		; 23F4: F0
    dta $52		; 23F5: 52
    dta $CF		; 23F6: CF
    dta $F6		; 23F7: F6
    dta $72		; 23F8: 72
    dta $1F		; 23F9: 1F
    dta $FD		; 23FA: FD
    dta $52		; 23FB: 52
    dta $CE		; 23FC: CE
    dta $F6		; 23FD: F6
    dta $72		; 23FE: 72
    dta $1E		; 23FF: 1E
    dta $FD		; 2400: FD
    dta $31		; 2401: 31
    dta $C9		; 2402: C9
    dta $F6		; 2403: F6
    dta $5D		; 2404: 5D
    dta $EF		; 2405: EF
    dta $52		; 2406: 52
    dta $CF		; 2407: CF
    dta $F6		; 2408: F6
    dta $62		; 2409: 62
    dta $BB		; 240A: BB
    dta $FC		; 240B: FC
    dta $B7		; 240C: B7
    dta $52		; 240D: 52
    dta $CE		; 240E: CE
    dta $F6		; 240F: F6
    dta $62		; 2410: 62
    dta $BA		; 2411: BA
    dta $FC		; 2412: FC
    dta $57		; 2413: 57
    dta $97		; 2414: 97
    dta $37		; 2415: 37
    dta $2F		; 2416: 2F
    dta $E0		; 2417: E0
    dta $57		; 2418: 57
    dta $37		; 2419: 37
    dta $2F		; 241A: 2F
    dta $E4		; 241B: E4
    dta $52		; 241C: 52
    dta $CD		; 241D: CD
    dta $F6		; 241E: F6
    dta $72		; 241F: 72
    dta $CF		; 2420: CF
    dta $F6		; 2421: F6
    dta $52		; 2422: 52
    dta $CC		; 2423: CC
    dta $F6		; 2424: F6
    dta $72		; 2425: 72
    dta $CE		; 2426: CE
    dta $F6		; 2427: F6
    dta $56		; 2428: 56
    dta $CD		; 2429: CD
    dta $62		; 242A: 62
    dta $BB		; 242B: BB
    dta $FC		; 242C: FC
    dta $56		; 242D: 56
    dta $F6		; 242E: F6
    dta $62		; 242F: 62
    dta $BA		; 2430: BA
    dta $FC		; 2431: FC
    dta $56		; 2432: 56
    dta $FD		; 2433: FD
    dta $B3		; 2434: B3
    dta $3C		; 2435: 3C
    dta $F8		; 2436: F8
    dta $52		; 2437: 52
    dta $CD		; 2438: CD
    dta $F6		; 2439: F6
    dta $C7		; 243A: C7
    dta $12		; 243B: 12
    dta $CF		; 243C: CF
    dta $F6		; 243D: F6
    dta $62		; 243E: 62
    dta $B7		; 243F: B7
    dta $FC		; 2440: FC
    dta $52		; 2441: 52
    dta $CC		; 2442: CC
    dta $F6		; 2443: F6
    dta $12		; 2444: 12
    dta $CE		; 2445: CE
    dta $F6		; 2446: F6
    dta $62		; 2447: 62
    dta $B6		; 2448: B6
    dta $FC		; 2449: FC
    dta $52		; 244A: 52
    dta $CE		; 244B: CE
    dta $F6		; 244C: F6
    dta $1		; 244D: 01
    dta $B7		; 244E: B7
    dta $FC		; 244F: FC
    dta $2F		; 2450: 2F
    dta $FC		; 2451: FC
    dta $1		; 2452: 01
    dta $B6		; 2453: B6
    dta $FC		; 2454: FC
    dta $5D		; 2455: 5D
    dta $EF		; 2456: EF
    dta $56		; 2457: 56
    dta $C		; 2458: 0C
    dta $72		; 2459: 72
    dta $1D		; 245A: 1D
    dta $FD		; 245B: FD
    dta $56		; 245C: 56
    dta $F7		; 245D: F7
    dta $72		; 245E: 72
    dta $1C		; 245F: 1C
    dta $FD		; 2460: FD
    dta $DF		; 2461: DF
    dta $A9		; 2462: A9
    dta $1B		; 2463: 1B
    dta $EF		; 2464: EF
    dta $FC		; 2465: FC
    dta $B3		; 2466: B3
    dta $25		; 2467: 25
    dta $F8		; 2468: F8
    dta $52		; 2469: 52
    dta $1D		; 246A: 1D
    dta $FD		; 246B: FD
    dta $72		; 246C: 72
    dta $F5		; 246D: F5
    dta $FF		; 246E: FF
    dta $52		; 246F: 52
    dta $1C		; 2470: 1C
    dta $FD		; 2471: FD
    dta $72		; 2472: 72
    dta $F4		; 2473: F4
    dta $FF		; 2474: FF
    dta $DF		; 2475: DF
    dta $6D		; 2476: 6D
    dta $F7		; 2477: F7
    dta $DF		; 2478: DF
    dta $85		; 2479: 85
    dta $F7		; 247A: F7
    dta $DF		; 247B: DF
    dta $30		; 247C: 30
    dta $F7		; 247D: F7
    dta $B3		; 247E: B3
    dta $4A		; 247F: 4A
    dta $F8		; 2480: F8
    dta $93		; 2481: 93
    dta $1D		; 2482: 1D
    dta $FD		; 2483: FD
    dta $52		; 2484: 52
    dta $1F		; 2485: 1F
    dta $FD		; 2486: FD
    dta $72		; 2487: 72
    dta $F5		; 2488: F5
    dta $FF		; 2489: FF
    dta $52		; 248A: 52
    dta $1E		; 248B: 1E
    dta $FD		; 248C: FD
    dta $72		; 248D: 72
    dta $F4		; 248E: F4
    dta $FF		; 248F: FF
    dta $DF		; 2490: DF
    dta $6D		; 2491: 6D
    dta $F7		; 2492: F7
    dta $DF		; 2493: DF
    dta $30		; 2494: 30
    dta $F7		; 2495: F7
    dta $93		; 2496: 93
    dta $1F		; 2497: 1F
    dta $FD		; 2498: FD
    dta $56		; 2499: 56
    dta $EF		; 249A: EF
    dta $72		; 249B: 72
    dta $FD		; 249C: FD
    dta $FF		; 249D: FF
    dta $56		; 249E: 56
    dta $14		; 249F: 14
    dta $72		; 24A0: 72
    dta $FC		; 24A1: FC
    dta $FF		; 24A2: FF
    dta $60		; 24A3: 60
    dta $A9		; 24A4: A9
    dta $C		; 24A5: 0C
    dta $8D		; 24A6: 8D
    dta $D0		; 24A7: D0
    dta $0		; 24A8: 00
    dta $A9		; 24A9: A9
    dta $7		; 24AA: 07
    dta $8D		; 24AB: 8D
    dta $D1		; 24AC: D1
    dta $0		; 24AD: 00
    dta $A0		; 24AE: A0
    dta $0		; 24AF: 00
    dta $B1		; 24B0: B1
    dta $D0		; 24B1: D0
    dta $49		; 24B2: 49
    dta $FF		; 24B3: FF
    dta $91		; 24B4: 91
    dta $D0		; 24B5: D0
    dta $EE		; 24B6: EE
    dta $D0		; 24B7: D0
    dta $0		; 24B8: 00
    dta $D0		; 24B9: D0
    dta $3		; 24BA: 03
    dta $EE		; 24BB: EE
    dta $D1		; 24BC: D1
    dta $0		; 24BD: 00
    dta $AD		; 24BE: AD
    dta $D1		; 24BF: D1
    dta $0		; 24C0: 00
    dta $C9		; 24C1: C9
    dta $8		; 24C2: 08
    dta $D0		; 24C3: D0
    dta $E9		; 24C4: E9
    dta $AD		; 24C5: AD
    dta $D0		; 24C6: D0
    dta $0		; 24C7: 00
    dta $C9		; 24C8: C9
    dta $9C		; 24C9: 9C
    dta $D0		; 24CA: D0
    dta $E2		; 24CB: E2
    dta $A9		; 24CC: A9
    dta $0		; 24CD: 00
    dta $8D		; 24CE: 8D
    dta $D0		; 24CF: D0
    dta $0		; 24D0: 00
    dta $8D		; 24D1: 8D
    dta $D1		; 24D2: D1
    dta $0		; 24D3: 00
    dta $EA		; 24D4: EA
    dta $60		; 24D5: 60
    dta $A9		; 24D6: A9
    dta $3C		; 24D7: 3C
    dta $8D		; 24D8: 8D
    dta $2		; 24D9: 02
    dta $D3		; 24DA: D3
    dta $60		; 24DB: 60
    dta $A9		; 24DC: A9
    dta $20		; 24DD: 20
    dta $8D		; 24DE: 8D
    dta $9		; 24DF: 09
    dta $7		; 24E0: 07
    dta $A9		; 24E1: A9
    dta $9D		; 24E2: 9D
    dta $8D		; 24E3: 8D
    dta $A		; 24E4: 0A
    dta $7		; 24E5: 07
    dta $A9		; 24E6: A9
    dta $8		; 24E7: 08
    dta $8D		; 24E8: 8D
    dta $B		; 24E9: 0B
    dta $7		; 24EA: 07
    dta $60		; 24EB: 60
    dta $A2		; 24EC: A2
    dta $10		; 24ED: 10
    dta $A9		; 24EE: A9
    dta $C		; 24EF: 0C
    dta $20		; 24F0: 20
    dta $56		; 24F1: 56
    dta $E4		; 24F2: E4
    dta $A2		; 24F3: A2
    dta $20		; 24F4: 20
    dta $A9		; 24F5: A9
    dta $C		; 24F6: 0C
    dta $20		; 24F7: 20
    dta $56		; 24F8: 56
    dta $E4		; 24F9: E4
    dta $60		; 24FA: 60
    dta $20		; 24FB: 20
    dta $CF		; 24FC: CF
    dta $8		; 24FD: 08
    dta $20		; 24FE: 20
    dta $D5		; 24FF: D5
    dta $8		; 2500: 08
    dta $60		; 2501: 60
    dta $43		; 2502: 43
    dta $3A		; 2503: 3A
    dta $9B		; 2504: 9B
    dta $FD		; 2505: FD
    dta $E3		; 2506: E3
    dta $E1		; 2507: E1
    dta $F2		; 2508: F2
    dta $F4		; 2509: F4
    dta $F2		; 250A: F2
    dta $E9		; 250B: E9
    dta $E4		; 250C: E4
    dta $E7		; 250D: E7
    dta $E5		; 250E: E5
    dta $A0		; 250F: A0
    dta $E9		; 2510: E9
    dta $EE		; 2511: EE
    dta $F3		; 2512: F3
    dta $F4		; 2513: F4
    dta $E1		; 2514: E1
    dta $EC		; 2515: EC
    dta $EC		; 2516: EC
    dta $E5		; 2517: E5
    dta $E4		; 2518: E4
    dta $1D		; 2519: 1D
    dta $9C		; 251A: 9C
    dta $F4		; 251B: F4
    dta $F9		; 251C: F9
    dta $F0		; 251D: F0
    dta $E5		; 251E: E5
    dta $A0		; 251F: A0
    dta $BC		; 2520: BC
    dta $C5		; 2521: C5
    dta $D3		; 2522: D3
    dta $C3		; 2523: C3
    dta $BE		; 2524: BE
    dta $A0		; 2525: A0
    dta $F4		; 2526: F4
    dta $EF		; 2527: EF
    dta $A0		; 2528: A0
    dta $E3		; 2529: E3
    dta $EF		; 252A: EF
    dta $EE		; 252B: EE
    dta $F4		; 252C: F4
    dta $E9		; 252D: E9
    dta $F5		; 252E: F5
    dta $E5		; 252F: E5
    dta $A0		; 2530: A0
    dta $E2		; 2531: E2
    dta $EF		; 2532: EF
    dta $EF		; 2533: EF
    dta $F4		; 2534: F4
    dta $FD		; 2535: FD
    dta $9B		; 2536: 9B
    dta $0		; 2537: 00
    dta $0		; 2538: 00
    dta $0		; 2539: 00
    dta $0		; 253A: 00
l253B			; Callers: 203D 25DF 25A1 1FC7 1FA1 1F5E 1EB3
    cpy #$AA		; 253B: C0 AA
    beq l2576		; 253D: F0 37
    tya    		; 253F: 98
    pha    		; 2540: 48
    jsr l2046		; 2541: 20 46 20
    pla    		; 2544: 68
    sec    		; 2545: 38
    sbc #$64		; 2546: E9 64
    ldx #$2F		; 2548: A2 2F
l254A			; Callers: 254E
    inx    		; 254A: E8
    sec    		; 254B: 38
    sbc #$0A		; 254C: E9 0A
    bpl l254A		; 254E: 10 FA
    clc    		; 2550: 18
    adc #$3A		; 2551: 69 3A
    sta $2304		; 2553: 8D 04 23
    stx $2303		; 2556: 8E 03 23
    lda #$F8		; 2559: A9 F8
    sta a:$00CE		; 255B: 8D CE 00
    lda #$22		; 255E: A9 22
    sta a:$00CF		; 2560: 8D CF 00
    jsr l2006		; 2563: 20 06 20
l2566			; Callers: 1EFD 25E5 1F57
    lda #$55		; 2566: A9 55
    sta a:$00CE		; 2568: 8D CE 00
    lda #$21		; 256B: A9 21
    sta a:$00CF		; 256D: 8D CF 00
    jsr l2006		; 2570: 20 06 20
    jmp l1FF7		; 2573: 4C F7 1F
l2576			; Callers: 253D
    lda #$D2		; 2576: A9 D2
    sta a:$00CE		; 2578: 8D CE 00
    lda #$22		; 257B: A9 22
    sta a:$00CF		; 257D: 8D CF 00
    jsr l2006		; 2580: 20 06 20
    jsr l2046		; 2583: 20 46 20
    ldx #$10		; 2586: A2 10
    lda #$03		; 2588: A9 03
    sta ICCOM,x		; 258A: 9D 42 03
    lda #$F1		; 258D: A9 F1
    sta ICBAL,x		; 258F: 9D 44 03
    lda #$22		; 2592: A9 22
    sta ICBAH,x		; 2594: 9D 45 03
    lda #$06		; 2597: A9 06
    sta ICAX1,x		; 2599: 9D 4A 03
    jsr CIOV		; 259C: 20 56 E4
    bpl l25A4		; 259F: 10 03
    jmp l253B		; 25A1: 4C 3B 25
l25A4			; Callers: 259F 25D8
    ldx #$10		; 25A4: A2 10
    lda #$05		; 25A6: A9 05
    sta ICCOM,x		; 25A8: 9D 42 03
    lda #$87		; 25AB: A9 87
    sta ICBAL,x		; 25AD: 9D 44 03
    lda #$26		; 25B0: A9 26
    sta ICBAH,x		; 25B2: 9D 45 03
    lda #$FF		; 25B5: A9 FF
    sta ICBLL,x		; 25B7: 9D 48 03
    jsr CIOV		; 25BA: 20 56 E4
    bmi l25DB		; 25BD: 30 1C
    ldx #$00		; 25BF: A2 00
    lda #$09		; 25C1: A9 09
    sta ICCOM,x		; 25C3: 9D 42 03
    lda #$87		; 25C6: A9 87
    sta ICBAL		; 25C8: 8D 44 03
    lda #$26		; 25CB: A9 26
    sta ICBAH		; 25CD: 8D 45 03
    lda #$FF		; 25D0: A9 FF
    sta ICBLL		; 25D2: 8D 48 03
    jsr CIOV		; 25D5: 20 56 E4
    jmp l25A4		; 25D8: 4C A4 25
l25DB			; Callers: 25BD
    cpy #$88		; 25DB: C0 88
    beq l25E2		; 25DD: F0 03
    jmp l253B		; 25DF: 4C 3B 25
l25E2			; Callers: 25DD
    jsr l2046		; 25E2: 20 46 20
    jmp l2566		; 25E5: 4C 66 25
l25E8			; Callers: l1D44 1D5E
    lda #$01		; 25E8: A9 01
    sta DUNIT		; 25EA: 8D 01 03
    lda a:$00D1		; 25ED: AD D1 00
    sta DAUX1		; 25F0: 8D 0A 03
    lda a:$00D2		; 25F3: AD D2 00
    sta DAUX2		; 25F6: 8D 0B 03
    lda #$89		; 25F9: A9 89
    sta DBUFLO		; 25FB: 8D 04 03
    lda #$26		; 25FE: A9 26
    sta DBUFHI		; 2600: 8D 05 03
    lda #$52		; 2603: A9 52
    sta DCOMND		; 2605: 8D 02 03
    jsr DSKINV		; 2608: 20 53 E4
    rts    		; 260B: 60
    dta $48		; 260C: 48
    dta $EE		; 260D: EE
    dta $2A		; 260E: 2A
    dta $26		; 260F: 26
    dta $AD		; 2610: AD
    dta $2A		; 2611: 2A
    dta $26		; 2612: 26
    dta $C9		; 2613: C9
    dta $1		; 2614: 01
    dta $F0		; 2615: F0
    dta $9		; 2616: 09
    dta $A9		; 2617: A9
    dta $0		; 2618: 00
    dta $8D		; 2619: 8D
    dta $2A		; 261A: 2A
    dta $26		; 261B: 26
    dta $A9		; 261C: A9
    dta $94		; 261D: 94
    dta $D0		; 261E: D0
    dta $2		; 261F: 02
    dta $A9		; 2620: A9
    dta $30		; 2621: 30
    dta $8D		; 2622: 8D
    dta $A		; 2623: 0A
    dta $D4		; 2624: D4
    dta $8D		; 2625: 8D
    dta $18		; 2626: 18
    dta $D0		; 2627: D0
    dta $68		; 2628: 68
    dta $40		; 2629: 40
    dta $0		; 262A: 00 Access: 1DC2
    dta $70		; 262B: 70
    dta $70		; 262C: 70
    dta $70		; 262D: 70
    dta $42		; 262E: 42
    dta $0		; 262F: 00 Access: 1D9E
    dta $0		; 2630: 00 Access: 1DA4
    dta $82		; 2631: 82
    dta $2		; 2632: 02
    dta $82		; 2633: 82
    dta $2		; 2634: 02
    dta $2		; 2635: 02
    dta $2		; 2636: 02
    dta $2		; 2637: 02
    dta $2		; 2638: 02
    dta $2		; 2639: 02
    dta $2		; 263A: 02
    dta $2		; 263B: 02
    dta $2		; 263C: 02
    dta $2		; 263D: 02
    dta $2		; 263E: 02
    dta $2		; 263F: 02
    dta $2		; 2640: 02
    dta $2		; 2641: 02
    dta $2		; 2642: 02
    dta $2		; 2643: 02
    dta $2		; 2644: 02
    dta $2		; 2645: 02
    dta $2		; 2646: 02
    dta $2		; 2647: 02
    dta $41		; 2648: 41
    dta $2B		; 2649: 2B
    dta $26		; 264A: 26
    dta $EA		; 264B: EA
l264C			; Callers: 17A2
    lda #$07		; 264C: A9 07
    sta a:$00CE		; 264E: 8D CE 00
    lda #$1D		; 2651: A9 1D
    sta a:$00CF		; 2653: 8D CF 00
l2656			; Callers: 266B 2672
    ldy #$00		; 2656: A0 00
    lda ($CE),y		; 2658: B1 CE
    eor #$FF		; 265A: 49 FF
    sta ($CE),y		; 265C: 91 CE
    inc a:$00CE		; 265E: EE CE 00
    bne l2666		; 2661: D0 03
    inc a:$00CF		; 2663: EE CF 00
l2666			; Callers: 2661
    lda a:$00CF		; 2666: AD CF 00
    cmp #$26		; 2669: C9 26
    bne l2656		; 266B: D0 E9
    lda a:$00CE		; 266D: AD CE 00
    cmp #$4B		; 2670: C9 4B
    bne l2656		; 2672: D0 E2
    jmp l1D07		; 2674: 4C 07 1D
    dta $44		; 2677: 44
    dta $31		; 2678: 31 Access: 1E85
    dta $3A		; 2679: 3A Access: 1E01 1E61 1E57
    dta $0		; 267A: 00
    dta $0		; 267B: 00
    dta $0		; 267C: 00
    dta $0		; 267D: 00
    dta $0		; 267E: 00
    dta $0		; 267F: 00
    dta $FF		; 2680: FF
    dta $FF		; 2681: FF
    dta $C0		; 2682: C0
    dta $FF		; 2683: FF
    dta $CF		; 2684: CF
    dta $E7		; 2685: E7
    dta $FF		; 2686: FF
    dta $FF		; 2687: FF Access: 1ED4
    dta $FF		; 2688: FF Access: 1ED7
    dta $72		; 2689: 72
    dta $FA		; 268A: FA
    dta $FC		; 268B: FC
    dta $56		; 268C: 56
    dta $AD		; 268D: AD
    dta $72		; 268E: 72
    dta $FD		; 268F: FD
    dta $FC		; 2690: FC
    dta $DF		; 2691: DF
    dta $AC		; 2692: AC
    dta $1B		; 2693: 1B
    dta $9F		; 2694: 9F
    dta $B7		; 2695: B7
    dta $11		; 2696: 11
    dta $D5		; 2697: D5
    dta $D9		; 2698: D9
    dta $52		; 2699: 52
    dta $D5		; 269A: D5
    dta $D9		; 269B: D9
    dta $36		; 269C: 36
    dta $FE		; 269D: FE
    dta $F		; 269E: 0F
    dta $F6		; 269F: F6
    dta $56		; 26A0: 56
    dta $FF		; 26A1: FF
    dta $72		; 26A2: 72
    dta $D5		; 26A3: D5
    dta $D9		; 26A4: D9
    dta $56		; 26A5: 56
    dta $6B		; 26A6: 6B
    dta $2F		; 26A7: 2F
    dta $FD		; 26A8: FD
    dta $56		; 26A9: 56
    dta $CF		; 26AA: CF
    dta $72		; 26AB: 72
    dta $F5		; 26AC: F5
    dta $2B		; 26AD: 2B
    dta $72		; 26AE: 72
    dta $E7		; 26AF: E7
    dta $2F		; 26B0: 2F
    dta $97		; 26B1: 97
    dta $BF		; 26B2: BF
    dta $FF		; 26B3: FF
    dta $8F		; 26B4: 8F
    dta $8F		; 26B5: 8F
    dta $8F		; 26B6: 8F
    dta $BD		; 26B7: BD
    dta $FF		; 26B8: FF
    dta $FF		; 26B9: FF
    dta $7D		; 26BA: 7D
    dta $FD		; 26BB: FD
    dta $7D		; 26BC: 7D
    dta $FD		; 26BD: FD
    dta $FD		; 26BE: FD
    dta $FD		; 26BF: FD
    dta $FD		; 26C0: FD
    dta $FD		; 26C1: FD
    dta $FD		; 26C2: FD
    dta $FD		; 26C3: FD
    dta $FD		; 26C4: FD
    dta $FD		; 26C5: FD
    dta $FD		; 26C6: FD
    dta $FD		; 26C7: FD
    dta $FD		; 26C8: FD
    dta $FD		; 26C9: FD
    dta $FD		; 26CA: FD
    dta $FD		; 26CB: FD
    dta $FD		; 26CC: FD
    dta $FD		; 26CD: FD
    dta $FD		; 26CE: FD
    dta $FD		; 26CF: FD
    dta $FD		; 26D0: FD
    dta $BE		; 26D1: BE
    dta $D4		; 26D2: D4
    dta $D9		; 26D3: D9
    dta $EA		; 26D4: EA
    dta $A9		; 26D5: A9
    dta $7		; 26D6: 07
    dta $8D		; 26D7: 8D
    dta $CE		; 26D8: CE
    dta $0		; 26D9: 00
    dta $A9		; 26DA: A9
    dta $1D		; 26DB: 1D
    dta $8D		; 26DC: 8D
    dta $CF		; 26DD: CF
    dta $0		; 26DE: 00
    dta $A0		; 26DF: A0
    dta $0		; 26E0: 00
    dta $B1		; 26E1: B1
    dta $CE		; 26E2: CE
    dta $49		; 26E3: 49
    dta $FF		; 26E4: FF
    dta $91		; 26E5: 91
    dta $CE		; 26E6: CE
    dta $EE		; 26E7: EE
    dta $CE		; 26E8: CE
    dta $0		; 26E9: 00
    dta $D0		; 26EA: D0
    dta $3		; 26EB: 03
    dta $EE		; 26EC: EE
    dta $CF		; 26ED: CF
    dta $0		; 26EE: 00
    dta $AD		; 26EF: AD
    dta $CF		; 26F0: CF
    dta $0		; 26F1: 00
    dta $C9		; 26F2: C9
    dta $26		; 26F3: 26
    dta $D0		; 26F4: D0
    dta $E9		; 26F5: E9
    dta $AD		; 26F6: AD
    dta $CE		; 26F7: CE
    dta $0		; 26F8: 00
    dta $C9		; 26F9: C9
    dta $4B		; 26FA: 4B
    dta $D0		; 26FB: D0
    dta $E2		; 26FC: E2
    dta $4C		; 26FD: 4C
    dta $7		; 26FE: 07
    dta $1D		; 26FF: 1D
    dta $44		; 2700: 44
    dta $31		; 2701: 31
    dta $3A		; 2702: 3A
    dta $0		; 2703: 00
    dta $0		; 2704: 00
    dta $0		; 2705: 00
    dta $0		; 2706: 00
    dta $0		; 2707: 00
    dta $0		; 2708: 00
    dta $15		; 2709: 15
    dta $9		; 270A: 09
    dta $7F		; 270B: 7F
    dta $FF		; 270C: FF
    dta $FF		; 270D: FF
    dta $D0		; 270E: D0
    dta $14		; 270F: 14
    dta $1F		; 2710: 1F
    dta $FF		; 2711: FF
    dta $FF		; 2712: FF
    dta $FF		; 2713: FF
    dta $FF		; 2714: FF
    dta $FF		; 2715: FF
    dta $FF		; 2716: FF
    dta $FF		; 2717: FF
    dta $FF		; 2718: FF
    dta $FF		; 2719: FF
    dta $90		; 271A: 90
    dta $99		; 271B: 99
    dta $99		; 271C: 99
    dta $94		; 271D: 94
    dta $9F		; 271E: 9F
    dta $99		; 271F: 99
    dta $E7		; 2720: E7
    dta $FF		; 2721: FF
    dta $FC		; 2722: FC
    dta $99		; 2723: 99
    dta $CF		; 2724: CF
    dta $E7		; 2725: E7
    dta $83		; 2726: 83
    dta $33		; 2727: 33
    dta $9F		; 2728: 9F
    dta $9F		; 2729: 9F
    dta $FF		; 272A: FF
    dta $FF		; 272B: FF
    dta $FF		; 272C: FF
    dta $FF		; 272D: FF
    dta $FF		; 272E: FF
    dta $FF		; 272F: FF
    dta $C4		; 2730: C4
    dta $0		; 2731: 00
    dta $1		; 2732: 01
    dta $7F		; 2733: 7F
    dta $FF		; 2734: FF
    dta $FF		; 2735: FF
    dta $87		; 2736: 87
    dta $94		; 2737: 94
    dta $4F		; 2738: 4F
    dta $F5		; 2739: F5
    dta $FF		; 273A: FF
    dta $FF		; 273B: FF
    dta $FF		; 273C: FF
    dta $FF		; 273D: FF
    dta $FF		; 273E: FF
    dta $FF		; 273F: FF
    dta $FF		; 2740: FF
    dta $FF		; 2741: FF
    dta $98		; 2742: 98
    dta $C1		; 2743: C1
    dta $C1		; 2744: C1
    dta $9C		; 2745: 9C
    dta $C1		; 2746: C1
    dta $8		; 2747: 08
    dta $C3		; 2748: C3
    dta $FF		; 2749: FF
    dta $FC		; 274A: FC
    dta $C3		; 274B: C3
    dta $CF		; 274C: CF
    dta $F1		; 274D: F1
    dta $93		; 274E: 93
    dta $89		; 274F: 89
    dta $F		; 2750: 0F
    dta $C1		; 2751: C1
    dta $FF		; 2752: FF
    dta $FF		; 2753: FF
    dta $FF		; 2754: FF
    dta $FF		; 2755: FF
    dta $FF		; 2756: FF
    dta $FF		; 2757: FF
    dta $83		; 2758: 83
    dta $F1		; 2759: F1
    dta $D5		; 275A: D5
    dta $7F		; 275B: 7F
    dta $FF		; 275C: FF
    dta $FF		; 275D: FF
    dta $A0		; 275E: A0
    dta $14		; 275F: 14
    dta $4F		; 2760: 4F
    dta $F0		; 2761: F0
    dta $3F		; 2762: 3F
    dta $FF		; 2763: FF
    dta $FF		; 2764: FF
    dta $FF		; 2765: FF
    dta $FF		; 2766: FF
    dta $FF		; 2767: FF
    dta $FF		; 2768: FF
    dta $FF		; 2769: FF
    dta $9C		; 276A: 9C
    dta $FF		; 276B: FF
    dta $FF		; 276C: FF
    dta $FF		; 276D: FF
    dta $FF		; 276E: FF
    dta $FF		; 276F: FF
    dta $FF		; 2770: FF
    dta $FF		; 2771: FF
    dta $81		; 2772: 81
    dta $FF		; 2773: FF
    dta $CF		; 2774: CF
    dta $FF		; 2775: FF
    dta $FF		; 2776: FF
    dta $FF		; 2777: FF
    dta $FF		; 2778: FF
    dta $FF		; 2779: FF
    dta $FF		; 277A: FF
    dta $FF		; 277B: FF
    dta $FF		; 277C: FF
    dta $FF		; 277D: FF
    dta $FF		; 277E: FF
    dta $FF		; 277F: FF
    dta $F		; 2780: 0F
    dta $FC		; 2781: FC
    dta $D5		; 2782: D5
    dta $3F		; 2783: 3F
    dta $FF		; 2784: FF
    dta $FF		; 2785: FF
    dta $F		; 2786: 0F
    dta $94		; 2787: 94
    dta $5F		; 2788: 5F
    dta $E0		; 2789: E0
    dta $3F		; 278A: 3F
    dta $FF		; 278B: FF
    dta $FF		; 278C: FF
    dta $FF		; 278D: FF
    dta $FF		; 278E: FF
    dta $FF		; 278F: FF
    dta $FF		; 2790: FF
    dta $FF		; 2791: FF
    dta $FF		; 2792: FF
    dta $FF		; 2793: FF
    dta $FF		; 2794: FF
    dta $FF		; 2795: FF
    dta $FF		; 2796: FF
    dta $FF		; 2797: FF
    dta $FF		; 2798: FF
    dta $FF		; 2799: FF
    dta $FF		; 279A: FF
    dta $FF		; 279B: FF
    dta $FF		; 279C: FF
    dta $FF		; 279D: FF
    dta $FF		; 279E: FF
    dta $FF		; 279F: FF
    dta $FF		; 27A0: FF
    dta $FF		; 27A1: FF
    dta $FF		; 27A2: FF
    dta $FF		; 27A3: FF
    dta $FF		; 27A4: FF
    dta $FF		; 27A5: FF
    dta $FF		; 27A6: FF
    dta $FF		; 27A7: FF
    dta $FF		; 27A8: FF
    dta $FE		; 27A9: FE
    dta $15		; 27AA: 15
    dta $3F		; 27AB: 3F
    dta $FF		; 27AC: FF
    dta $FE		; 27AD: FE
    dta $40		; 27AE: 40
    dta $14		; 27AF: 14
    dta $FF		; 27B0: FF
    dta $E0		; 27B1: E0
    dta $1F		; 27B2: 1F
    dta $FF		; 27B3: FF
    dta $FF		; 27B4: FF
    dta $FF		; 27B5: FF
    dta $FF		; 27B6: FF
    dta $FF		; 27B7: FF
    dta $FF		; 27B8: FF
    dta $FF		; 27B9: FF
    dta $FF		; 27BA: FF
    dta $FF		; 27BB: FF
    dta $FF		; 27BC: FF
    dta $FF		; 27BD: FF
    dta $FF		; 27BE: FF
    dta $FF		; 27BF: FF
    dta $FF		; 27C0: FF
    dta $FF		; 27C1: FF
    dta $FF		; 27C2: FF
    dta $FF		; 27C3: FF
    dta $FF		; 27C4: FF
    dta $FF		; 27C5: FF
    dta $FF		; 27C6: FF
    dta $FF		; 27C7: FF
    dta $FF		; 27C8: FF
    dta $FF		; 27C9: FF
    dta $FF		; 27CA: FF
    dta $FF		; 27CB: FF
    dta $FF		; 27CC: FF
    dta $FF		; 27CD: FF
    dta $FF		; 27CE: FF
    dta $FF		; 27CF: FF
    dta $FF		; 27D0: FF
    dta $FE		; 27D1: FE
    dta $15		; 27D2: 15
    dta $3F		; 27D3: 3F
    dta $FF		; 27D4: FF
    dta $FC		; 27D5: FC
    dta $8F		; 27D6: 8F
    dta $14		; 27D7: 14
    dta $FF		; 27D8: FF
    dta $E4		; 27D9: E4
    dta $5F		; 27DA: 5F
    dta $FF		; 27DB: FF
    dta $FF		; 27DC: FF
    dta $FF		; 27DD: FF
    dta $FF		; 27DE: FF
    dta $FF		; 27DF: FF
    dta $FF		; 27E0: FF
    dta $FF		; 27E1: FF
    dta $FF		; 27E2: FF
    dta $FF		; 27E3: FF
    dta $FF		; 27E4: FF
    dta $FF		; 27E5: FF
    dta $FF		; 27E6: FF
    dta $FF		; 27E7: FF
    dta $FF		; 27E8: FF
    dta $FF		; 27E9: FF
    dta $FF		; 27EA: FF
    dta $FF		; 27EB: FF
    dta $FF		; 27EC: FF
    dta $FF		; 27ED: FF
    dta $FF		; 27EE: FF
    dta $FF		; 27EF: FF
    dta $FF		; 27F0: FF
    dta $FF		; 27F1: FF
    dta $FF		; 27F2: FF
    dta $FF		; 27F3: FF
    dta $FF		; 27F4: FF
    dta $FF		; 27F5: FF
    dta $FF		; 27F6: FF
    dta $FF		; 27F7: FF
    dta $F3		; 27F8: F3
    dta $10		; 27F9: 10
    dta $55		; 27FA: 55
    dta $1F		; 27FB: 1F
    dta $FF		; 27FC: FF
    dta $F1		; 27FD: F1
    dta $3F		; 27FE: 3F
    dta $54		; 27FF: 54
    dta $FF		; 2800: FF
    dta $E4		; 2801: E4
    dta $4F		; 2802: 4F
    dta $FF		; 2803: FF
    dta $FF		; 2804: FF
    dta $FF		; 2805: FF
    dta $FF		; 2806: FF
    dta $FF		; 2807: FF
    dta $FF		; 2808: FF
    dta $FF		; 2809: FF
    dta $FF		; 280A: FF
    dta $FF		; 280B: FF
    dta $FF		; 280C: FF
    dta $FF		; 280D: FF
    dta $FF		; 280E: FF
    dta $FF		; 280F: FF
    dta $FF		; 2810: FF
    dta $FF		; 2811: FF
    dta $FF		; 2812: FF
    dta $FF		; 2813: FF
    dta $FF		; 2814: FF
    dta $FF		; 2815: FF
    dta $FF		; 2816: FF
    dta $FF		; 2817: FF
    dta $FF		; 2818: FF
    dta $FF		; 2819: FF
    dta $FF		; 281A: FF
    dta $FF		; 281B: FF
    dta $FF		; 281C: FF
    dta $FF		; 281D: FF
    dta $FF		; 281E: FF
    dta $FF		; 281F: FF
    dta $FF		; 2820: FF
    dta $87		; 2821: 87
    dta $55		; 2822: 55
    dta $4F		; 2823: 4F
    dta $FF		; 2824: FF
    dta $F4		; 2825: F4
    dta $60		; 2826: 60
    dta $54		; 2827: 54
    dta $3F		; 2828: 3F
    dta $E4		; 2829: E4
    dta $57		; 282A: 57
    dta $FF		; 282B: FF
    dta $FF		; 282C: FF
    dta $FF		; 282D: FF
    dta $FF		; 282E: FF
    dta $FF		; 282F: FF
    dta $FF		; 2830: FF
    dta $FF		; 2831: FF
    dta $FF		; 2832: FF
    dta $FF		; 2833: FF
    dta $FF		; 2834: FF
    dta $FF		; 2835: FF
    dta $FF		; 2836: FF
    dta $FF		; 2837: FF
    dta $FF		; 2838: FF
    dta $FF		; 2839: FF
    dta $FF		; 283A: FF
    dta $FF		; 283B: FF
    dta $FF		; 283C: FF
    dta $FF		; 283D: FF
    dta $FF		; 283E: FF
    dta $FF		; 283F: FF
    dta $FF		; 2840: FF
    dta $FF		; 2841: FF
    dta $FF		; 2842: FF
    dta $FF		; 2843: FF
    dta $FF		; 2844: FF
    dta $FF		; 2845: FF
    dta $FF		; 2846: FF
    dta $FF		; 2847: FF
    dta $FF		; 2848: FF
    dta $E0		; 2849: E0
    dta $5		; 284A: 05
    dta $4F		; 284B: 4F
    dta $FF		; 284C: FF
    dta $E4		; 284D: E4
    dta $8C		; 284E: 8C
    dta $54		; 284F: 54
    dta $BF		; 2850: BF
    dta $C4		; 2851: C4
    dta $53		; 2852: 53
    dta $FF		; 2853: FF
    dta $FF		; 2854: FF
    dta $FF		; 2855: FF
    dta $FF		; 2856: FF
    dta $FF		; 2857: FF
    dta $FF		; 2858: FF
    dta $FF		; 2859: FF
    dta $FF		; 285A: FF
    dta $FF		; 285B: FF
    dta $FF		; 285C: FF
    dta $FF		; 285D: FF
    dta $FF		; 285E: FF
    dta $FF		; 285F: FF
    dta $FF		; 2860: FF
    dta $FF		; 2861: FF
    dta $FF		; 2862: FF
    dta $FF		; 2863: FF
    dta $FF		; 2864: FF
    dta $FF		; 2865: FF
    dta $FF		; 2866: FF
    dta $FF		; 2867: FF
    dta $FF		; 2868: FF
    dta $FF		; 2869: FF
    dta $FF		; 286A: FF
    dta $FF		; 286B: FF
    dta $FF		; 286C: FF
    dta $FF		; 286D: FF
    dta $FF		; 286E: FF
    dta $FF		; 286F: FF
    dta $FF		; 2870: FF
    dta $FF		; 2871: FF
    dta $E5		; 2872: E5
    dta $4F		; 2873: 4F
    dta $FF		; 2874: FF
    dta $C4		; 2875: C4
    dta $FE		; 2876: FE
    dta $54		; 2877: 54
    dta $5F		; 2878: 5F
    dta $C4		; 2879: C4
    dta $51		; 287A: 51
    dta $FF		; 287B: FF
    dta $FF		; 287C: FF
    dta $FF		; 287D: FF
    dta $FF		; 287E: FF
    dta $FF		; 287F: FF
    dta $FF		; 2880: FF
    dta $FF		; 2881: FF
    dta $FF		; 2882: FF
    dta $FF		; 2883: FF
    dta $FF		; 2884: FF
    dta $FF		; 2885: FF
    dta $FF		; 2886: FF
    dta $FF		; 2887: FF
    dta $FF		; 2888: FF
    dta $FF		; 2889: FF
    dta $FF		; 288A: FF
    dta $FF		; 288B: FF
    dta $FF		; 288C: FF
    dta $FF		; 288D: FF
    dta $FF		; 288E: FF
    dta $FF		; 288F: FF
    dta $FF		; 2890: FF
    dta $FF		; 2891: FF
    dta $FF		; 2892: FF
    dta $FF		; 2893: FF
    dta $FF		; 2894: FF
    dta $FF		; 2895: FF
    dta $FF		; 2896: FF
    dta $FF		; 2897: FF
    dta $FF		; 2898: FF
    dta $FF		; 2899: FF
    dta $E5		; 289A: E5
    dta $4F		; 289B: 4F
    dta $FF		; 289C: FF
    dta $90		; 289D: 90
    dta $6		; 289E: 06
    dta $54		; 289F: 54
    dta $4F		; 28A0: 4F
    dta $84		; 28A1: 84
    dta $55		; 28A2: 55
    dta $FF		; 28A3: FF
    dta $FF		; 28A4: FF
    dta $FF		; 28A5: FF
    dta $FF		; 28A6: FF
    dta $FF		; 28A7: FF
    dta $FF		; 28A8: FF
    dta $FF		; 28A9: FF
    dta $FF		; 28AA: FF
    dta $FF		; 28AB: FF
    dta $FF		; 28AC: FF
    dta $FF		; 28AD: FF
    dta $FF		; 28AE: FF
    dta $FF		; 28AF: FF
    dta $FF		; 28B0: FF
    dta $FF		; 28B1: FF
    dta $FF		; 28B2: FF
    dta $FF		; 28B3: FF
    dta $FF		; 28B4: FF
    dta $FF		; 28B5: FF
    dta $FF		; 28B6: FF
    dta $FF		; 28B7: FF
    dta $FF		; 28B8: FF
    dta $FF		; 28B9: FF
    dta $FF		; 28BA: FF
    dta $FF		; 28BB: FF
    dta $FF		; 28BC: FF
    dta $FF		; 28BD: FF
    dta $FF		; 28BE: FF
    dta $FF		; 28BF: FF
    dta $FF		; 28C0: FF
    dta $FF		; 28C1: FF
    dta $E5		; 28C2: E5
    dta $1F		; 28C3: 1F
    dta $FF		; 28C4: FF
    dta $29		; 28C5: 29
    dta $F2		; 28C6: F2
    dta $50		; 28C7: 50
    dta $5F		; 28C8: 5F
    dta $94		; 28C9: 94
    dta $14		; 28CA: 14
    dta $FF		; 28CB: FF
    dta $FF		; 28CC: FF
    dta $FF		; 28CD: FF
    dta $FF		; 28CE: FF
    dta $FF		; 28CF: FF
    dta $FF		; 28D0: FF
    dta $FF		; 28D1: FF
    dta $FF		; 28D2: FF
    dta $FF		; 28D3: FF
    dta $FF		; 28D4: FF
    dta $FF		; 28D5: FF
    dta $FF		; 28D6: FF
    dta $FF		; 28D7: FF
    dta $FF		; 28D8: FF
    dta $FF		; 28D9: FF
    dta $FF		; 28DA: FF
    dta $E7		; 28DB: E7
    dta $FF		; 28DC: FF
    dta $FF		; 28DD: FF
    dta $FF		; 28DE: FF
    dta $FF		; 28DF: FF
    dta $FF		; 28E0: FF
    dta $FF		; 28E1: FF
    dta $FF		; 28E2: FF
    dta $FF		; 28E3: FF
    dta $FF		; 28E4: FF
    dta $C1		; 28E5: C1
    dta $FF		; 28E6: FF
    dta $FF		; 28E7: FF
    dta $FF		; 28E8: FF
    dta $FF		; 28E9: FF
    dta $85		; 28EA: 85
    dta $1F		; 28EB: 1F
    dta $FE		; 28EC: FE
    dta $53		; 28ED: 53
    dta $FC		; 28EE: FC
    dta $51		; 28EF: 51
    dta $3F		; 28F0: 3F
    dta $94		; 28F1: 94
    dta $14		; 28F2: 14
    dta $7F		; 28F3: 7F
    dta $FF		; 28F4: FF
    dta $FF		; 28F5: FF
    dta $FF		; 28F6: FF
    dta $FF		; 28F7: FF
    dta $FF		; 28F8: FF
    dta $FF		; 28F9: FF
    dta $FF		; 28FA: FF
    dta $FF		; 28FB: FF
    dta $FF		; 28FC: FF
    dta $FF		; 28FD: FF
    dta $FF		; 28FE: FF
    dta $FF		; 28FF: FF
    dta $FF		; 2900: FF
    dta $FF		; 2901: FF
    dta $FF		; 2902: FF
    dta $E7		; 2903: E7
    dta $FF		; 2904: FF
    dta $FF		; 2905: FF
    dta $FF		; 2906: FF
    dta $FF		; 2907: FF
    dta $FF		; 2908: FF
    dta $FF		; 2909: FF
    dta $FF		; 290A: FF
    dta $FF		; 290B: FF
    dta $FF		; 290C: FF
    dta $14		; 290D: 14
    dta $FF		; 290E: FF
    dta $FF		; 290F: FF
    dta $FF		; 2910: FF
    dta $FF		; 2911: FF
    dta $95		; 2912: 95
    dta $1F		; 2913: 1F
    dta $FE		; 2914: FE
    dta $50		; 2915: 50
    dta $5		; 2916: 05
    dta $51		; 2917: 51
    dta $BF		; 2918: BF
    dta $95		; 2919: 95
    dta $15		; 291A: 15
    dta $3F		; 291B: 3F
    dta $FF		; 291C: FF
    dta $FF		; 291D: FF
    dta $FF		; 291E: FF
    dta $FF		; 291F: FF
    dta $FF		; 2920: FF
    dta $FF		; 2921: FF
    dta $FF		; 2922: FF
    dta $FF		; 2923: FF
    dta $FF		; 2924: FF
    dta $3		; 2925: 03
    dta $23		; 2926: 23
    dta $C3		; 2927: C3
    dta $C1		; 2928: C1
    dta $C3		; 2929: C3
    dta $23		; 292A: 23
    dta $81		; 292B: 81
    dta $C1		; 292C: C1
    dta $FF		; 292D: FF
    dta $FF		; 292E: FF
    dta $FF		; 292F: FF
    dta $FF		; 2930: FF
    dta $FF		; 2931: FF
    dta $FF		; 2932: FF
    dta $FF		; 2933: FF
    dta $FF		; 2934: FF
    dta $54		; 2935: 54
    dta $7F		; 2936: 7F
    dta $FF		; 2937: FF
    dta $FF		; 2938: FF
    dta $FF		; 2939: FF
    dta $15		; 293A: 15
    dta $3F		; 293B: 3F
    dta $FC		; 293C: FC
    dta $47		; 293D: 47
    dta $F9		; 293E: F9
    dta $50		; 293F: 50
    dta $BF		; 2940: BF
    dta $15		; 2941: 15
    dta $15		; 2942: 15
    dta $3F		; 2943: 3F
    dta $FF		; 2944: FF
    dta $FF		; 2945: FF
    dta $FF		; 2946: FF
    dta $FF		; 2947: FF
    dta $FF		; 2948: FF
    dta $FF		; 2949: FF
    dta $FF		; 294A: FF
    dta $FF		; 294B: FF
    dta $FF		; 294C: FF
    dta $99		; 294D: 99
    dta $99		; 294E: 99
    dta $99		; 294F: 99
    dta $9F		; 2950: 9F
    dta $99		; 2951: 99
    dta $99		; 2952: 99
    dta $E7		; 2953: E7
    dta $9F		; 2954: 9F
    dta $FF		; 2955: FF
    dta $FF		; 2956: FF
    dta $FF		; 2957: FF
    dta $FF		; 2958: FF
    dta $FF		; 2959: FF
    dta $FF		; 295A: FF
    dta $FF		; 295B: FF
    dta $FC		; 295C: FC
    dta $55		; 295D: 55
    dta $5F		; 295E: 5F
    dta $FF		; 295F: FF
    dta $FF		; 2960: FF
    dta $FE		; 2961: FE
    dta $15		; 2962: 15
    dta $3F		; 2963: 3F
    dta $F9		; 2964: F9
    dta $4F		; 2965: 4F
    dta $F9		; 2966: F9
    dta $50		; 2967: 50
    dta $3F		; 2968: 3F
    dta $15		; 2969: 15
    dta $15		; 296A: 15
    dta $1F		; 296B: 1F
    dta $FF		; 296C: FF
    dta $FF		; 296D: FF
    dta $FF		; 296E: FF
    dta $FF		; 296F: FF
    dta $FF		; 2970: FF
    dta $FF		; 2971: FF
    dta $FF		; 2972: FF
    dta $FF		; 2973: FF
    dta $FF		; 2974: FF
    dta $99		; 2975: 99
    dta $9F		; 2976: 9F
    dta $81		; 2977: 81
    dta $C3		; 2978: C3
    dta $81		; 2979: 81
    dta $99		; 297A: 99
    dta $E7		; 297B: E7
    dta $C3		; 297C: C3
    dta $FF		; 297D: FF
    dta $FF		; 297E: FF
    dta $FF		; 297F: FF
    dta $FF		; 2980: FF
    dta $FF		; 2981: FF
    dta $FF		; 2982: FF
    dta $FF		; 2983: FF
    dta $FD		; 2984: FD
    dta $55		; 2985: 55
    dta $43		; 2986: 43
    dta $FF		; 2987: FF
    dta $FF		; 2988: FF
    dta $FE		; 2989: FE
    dta $55		; 298A: 55
    dta $7F		; 298B: 7F
    dta $F1		; 298C: F1
    dta $1F		; 298D: 1F
    dta $F1		; 298E: F1
    dta $51		; 298F: 51
    dta $7F		; 2990: 7F
    dta $55		; 2991: 55
    dta $5		; 2992: 05
    dta $1F		; 2993: 1F
    dta $FF		; 2994: FF
    dta $FF		; 2995: FF
    dta $FF		; 2996: FF
    dta $FF		; 2997: FF
    dta $FF		; 2998: FF
    dta $FF		; 2999: FF
    dta $FF		; 299A: FF
    dta $FF		; 299B: FF
    dta $FF		; 299C: FF
    dta $83		; 299D: 83
    dta $9F		; 299E: 9F
    dta $9F		; 299F: 9F
    dta $F9		; 29A0: F9
    dta $9F		; 29A1: 9F
    dta $99		; 29A2: 99
    dta $E7		; 29A3: E7
    dta $F9		; 29A4: F9
    dta $FF		; 29A5: FF
    dta $FF		; 29A6: FF
    dta $FF		; 29A7: FF
    dta $FF		; 29A8: FF
    dta $FF		; 29A9: FF
    dta $FF		; 29AA: FF
    dta $FF		; 29AB: FF
    dta $F9		; 29AC: F9
    dta $55		; 29AD: 55
    dta $50		; 29AE: 50
    dta $7F		; 29AF: 7F
    dta $FF		; 29B0: FF
    dta $FC		; 29B1: FC
    dta $55		; 29B2: 55
    dta $FF		; 29B3: FF
    dta $E5		; 29B4: E5
    dta $0		; 29B5: 00
    dta $1		; 29B6: 01
    dta $51		; 29B7: 51
    dta $FE		; 29B8: FE
    dta $55		; 29B9: 55
    dta $45		; 29BA: 45
    dta $F		; 29BB: 0F
    dta $FF		; 29BC: FF
    dta $FF		; 29BD: FF
    dta $FF		; 29BE: FF
    dta $FF		; 29BF: FF
    dta $FF		; 29C0: FF
    dta $FF		; 29C1: FF
    dta $FF		; 29C2: FF
    dta $FF		; 29C3: FF
    dta $FF		; 29C4: FF
    dta $9F		; 29C5: 9F
    dta $F		; 29C6: 0F
    dta $C1		; 29C7: C1
    dta $83		; 29C8: 83
    dta $C1		; 29C9: C1
    dta $8		; 29CA: 08
    dta $F1		; 29CB: F1
    dta $83		; 29CC: 83
    dta $FF		; 29CD: FF
    dta $FF		; 29CE: FF
    dta $FF		; 29CF: FF
    dta $FF		; 29D0: FF
    dta $FF		; 29D1: FF
    dta $FF		; 29D2: FF
    dta $FF		; 29D3: FF
    dta $F9		; 29D4: F9
    dta $55		; 29D5: 55
    dta $55		; 29D6: 55
    dta $5F		; 29D7: 5F
    dta $FF		; 29D8: FF
    dta $F1		; 29D9: F1
    dta $54		; 29DA: 54
    dta $FE		; 29DB: FE
    dta $5		; 29DC: 05
    dta $3F		; 29DD: 3F
    dta $E1		; 29DE: E1
    dta $51		; 29DF: 51
    dta $FE		; 29E0: FE
    dta $55		; 29E1: 55
    dta $45		; 29E2: 45
    dta $4F		; 29E3: 4F
    dta $FF		; 29E4: FF
    dta $FF		; 29E5: FF
    dta $FF		; 29E6: FF
    dta $FF		; 29E7: FF
    dta $FF		; 29E8: FF
    dta $FF		; 29E9: FF
    dta $FF		; 29EA: FF
    dta $FF		; 29EB: FF
    dta $FF		; 29EC: FF
    dta $F		; 29ED: 0F
    dta $FF		; 29EE: FF
    dta $FF		; 29EF: FF
    dta $FF		; 29F0: FF
    dta $FF		; 29F1: FF
    dta $FF		; 29F2: FF
    dta $FF		; 29F3: FF
    dta $FF		; 29F4: FF
    dta $FF		; 29F5: FF
    dta $FF		; 29F6: FF
    dta $FF		; 29F7: FF
    dta $FF		; 29F8: FF
    dta $FF		; 29F9: FF
    dta $FF		; 29FA: FF
    dta $FF		; 29FB: FF
    dta $F1		; 29FC: F1
    dta $55		; 29FD: 55
    dta $55		; 29FE: 55
    dta $0		; 29FF: 00
    dta $FF		; 2A00: FF
    dta $E5		; 2A01: E5
    dta $55		; 2A02: 55
    dta $F0		; 2A03: F0
    dta $54		; 2A04: 54
    dta $0		; 2A05: 00
    dta $5		; 2A06: 05
    dta $51		; 2A07: 51
    dta $FC		; 2A08: FC
    dta $55		; 2A09: 55
    dta $45		; 2A0A: 45
    dta $47		; 2A0B: 47
    dta $FF		; 2A0C: FF
    dta $FF		; 2A0D: FF
    dta $FF		; 2A0E: FF
    dta $FF		; 2A0F: FF
    dta $FF		; 2A10: FF
    dta $FF		; 2A11: FF
    dta $FF		; 2A12: FF
    dta $FF		; 2A13: FF
    dta $FF		; 2A14: FF
    dta $FF		; 2A15: FF
    dta $FF		; 2A16: FF
    dta $FF		; 2A17: FF
    dta $FF		; 2A18: FF
    dta $FF		; 2A19: FF
    dta $FF		; 2A1A: FF
    dta $FF		; 2A1B: FF
    dta $FF		; 2A1C: FF
    dta $FF		; 2A1D: FF
    dta $FF		; 2A1E: FF
    dta $FF		; 2A1F: FF
    dta $FF		; 2A20: FF
    dta $FF		; 2A21: FF
    dta $FF		; 2A22: FF
    dta $FF		; 2A23: FF
    dta $F5		; 2A24: F5
    dta $55		; 2A25: 55
    dta $55		; 2A26: 55
    dta $54		; 2A27: 54
    dta $43		; 2A28: 43
    dta $E5		; 2A29: E5
    dta $53		; 2A2A: 53
    dta $5		; 2A2B: 05
    dta $54		; 2A2C: 54
    dta $FF		; 2A2D: FF
    dta $E5		; 2A2E: E5
    dta $53		; 2A2F: 53
    dta $F9		; 2A30: F9
    dta $55		; 2A31: 55
    dta $45		; 2A32: 45
    dta $47		; 2A33: 47
    dta $FF		; 2A34: FF
    dta $FF		; 2A35: FF
    dta $FF		; 2A36: FF
    dta $FF		; 2A37: FF
    dta $FF		; 2A38: FF
    dta $FF		; 2A39: FF
    dta $FF		; 2A3A: FF
    dta $FF		; 2A3B: FF
    dta $FF		; 2A3C: FF
    dta $FF		; 2A3D: FF
    dta $FF		; 2A3E: FF
    dta $FF		; 2A3F: FF
    dta $FF		; 2A40: FF
    dta $FF		; 2A41: FF
    dta $FF		; 2A42: FF
    dta $FF		; 2A43: FF
    dta $FF		; 2A44: FF
    dta $FF		; 2A45: FF
    dta $FF		; 2A46: FF
    dta $FF		; 2A47: FF
    dta $FF		; 2A48: FF
    dta $FF		; 2A49: FF
    dta $FF		; 2A4A: FF
    dta $FF		; 2A4B: FF
    dta $E5		; 2A4C: E5
    dta $55		; 2A4D: 55
    dta $55		; 2A4E: 55
    dta $55		; 2A4F: 55
    dta $50		; 2A50: 50
    dta $5		; 2A51: 05
    dta $50		; 2A52: 50
    dta $55		; 2A53: 55
    dta $55		; 2A54: 55
    dta $FF		; 2A55: FF
    dta $E5		; 2A56: E5
    dta $53		; 2A57: 53
    dta $F9		; 2A58: F9
    dta $55		; 2A59: 55
    dta $45		; 2A5A: 45
    dta $43		; 2A5B: 43
    dta $FF		; 2A5C: FF
    dta $FF		; 2A5D: FF
    dta $FF		; 2A5E: FF
    dta $FF		; 2A5F: FF
    dta $FF		; 2A60: FF
    dta $FF		; 2A61: FF
    dta $FF		; 2A62: FF
    dta $FF		; 2A63: FF
    dta $FF		; 2A64: FF
    dta $FF		; 2A65: FF
    dta $FF		; 2A66: FF
    dta $FF		; 2A67: FF
    dta $FF		; 2A68: FF
    dta $FF		; 2A69: FF
    dta $FF		; 2A6A: FF
    dta $FF		; 2A6B: FF
    dta $FF		; 2A6C: FF
    dta $FF		; 2A6D: FF
    dta $FF		; 2A6E: FF
    dta $FF		; 2A6F: FF
    dta $FF		; 2A70: FF
    dta $FF		; 2A71: FF
    dta $FF		; 2A72: FF
    dta $FF		; 2A73: FF
    dta $E5		; 2A74: E5
    dta $55		; 2A75: 55
    dta $55		; 2A76: 55
    dta $55		; 2A77: 55
    dta $55		; 2A78: 55
    dta $45		; 2A79: 45
    dta $45		; 2A7A: 45
    dta $55		; 2A7B: 55
    dta $51		; 2A7C: 51
    dta $FF		; 2A7D: FF
    dta $E5		; 2A7E: E5
    dta $53		; 2A7F: 53
    dta $F9		; 2A80: F9
    dta $55		; 2A81: 55
    dta $45		; 2A82: 45
    dta $43		; 2A83: 43
    dta $FF		; 2A84: FF
    dta $FF		; 2A85: FF
    dta $FF		; 2A86: FF
    dta $FF		; 2A87: FF
    dta $FF		; 2A88: FF
    dta $FF		; 2A89: FF
    dta $FF		; 2A8A: FF
    dta $FF		; 2A8B: FF
    dta $FF		; 2A8C: FF
    dta $FF		; 2A8D: FF
    dta $FF		; 2A8E: FF
    dta $FF		; 2A8F: FF
    dta $FF		; 2A90: FF
    dta $FF		; 2A91: FF
    dta $FF		; 2A92: FF
    dta $FF		; 2A93: FF
    dta $FF		; 2A94: FF
    dta $FF		; 2A95: FF
    dta $FF		; 2A96: FF
    dta $FF		; 2A97: FF
    dta $FF		; 2A98: FF
    dta $FF		; 2A99: FF
    dta $FF		; 2A9A: FF
    dta $FF		; 2A9B: FF
    dta $C5		; 2A9C: C5
    dta $55		; 2A9D: 55
    dta $55		; 2A9E: 55
    dta $55		; 2A9F: 55
    dta $55		; 2AA0: 55
    dta $55		; 2AA1: 55
    dta $45		; 2AA2: 45
    dta $55		; 2AA3: 55
    dta $52		; 2AA4: 52
    dta $0		; 2AA5: 00
    dta $9		; 2AA6: 09
    dta $53		; 2AA7: 53
    dta $F1		; 2AA8: F1
    dta $55		; 2AA9: 55
    dta $45		; 2AAA: 45
    dta $51		; 2AAB: 51
    dta $FF		; 2AAC: FF
    dta $FF		; 2AAD: FF
    dta $FF		; 2AAE: FF
    dta $FF		; 2AAF: FF
    dta $FF		; 2AB0: FF
    dta $FF		; 2AB1: FF
    dta $FF		; 2AB2: FF
    dta $FF		; 2AB3: FF
    dta $FF		; 2AB4: FF
    dta $FF		; 2AB5: FF
    dta $FF		; 2AB6: FF
    dta $FF		; 2AB7: FF
    dta $FF		; 2AB8: FF
    dta $FF		; 2AB9: FF
    dta $FF		; 2ABA: FF
    dta $FF		; 2ABB: FF
    dta $FF		; 2ABC: FF
    dta $FF		; 2ABD: FF
    dta $FF		; 2ABE: FF
    dta $FF		; 2ABF: FF
    dta $FF		; 2AC0: FF
    dta $FF		; 2AC1: FF
    dta $FF		; 2AC2: FF
    dta $FF		; 2AC3: FF
    dta $95		; 2AC4: 95
    dta $55		; 2AC5: 55
    dta $55		; 2AC6: 55
    dta $55		; 2AC7: 55
    dta $55		; 2AC8: 55
    dta $15		; 2AC9: 15
    dta $15		; 2ACA: 15
    dta $54		; 2ACB: 54
    dta $53		; 2ACC: 53
    dta $FF		; 2ACD: FF
    dta $E9		; 2ACE: E9
    dta $53		; 2ACF: 53
    dta $E5		; 2AD0: E5
    dta $55		; 2AD1: 55
    dta $45		; 2AD2: 45
    dta $51		; 2AD3: 51
    dta $FF		; 2AD4: FF
    dta $FF		; 2AD5: FF
    dta $FF		; 2AD6: FF
    dta $FF		; 2AD7: FF
    dta $FF		; 2AD8: FF
    dta $FF		; 2AD9: FF
    dta $FF		; 2ADA: FF
    dta $FF		; 2ADB: FF
    dta $FF		; 2ADC: FF
    dta $FF		; 2ADD: FF
    dta $FF		; 2ADE: FF
    dta $FF		; 2ADF: FF
    dta $FF		; 2AE0: FF
    dta $FF		; 2AE1: FF
    dta $FF		; 2AE2: FF
    dta $FF		; 2AE3: FF
    dta $FF		; 2AE4: FF
    dta $FF		; 2AE5: FF
    dta $FF		; 2AE6: FF
    dta $FF		; 2AE7: FF
    dta $FF		; 2AE8: FF
    dta $FF		; 2AE9: FF
    dta $FF		; 2AEA: FF
    dta $FF		; 2AEB: FF
    dta $15		; 2AEC: 15
    dta $55		; 2AED: 55
    dta $55		; 2AEE: 55
    dta $55		; 2AEF: 55
    dta $54		; 2AF0: 54
    dta $55		; 2AF1: 55
    dta $15		; 2AF2: 15
    dta $51		; 2AF3: 51
    dta $57		; 2AF4: 57
    dta $C0		; 2AF5: C0
    dta $E1		; 2AF6: E1
    dta $53		; 2AF7: 53
    dta $C5		; 2AF8: C5
    dta $55		; 2AF9: 55
    dta $41		; 2AFA: 41
    dta $50		; 2AFB: 50
    dta $FF		; 2AFC: FF
    dta $FF		; 2AFD: FF
    dta $FF		; 2AFE: FF
    dta $FF		; 2AFF: FF
    dta $FF		; 2B00: FF
    dta $FF		; 2B01: FF
    dta $FF		; 2B02: FF
    dta $FF		; 2B03: FF
    dta $FF		; 2B04: FF
    dta $FF		; 2B05: FF
    dta $FF		; 2B06: FF
    dta $FF		; 2B07: FF
    dta $FF		; 2B08: FF
    dta $FF		; 2B09: FF
    dta $FF		; 2B0A: FF
    dta $FF		; 2B0B: FF
    dta $FF		; 2B0C: FF
    dta $FF		; 2B0D: FF
    dta $FF		; 2B0E: FF
    dta $FF		; 2B0F: FF
    dta $FF		; 2B10: FF
    dta $FF		; 2B11: FF
    dta $FF		; 2B12: FF
    dta $FE		; 2B13: FE
    dta $15		; 2B14: 15
    dta $55		; 2B15: 55
    dta $55		; 2B16: 55
    dta $55		; 2B17: 55
    dta $54		; 2B18: 54
    dta $55		; 2B19: 55
    dta $0		; 2B1A: 00
    dta $5		; 2B1B: 05
    dta $50		; 2B1C: 50
    dta $1E		; 2B1D: 1E
    dta $1		; 2B1E: 01
    dta $54		; 2B1F: 54
    dta $15		; 2B20: 15
    dta $55		; 2B21: 55
    dta $51		; 2B22: 51
    dta $50		; 2B23: 50
    dta $7F		; 2B24: 7F
    dta $FF		; 2B25: FF
    dta $FF		; 2B26: FF
    dta $FF		; 2B27: FF
    dta $FF		; 2B28: FF
    dta $FF		; 2B29: FF
    dta $FF		; 2B2A: FF
    dta $FF		; 2B2B: FF
    dta $FF		; 2B2C: FF
    dta $FF		; 2B2D: FF
    dta $FF		; 2B2E: FF
    dta $FF		; 2B2F: FF
    dta $FF		; 2B30: FF
    dta $FF		; 2B31: FF
    dta $FF		; 2B32: FF
    dta $FF		; 2B33: FF
    dta $FF		; 2B34: FF
    dta $FF		; 2B35: FF
    dta $FF		; 2B36: FF
    dta $FF		; 2B37: FF
    dta $FF		; 2B38: FF
    dta $FF		; 2B39: FF
    dta $FF		; 2B3A: FF
    dta $FC		; 2B3B: FC
    dta $55		; 2B3C: 55
    dta $55		; 2B3D: 55
    dta $55		; 2B3E: 55
    dta $55		; 2B3F: 55
    dta $54		; 2B40: 54
    dta $55		; 2B41: 55
    dta $55		; 2B42: 55
    dta $55		; 2B43: 55
    dta $5F		; 2B44: 5F
    dta $FF		; 2B45: FF
    dta $F1		; 2B46: F1
    dta $54		; 2B47: 54
    dta $15		; 2B48: 15
    dta $55		; 2B49: 55
    dta $51		; 2B4A: 51
    dta $54		; 2B4B: 54
    dta $7F		; 2B4C: 7F
    dta $FF		; 2B4D: FF
    dta $FF		; 2B4E: FF
    dta $FF		; 2B4F: FF
    dta $FF		; 2B50: FF
    dta $FF		; 2B51: FF
    dta $FF		; 2B52: FF
    dta $FF		; 2B53: FF
    dta $FF		; 2B54: FF
    dta $FF		; 2B55: FF
    dta $FF		; 2B56: FF
    dta $FF		; 2B57: FF
    dta $FF		; 2B58: FF
    dta $FF		; 2B59: FF
    dta $FF		; 2B5A: FF
    dta $FF		; 2B5B: FF
    dta $FF		; 2B5C: FF
    dta $FF		; 2B5D: FF
    dta $FF		; 2B5E: FF
    dta $FF		; 2B5F: FF
    dta $FF		; 2B60: FF
    dta $FF		; 2B61: FF
    dta $FF		; 2B62: FF
    dta $F9		; 2B63: F9
    dta $55		; 2B64: 55
    dta $55		; 2B65: 55
    dta $55		; 2B66: 55
    dta $55		; 2B67: 55
    dta $54		; 2B68: 54
    dta $55		; 2B69: 55
    dta $55		; 2B6A: 55
    dta $55		; 2B6B: 55
    dta $5F		; 2B6C: 5F
    dta $FF		; 2B6D: FF
    dta $F1		; 2B6E: F1
    dta $54		; 2B6F: 54
    dta $55		; 2B70: 55
    dta $55		; 2B71: 55
    dta $51		; 2B72: 51
    dta $54		; 2B73: 54
    dta $3F		; 2B74: 3F
    dta $FF		; 2B75: FF
    dta $FF		; 2B76: FF
    dta $FF		; 2B77: FF
    dta $FF		; 2B78: FF
    dta $FF		; 2B79: FF
    dta $FF		; 2B7A: FF
    dta $FF		; 2B7B: FF
    dta $FF		; 2B7C: FF
    dta $FF		; 2B7D: FF
    dta $FF		; 2B7E: FF
    dta $FF		; 2B7F: FF
    dta $FF		; 2B80: FF
    dta $FF		; 2B81: FF
    dta $FF		; 2B82: FF
    dta $FF		; 2B83: FF
    dta $FF		; 2B84: FF
    dta $FF		; 2B85: FF
    dta $FF		; 2B86: FF
    dta $FF		; 2B87: FF
    dta $FF		; 2B88: FF
    dta $FF		; 2B89: FF
    dta $FF		; 2B8A: FF
    dta $F1		; 2B8B: F1
    dta $55		; 2B8C: 55
    dta $55		; 2B8D: 55
    dta $55		; 2B8E: 55
    dta $55		; 2B8F: 55
    dta $54		; 2B90: 54
    dta $55		; 2B91: 55
    dta $55		; 2B92: 55
    dta $55		; 2B93: 55
    dta $50		; 2B94: 50
    dta $7		; 2B95: 07
    dta $F1		; 2B96: F1
    dta $55		; 2B97: 55
    dta $15		; 2B98: 15
    dta $55		; 2B99: 55
    dta $51		; 2B9A: 51
    dta $54		; 2B9B: 54
    dta $1F		; 2B9C: 1F
    dta $FF		; 2B9D: FF
    dta $FF		; 2B9E: FF
    dta $FF		; 2B9F: FF
    dta $FF		; 2BA0: FF
    dta $FF		; 2BA1: FF
    dta $FF		; 2BA2: FF
    dta $FF		; 2BA3: FF
    dta $FF		; 2BA4: FF
    dta $FF		; 2BA5: FF
    dta $FF		; 2BA6: FF
    dta $FF		; 2BA7: FF
    dta $FF		; 2BA8: FF
    dta $FF		; 2BA9: FF
    dta $FF		; 2BAA: FF
    dta $FF		; 2BAB: FF
    dta $FF		; 2BAC: FF
    dta $FF		; 2BAD: FF
    dta $FF		; 2BAE: FF
    dta $FF		; 2BAF: FF
    dta $FF		; 2BB0: FF
    dta $FF		; 2BB1: FF
    dta $FF		; 2BB2: FF
    dta $E5		; 2BB3: E5
    dta $55		; 2BB4: 55
    dta $55		; 2BB5: 55
    dta $55		; 2BB6: 55
    dta $55		; 2BB7: 55
    dta $54		; 2BB8: 54
    dta $55		; 2BB9: 55
    dta $55		; 2BBA: 55
    dta $55		; 2BBB: 55
    dta $57		; 2BBC: 57
    dta $F0		; 2BBD: F0
    dta $1		; 2BBE: 01
    dta $55		; 2BBF: 55
    dta $15		; 2BC0: 15
    dta $55		; 2BC1: 55
    dta $51		; 2BC2: 51
    dta $54		; 2BC3: 54
    dta $1F		; 2BC4: 1F
    dta $FF		; 2BC5: FF
    dta $FF		; 2BC6: FF
    dta $FF		; 2BC7: FF
    dta $FF		; 2BC8: FF
    dta $FF		; 2BC9: FF
    dta $FF		; 2BCA: FF
    dta $FF		; 2BCB: FF
    dta $FF		; 2BCC: FF
    dta $FF		; 2BCD: FF
    dta $FF		; 2BCE: FF
    dta $FF		; 2BCF: FF
    dta $FF		; 2BD0: FF
    dta $FF		; 2BD1: FF
    dta $FF		; 2BD2: FF
    dta $FF		; 2BD3: FF
    dta $FF		; 2BD4: FF
    dta $FF		; 2BD5: FF
    dta $FF		; 2BD6: FF
    dta $FF		; 2BD7: FF
    dta $FF		; 2BD8: FF
    dta $FF		; 2BD9: FF
    dta $FF		; 2BDA: FF
    dta $85		; 2BDB: 85
    dta $55		; 2BDC: 55
    dta $55		; 2BDD: 55
    dta $55		; 2BDE: 55
    dta $55		; 2BDF: 55
    dta $54		; 2BE0: 54
    dta $55		; 2BE1: 55
    dta $55		; 2BE2: 55
    dta $55		; 2BE3: 55
    dta $5F		; 2BE4: 5F
    dta $FF		; 2BE5: FF
    dta $F5		; 2BE6: F5
    dta $55		; 2BE7: 55
    dta $15		; 2BE8: 15
    dta $55		; 2BE9: 55
    dta $51		; 2BEA: 51
    dta $55		; 2BEB: 55
    dta $1F		; 2BEC: 1F
    dta $FF		; 2BED: FF
    dta $FF		; 2BEE: FF
    dta $FF		; 2BEF: FF
    dta $FF		; 2BF0: FF
    dta $FF		; 2BF1: FF
    dta $FF		; 2BF2: FF
    dta $FF		; 2BF3: FF
    dta $FF		; 2BF4: FF
    dta $FF		; 2BF5: FF
    dta $FF		; 2BF6: FF
    dta $FF		; 2BF7: FF
    dta $FF		; 2BF8: FF
    dta $FF		; 2BF9: FF
    dta $FF		; 2BFA: FF
    dta $FF		; 2BFB: FF
    dta $FF		; 2BFC: FF
    dta $FF		; 2BFD: FF
    dta $FF		; 2BFE: FF
    dta $FF		; 2BFF: FF
    dta $FF		; 2C00: FF
    dta $FF		; 2C01: FF
    dta $FE		; 2C02: FE
    dta $15		; 2C03: 15
    dta $55		; 2C04: 55
    dta $55		; 2C05: 55
    dta $55		; 2C06: 55
    dta $55		; 2C07: 55
    dta $54		; 2C08: 54
    dta $55		; 2C09: 55
    dta $55		; 2C0A: 55
    dta $55		; 2C0B: 55
    dta $40		; 2C0C: 40
    dta $0		; 2C0D: 00
    dta $9		; 2C0E: 09
    dta $55		; 2C0F: 55
    dta $15		; 2C10: 15
    dta $55		; 2C11: 55
    dta $51		; 2C12: 51
    dta $55		; 2C13: 55
    dta $1F		; 2C14: 1F
    dta $FF		; 2C15: FF
    dta $FF		; 2C16: FF
    dta $FF		; 2C17: FF
    dta $FF		; 2C18: FF
    dta $FF		; 2C19: FF
    dta $FF		; 2C1A: FF
    dta $FF		; 2C1B: FF
    dta $FF		; 2C1C: FF
    dta $FF		; 2C1D: FF
    dta $FF		; 2C1E: FF
    dta $FF		; 2C1F: FF
    dta $FF		; 2C20: FF
    dta $FF		; 2C21: FF
    dta $FF		; 2C22: FF
    dta $FF		; 2C23: FF
    dta $FF		; 2C24: FF
    dta $FF		; 2C25: FF
    dta $FF		; 2C26: FF
    dta $FF		; 2C27: FF
    dta $FF		; 2C28: FF
    dta $FF		; 2C29: FF
    dta $F8		; 2C2A: F8
    dta $55		; 2C2B: 55
    dta $55		; 2C2C: 55
    dta $55		; 2C2D: 55
    dta $55		; 2C2E: 55
    dta $55		; 2C2F: 55
    dta $55		; 2C30: 55
    dta $15		; 2C31: 15
    dta $55		; 2C32: 55
    dta $55		; 2C33: 55
    dta $1F		; 2C34: 1F
    dta $FF		; 2C35: FF
    dta $E1		; 2C36: E1
    dta $55		; 2C37: 55
    dta $15		; 2C38: 15
    dta $55		; 2C39: 55
    dta $51		; 2C3A: 51
    dta $55		; 2C3B: 55
    dta $F		; 2C3C: 0F
    dta $FF		; 2C3D: FF
    dta $FF		; 2C3E: FF
    dta $FF		; 2C3F: FF
    dta $FF		; 2C40: FF
    dta $FF		; 2C41: FF
    dta $FF		; 2C42: FF
    dta $FF		; 2C43: FF
    dta $FF		; 2C44: FF
    dta $FF		; 2C45: FF
    dta $FF		; 2C46: FF
    dta $FF		; 2C47: FF
    dta $FF		; 2C48: FF
    dta $FF		; 2C49: FF
    dta $FF		; 2C4A: FF
    dta $FF		; 2C4B: FF
    dta $FF		; 2C4C: FF
    dta $FF		; 2C4D: FF
    dta $FF		; 2C4E: FF
    dta $FF		; 2C4F: FF
    dta $FF		; 2C50: FF
    dta $FF		; 2C51: FF
    dta $C1		; 2C52: C1
    dta $55		; 2C53: 55
    dta $55		; 2C54: 55
    dta $55		; 2C55: 55
    dta $55		; 2C56: 55
    dta $55		; 2C57: 55
    dta $55		; 2C58: 55
    dta $41		; 2C59: 41
    dta $55		; 2C5A: 55
    dta $55		; 2C5B: 55
    dta $3F		; 2C5C: 3F
    dta $FF		; 2C5D: FF
    dta $F9		; 2C5E: F9
    dta $55		; 2C5F: 55
    dta $15		; 2C60: 15
    dta $55		; 2C61: 55
    dta $51		; 2C62: 51
    dta $55		; 2C63: 55
    dta $F		; 2C64: 0F
    dta $FF		; 2C65: FF
    dta $FF		; 2C66: FF
    dta $FF		; 2C67: FF
    dta $FF		; 2C68: FF
    dta $FF		; 2C69: FF
    dta $FF		; 2C6A: FF
    dta $FF		; 2C6B: FF
    dta $FF		; 2C6C: FF
    dta $FF		; 2C6D: FF
    dta $FF		; 2C6E: FF
    dta $FF		; 2C6F: FF
    dta $FF		; 2C70: FF
    dta $FF		; 2C71: FF
    dta $FF		; 2C72: FF
    dta $FF		; 2C73: FF
    dta $FF		; 2C74: FF
    dta $FF		; 2C75: FF
    dta $FF		; 2C76: FF
    dta $FF		; 2C77: FF
    dta $FF		; 2C78: FF
    dta $FE		; 2C79: FE
    dta $15		; 2C7A: 15
    dta $55		; 2C7B: 55
    dta $55		; 2C7C: 55
    dta $55		; 2C7D: 55
    dta $55		; 2C7E: 55
    dta $55		; 2C7F: 55
    dta $55		; 2C80: 55
    dta $54		; 2C81: 54
    dta $55		; 2C82: 55
    dta $55		; 2C83: 55
    dta $7F		; 2C84: 7F
    dta $FF		; 2C85: FF
    dta $F9		; 2C86: F9
    dta $55		; 2C87: 55
    dta $45		; 2C88: 45
    dta $55		; 2C89: 55
    dta $51		; 2C8A: 51
    dta $55		; 2C8B: 55
    dta $7		; 2C8C: 07
    dta $FF		; 2C8D: FF
    dta $FF		; 2C8E: FF
    dta $FF		; 2C8F: FF
    dta $FF		; 2C90: FF
    dta $FF		; 2C91: FF
    dta $FF		; 2C92: FF
    dta $FF		; 2C93: FF
    dta $FF		; 2C94: FF
    dta $FF		; 2C95: FF
    dta $FF		; 2C96: FF
    dta $FF		; 2C97: FF
    dta $FF		; 2C98: FF
    dta $FF		; 2C99: FF
    dta $FF		; 2C9A: FF
    dta $FF		; 2C9B: FF
    dta $FF		; 2C9C: FF
    dta $FF		; 2C9D: FF
    dta $FF		; 2C9E: FF
    dta $FF		; 2C9F: FF
    dta $FF		; 2CA0: FF
    dta $F0		; 2CA1: F0
    dta $55		; 2CA2: 55
    dta $55		; 2CA3: 55
    dta $55		; 2CA4: 55
    dta $55		; 2CA5: 55
    dta $55		; 2CA6: 55
    dta $55		; 2CA7: 55
    dta $55		; 2CA8: 55
    dta $55		; 2CA9: 55
    dta $41		; 2CAA: 41
    dta $54		; 2CAB: 54
    dta $E0		; 2CAC: E0
    dta $1F		; 2CAD: 1F
    dta $F9		; 2CAE: F9
    dta $55		; 2CAF: 55
    dta $45		; 2CB0: 45
    dta $55		; 2CB1: 55
    dta $51		; 2CB2: 51
    dta $55		; 2CB3: 55
    dta $47		; 2CB4: 47
    dta $FF		; 2CB5: FF
    dta $FF		; 2CB6: FF
    dta $FF		; 2CB7: FF
    dta $FF		; 2CB8: FF
    dta $FF		; 2CB9: FF
    dta $FF		; 2CBA: FF
    dta $FF		; 2CBB: FF
    dta $FF		; 2CBC: FF
    dta $FF		; 2CBD: FF
    dta $FF		; 2CBE: FF
    dta $FF		; 2CBF: FF
    dta $FF		; 2CC0: FF
    dta $FF		; 2CC1: FF
    dta $FF		; 2CC2: FF
    dta $FF		; 2CC3: FF
    dta $FF		; 2CC4: FF
    dta $FF		; 2CC5: FF
    dta $FF		; 2CC6: FF
    dta $FF		; 2CC7: FF
    dta $FF		; 2CC8: FF
    dta $85		; 2CC9: 85
    dta $55		; 2CCA: 55
    dta $55		; 2CCB: 55
    dta $55		; 2CCC: 55
    dta $55		; 2CCD: 55
    dta $55		; 2CCE: 55
    dta $55		; 2CCF: 55
    dta $55		; 2CD0: 55
    dta $55		; 2CD1: 55
    dta $50		; 2CD2: 50
    dta $54		; 2CD3: 54
    dta $F		; 2CD4: 0F
    dta $C0		; 2CD5: C0
    dta $39		; 2CD6: 39
    dta $55		; 2CD7: 55
    dta $45		; 2CD8: 45
    dta $55		; 2CD9: 55
    dta $51		; 2CDA: 51
    dta $55		; 2CDB: 55
    dta $43		; 2CDC: 43
    dta $FF		; 2CDD: FF
    dta $FF		; 2CDE: FF
    dta $FF		; 2CDF: FF
    dta $FF		; 2CE0: FF
    dta $FF		; 2CE1: FF
    dta $FF		; 2CE2: FF
    dta $FF		; 2CE3: FF
    dta $FF		; 2CE4: FF
    dta $FF		; 2CE5: FF
    dta $FF		; 2CE6: FF
    dta $FF		; 2CE7: FF
    dta $FF		; 2CE8: FF
    dta $FF		; 2CE9: FF
    dta $FF		; 2CEA: FF
    dta $FF		; 2CEB: FF
    dta $FF		; 2CEC: FF
    dta $FF		; 2CED: FF
    dta $FF		; 2CEE: FF
    dta $FF		; 2CEF: FF
    dta $FC		; 2CF0: FC
    dta $15		; 2CF1: 15
    dta $55		; 2CF2: 55
    dta $55		; 2CF3: 55
    dta $55		; 2CF4: 55
    dta $55		; 2CF5: 55
    dta $55		; 2CF6: 55
    dta $55		; 2CF7: 55
    dta $55		; 2CF8: 55
    dta $55		; 2CF9: 55
    dta $55		; 2CFA: 55
    dta $46		; 2CFB: 46
    dta $40		; 2CFC: 40
    dta $3F		; 2CFD: 3F
    dta $81		; 2CFE: 81
    dta $55		; 2CFF: 55
    dta $51		; 2D00: 51
    dta $55		; 2D01: 55
    dta $51		; 2D02: 51
    dta $55		; 2D03: 55
    dta $43		; 2D04: 43
    dta $FF		; 2D05: FF
    dta $FF		; 2D06: FF
    dta $FF		; 2D07: FF
    dta $FF		; 2D08: FF
    dta $FF		; 2D09: FF
    dta $FF		; 2D0A: FF
    dta $FF		; 2D0B: FF
    dta $FF		; 2D0C: FF
    dta $FF		; 2D0D: FF
    dta $FF		; 2D0E: FF
    dta $FF		; 2D0F: FF
    dta $FF		; 2D10: FF
    dta $FF		; 2D11: FF
    dta $FF		; 2D12: FF
    dta $FF		; 2D13: FF
    dta $FF		; 2D14: FF
    dta $FF		; 2D15: FF
    dta $FF		; 2D16: FF
    dta $FF		; 2D17: FF
    dta $E1		; 2D18: E1
    dta $55		; 2D19: 55
    dta $55		; 2D1A: 55
    dta $55		; 2D1B: 55
    dta $55		; 2D1C: 55
    dta $55		; 2D1D: 55
    dta $55		; 2D1E: 55
    dta $55		; 2D1F: 55
    dta $55		; 2D20: 55
    dta $55		; 2D21: 55
    dta $55		; 2D22: 55
    dta $44		; 2D23: 44
    dta $7		; 2D24: 07
    dta $BF		; 2D25: BF
    dta $FC		; 2D26: FC
    dta $55		; 2D27: 55
    dta $51		; 2D28: 51
    dta $55		; 2D29: 55
    dta $51		; 2D2A: 51
    dta $55		; 2D2B: 55
    dta $41		; 2D2C: 41
    dta $FF		; 2D2D: FF
    dta $FF		; 2D2E: FF
    dta $FF		; 2D2F: FF
    dta $FF		; 2D30: FF
    dta $FF		; 2D31: FF
    dta $FF		; 2D32: FF
    dta $FF		; 2D33: FF
    dta $FF		; 2D34: FF
    dta $FF		; 2D35: FF
    dta $FF		; 2D36: FF
    dta $FF		; 2D37: FF
    dta $FF		; 2D38: FF
    dta $FF		; 2D39: FF
    dta $FF		; 2D3A: FF
    dta $FF		; 2D3B: FF
    dta $FF		; 2D3C: FF
    dta $FF		; 2D3D: FF
    dta $FF		; 2D3E: FF
    dta $FF		; 2D3F: FF
    dta $5		; 2D40: 05
    dta $55		; 2D41: 55
    dta $55		; 2D42: 55
    dta $55		; 2D43: 55
    dta $55		; 2D44: 55
    dta $55		; 2D45: 55
    dta $55		; 2D46: 55
    dta $55		; 2D47: 55
    dta $55		; 2D48: 55
    dta $55		; 2D49: 55
    dta $55		; 2D4A: 55
    dta $48		; 2D4B: 48
    dta $7D		; 2D4C: 7D
    dta $1F		; 2D4D: 1F
    dta $FC		; 2D4E: FC
    dta $55		; 2D4F: 55
    dta $51		; 2D50: 51
    dta $55		; 2D51: 55
    dta $51		; 2D52: 51
    dta $55		; 2D53: 55
    dta $41		; 2D54: 41
    dta $FF		; 2D55: FF
    dta $FF		; 2D56: FF
    dta $FF		; 2D57: FF
    dta $FF		; 2D58: FF
    dta $FF		; 2D59: FF
    dta $FF		; 2D5A: FF
    dta $FF		; 2D5B: FF
    dta $FF		; 2D5C: FF
    dta $FF		; 2D5D: FF
    dta $FF		; 2D5E: FF
    dta $FF		; 2D5F: FF
    dta $FF		; 2D60: FF
    dta $FF		; 2D61: FF
    dta $FF		; 2D62: FF
    dta $FF		; 2D63: FF
    dta $FF		; 2D64: FF
    dta $FF		; 2D65: FF
    dta $FF		; 2D66: FF
    dta $F8		; 2D67: F8
    dta $55		; 2D68: 55
    dta $55		; 2D69: 55
    dta $55		; 2D6A: 55
    dta $55		; 2D6B: 55
    dta $55		; 2D6C: 55
    dta $55		; 2D6D: 55
    dta $55		; 2D6E: 55
    dta $55		; 2D6F: 55
    dta $55		; 2D70: 55
    dta $55		; 2D71: 55
    dta $55		; 2D72: 55
    dta $4C		; 2D73: 4C
    dta $5		; 2D74: 05
    dta $40		; 2D75: 40
    dta $1C		; 2D76: 1C
    dta $55		; 2D77: 55
    dta $51		; 2D78: 51
    dta $55		; 2D79: 55
    dta $51		; 2D7A: 51
    dta $55		; 2D7B: 55
    dta $41		; 2D7C: 41
    dta $FF		; 2D7D: FF
    dta $FF		; 2D7E: FF
    dta $FF		; 2D7F: FF
    dta $FF		; 2D80: FF
    dta $FF		; 2D81: FF
    dta $FF		; 2D82: FF
    dta $FF		; 2D83: FF
    dta $FF		; 2D84: FF
    dta $FF		; 2D85: FF
    dta $FF		; 2D86: FF
    dta $FF		; 2D87: FF
    dta $FF		; 2D88: FF
    dta $FF		; 2D89: FF
    dta $FF		; 2D8A: FF
    dta $FF		; 2D8B: FF
    dta $FF		; 2D8C: FF
    dta $FF		; 2D8D: FF
    dta $FF		; 2D8E: FF
    dta $85		; 2D8F: 85
    dta $55		; 2D90: 55
    dta $55		; 2D91: 55
    dta $55		; 2D92: 55
    dta $55		; 2D93: 55
    dta $55		; 2D94: 55
    dta $55		; 2D95: 55
    dta $55		; 2D96: 55
    dta $55		; 2D97: 55
    dta $55		; 2D98: 55
    dta $55		; 2D99: 55
    dta $55		; 2D9A: 55
    dta $49		; 2D9B: 49
    dta $55		; 2D9C: 55
    dta $4F		; 2D9D: 4F
    dta $C0		; 2D9E: C0
    dta $55		; 2D9F: 55
    dta $51		; 2DA0: 51
    dta $55		; 2DA1: 55
    dta $51		; 2DA2: 51
    dta $55		; 2DA3: 55
    dta $40		; 2DA4: 40
    dta $FF		; 2DA5: FF
    dta $FF		; 2DA6: FF
    dta $FF		; 2DA7: FF
    dta $FF		; 2DA8: FF
    dta $FF		; 2DA9: FF
    dta $FF		; 2DAA: FF
    dta $FF		; 2DAB: FF
    dta $FF		; 2DAC: FF
    dta $FF		; 2DAD: FF
    dta $FF		; 2DAE: FF
    dta $FF		; 2DAF: FF
    dta $FF		; 2DB0: FF
    dta $FF		; 2DB1: FF
    dta $FF		; 2DB2: FF
    dta $FF		; 2DB3: FF
    dta $FF		; 2DB4: FF
    dta $FF		; 2DB5: FF
    dta $F8		; 2DB6: F8
    dta $15		; 2DB7: 15
    dta $55		; 2DB8: 55
    dta $55		; 2DB9: 55
    dta $5		; 2DBA: 05
    dta $55		; 2DBB: 55
    dta $55		; 2DBC: 55
    dta $55		; 2DBD: 55
    dta $55		; 2DBE: 55
    dta $55		; 2DBF: 55
    dta $55		; 2DC0: 55
    dta $15		; 2DC1: 15
    dta $55		; 2DC2: 55
    dta $49		; 2DC3: 49
    dta $55		; 2DC4: 55
    dta $47		; 2DC5: 47
    dta $FD		; 2DC6: FD
    dta $15		; 2DC7: 15
    dta $51		; 2DC8: 51
    dta $55		; 2DC9: 55
    dta $51		; 2DCA: 51
    dta $55		; 2DCB: 55
    dta $40		; 2DCC: 40
    dta $FF		; 2DCD: FF
    dta $FF		; 2DCE: FF
    dta $FF		; 2DCF: FF
    dta $FF		; 2DD0: FF
    dta $FF		; 2DD1: FF
    dta $FF		; 2DD2: FF
    dta $FF		; 2DD3: FF
    dta $FF		; 2DD4: FF
    dta $FF		; 2DD5: FF
    dta $FF		; 2DD6: FF
    dta $FF		; 2DD7: FF
    dta $FF		; 2DD8: FF
    dta $FF		; 2DD9: FF
    dta $FF		; 2DDA: FF
    dta $FF		; 2DDB: FF
    dta $FF		; 2DDC: FF
    dta $FF		; 2DDD: FF
    dta $5		; 2DDE: 05
    dta $55		; 2DDF: 55
    dta $55		; 2DE0: 55
    dta $50		; 2DE1: 50
    dta $15		; 2DE2: 15
    dta $54		; 2DE3: 54
    dta $15		; 2DE4: 15
    dta $55		; 2DE5: 55
    dta $55		; 2DE6: 55
    dta $55		; 2DE7: 55
    dta $54		; 2DE8: 54
    dta $15		; 2DE9: 15
    dta $55		; 2DEA: 55
    dta $49		; 2DEB: 49
    dta $5		; 2DEC: 05
    dta $47		; 2DED: 47
    dta $FD		; 2DEE: FD
    dta $15		; 2DEF: 15
    dta $51		; 2DF0: 51
    dta $55		; 2DF1: 55
    dta $51		; 2DF2: 51
    dta $55		; 2DF3: 55
    dta $40		; 2DF4: 40
    dta $7F		; 2DF5: 7F
    dta $FF		; 2DF6: FF
    dta $FF		; 2DF7: FF
    dta $FF		; 2DF8: FF
    dta $FF		; 2DF9: FF
    dta $FF		; 2DFA: FF
    dta $FF		; 2DFB: FF
    dta $FF		; 2DFC: FF
    dta $FF		; 2DFD: FF
    dta $FF		; 2DFE: FF
    dta $FF		; 2DFF: FF
    dta $FF		; 2E00: FF
    dta $FF		; 2E01: FF
    dta $FF		; 2E02: FF
    dta $FF		; 2E03: FF
    dta $FF		; 2E04: FF
    dta $E0		; 2E05: E0
    dta $55		; 2E06: 55
    dta $55		; 2E07: 55
    dta $55		; 2E08: 55
    dta $45		; 2E09: 45
    dta $55		; 2E0A: 55
    dta $50		; 2E0B: 50
    dta $55		; 2E0C: 55
    dta $55		; 2E0D: 55
    dta $55		; 2E0E: 55
    dta $15		; 2E0F: 15
    dta $54		; 2E10: 54
    dta $55		; 2E11: 55
    dta $55		; 2E12: 55
    dta $58		; 2E13: 58
    dta $35		; 2E14: 35
    dta $50		; 2E15: 50
    dta $1C		; 2E16: 1C
    dta $15		; 2E17: 15
    dta $51		; 2E18: 51
    dta $55		; 2E19: 55
    dta $51		; 2E1A: 51
    dta $55		; 2E1B: 55
    dta $44		; 2E1C: 44
    dta $7F		; 2E1D: 7F
    dta $FF		; 2E1E: FF
    dta $FF		; 2E1F: FF
    dta $FF		; 2E20: FF
    dta $FF		; 2E21: FF
    dta $FF		; 2E22: FF
    dta $FF		; 2E23: FF
    dta $FF		; 2E24: FF
    dta $FF		; 2E25: FF
    dta $FF		; 2E26: FF
    dta $FF		; 2E27: FF
    dta $FF		; 2E28: FF
    dta $FF		; 2E29: FF
    dta $FF		; 2E2A: FF
    dta $FF		; 2E2B: FF
    dta $FF		; 2E2C: FF
    dta $E5		; 2E2D: E5
    dta $55		; 2E2E: 55
    dta $55		; 2E2F: 55
    dta $54		; 2E30: 54
    dta $15		; 2E31: 15
    dta $55		; 2E32: 55
    dta $41		; 2E33: 41
    dta $55		; 2E34: 55
    dta $45		; 2E35: 45
    dta $55		; 2E36: 55
    dta $15		; 2E37: 15
    dta $50		; 2E38: 50
    dta $55		; 2E39: 55
    dta $55		; 2E3A: 55
    dta $59		; 2E3B: 59
    dta $CC		; 2E3C: CC
    dta $50		; 2E3D: 50
    dta $40		; 2E3E: 40
    dta $5		; 2E3F: 05
    dta $51		; 2E40: 51
    dta $55		; 2E41: 55
    dta $51		; 2E42: 51
    dta $55		; 2E43: 55
    dta $44		; 2E44: 44
    dta $3F		; 2E45: 3F
    dta $FF		; 2E46: FF
    dta $FF		; 2E47: FF
    dta $FF		; 2E48: FF
    dta $FF		; 2E49: FF
    dta $FF		; 2E4A: FF
    dta $FF		; 2E4B: FF
    dta $FF		; 2E4C: FF
    dta $FF		; 2E4D: FF
    dta $FF		; 2E4E: FF
    dta $FF		; 2E4F: FF
    dta $FF		; 2E50: FF
    dta $FF		; 2E51: FF
    dta $FF		; 2E52: FF
    dta $FF		; 2E53: FF
    dta $FF		; 2E54: FF
    dta $F1		; 2E55: F1
    dta $55		; 2E56: 55
    dta $55		; 2E57: 55
    dta $50		; 2E58: 50
    dta $55		; 2E59: 55
    dta $55		; 2E5A: 55
    dta $45		; 2E5B: 45
    dta $55		; 2E5C: 55
    dta $5		; 2E5D: 05
    dta $54		; 2E5E: 54
    dta $15		; 2E5F: 15
    dta $51		; 2E60: 51
    dta $55		; 2E61: 55
    dta $55		; 2E62: 55
    dta $40		; 2E63: 40
    dta $1		; 2E64: 01
    dta $55		; 2E65: 55
    dta $C		; 2E66: 0C
    dta $45		; 2E67: 45
    dta $51		; 2E68: 51
    dta $55		; 2E69: 55
    dta $51		; 2E6A: 51
    dta $55		; 2E6B: 55
    dta $44		; 2E6C: 44
    dta $3F		; 2E6D: 3F
    dta $FF		; 2E6E: FF
    dta $FF		; 2E6F: FF
    dta $FF		; 2E70: FF
    dta $FF		; 2E71: FF
    dta $FF		; 2E72: FF
    dta $FF		; 2E73: FF
    dta $FF		; 2E74: FF
    dta $FF		; 2E75: FF
    dta $FF		; 2E76: FF
    dta $FF		; 2E77: FF
    dta $FF		; 2E78: FF
    dta $FF		; 2E79: FF
    dta $FF		; 2E7A: FF
    dta $FF		; 2E7B: FF
    dta $FF		; 2E7C: FF
    dta $F9		; 2E7D: F9
    dta $55		; 2E7E: 55
    dta $55		; 2E7F: 55
    dta $41		; 2E80: 41
    dta $55		; 2E81: 55
    dta $55		; 2E82: 55
    dta $15		; 2E83: 15
    dta $54		; 2E84: 54
    dta $55		; 2E85: 55
    dta $54		; 2E86: 54
    dta $55		; 2E87: 55
    dta $45		; 2E88: 45
    dta $55		; 2E89: 55
    dta $55		; 2E8A: 55
    dta $41		; 2E8B: 41
    dta $E1		; 2E8C: E1
    dta $55		; 2E8D: 55
    dta $44		; 2E8E: 44
    dta $45		; 2E8F: 45
    dta $51		; 2E90: 51
    dta $55		; 2E91: 55
    dta $51		; 2E92: 51
    dta $55		; 2E93: 55
    dta $44		; 2E94: 44
    dta $3F		; 2E95: 3F
    dta $FF		; 2E96: FF
    dta $FF		; 2E97: FF
    dta $FF		; 2E98: FF
    dta $FF		; 2E99: FF
    dta $FF		; 2E9A: FF
    dta $FF		; 2E9B: FF
    dta $FF		; 2E9C: FF
    dta $FF		; 2E9D: FF
    dta $FF		; 2E9E: FF
    dta $FF		; 2E9F: FF
    dta $FF		; 2EA0: FF
    dta $FF		; 2EA1: FF
    dta $FF		; 2EA2: FF
    dta $FF		; 2EA3: FF
    dta $FF		; 2EA4: FF
    dta $F9		; 2EA5: F9
    dta $55		; 2EA6: 55
    dta $55		; 2EA7: 55
    dta $15		; 2EA8: 15
    dta $55		; 2EA9: 55
    dta $54		; 2EAA: 54
    dta $55		; 2EAB: 55
    dta $51		; 2EAC: 51
    dta $55		; 2EAD: 55
    dta $50		; 2EAE: 50
    dta $55		; 2EAF: 55
    dta $45		; 2EB0: 45
    dta $55		; 2EB1: 55
    dta $55		; 2EB2: 55
    dta $53		; 2EB3: 53
    dta $84		; 2EB4: 84
    dta $15		; 2EB5: 15
    dta $50		; 2EB6: 50
    dta $45		; 2EB7: 45
    dta $51		; 2EB8: 51
    dta $55		; 2EB9: 55
    dta $51		; 2EBA: 51
    dta $55		; 2EBB: 55
    dta $45		; 2EBC: 45
    dta $1F		; 2EBD: 1F
    dta $FF		; 2EBE: FF
    dta $FF		; 2EBF: FF
    dta $FF		; 2EC0: FF
    dta $FF		; 2EC1: FF
    dta $FF		; 2EC2: FF
    dta $FF		; 2EC3: FF
    dta $FF		; 2EC4: FF
    dta $FF		; 2EC5: FF
    dta $FF		; 2EC6: FF
    dta $FF		; 2EC7: FF
    dta $FF		; 2EC8: FF
    dta $FF		; 2EC9: FF
    dta $FF		; 2ECA: FF
    dta $FF		; 2ECB: FF
    dta $FF		; 2ECC: FF
    dta $FE		; 2ECD: FE
    dta $55		; 2ECE: 55
    dta $54		; 2ECF: 54
    dta $55		; 2ED0: 55
    dta $55		; 2ED1: 55
    dta $41		; 2ED2: 41
    dta $55		; 2ED3: 55
    dta $41		; 2ED4: 41
    dta $55		; 2ED5: 55
    dta $51		; 2ED6: 51
    dta $55		; 2ED7: 55
    dta $5		; 2ED8: 05
    dta $55		; 2ED9: 55
    dta $55		; 2EDA: 55
    dta $43		; 2EDB: 43
    dta $11		; 2EDC: 11
    dta $35		; 2EDD: 35
    dta $50		; 2EDE: 50
    dta $45		; 2EDF: 45
    dta $50		; 2EE0: 50
    dta $55		; 2EE1: 55
    dta $51		; 2EE2: 51
    dta $55		; 2EE3: 55
    dta $45		; 2EE4: 45
    dta $1F		; 2EE5: 1F
    dta $FF		; 2EE6: FF
    dta $FF		; 2EE7: FF
    dta $FF		; 2EE8: FF
    dta $FF		; 2EE9: FF
    dta $FF		; 2EEA: FF
    dta $FF		; 2EEB: FF
    dta $FF		; 2EEC: FF
    dta $FF		; 2EED: FF
    dta $FF		; 2EEE: FF
    dta $FF		; 2EEF: FF
    dta $FF		; 2EF0: FF
    dta $FF		; 2EF1: FF
    dta $FF		; 2EF2: FF
    dta $FF		; 2EF3: FF
    dta $FF		; 2EF4: FF
    dta $FE		; 2EF5: FE
    dta $15		; 2EF6: 15
    dta $51		; 2EF7: 51
    dta $55		; 2EF8: 55
    dta $55		; 2EF9: 55
    dta $15		; 2EFA: 15
    dta $55		; 2EFB: 55
    dta $5		; 2EFC: 05
    dta $55		; 2EFD: 55
    dta $45		; 2EFE: 45
    dta $55		; 2EFF: 55
    dta $15		; 2F00: 15
    dta $55		; 2F01: 55
    dta $55		; 2F02: 55
    dta $6		; 2F03: 06
    dta $4E		; 2F04: 4E
    dta $5		; 2F05: 05
    dta $54		; 2F06: 54
    dta $5		; 2F07: 05
    dta $54		; 2F08: 54
    dta $55		; 2F09: 55
    dta $51		; 2F0A: 51
    dta $55		; 2F0B: 55
    dta $45		; 2F0C: 45
    dta $4F		; 2F0D: 4F
    dta $FF		; 2F0E: FF
    dta $FF		; 2F0F: FF
    dta $FF		; 2F10: FF
    dta $FF		; 2F11: FF
    dta $FF		; 2F12: FF
    dta $FF		; 2F13: FF
    dta $FF		; 2F14: FF
    dta $FF		; 2F15: FF
    dta $FF		; 2F16: FF
    dta $FF		; 2F17: FF
    dta $FF		; 2F18: FF
    dta $FF		; 2F19: FF
    dta $FF		; 2F1A: FF
    dta $FF		; 2F1B: FF
    dta $FF		; 2F1C: FF
    dta $FF		; 2F1D: FF
    dta $85		; 2F1E: 85
    dta $45		; 2F1F: 45
    dta $55		; 2F20: 55
    dta $54		; 2F21: 54
    dta $55		; 2F22: 55
    dta $54		; 2F23: 54
    dta $55		; 2F24: 55
    dta $55		; 2F25: 55
    dta $5		; 2F26: 05
    dta $54		; 2F27: 54
    dta $15		; 2F28: 15
    dta $55		; 2F29: 55
    dta $55		; 2F2A: 55
    dta $5C		; 2F2B: 5C
    dta $5C		; 2F2C: 5C
    dta $31		; 2F2D: 31
    dta $55		; 2F2E: 55
    dta $45		; 2F2F: 45
    dta $54		; 2F30: 54
    dta $55		; 2F31: 55
    dta $51		; 2F32: 51
    dta $55		; 2F33: 55
    dta $45		; 2F34: 45
    dta $47		; 2F35: 47
    dta $FF		; 2F36: FF
    dta $FF		; 2F37: FF
    dta $FF		; 2F38: FF
    dta $FF		; 2F39: FF
    dta $FF		; 2F3A: FF
    dta $FF		; 2F3B: FF
    dta $FF		; 2F3C: FF
    dta $FF		; 2F3D: FF
    dta $FF		; 2F3E: FF
    dta $FF		; 2F3F: FF
    dta $FF		; 2F40: FF
    dta $FF		; 2F41: FF
    dta $FF		; 2F42: FF
    dta $FF		; 2F43: FF
    dta $FF		; 2F44: FF
    dta $FF		; 2F45: FF
    dta $F0		; 2F46: F0
    dta $15		; 2F47: 15
    dta $55		; 2F48: 55
    dta $51		; 2F49: 51
    dta $55		; 2F4A: 55
    dta $41		; 2F4B: 41
    dta $55		; 2F4C: 55
    dta $54		; 2F4D: 54
    dta $15		; 2F4E: 15
    dta $54		; 2F4F: 54
    dta $55		; 2F50: 55
    dta $55		; 2F51: 55
    dta $55		; 2F52: 55
    dta $4C		; 2F53: 4C
    dta $78		; 2F54: 78
    dta $7C		; 2F55: 7C
    dta $55		; 2F56: 55
    dta $55		; 2F57: 55
    dta $54		; 2F58: 54
    dta $55		; 2F59: 55
    dta $51		; 2F5A: 51
    dta $55		; 2F5B: 55
    dta $45		; 2F5C: 45
    dta $47		; 2F5D: 47
    dta $FF		; 2F5E: FF
    dta $FF		; 2F5F: FF
    dta $FF		; 2F60: FF
    dta $FF		; 2F61: FF
    dta $FF		; 2F62: FF
    dta $FF		; 2F63: FF
    dta $FF		; 2F64: FF
    dta $FF		; 2F65: FF
    dta $FF		; 2F66: FF
    dta $FF		; 2F67: FF
    dta $FF		; 2F68: FF
    dta $FF		; 2F69: FF
    dta $FF		; 2F6A: FF
    dta $FF		; 2F6B: FF
    dta $FF		; 2F6C: FF
    dta $FF		; 2F6D: FF
    dta $F8		; 2F6E: F8
    dta $55		; 2F6F: 55
    dta $55		; 2F70: 55
    dta $45		; 2F71: 45
    dta $55		; 2F72: 55
    dta $5		; 2F73: 05
    dta $55		; 2F74: 55
    dta $54		; 2F75: 54
    dta $55		; 2F76: 55
    dta $50		; 2F77: 50
    dta $55		; 2F78: 55
    dta $55		; 2F79: 55
    dta $54		; 2F7A: 54
    dta $8		; 2F7B: 08
    dta $F0		; 2F7C: F0
    dta $FE		; 2F7D: FE
    dta $15		; 2F7E: 15
    dta $55		; 2F7F: 55
    dta $54		; 2F80: 54
    dta $55		; 2F81: 55
    dta $51		; 2F82: 51
    dta $55		; 2F83: 55
    dta $45		; 2F84: 45
    dta $43		; 2F85: 43
    dta $FF		; 2F86: FF
    dta $FF		; 2F87: FF
    dta $FF		; 2F88: FF
    dta $FF		; 2F89: FF
    dta $FF		; 2F8A: FF
    dta $FF		; 2F8B: FF
    dta $FF		; 2F8C: FF
    dta $FF		; 2F8D: FF
    dta $FF		; 2F8E: FF
    dta $FF		; 2F8F: FF
    dta $FF		; 2F90: FF
    dta $FF		; 2F91: FF
    dta $FF		; 2F92: FF
    dta $FF		; 2F93: FF
    dta $FF		; 2F94: FF
    dta $FF		; 2F95: FF
    dta $FF		; 2F96: FF
    dta $15		; 2F97: 15
    dta $55		; 2F98: 55
    dta $15		; 2F99: 15
    dta $55		; 2F9A: 55
    dta $15		; 2F9B: 15
    dta $55		; 2F9C: 55
    dta $51		; 2F9D: 51
    dta $55		; 2F9E: 55
    dta $51		; 2F9F: 51
    dta $55		; 2FA0: 55
    dta $55		; 2FA1: 55
    dta $50		; 2FA2: 50
    dta $48		; 2FA3: 48
    dta $F1		; 2FA4: F1
    dta $FF		; 2FA5: FF
    dta $95		; 2FA6: 95
    dta $55		; 2FA7: 55
    dta $54		; 2FA8: 54
    dta $55		; 2FA9: 55 Access: 1BED
    dta $51		; 2FAA: 51
    dta $55		; 2FAB: 55
    dta $45		; 2FAC: 45
    dta $53		; 2FAD: 53
    dta $FF		; 2FAE: FF
    dta $FF		; 2FAF: FF
    dta $FF		; 2FB0: FF
    dta $FF		; 2FB1: FF
    dta $FF		; 2FB2: FF
    dta $FF		; 2FB3: FF
    dta $FF		; 2FB4: FF
    dta $FF		; 2FB5: FF
    dta $FF		; 2FB6: FF
    dta $FF		; 2FB7: FF
    dta $FF		; 2FB8: FF
    dta $FF		; 2FB9: FF
    dta $FF		; 2FBA: FF
    dta $FF		; 2FBB: FF
    dta $FF		; 2FBC: FF
    dta $FF		; 2FBD: FF
    dta $FF		; 2FBE: FF
    dta $95		; 2FBF: 95
    dta $54		; 2FC0: 54
    dta $55		; 2FC1: 55
    dta $54		; 2FC2: 54
    dta $15		; 2FC3: 15
    dta $55		; 2FC4: 55
    dta $51		; 2FC5: 51
    dta $55		; 2FC6: 55
    dta $41		; 2FC7: 41
    dta $55		; 2FC8: 55
    dta $55		; 2FC9: 55
    dta $53		; 2FCA: 53
    dta $C9		; 2FCB: C9
    dta $E2		; 2FCC: E2
    dta $FF		; 2FCD: FF
    dta $C5		; 2FCE: C5
    dta $55		; 2FCF: 55
    dta $54		; 2FD0: 54
    dta $55		; 2FD1: 55
    dta $51		; 2FD2: 51
    dta $55		; 2FD3: 55
    dta $55		; 2FD4: 55
    dta $53		; 2FD5: 53
    dta $FF		; 2FD6: FF
    dta $FF		; 2FD7: FF
    dta $FF		; 2FD8: FF
    dta $FF		; 2FD9: FF
    dta $FF		; 2FDA: FF
    dta $FF		; 2FDB: FF
    dta $FF		; 2FDC: FF
    dta $FF		; 2FDD: FF
    dta $FF		; 2FDE: FF
    dta $FF		; 2FDF: FF
    dta $FF		; 2FE0: FF
    dta $FF		; 2FE1: FF
    dta $FF		; 2FE2: FF
    dta $FF		; 2FE3: FF
    dta $FF		; 2FE4: FF
    dta $FF		; 2FE5: FF
    dta $FF		; 2FE6: FF
    dta $85		; 2FE7: 85
    dta $51		; 2FE8: 51
    dta $55		; 2FE9: 55
    dta $54		; 2FEA: 54
    dta $55		; 2FEB: 55
    dta $55		; 2FEC: 55
    dta $45		; 2FED: 45
    dta $55		; 2FEE: 55
    dta $45		; 2FEF: 45
    dta $55		; 2FF0: 55
    dta $55		; 2FF1: 55
    dta $47		; 2FF2: 47
    dta $CD		; 2FF3: CD
    dta $EA		; 2FF4: EA
    dta $3		; 2FF5: 03
    dta $F1		; 2FF6: F1
    dta $55		; 2FF7: 55
    dta $54		; 2FF8: 54
    dta $55		; 2FF9: 55
    dta $51		; 2FFA: 51
    dta $55		; 2FFB: 55
    dta $55		; 2FFC: 55
    dta $51		; 2FFD: 51
    dta $FF		; 2FFE: FF
    dta $FF		; 2FFF: FF
    dta $FF		; 3000: FF
    dta $FF		; 3001: FF
    dta $FF		; 3002: FF
    dta $FF		; 3003: FF
    dta $FF		; 3004: FF
    dta $FF		; 3005: FF
    dta $FF		; 3006: FF
    dta $FF		; 3007: FF
    dta $FF		; 3008: FF
    dta $FF		; 3009: FF
    dta $FF		; 300A: FF
    dta $FF		; 300B: FF
    dta $FF		; 300C: FF
    dta $FF		; 300D: FF
    dta $FF		; 300E: FF
    dta $F1		; 300F: F1
    dta $5		; 3010: 05
    dta $55		; 3011: 55
    dta $51		; 3012: 51
    dta $55		; 3013: 55
    dta $55		; 3014: 55
    dta $5		; 3015: 05
    dta $55		; 3016: 55
    dta $15		; 3017: 15
    dta $55		; 3018: 55
    dta $55		; 3019: 55
    dta $1F		; 301A: 1F
    dta $CF		; 301B: CF
    dta $E3		; 301C: E3
    dta $F8		; 301D: F8
    dta $9		; 301E: 09
    dta $55		; 301F: 55
    dta $54		; 3020: 54
    dta $55		; 3021: 55
    dta $51		; 3022: 51
    dta $55		; 3023: 55
    dta $55		; 3024: 55
    dta $51		; 3025: 51
    dta $FF		; 3026: FF
    dta $FF		; 3027: FF
    dta $FF		; 3028: FF
    dta $FF		; 3029: FF
    dta $FF		; 302A: FF
    dta $FF		; 302B: FF
    dta $FF		; 302C: FF
    dta $FF		; 302D: FF
    dta $FF		; 302E: FF
    dta $FF		; 302F: FF
    dta $FF		; 3030: FF
    dta $FF		; 3031: FF
    dta $FF		; 3032: FF
    dta $FF		; 3033: FF
    dta $FF		; 3034: FF
    dta $FF		; 3035: FF
    dta $FF		; 3036: FF
    dta $F8		; 3037: F8
    dta $55		; 3038: 55
    dta $55		; 3039: 55
    dta $45		; 303A: 45
    dta $55		; 303B: 55
    dta $54		; 303C: 54
    dta $15		; 303D: 15
    dta $54		; 303E: 54
    dta $15		; 303F: 15
    dta $55		; 3040: 55
    dta $55		; 3041: 55
    dta $7F		; 3042: 7F
    dta $C0		; 3043: C0
    dta $11		; 3044: 11
    dta $FF		; 3045: FF
    dta $F8		; 3046: F8
    dta $55		; 3047: 55
    dta $51		; 3048: 51
    dta $55		; 3049: 55
    dta $51		; 304A: 51
    dta $55		; 304B: 55
    dta $55		; 304C: 55
    dta $54		; 304D: 54
    dta $FF		; 304E: FF
    dta $FF		; 304F: FF
    dta $FF		; 3050: FF
    dta $FF		; 3051: FF
    dta $FF		; 3052: FF
    dta $FF		; 3053: FF
    dta $FF		; 3054: FF
    dta $FF		; 3055: FF
    dta $FF		; 3056: FF
    dta $FF		; 3057: FF
    dta $FF		; 3058: FF
    dta $FF		; 3059: FF
    dta $FF		; 305A: FF
    dta $FF		; 305B: FF
    dta $FF		; 305C: FF
    dta $FF		; 305D: FF
    dta $FF		; 305E: FF
    dta $FE		; 305F: FE
    dta $55		; 3060: 55
    dta $55		; 3061: 55
    dta $15		; 3062: 15
    dta $55		; 3063: 55
    dta $41		; 3064: 41
    dta $55		; 3065: 55
    dta $51		; 3066: 51
    dta $55		; 3067: 55
    dta $55		; 3068: 55
    dta $50		; 3069: 50
    dta $FF		; 306A: FF
    dta $CF		; 306B: CF
    dta $F8		; 306C: F8
    dta $1		; 306D: 01
    dta $F8		; 306E: F8
    dta $55		; 306F: 55
    dta $51		; 3070: 51
    dta $55		; 3071: 55
    dta $50		; 3072: 50
    dta $55		; 3073: 55
    dta $55		; 3074: 55
    dta $54		; 3075: 54
    dta $FF		; 3076: FF
    dta $FF		; 3077: FF
    dta $FF		; 3078: FF
    dta $FF		; 3079: FF
    dta $FF		; 307A: FF
    dta $FF		; 307B: FF
    dta $FF		; 307C: FF
    dta $FF		; 307D: FF
    dta $FF		; 307E: FF
    dta $FF		; 307F: FF
    dta $FF		; 3080: FF
    dta $FF		; 3081: FF
    dta $FF		; 3082: FF
    dta $FF		; 3083: FF
    dta $FF		; 3084: FF
    dta $FF		; 3085: FF
    dta $FF		; 3086: FF
    dta $FF		; 3087: FF
    dta $95		; 3088: 95
    dta $54		; 3089: 54
    dta $15		; 308A: 15
    dta $55		; 308B: 55
    dta $5		; 308C: 05
    dta $55		; 308D: 55
    dta $51		; 308E: 51
    dta $55		; 308F: 55
    dta $54		; 3090: 54
    dta $7		; 3091: 07
    dta $FF		; 3092: FF
    dta $CF		; 3093: CF
    dta $FF		; 3094: FF
    dta $FC		; 3095: FC
    dta $1		; 3096: 01
    dta $15		; 3097: 15
    dta $51		; 3098: 51
    dta $55		; 3099: 55
    dta $50		; 309A: 50
    dta $55		; 309B: 55
    dta $55		; 309C: 55
    dta $54		; 309D: 54
    dta $FF		; 309E: FF
    dta $FF		; 309F: FF
    dta $FF		; 30A0: FF
    dta $FF		; 30A1: FF
    dta $FF		; 30A2: FF
    dta $FF		; 30A3: FF
    dta $FF		; 30A4: FF
    dta $FF		; 30A5: FF
    dta $FF		; 30A6: FF
    dta $FF		; 30A7: FF
    dta $FF		; 30A8: FF
    dta $FF		; 30A9: FF
    dta $FF		; 30AA: FF
    dta $FF		; 30AB: FF
    dta $FF		; 30AC: FF
    dta $FF		; 30AD: FF
    dta $FF		; 30AE: FF
    dta $FF		; 30AF: FF
    dta $E5		; 30B0: E5
    dta $51		; 30B1: 51
    dta $55		; 30B2: 55
    dta $55		; 30B3: 55
    dta $15		; 30B4: 15
    dta $55		; 30B5: 55
    dta $45		; 30B6: 45
    dta $55		; 30B7: 55
    dta $50		; 30B8: 50
    dta $7F		; 30B9: 7F
    dta $FF		; 30BA: FF
    dta $CF		; 30BB: CF
    dta $FF		; 30BC: FF
    dta $FF		; 30BD: FF
    dta $F9		; 30BE: F9
    dta $45		; 30BF: 45
    dta $45		; 30C0: 45
    dta $55		; 30C1: 55
    dta $50		; 30C2: 50
    dta $55		; 30C3: 55
    dta $55		; 30C4: 55
    dta $54		; 30C5: 54
    dta $7F		; 30C6: 7F
    dta $FF		; 30C7: FF
    dta $FF		; 30C8: FF
    dta $FF		; 30C9: FF
    dta $FF		; 30CA: FF
    dta $FF		; 30CB: FF
    dta $FF		; 30CC: FF
    dta $FF		; 30CD: FF
    dta $FF		; 30CE: FF
    dta $FF		; 30CF: FF
    dta $FF		; 30D0: FF
    dta $FF		; 30D1: FF
    dta $FF		; 30D2: FF
    dta $FF		; 30D3: FF
    dta $FF		; 30D4: FF
    dta $FF		; 30D5: FF
    dta $FF		; 30D6: FF
    dta $FF		; 30D7: FF
    dta $F8		; 30D8: F8
    dta $0		; 30D9: 00
    dta $55		; 30DA: 55
    dta $50		; 30DB: 50
    dta $55		; 30DC: 55
    dta $55		; 30DD: 55
    dta $15		; 30DE: 15
    dta $55		; 30DF: 55
    dta $7		; 30E0: 07
    dta $FF		; 30E1: FF
    dta $FF		; 30E2: FF
    dta $CF		; 30E3: CF
    dta $FF		; 30E4: FF
    dta $FF		; 30E5: FF
    dta $F9		; 30E6: F9
    dta $45		; 30E7: 45
    dta $45		; 30E8: 45
    dta $55		; 30E9: 55
    dta $54		; 30EA: 54
    dta $55		; 30EB: 55
    dta $55		; 30EC: 55
    dta $54		; 30ED: 54
    dta $7F		; 30EE: 7F
    dta $FF		; 30EF: FF
    dta $FF		; 30F0: FF
    dta $FF		; 30F1: FF
    dta $FF		; 30F2: FF
    dta $FF		; 30F3: FF
    dta $FF		; 30F4: FF
    dta $FF		; 30F5: FF
    dta $FF		; 30F6: FF
    dta $FF		; 30F7: FF
    dta $FF		; 30F8: FF
    dta $FF		; 30F9: FF
    dta $FF		; 30FA: FF
    dta $FF		; 30FB: FF
    dta $FF		; 30FC: FF
    dta $FF		; 30FD: FF
    dta $FF		; 30FE: FF
    dta $FF		; 30FF: FF
    dta $FF		; 3100: FF
    dta $FF		; 3101: FF
    dta $15		; 3102: 15
    dta $5		; 3103: 05
    dta $55		; 3104: 55
    dta $54		; 3105: 54
    dta $15		; 3106: 15
    dta $40		; 3107: 40
    dta $7F		; 3108: 7F
    dta $FF		; 3109: FF
    dta $FF		; 310A: FF
    dta $80		; 310B: 80
    dta $0		; 310C: 00
    dta $0		; 310D: 00
    dta $79		; 310E: 79
    dta $50		; 310F: 50
    dta $5		; 3110: 05
    dta $55		; 3111: 55
    dta $54		; 3112: 54
    dta $55		; 3113: 55
    dta $55		; 3114: 55
    dta $54		; 3115: 54
    dta $3F		; 3116: 3F
    dta $FF		; 3117: FF
    dta $FF		; 3118: FF
    dta $FF		; 3119: FF
    dta $FF		; 311A: FF
    dta $FF		; 311B: FF
    dta $FF		; 311C: FF
    dta $FF		; 311D: FF
    dta $FF		; 311E: FF
    dta $FF		; 311F: FF
    dta $FF		; 3120: FF
    dta $FF		; 3121: FF
    dta $FF		; 3122: FF
    dta $FF		; 3123: FF
    dta $FF		; 3124: FF
    dta $FF		; 3125: FF
    dta $FF		; 3126: FF
    dta $FF		; 3127: FF
    dta $FF		; 3128: FF
    dta $FF		; 3129: FF
    dta $E5		; 312A: E5
    dta $15		; 312B: 15
    dta $55		; 312C: 55
    dta $50		; 312D: 50
    dta $D5		; 312E: D5
    dta $F		; 312F: 0F
    dta $FF		; 3130: FF
    dta $FF		; 3131: FF
    dta $FF		; 3132: FF
    dta $AF		; 3133: AF
    dta $FF		; 3134: FF
    dta $FF		; 3135: FF
    dta $1		; 3136: 01
    dta $55		; 3137: 55
    dta $45		; 3138: 45
    dta $55		; 3139: 55
    dta $54		; 313A: 54
    dta $55		; 313B: 55
    dta $55		; 313C: 55
    dta $55		; 313D: 55
    dta $3F		; 313E: 3F
    dta $FF		; 313F: FF
    dta $FF		; 3140: FF
    dta $FF		; 3141: FF
    dta $FF		; 3142: FF
    dta $FF		; 3143: FF
    dta $FF		; 3144: FF
    dta $FF		; 3145: FF
    dta $FF		; 3146: FF
    dta $FF		; 3147: FF
    dta $FF		; 3148: FF
    dta $FF		; 3149: FF
    dta $FF		; 314A: FF
    dta $FF		; 314B: FF
    dta $FF		; 314C: FF
    dta $FF		; 314D: FF
    dta $FF		; 314E: FF
    dta $FF		; 314F: FF
    dta $FF		; 3150: FF
    dta $FF		; 3151: FF
    dta $F0		; 3152: F0
    dta $55		; 3153: 55
    dta $55		; 3154: 55
    dta $1		; 3155: 01
    dta $FC		; 3156: FC
    dta $7F		; 3157: 7F
    dta $FF		; 3158: FF
    dta $FF		; 3159: FF
    dta $FF		; 315A: FF
    dta $1F		; 315B: 1F
    dta $FF		; 315C: FF
    dta $FF		; 315D: FF
    dta $F1		; 315E: F1
    dta $55		; 315F: 55
    dta $45		; 3160: 45
    dta $55		; 3161: 55
    dta $54		; 3162: 54
    dta $55		; 3163: 55
    dta $55		; 3164: 55
    dta $55		; 3165: 55
    dta $1F		; 3166: 1F
    dta $FF		; 3167: FF
    dta $FF		; 3168: FF
    dta $FF		; 3169: FF
    dta $FF		; 316A: FF
    dta $FF		; 316B: FF
    dta $FF		; 316C: FF
    dta $FF		; 316D: FF
    dta $FF		; 316E: FF
    dta $FF		; 316F: FF
    dta $FF		; 3170: FF
    dta $FF		; 3171: FF
    dta $FF		; 3172: FF
    dta $FF		; 3173: FF
    dta $FF		; 3174: FF
    dta $FF		; 3175: FF
    dta $FF		; 3176: FF
    dta $FF		; 3177: FF
    dta $FF		; 3178: FF
    dta $FF		; 3179: FF
    dta $FE		; 317A: FE
    dta $0		; 317B: 00
    dta $5		; 317C: 05
    dta $1F		; 317D: 1F
    dta $FF		; 317E: FF
    dta $FF		; 317F: FF
    dta $FF		; 3180: FF
    dta $FF		; 3181: FF
    dta $FF		; 3182: FF
    dta $4F		; 3183: 4F
    dta $FF		; 3184: FF
    dta $FF		; 3185: FF
    dta $F9		; 3186: F9
    dta $55		; 3187: 55
    dta $5		; 3188: 05
    dta $55		; 3189: 55
    dta $54		; 318A: 54
    dta $55		; 318B: 55
    dta $55		; 318C: 55
    dta $55		; 318D: 55
    dta $1F		; 318E: 1F
    dta $FF		; 318F: FF
    dta $FF		; 3190: FF
    dta $FF		; 3191: FF
    dta $FF		; 3192: FF
    dta $FF		; 3193: FF
    dta $FF		; 3194: FF
    dta $FF		; 3195: FF
    dta $FF		; 3196: FF
    dta $FF		; 3197: FF
    dta $FF		; 3198: FF
    dta $FF		; 3199: FF
    dta $FF		; 319A: FF
    dta $FF		; 319B: FF
    dta $FF		; 319C: FF
    dta $FF		; 319D: FF
    dta $FF		; 319E: FF
    dta $FF		; 319F: FF
    dta $FF		; 31A0: FF
    dta $FF		; 31A1: FF
    dta $FF		; 31A2: FF
    dta $FF		; 31A3: FF
    dta $F0		; 31A4: F0
    dta $7F		; 31A5: 7F
    dta $FF		; 31A6: FF
    dta $FF		; 31A7: FF
    dta $FF		; 31A8: FF
    dta $FF		; 31A9: FF
l31AA			; Callers: l19DB
    inc $FF4F,x		; 31AA: FE 4F FF
    dta $FF		; 31AD: FF
    dta $F9		; 31AE: F9
    dta $55		; 31AF: 55
    dta $15		; 31B0: 15
    dta $55		; 31B1: 55
    dta $54		; 31B2: 54
    dta $55		; 31B3: 55
    dta $55		; 31B4: 55
    dta $55		; 31B5: 55
    dta $4F		; 31B6: 4F
    dta $FF		; 31B7: FF
    dta $FF		; 31B8: FF
    dta $FF		; 31B9: FF
    dta $FF		; 31BA: FF
    dta $FF		; 31BB: FF
    dta $FF		; 31BC: FF
    dta $FF		; 31BD: FF
    dta $FF		; 31BE: FF
    dta $FF		; 31BF: FF
    dta $FF		; 31C0: FF
    dta $FF		; 31C1: FF
    dta $FF		; 31C2: FF
    dta $FF		; 31C3: FF
    dta $FF		; 31C4: FF
    dta $FF		; 31C5: FF
    dta $FF		; 31C6: FF
    dta $FF		; 31C7: FF
    dta $FF		; 31C8: FF
    dta $FF		; 31C9: FF
    dta $FF		; 31CA: FF
    dta $FF		; 31CB: FF
    dta $FF		; 31CC: FF
    dta $FF		; 31CD: FF
    dta $FF		; 31CE: FF
    dta $FF		; 31CF: FF
    dta $FF		; 31D0: FF
    dta $FF		; 31D1: FF
    dta $FE		; 31D2: FE
    dta $48		; 31D3: 48
    dta $F		; 31D4: 0F
    dta $FF		; 31D5: FF
    dta $F9		; 31D6: F9
    dta $55		; 31D7: 55
    dta $15		; 31D8: 15
    dta $55		; 31D9: 55
    dta $54		; 31DA: 54
    dta $55		; 31DB: 55
    dta $55		; 31DC: 55
    dta $55		; 31DD: 55
    dta $4F		; 31DE: 4F
    dta $FF		; 31DF: FF
    dta $FF		; 31E0: FF
    dta $FF		; 31E1: FF
    dta $FF		; 31E2: FF
    dta $FF		; 31E3: FF
    dta $FF		; 31E4: FF
    dta $FF		; 31E5: FF
    dta $FF		; 31E6: FF
    dta $FF		; 31E7: FF
    dta $FF		; 31E8: FF
    dta $FF		; 31E9: FF
    dta $FF		; 31EA: FF
    dta $FF		; 31EB: FF
    dta $FF		; 31EC: FF
    dta $FF		; 31ED: FF
    dta $FF		; 31EE: FF
    dta $FF		; 31EF: FF
    dta $FF		; 31F0: FF
    dta $FF		; 31F1: FF
    dta $FF		; 31F2: FF
    dta $FF		; 31F3: FF
    dta $FF		; 31F4: FF
    dta $FF		; 31F5: FF
    dta $FF		; 31F6: FF
    dta $FF		; 31F7: FF
    dta $FF		; 31F8: FF
    dta $FF		; 31F9: FF
    dta $FC		; 31FA: FC
    dta $4F		; 31FB: 4F
    dta $E0		; 31FC: E0
    dta $7		; 31FD: 07
    dta $F9		; 31FE: F9
    dta $55		; 31FF: 55
    dta $15		; 3200: 15
    dta $55		; 3201: 55
    dta $54		; 3202: 54
    dta $55		; 3203: 55
    dta $55		; 3204: 55
    dta $55		; 3205: 55
    dta $4F		; 3206: 4F
    dta $FF		; 3207: FF
    dta $FF		; 3208: FF
    dta $FF		; 3209: FF
    dta $FF		; 320A: FF
    dta $FF		; 320B: FF
    dta $FF		; 320C: FF
    dta $FF		; 320D: FF
    dta $FF		; 320E: FF
    dta $FF		; 320F: FF
    dta $FF		; 3210: FF
    dta $FF		; 3211: FF
    dta $FF		; 3212: FF
    dta $FF		; 3213: FF
    dta $FF		; 3214: FF
    dta $FF		; 3215: FF
    dta $FF		; 3216: FF
    dta $FF		; 3217: FF
    dta $FF		; 3218: FF
    dta $FF		; 3219: FF
    dta $FF		; 321A: FF
    dta $FF		; 321B: FF
    dta $FF		; 321C: FF
    dta $FF		; 321D: FF
    dta $FF		; 321E: FF
    dta $FF		; 321F: FF
    dta $FF		; 3220: FF
    dta $FF		; 3221: FF
    dta $FD		; 3222: FD
    dta $47		; 3223: 47
    dta $FF		; 3224: FF
    dta $F0		; 3225: F0
    dta $1		; 3226: 01
    dta $55		; 3227: 55
    dta $15		; 3228: 15
    dta $55		; 3229: 55
    dta $54		; 322A: 54
    dta $55		; 322B: 55
    dta $55		; 322C: 55
    dta $55		; 322D: 55
    dta $4F		; 322E: 4F
    dta $FF		; 322F: FF
    dta $FF		; 3230: FF
    dta $FF		; 3231: FF
    dta $FF		; 3232: FF
    dta $FF		; 3233: FF
    dta $FF		; 3234: FF
    dta $FF		; 3235: FF
    dta $FF		; 3236: FF
    dta $FF		; 3237: FF
    dta $FF		; 3238: FF
    dta $FF		; 3239: FF
    dta $FF		; 323A: FF
    dta $FF		; 323B: FF
    dta $FF		; 323C: FF
    dta $FF		; 323D: FF
    dta $FF		; 323E: FF
    dta $FF		; 323F: FF
    dta $FF		; 3240: FF
    dta $FF		; 3241: FF
    dta $FF		; 3242: FF
    dta $FF		; 3243: FF
    dta $FF		; 3244: FF
    dta $FF		; 3245: FF
    dta $FF		; 3246: FF
    dta $FF		; 3247: FF
    dta $FF		; 3248: FF
    dta $FF		; 3249: FF
    dta $F9		; 324A: F9
    dta $53		; 324B: 53
    dta $FF		; 324C: FF
    dta $FF		; 324D: FF
    dta $F9		; 324E: F9
    dta $55		; 324F: 55
    dta $5		; 3250: 05
    dta $55		; 3251: 55
    dta $54		; 3252: 54
    dta $55		; 3253: 55
    dta $55		; 3254: 55
    dta $55		; 3255: 55
    dta $47		; 3256: 47
    dta $FF		; 3257: FF
    dta $FF		; 3258: FF
    dta $FF		; 3259: FF
    dta $FF		; 325A: FF
    dta $FF		; 325B: FF
    dta $FF		; 325C: FF
    dta $FF		; 325D: FF
    dta $FF		; 325E: FF
    dta $FF		; 325F: FF
    dta $FF		; 3260: FF
    dta $FF		; 3261: FF
    dta $FF		; 3262: FF
    dta $FF		; 3263: FF
    dta $FF		; 3264: FF
    dta $FF		; 3265: FF
    dta $FF		; 3266: FF
    dta $FF		; 3267: FF
    dta $FF		; 3268: FF
    dta $FF		; 3269: FF
    dta $FF		; 326A: FF
    dta $FF		; 326B: FF
    dta $FF		; 326C: FF
    dta $FF		; 326D: FF
    dta $FF		; 326E: FF
    dta $FF		; 326F: FF
    dta $FF		; 3270: FF
    dta $FF		; 3271: FF
    dta $F5		; 3272: F5
    dta $53		; 3273: 53
    dta $FF		; 3274: FF
    dta $FF		; 3275: FF
    dta $F1		; 3276: F1
    dta $55		; 3277: 55
    dta $45		; 3278: 45
    dta $55		; 3279: 55
    dta $55		; 327A: 55
    dta $55		; 327B: 55
    dta $55		; 327C: 55
    dta $55		; 327D: 55
    dta $47		; 327E: 47
    dta $FF		; 327F: FF
    dta $FF		; 3280: FF
    dta $FF		; 3281: FF
    dta $FF		; 3282: FF
    dta $FF		; 3283: FF
    dta $FF		; 3284: FF
    dta $FF		; 3285: FF
    dta $FF		; 3286: FF
    dta $FF		; 3287: FF
    dta $FF		; 3288: FF
    dta $FF		; 3289: FF
    dta $FF		; 328A: FF
    dta $FF		; 328B: FF
    dta $FF		; 328C: FF
    dta $FF		; 328D: FF
    dta $FF		; 328E: FF
    dta $FF		; 328F: FF
    dta $FF		; 3290: FF
    dta $FF		; 3291: FF
    dta $FF		; 3292: FF
    dta $FF		; 3293: FF
    dta $FF		; 3294: FF
    dta $FF		; 3295: FF
    dta $FF		; 3296: FF
    dta $FF		; 3297: FF
    dta $FF		; 3298: FF
    dta $FF		; 3299: FF
    dta $E5		; 329A: E5
    dta $50		; 329B: 50
    dta $0		; 329C: 00
    dta $1		; 329D: 01
    dta $F1		; 329E: F1
    dta $55		; 329F: 55
    dta $45		; 32A0: 45
    dta $55		; 32A1: 55
    dta $55		; 32A2: 55
    dta $55		; 32A3: 55
    dta $55		; 32A4: 55
    dta $55		; 32A5: 55
    dta $47		; 32A6: 47
    dta $FF		; 32A7: FF
    dta $FF		; 32A8: FF
    dta $FF		; 32A9: FF
    dta $FF		; 32AA: FF
    dta $FF		; 32AB: FF
    dta $FF		; 32AC: FF
    dta $FF		; 32AD: FF
    dta $FF		; 32AE: FF
    dta $FF		; 32AF: FF
    dta $FF		; 32B0: FF
    dta $FF		; 32B1: FF
    dta $FF		; 32B2: FF
    dta $FF		; 32B3: FF
    dta $FF		; 32B4: FF
    dta $FF		; 32B5: FF
    dta $FF		; 32B6: FF
    dta $FF		; 32B7: FF
    dta $FF		; 32B8: FF
    dta $FF		; 32B9: FF
    dta $FF		; 32BA: FF
    dta $FF		; 32BB: FF
    dta $FF		; 32BC: FF
    dta $FF		; 32BD: FF
    dta $FF		; 32BE: FF
    dta $FF		; 32BF: FF
    dta $FF		; 32C0: FF
    dta $FF		; 32C1: FF
    dta $C5		; 32C2: C5
    dta $53		; 32C3: 53
    dta $FF		; 32C4: FF
    dta $FC		; 32C5: FC
    dta $1		; 32C6: 01
    dta $55		; 32C7: 55
    dta $45		; 32C8: 45
    dta $55		; 32C9: 55
    dta $55		; 32CA: 55
    dta $55		; 32CB: 55
    dta $55		; 32CC: 55
    dta $55		; 32CD: 55
    dta $43		; 32CE: 43
    dta $FF		; 32CF: FF
    dta $FF		; 32D0: FF
    dta $81		; 32D1: 81
    dta $80		; 32D2: 80
    dta $80		; 32D3: 80
    dta $80		; 32D4: 80
    dta $FF		; 32D5: FF
    dta $80		; 32D6: 80
    dta $C0		; 32D7: C0
    dta $80		; 32D8: 80
    dta $80		; 32D9: 80
    dta $80		; 32DA: 80
    dta $80		; 32DB: 80
    dta $80		; 32DC: 80
    dta $80		; 32DD: 80
    dta $FF		; 32DE: FF
    dta $98		; 32DF: 98
    dta $C0		; 32E0: C0
    dta $99		; 32E1: 99
    dta $80		; 32E2: 80
    dta $81		; 32E3: 81
    dta $FF		; 32E4: FF
    dta $FF		; 32E5: FF
    dta $FF		; 32E6: FF
    dta $FF		; 32E7: FF
    dta $FF		; 32E8: FF
    dta $FF		; 32E9: FF
    dta $C5		; 32EA: C5
    dta $53		; 32EB: 53
    dta $FF		; 32EC: FF
    dta $FF		; 32ED: FF
    dta $E1		; 32EE: E1
    dta $55		; 32EF: 55
    dta $45		; 32F0: 45
    dta $55		; 32F1: 55
    dta $55		; 32F2: 55
    dta $55		; 32F3: 55
    dta $55		; 32F4: 55
    dta $55		; 32F5: 55
    dta $53		; 32F6: 53
    dta $FF		; 32F7: FF
    dta $FF		; 32F8: FF
    dta $99		; 32F9: 99
    dta $9C		; 32FA: 9C
    dta $9C		; 32FB: 9C
    dta $E3		; 32FC: E3
    dta $FF		; 32FD: FF
    dta $98		; 32FE: 98
    dta $CC		; 32FF: CC
    dta $9F		; 3300: 9F
    dta $9F		; 3301: 9F
    dta $9F		; 3302: 9F
    dta $E3		; 3303: E3
    dta $E3		; 3304: E3
    dta $9F		; 3305: 9F
    dta $FF		; 3306: FF
    dta $80		; 3307: 80
    dta $CC		; 3308: CC
    dta $99		; 3309: 99
    dta $9F		; 330A: 9F
    dta $99		; 330B: 99
    dta $FF		; 330C: FF
    dta $FF		; 330D: FF
    dta $FF		; 330E: FF
    dta $FF		; 330F: FF
    dta $FF		; 3310: FF
    dta $FF		; 3311: FF
    dta $15		; 3312: 15
    dta $53		; 3313: 53
    dta $FF		; 3314: FF
    dta $FF		; 3315: FF
    dta $E1		; 3316: E1
    dta $55		; 3317: 55
    dta $41		; 3318: 41
    dta $55		; 3319: 55
    dta $55		; 331A: 55
    dta $55		; 331B: 55
    dta $55		; 331C: 55
    dta $55		; 331D: 55
    dta $53		; 331E: 53
    dta $FF		; 331F: FF
    dta $FF		; 3320: FF
    dta $99		; 3321: 99
    dta $9C		; 3322: 9C
    dta $9C		; 3323: 9C
    dta $E3		; 3324: E3
    dta $FF		; 3325: FF
    dta $98		; 3326: 98
    dta $CC		; 3327: CC
    dta $80		; 3328: 80
    dta $80		; 3329: 80
    dta $9F		; 332A: 9F
    dta $E3		; 332B: E3
    dta $E3		; 332C: E3
    dta $9F		; 332D: 9F
    dta $FF		; 332E: FF
    dta $80		; 332F: 80
    dta $CC		; 3330: CC
    dta $93		; 3331: 93
    dta $9F		; 3332: 9F
    dta $99		; 3333: 99
    dta $FF		; 3334: FF
    dta $FF		; 3335: FF
    dta $FF		; 3336: FF
    dta $FF		; 3337: FF
    dta $FF		; 3338: FF
    dta $FE		; 3339: FE
    dta $55		; 333A: 55
    dta $50		; 333B: 50
    dta $0		; 333C: 00
    dta $FF		; 333D: FF
    dta $E5		; 333E: E5
    dta $55		; 333F: 55
    dta $51		; 3340: 51
    dta $55		; 3341: 55
    dta $55		; 3342: 55
    dta $55		; 3343: 55
    dta $55		; 3344: 55
    dta $55		; 3345: 55
    dta $53		; 3346: 53
    dta $FF		; 3347: FF
    dta $FF		; 3348: FF
    dta $80		; 3349: 80
    dta $98		; 334A: 98
    dta $98		; 334B: 98
    dta $E3		; 334C: E3
    dta $FF		; 334D: FF
    dta $9F		; 334E: 9F
    dta $80		; 334F: 80
    dta $FC		; 3350: FC
    dta $FC		; 3351: FC
    dta $80		; 3352: 80
    dta $E3		; 3353: E3
    dta $E3		; 3354: E3
    dta $80		; 3355: 80
    dta $FF		; 3356: FF
    dta $88		; 3357: 88
    dta $80		; 3358: 80
    dta $80		; 3359: 80
    dta $80		; 335A: 80
    dta $80		; 335B: 80
    dta $FF		; 335C: FF
    dta $FF		; 335D: FF
    dta $FF		; 335E: FF
    dta $FF		; 335F: FF
    dta $FF		; 3360: FF
    dta $FC		; 3361: FC
    dta $55		; 3362: 55
    dta $53		; 3363: 53
    dta $FE		; 3364: FE
    dta $0		; 3365: 00
    dta $65		; 3366: 65
    dta $55		; 3367: 55
    dta $51		; 3368: 51
    dta $55		; 3369: 55
    dta $55		; 336A: 55
    dta $55		; 336B: 55
    dta $55		; 336C: 55
    dta $55		; 336D: 55
    dta $53		; 336E: 53
    dta $FF		; 336F: FF
    dta $FF		; 3370: FF
    dta $98		; 3371: 98
    dta $98		; 3372: 98
    dta $98		; 3373: 98
    dta $E3		; 3374: E3
    dta $FF		; 3375: FF
    dta $9C		; 3376: 9C
    dta $8C		; 3377: 8C
    dta $8C		; 3378: 8C
    dta $8C		; 3379: 8C
    dta $8F		; 337A: 8F
    dta $E3		; 337B: E3
    dta $E3		; 337C: E3
    dta $8F		; 337D: 8F
    dta $FF		; 337E: FF
    dta $98		; 337F: 98
    dta $8C		; 3380: 8C
    dta $98		; 3381: 98
    dta $8F		; 3382: 8F
    dta $88		; 3383: 88
    dta $FF		; 3384: FF
    dta $FF		; 3385: FF
    dta $FF		; 3386: FF
    dta $FF		; 3387: FF
    dta $FF		; 3388: FF
    dta $F9		; 3389: F9
    dta $55		; 338A: 55
    dta $53		; 338B: 53
    dta $FF		; 338C: FF
    dta $FF		; 338D: FF
    dta $5		; 338E: 05
    dta $55		; 338F: 55
    dta $51		; 3390: 51
    dta $55		; 3391: 55
    dta $55		; 3392: 55
    dta $55		; 3393: 55
    dta $51		; 3394: 51
    dta $55		; 3395: 55
    dta $51		; 3396: 51
    dta $FF		; 3397: FF
    dta $FF		; 3398: FF
    dta $98		; 3399: 98
    dta $98		; 339A: 98
    dta $98		; 339B: 98
    dta $E3		; 339C: E3
    dta $FF		; 339D: FF
    dta $9C		; 339E: 9C
    dta $8C		; 339F: 8C
    dta $8C		; 33A0: 8C
    dta $8C		; 33A1: 8C
    dta $8F		; 33A2: 8F
    dta $E3		; 33A3: E3
    dta $E3		; 33A4: E3
    dta $8F		; 33A5: 8F
    dta $FF		; 33A6: FF
    dta $98		; 33A7: 98
    dta $8C		; 33A8: 8C
    dta $98		; 33A9: 98
    dta $8F		; 33AA: 8F
    dta $88		; 33AB: 88
    dta $FF		; 33AC: FF
    dta $FF		; 33AD: FF
    dta $FF		; 33AE: FF
    dta $FF		; 33AF: FF
    dta $FF		; 33B0: FF
    dta $F1		; 33B1: F1
    dta $55		; 33B2: 55
    dta $53		; 33B3: 53
    dta $FF		; 33B4: FF
    dta $FF		; 33B5: FF
    dta $C5		; 33B6: C5
    dta $55		; 33B7: 55
    dta $51		; 33B8: 51
    dta $15		; 33B9: 15
    dta $55		; 33BA: 55
    dta $55		; 33BB: 55
    dta $51		; 33BC: 51
    dta $55		; 33BD: 55
    dta $51		; 33BE: 51
    dta $FF		; 33BF: FF
    dta $FF		; 33C0: FF
    dta $80		; 33C1: 80
    dta $80		; 33C2: 80
    dta $80		; 33C3: 80
    dta $E3		; 33C4: E3
    dta $FF		; 33C5: FF
    dta $80		; 33C6: 80
    dta $8C		; 33C7: 8C
    dta $80		; 33C8: 80
    dta $80		; 33C9: 80
    dta $80		; 33CA: 80
    dta $E3		; 33CB: E3
    dta $E3		; 33CC: E3
    dta $80		; 33CD: 80
    dta $FF		; 33CE: FF
    dta $98		; 33CF: 98
    dta $8C		; 33D0: 8C
    dta $98		; 33D1: 98
    dta $80		; 33D2: 80
    dta $88		; 33D3: 88
    dta $FF		; 33D4: FF
    dta $FF		; 33D5: FF
    dta $FF		; 33D6: FF
    dta $FF		; 33D7: FF
    dta $FF		; 33D8: FF
    dta $F1		; 33D9: F1
    dta $55		; 33DA: 55
    dta $53		; 33DB: 53
    dta $FF		; 33DC: FF
    dta $FF		; 33DD: FF
    dta $C5		; 33DE: C5
    dta $55		; 33DF: 55
    dta $51		; 33E0: 51
    dta $15		; 33E1: 15
    dta $55		; 33E2: 55
    dta $55		; 33E3: 55
    dta $51		; 33E4: 51
    dta $55		; 33E5: 55
    dta $51		; 33E6: 51
    dta $FF		; 33E7: FF
    dta $FF		; 33E8: FF
    dta $FF		; 33E9: FF
    dta $FF		; 33EA: FF
    dta $FF		; 33EB: FF
    dta $FF		; 33EC: FF
    dta $FF		; 33ED: FF
    dta $FF		; 33EE: FF
    dta $FF		; 33EF: FF
    dta $FF		; 33F0: FF
    dta $FF		; 33F1: FF
    dta $FF		; 33F2: FF
    dta $FF		; 33F3: FF
    dta $FF		; 33F4: FF
    dta $FF		; 33F5: FF
    dta $FF		; 33F6: FF
    dta $FF		; 33F7: FF
    dta $FF		; 33F8: FF
    dta $FF		; 33F9: FF
    dta $FF		; 33FA: FF
    dta $FF		; 33FB: FF
    dta $FF		; 33FC: FF
    dta $FF		; 33FD: FF
    dta $FF		; 33FE: FF
    dta $FF		; 33FF: FF
    dta $FF		; 3400: FF
    dta $E5		; 3401: E5
    dta $55		; 3402: 55
    dta $50		; 3403: 50
    dta $1F		; 3404: 1F
    dta $FF		; 3405: FF
    dta $C5		; 3406: C5
    dta $55		; 3407: 55
    dta $51		; 3408: 51
    dta $15		; 3409: 15
    dta $55		; 340A: 55
    dta $55		; 340B: 55
    dta $51		; 340C: 51
    dta $55		; 340D: 55
    dta $51		; 340E: 51
    dta $FF		; 340F: FF
    dta $FF		; 3410: FF
    dta $FF		; 3411: FF
    dta $FF		; 3412: FF
    dta $FF		; 3413: FF
    dta $FF		; 3414: FF
    dta $FF		; 3415: FF
    dta $FF		; 3416: FF
    dta $FF		; 3417: FF
    dta $FF		; 3418: FF
    dta $FF		; 3419: FF
    dta $FF		; 341A: FF
    dta $FF		; 341B: FF
    dta $FF		; 341C: FF
    dta $FF		; 341D: FF
    dta $FF		; 341E: FF
    dta $FF		; 341F: FF
    dta $FF		; 3420: FF
    dta $FF		; 3421: FF
    dta $FF		; 3422: FF
    dta $FF		; 3423: FF
    dta $FF		; 3424: FF
    dta $FF		; 3425: FF
    dta $FF		; 3426: FF
    dta $FF		; 3427: FF
    dta $FF		; 3428: FF
    dta $C5		; 3429: C5
    dta $55		; 342A: 55
    dta $53		; 342B: 53
    dta $C0		; 342C: C0
    dta $FF		; 342D: FF
    dta $C5		; 342E: C5
    dta $55		; 342F: 55
    dta $51		; 3430: 51
    dta $15		; 3431: 15
    dta $55		; 3432: 55
    dta $55		; 3433: 55
    dta $51		; 3434: 51
    dta $55		; 3435: 55
    dta $51		; 3436: 51
    dta $FF		; 3437: FF
    dta $FF		; 3438: FF
    dta $FF		; 3439: FF
    dta $FF		; 343A: FF
    dta $FF		; 343B: FF
    dta $FF		; 343C: FF
    dta $FF		; 343D: FF
    dta $FF		; 343E: FF
    dta $FF		; 343F: FF
    dta $FF		; 3440: FF
    dta $FF		; 3441: FF
    dta $FF		; 3442: FF
    dta $FF		; 3443: FF
    dta $FF		; 3444: FF
    dta $FF		; 3445: FF
    dta $FF		; 3446: FF
    dta $FF		; 3447: FF
    dta $FF		; 3448: FF
    dta $FF		; 3449: FF
    dta $FF		; 344A: FF
    dta $FF		; 344B: FF
    dta $FF		; 344C: FF
    dta $FF		; 344D: FF
    dta $FF		; 344E: FF
    dta $FF		; 344F: FF
    dta $FF		; 3450: FF
    dta $95		; 3451: 95
    dta $55		; 3452: 55
    dta $53		; 3453: 53
    dta $FE		; 3454: FE
    dta $FC		; 3455: FC
    dta $5		; 3456: 05
    dta $55		; 3457: 55
    dta $51		; 3458: 51
    dta $15		; 3459: 15
    dta $55		; 345A: 55
    dta $55		; 345B: 55
    dta $51		; 345C: 51
    dta $55		; 345D: 55
    dta $51		; 345E: 51
    dta $FF		; 345F: FF
    dta $FF		; 3460: FF
    dta $FF		; 3461: FF
    dta $FF		; 3462: FF
    dta $FF		; 3463: FF
    dta $FF		; 3464: FF
    dta $FF		; 3465: FF
    dta $FF		; 3466: FF
    dta $FF		; 3467: FF
    dta $FF		; 3468: FF
    dta $FF		; 3469: FF
    dta $FF		; 346A: FF
    dta $FF		; 346B: FF
    dta $FF		; 346C: FF
    dta $FF		; 346D: FF
    dta $FF		; 346E: FF
    dta $FF		; 346F: FF
    dta $FF		; 3470: FF
    dta $FF		; 3471: FF
    dta $FF		; 3472: FF
    dta $FF		; 3473: FF
    dta $FF		; 3474: FF
    dta $FF		; 3475: FF
    dta $FF		; 3476: FF
    dta $FF		; 3477: FF
    dta $FF		; 3478: FF
    dta $15		; 3479: 15
    dta $55		; 347A: 55
    dta $53		; 347B: 53
    dta $FF		; 347C: FF
    dta $FF		; 347D: FF
    dta $85		; 347E: 85
    dta $55		; 347F: 55
    dta $51		; 3480: 51
    dta $15		; 3481: 15
    dta $55		; 3482: 55
    dta $55		; 3483: 55
    dta $51		; 3484: 51
    dta $55		; 3485: 55
    dta $50		; 3486: 50
    dta $FF		; 3487: FF
    dta $FF		; 3488: FF
    dta $FF		; 3489: FF
    dta $FF		; 348A: FF
    dta $FF		; 348B: FF
    dta $FF		; 348C: FF
    dta $FF		; 348D: FF
    dta $FF		; 348E: FF
    dta $FF		; 348F: FF
    dta $FF		; 3490: FF
    dta $FF		; 3491: FF
    dta $FF		; 3492: FF
    dta $FF		; 3493: FF
    dta $FF		; 3494: FF
    dta $FF		; 3495: FF
    dta $FF		; 3496: FF
    dta $FF		; 3497: FF
    dta $FF		; 3498: FF
    dta $FF		; 3499: FF
    dta $FF		; 349A: FF
    dta $FF		; 349B: FF
    dta $FF		; 349C: FF
    dta $FF		; 349D: FF
    dta $F1		; 349E: F1
    dta $FF		; 349F: FF
    dta $FE		; 34A0: FE
    dta $55		; 34A1: 55
    dta $55		; 34A2: 55
    dta $53		; 34A3: 53
    dta $FF		; 34A4: FF
    dta $FF		; 34A5: FF
    dta $C5		; 34A6: C5
    dta $55		; 34A7: 55
    dta $51		; 34A8: 51
    dta $55		; 34A9: 55
    dta $55		; 34AA: 55
    dta $55		; 34AB: 55
    dta $51		; 34AC: 51
    dta $55		; 34AD: 55
    dta $54		; 34AE: 54
    dta $FF		; 34AF: FF
    dta $FF		; 34B0: FF
    dta $FF		; 34B1: FF
    dta $FF		; 34B2: FF
    dta $FF		; 34B3: FF
    dta $FF		; 34B4: FF
    dta $FF		; 34B5: FF
    dta $FF		; 34B6: FF
    dta $FF		; 34B7: FF
    dta $FF		; 34B8: FF
    dta $FF		; 34B9: FF
    dta $FF		; 34BA: FF
    dta $FF		; 34BB: FF
    dta $FF		; 34BC: FF
    dta $FF		; 34BD: FF
    dta $FF		; 34BE: FF
    dta $FF		; 34BF: FF
    dta $FF		; 34C0: FF
    dta $FF		; 34C1: FF
    dta $FF		; 34C2: FF
    dta $FF		; 34C3: FF
    dta $FF		; 34C4: FF
    dta $3		; 34C5: 03
    dta $F4		; 34C6: F4
    dta $7F		; 34C7: 7F
    dta $F9		; 34C8: F9
    dta $55		; 34C9: 55
    dta $55		; 34CA: 55
    dta $51		; 34CB: 51
    dta $FF		; 34CC: FF
    dta $FF		; 34CD: FF
    dta $C5		; 34CE: C5
    dta $55		; 34CF: 55
    dta $40		; 34D0: 40
    dta $55		; 34D1: 55
    dta $55		; 34D2: 55
    dta $55		; 34D3: 55
    dta $51		; 34D4: 51
    dta $55		; 34D5: 55
    dta $54		; 34D6: 54
    dta $FF		; 34D7: FF
    dta $FF		; 34D8: FF
    dta $FF		; 34D9: FF
    dta $FF		; 34DA: FF
    dta $FF		; 34DB: FF
    dta $FF		; 34DC: FF
    dta $FF		; 34DD: FF
    dta $FF		; 34DE: FF
    dta $FF		; 34DF: FF
    dta $FC		; 34E0: FC
    dta $4F		; 34E1: 4F
    dta $FF		; 34E2: FF
    dta $FF		; 34E3: FF
    dta $FF		; 34E4: FF
    dta $FF		; 34E5: FF
    dta $FF		; 34E6: FF
    dta $FF		; 34E7: FF
    dta $FF		; 34E8: FF
    dta $FF		; 34E9: FF
    dta $FF		; 34EA: FF
    dta $FF		; 34EB: FF
    dta $FF		; 34EC: FF
    dta $14		; 34ED: 14
    dta $74		; 34EE: 74
    dta $1F		; 34EF: 1F
    dta $C5		; 34F0: C5
    dta $55		; 34F1: 55
    dta $55		; 34F2: 55
    dta $54		; 34F3: 54
    dta $3		; 34F4: 03
    dta $FF		; 34F5: FF
    dta $C5		; 34F6: C5
    dta $55		; 34F7: 55
    dta $42		; 34F8: 42
    dta $5		; 34F9: 05
    dta $55		; 34FA: 55
    dta $55		; 34FB: 55
    dta $51		; 34FC: 51
    dta $55		; 34FD: 55
    dta $54		; 34FE: 54
    dta $FF		; 34FF: FF
    dta $FF		; 3500: FF
    dta $FF		; 3501: FF
    dta $FF		; 3502: FF
    dta $FF		; 3503: FF
    dta $FF		; 3504: FF
    dta $FF		; 3505: FF
    dta $FF		; 3506: FF
    dta $FF		; 3507: FF
    dta $E1		; 3508: E1
    dta $53		; 3509: 53
    dta $FF		; 350A: FF
    dta $FF		; 350B: FF
    dta $FF		; 350C: FF
    dta $FF		; 350D: FF
    dta $FF		; 350E: FF
    dta $FF		; 350F: FF
    dta $FF		; 3510: FF
    dta $FF		; 3511: FF
    dta $FF		; 3512: FF
    dta $FC		; 3513: FC
    dta $1F		; 3514: 1F
    dta $95		; 3515: 95
    dta $35		; 3516: 35
    dta $7		; 3517: 07
    dta $15		; 3518: 15
    dta $55		; 3519: 55
    dta $55		; 351A: 55
    dta $54		; 351B: 54
    dta $FB		; 351C: FB
    dta $FF		; 351D: FF
    dta $C5		; 351E: C5
    dta $55		; 351F: 55
    dta $42		; 3520: 42
    dta $45		; 3521: 45
    dta $55		; 3522: 55
    dta $55		; 3523: 55
    dta $51		; 3524: 51
    dta $55		; 3525: 55
    dta $54		; 3526: 54
    dta $FF		; 3527: FF
    dta $FF		; 3528: FF
    dta $FF		; 3529: FF
    dta $FF		; 352A: FF
    dta $FF		; 352B: FF
    dta $FF		; 352C: FF
    dta $FF		; 352D: FF
    dta $FF		; 352E: FF
    dta $FF		; 352F: FF
    dta $15		; 3530: 15
    dta $50		; 3531: 50
    dta $FF		; 3532: FF
    dta $FF		; 3533: FF
    dta $FF		; 3534: FF
    dta $FF		; 3535: FF
    dta $FF		; 3536: FF
    dta $FF		; 3537: FF
    dta $FF		; 3538: FF
    dta $FF		; 3539: FF
    dta $FF		; 353A: FF
    dta $FC		; 353B: FC
    dta $41		; 353C: 41
    dta $95		; 353D: 95
    dta $15		; 353E: 15
    dta $42		; 353F: 42
    dta $15		; 3540: 15
    dta $55		; 3541: 55
    dta $55		; 3542: 55
    dta $54		; 3543: 54
    dta $FF		; 3544: FF
    dta $C0		; 3545: C0
    dta $25		; 3546: 25
    dta $55		; 3547: 55
    dta $42		; 3548: 42
    dta $64		; 3549: 64
    dta $55		; 354A: 55
    dta $55		; 354B: 55
    dta $51		; 354C: 51
    dta $55		; 354D: 55
    dta $54		; 354E: 54
    dta $FF		; 354F: FF
    dta $FF		; 3550: FF
    dta $FF		; 3551: FF
    dta $FF		; 3552: FF
    dta $FF		; 3553: FF
    dta $FF		; 3554: FF
    dta $FF		; 3555: FF
    dta $FF		; 3556: FF
    dta $F8		; 3557: F8
    dta $55		; 3558: 55
    dta $54		; 3559: 54
    dta $7F		; 355A: 7F
    dta $FF		; 355B: FF
    dta $FF		; 355C: FF
    dta $FF		; 355D: FF
    dta $FF		; 355E: FF
    dta $FF		; 355F: FF
    dta $FF		; 3560: FF
    dta $FF		; 3561: FF
    dta $FF		; 3562: FF
    dta $FE		; 3563: FE
    dta $54		; 3564: 54
    dta $95		; 3565: 95
    dta $45		; 3566: 45
    dta $50		; 3567: 50
    dta $55		; 3568: 55
    dta $55		; 3569: 55
    dta $55		; 356A: 55
    dta $54		; 356B: 54
    dta $7F		; 356C: 7F
    dta $FF		; 356D: FF
    dta $A5		; 356E: A5
    dta $55		; 356F: 55
    dta $4F		; 3570: 4F
    dta $64		; 3571: 64
    dta $55		; 3572: 55
    dta $55		; 3573: 55
    dta $51		; 3574: 51
    dta $55		; 3575: 55
    dta $54		; 3576: 54
    dta $7F		; 3577: 7F
    dta $FF		; 3578: FF
    dta $FF		; 3579: FF
    dta $FF		; 357A: FF
    dta $FF		; 357B: FF
    dta $FF		; 357C: FF
    dta $FF		; 357D: FF
    dta $FF		; 357E: FF
    dta $F1		; 357F: F1
    dta $50		; 3580: 50
    dta $55		; 3581: 55
    dta $1F		; 3582: 1F
    dta $FF		; 3583: FF
    dta $FF		; 3584: FF
    dta $FF		; 3585: FF
    dta $FF		; 3586: FF
    dta $FF		; 3587: FF
    dta $FF		; 3588: FF
    dta $FF		; 3589: FF
    dta $FF		; 358A: FF
    dta $FE		; 358B: FE
    dta $14		; 358C: 14
    dta $15		; 358D: 15
    dta $45		; 358E: 45
    dta $51		; 358F: 51
    dta $55		; 3590: 55
    dta $55		; 3591: 55
    dta $55		; 3592: 55
    dta $55		; 3593: 55
    dta $3F		; 3594: 3F
    dta $FF		; 3595: FF
    dta $E5		; 3596: E5
    dta $50		; 3597: 50
    dta $F		; 3598: 0F
    dta $E4		; 3599: E4
    dta $55		; 359A: 55
    dta $55		; 359B: 55
    dta $51		; 359C: 51
    dta $55		; 359D: 55
    dta $54		; 359E: 54
    dta $7F		; 359F: 7F
    dta $FF		; 35A0: FF
    dta $FF		; 35A1: FF
    dta $FF		; 35A2: FF
    dta $FF		; 35A3: FF
    dta $FF		; 35A4: FF
    dta $FF		; 35A5: FF
    dta $FF		; 35A6: FF
    dta $E5		; 35A7: E5
    dta $43		; 35A8: 43
    dta $85		; 35A9: 85
    dta $4F		; 35AA: 4F
    dta $FF		; 35AB: FF
    dta $FF		; 35AC: FF
    dta $FF		; 35AD: FF
    dta $FF		; 35AE: FF
    dta $FF		; 35AF: FF
    dta $FF		; 35B0: FF
    dta $FF		; 35B1: FF
    dta $FE		; 35B2: FE
    dta $4F		; 35B3: 4F
    dta $15		; 35B4: 15
    dta $15		; 35B5: 15
    dta $45		; 35B6: 45
    dta $45		; 35B7: 45
    dta $55		; 35B8: 55
    dta $55		; 35B9: 55
    dta $55		; 35BA: 55
    dta $55		; 35BB: 55
    dta $3F		; 35BC: 3F
    dta $FF		; 35BD: FF
    dta $E1		; 35BE: E1
    dta $45		; 35BF: 45
    dta $4F		; 35C0: 4F
    dta $A4		; 35C1: A4
    dta $51		; 35C2: 51
    dta $55		; 35C3: 55
    dta $51		; 35C4: 51
    dta $55		; 35C5: 55
    dta $54		; 35C6: 54
    dta $7F		; 35C7: 7F
    dta $FF		; 35C8: FF
    dta $FF		; 35C9: FF
    dta $FF		; 35CA: FF
    dta $FF		; 35CB: FF
    dta $FF		; 35CC: FF
    dta $FF		; 35CD: FF
    dta $FF		; 35CE: FF
    dta $C5		; 35CF: C5
    dta $F		; 35D0: 0F
    dta $E1		; 35D1: E1
    dta $57		; 35D2: 57
    dta $FF		; 35D3: FF
    dta $FF		; 35D4: FF
    dta $FF		; 35D5: FF
    dta $FF		; 35D6: FF
    dta $FF		; 35D7: FF
    dta $FF		; 35D8: FF
    dta $FF		; 35D9: FF
    dta $C0		; 35DA: C0
    dta $7		; 35DB: 07
    dta $15		; 35DC: 15
    dta $15		; 35DD: 15
    dta $55		; 35DE: 55
    dta $45		; 35DF: 45
    dta $55		; 35E0: 55
    dta $55		; 35E1: 55
    dta $55		; 35E2: 55
    dta $55		; 35E3: 55
    dta $3F		; 35E4: 3F
    dta $FF		; 35E5: FF
    dta $F1		; 35E6: F1
    dta $55		; 35E7: 55
    dta $4F		; 35E8: 4F
    dta $A4		; 35E9: A4
    dta $51		; 35EA: 51
    dta $55		; 35EB: 55
    dta $51		; 35EC: 51
    dta $55		; 35ED: 55
    dta $54		; 35EE: 54
    dta $7F		; 35EF: 7F
    dta $FF		; 35F0: FF
    dta $FF		; 35F1: FF
    dta $FF		; 35F2: FF
    dta $FF		; 35F3: FF
    dta $FF		; 35F4: FF
    dta $FF		; 35F5: FF
    dta $FF		; 35F6: FF
    dta $94		; 35F7: 94
    dta $7F		; 35F8: 7F
    dta $F8		; 35F9: F8
    dta $53		; 35FA: 53
    dta $FF		; 35FB: FF
    dta $FF		; 35FC: FF
    dta $FF		; 35FD: FF
    dta $FF		; 35FE: FF
    dta $FF		; 35FF: FF
    dta $FF		; 3600: FF
    dta $FF		; 3601: FF
    dta $C5		; 3602: C5
    dta $55		; 3603: 55
    dta $55		; 3604: 55
    dta $55		; 3605: 55
    dta $55		; 3606: 55
    dta $55		; 3607: 55
    dta $55		; 3608: 55
    dta $55		; 3609: 55
    dta $55		; 360A: 55
    dta $55		; 360B: 55
    dta $20		; 360C: 20
    dta $F		; 360D: 0F
    dta $F1		; 360E: F1
    dta $55		; 360F: 55
    dta $4F		; 3610: 4F
    dta $B0		; 3611: B0
    dta $51		; 3612: 51
    dta $55		; 3613: 55
    dta $51		; 3614: 51
    dta $55		; 3615: 55
    dta $54		; 3616: 54
    dta $7F		; 3617: 7F
    dta $FF		; 3618: FF
    dta $FF		; 3619: FF
    dta $FF		; 361A: FF
    dta $FF		; 361B: FF
    dta $FF		; 361C: FF
    dta $FF		; 361D: FF
    dta $FF		; 361E: FF
    dta $14		; 361F: 14
    dta $FF		; 3620: FF
    dta $FE		; 3621: FE
    dta $53		; 3622: 53
    dta $FF		; 3623: FF
    dta $FF		; 3624: FF
    dta $FF		; 3625: FF
    dta $FF		; 3626: FF
    dta $FF		; 3627: FF
    dta $FF		; 3628: FF
    dta $FF		; 3629: FF
    dta $E5		; 362A: E5
    dta $54		; 362B: 54
    dta $55		; 362C: 55
    dta $55		; 362D: 55
    dta $55		; 362E: 55
    dta $15		; 362F: 15
    dta $55		; 3630: 55
    dta $55		; 3631: 55
    dta $55		; 3632: 55
    dta $55		; 3633: 55
    dta $F		; 3634: 0F
    dta $F0		; 3635: F0
    dta $31		; 3636: 31
    dta $55		; 3637: 55
    dta $4F		; 3638: 4F
    dta $B0		; 3639: B0
    dta $11		; 363A: 11
    dta $55		; 363B: 55
    dta $55		; 363C: 55
    dta $55		; 363D: 55
    dta $54		; 363E: 54
    dta $7F		; 363F: 7F
    dta $FF		; 3640: FF
    dta $FF		; 3641: FF
    dta $FF		; 3642: FF
    dta $FF		; 3643: FF
    dta $FF		; 3644: FF
    dta $FF		; 3645: FF
    dta $FE		; 3646: FE
    dta $55		; 3647: 55
    dta $FF		; 3648: FF
    dta $FF		; 3649: FF
    dta $11		; 364A: 11
    dta $FF		; 364B: FF
    dta $FF		; 364C: FF
    dta $FF		; 364D: FF
    dta $FF		; 364E: FF
    dta $FF		; 364F: FF
    dta $FF		; 3650: FF
    dta $FF		; 3651: FF
    dta $F9		; 3652: F9
    dta $55		; 3653: 55
    dta $50		; 3654: 50
    dta $0		; 3655: 00
    dta $0		; 3656: 00
    dta $15		; 3657: 15
    dta $55		; 3658: 55
    dta $55		; 3659: 55
    dta $55		; 365A: 55
    dta $55		; 365B: 55
    dta $4F		; 365C: 4F
    dta $FF		; 365D: FF
    dta $F5		; 365E: F5
    dta $55		; 365F: 55
    dta $4F		; 3660: 4F
    dta $F4		; 3661: F4
    dta $11		; 3662: 11
    dta $55		; 3663: 55
    dta $55		; 3664: 55
    dta $54		; 3665: 54
    dta $0		; 3666: 00
    dta $FF		; 3667: FF
    dta $FF		; 3668: FF
    dta $FF		; 3669: FF
    dta $FF		; 366A: FF
    dta $FF		; 366B: FF
    dta $FF		; 366C: FF
    dta $FF		; 366D: FF
    dta $F8		; 366E: F8
    dta $51		; 366F: 51
    dta $FF		; 3670: FF
    dta $FF		; 3671: FF
    dta $95		; 3672: 95
    dta $FF		; 3673: FF
    dta $FF		; 3674: FF
    dta $FF		; 3675: FF
    dta $FF		; 3676: FF
    dta $FF		; 3677: FF
    dta $FF		; 3678: FF
    dta $80		; 3679: 80
    dta $5D		; 367A: 5D
    dta $55		; 367B: 55
    dta $5		; 367C: 05
    dta $55		; 367D: 55
    dta $55		; 367E: 55
    dta $15		; 367F: 15
    dta $55		; 3680: 55
    dta $55		; 3681: 55
    dta $55		; 3682: 55
    dta $55		; 3683: 55
    dta $4F		; 3684: 4F
    dta $FF		; 3685: FF
    dta $F1		; 3686: F1
    dta $55		; 3687: 55
    dta $47		; 3688: 47
    dta $F0		; 3689: F0
    dta $11		; 368A: 11
    dta $55		; 368B: 55
    dta $55		; 368C: 55
    dta $50		; 368D: 50
    dta $7F		; 368E: 7F
    dta $FF		; 368F: FF
    dta $FF		; 3690: FF
    dta $FF		; 3691: FF
    dta $FF		; 3692: FF
    dta $FF		; 3693: FF
    dta $FF		; 3694: FF
    dta $FF		; 3695: FF
    dta $F9		; 3696: F9
    dta $51		; 3697: 51
    dta $FF		; 3698: FF
    dta $FF		; 3699: FF
    dta $95		; 369A: 95
    dta $FF		; 369B: FF
    dta $FF		; 369C: FF
    dta $FF		; 369D: FF
    dta $FF		; 369E: FF
    dta $FF		; 369F: FF
    dta $FF		; 36A0: FF
    dta $95		; 36A1: 95
    dta $45		; 36A2: 45
    dta $54		; 36A3: 54
    dta $55		; 36A4: 55
    dta $55		; 36A5: 55
    dta $54		; 36A6: 54
    dta $55		; 36A7: 55
    dta $55		; 36A8: 55
    dta $55		; 36A9: 55
    dta $55		; 36AA: 55
    dta $55		; 36AB: 55
    dta $F		; 36AC: 0F
    dta $FF		; 36AD: FF
    dta $F9		; 36AE: F9
    dta $55		; 36AF: 55
    dta $53		; 36B0: 53
    dta $F8		; 36B1: F8
    dta $51		; 36B2: 51
    dta $55		; 36B3: 55
    dta $55		; 36B4: 55
    dta $7		; 36B5: 07
    dta $FF		; 36B6: FF
    dta $FF		; 36B7: FF
    dta $FF		; 36B8: FF
    dta $FF		; 36B9: FF
    dta $FF		; 36BA: FF
    dta $FF		; 36BB: FF
    dta $FF		; 36BC: FF
    dta $FF		; 36BD: FF
    dta $F9		; 36BE: F9
    dta $51		; 36BF: 51
    dta $FF		; 36C0: FF
    dta $FF		; 36C1: FF
    dta $95		; 36C2: 95
    dta $FF		; 36C3: FF
    dta $FF		; 36C4: FF
    dta $FF		; 36C5: FF
    dta $FF		; 36C6: FF
    dta $FF		; 36C7: FF
    dta $FF		; 36C8: FF
    dta $C5		; 36C9: C5
    dta $51		; 36CA: 51
    dta $51		; 36CB: 51
    dta $55		; 36CC: 55
    dta $55		; 36CD: 55
    dta $54		; 36CE: 54
    dta $55		; 36CF: 55
    dta $55		; 36D0: 55
    dta $55		; 36D1: 55
    dta $55		; 36D2: 55
    dta $48		; 36D3: 48
    dta $2F		; 36D4: 2F
    dta $FF		; 36D5: FF
    dta $F9		; 36D6: F9
    dta $55		; 36D7: 55
    dta $53		; 36D8: 53
    dta $F8		; 36D9: F8
    dta $45		; 36DA: 45
    dta $55		; 36DB: 55
    dta $50		; 36DC: 50
    dta $3F		; 36DD: 3F
    dta $FF		; 36DE: FF
    dta $FF		; 36DF: FF
    dta $FF		; 36E0: FF
    dta $FF		; 36E1: FF
    dta $FF		; 36E2: FF
    dta $FF		; 36E3: FF
    dta $FF		; 36E4: FF
    dta $FF		; 36E5: FF
    dta $F9		; 36E6: F9
    dta $54		; 36E7: 54
    dta $FF		; 36E8: FF
    dta $FF		; 36E9: FF
    dta $95		; 36EA: 95
    dta $FF		; 36EB: FF
    dta $FF		; 36EC: FF
    dta $FF		; 36ED: FF
    dta $FF		; 36EE: FF
    dta $FF		; 36EF: FF
    dta $FF		; 36F0: FF
    dta $E1		; 36F1: E1
    dta $55		; 36F2: 55
    dta $5		; 36F3: 05
    dta $55		; 36F4: 55
    dta $55		; 36F5: 55
    dta $54		; 36F6: 54
    dta $55		; 36F7: 55
    dta $55		; 36F8: 55
    dta $55		; 36F9: 55
    dta $55		; 36FA: 55
    dta $41		; 36FB: 41
    dta $4F		; 36FC: 4F
    dta $FF		; 36FD: FF
    dta $F8		; 36FE: F8
    dta $55		; 36FF: 55
    dta $53		; 3700: 53
    dta $FC		; 3701: FC
    dta $45		; 3702: 45
    dta $55		; 3703: 55
    dta $7		; 3704: 07
    dta $FF		; 3705: FF
    dta $FF		; 3706: FF
    dta $FF		; 3707: FF
    dta $FF		; 3708: FF
    dta $FF		; 3709: FF
    dta $FF		; 370A: FF
    dta $FF		; 370B: FF
    dta $FF		; 370C: FF
    dta $FF		; 370D: FF
    dta $F9		; 370E: F9
    dta $56		; 370F: 56
    dta $FF		; 3710: FF
    dta $FF		; 3711: FF
    dta $91		; 3712: 91
    dta $FF		; 3713: FF
    dta $FF		; 3714: FF
    dta $FF		; 3715: FF
    dta $FF		; 3716: FF
    dta $FF		; 3717: FF
    dta $FC		; 3718: FC
    dta $19		; 3719: 19
    dta $54		; 371A: 54
    dta $15		; 371B: 15
    dta $55		; 371C: 55
    dta $55		; 371D: 55
    dta $54		; 371E: 54
    dta $55		; 371F: 55
    dta $55		; 3720: 55
    dta $55		; 3721: 55
    dta $50		; 3722: 50
    dta $15		; 3723: 15
    dta $4F		; 3724: 4F
    dta $FF		; 3725: FF
    dta $F0		; 3726: F0
    dta $55		; 3727: 55
    dta $51		; 3728: 51
    dta $FC		; 3729: FC
    dta $44		; 372A: 44
    dta $54		; 372B: 54
    dta $3F		; 372C: 3F
    dta $FF		; 372D: FF
    dta $FF		; 372E: FF
    dta $FF		; 372F: FF
    dta $FF		; 3730: FF
    dta $FF		; 3731: FF
    dta $FF		; 3732: FF
    dta $FF		; 3733: FF
    dta $FF		; 3734: FF
    dta $FF		; 3735: FF
    dta $F9		; 3736: F9
    dta $50		; 3737: 50
    dta $FF		; 3738: FF
    dta $FF		; 3739: FF
    dta $93		; 373A: 93
    dta $FF		; 373B: FF
    dta $FF		; 373C: FF
    dta $FF		; 373D: FF
    dta $FF		; 373E: FF
    dta $FF		; 373F: FF
    dta $FC		; 3740: FC
    dta $50		; 3741: 50
    dta $40		; 3742: 40
    dta $55		; 3743: 55
    dta $55		; 3744: 55
    dta $55		; 3745: 55
    dta $51		; 3746: 51
    dta $55		; 3747: 55
    dta $55		; 3748: 55
    dta $55		; 3749: 55
    dta $4		; 374A: 04
    dta $55		; 374B: 55
    dta $4C		; 374C: 4C
    dta $0		; 374D: 00
    dta $8		; 374E: 08
    dta $55		; 374F: 55
    dta $51		; 3750: 51
    dta $FC		; 3751: FC
    dta $44		; 3752: 44
    dta $54		; 3753: 54
    dta $FF		; 3754: FF
    dta $FF		; 3755: FF
    dta $FF		; 3756: FF
    dta $FF		; 3757: FF
    dta $FF		; 3758: FF
    dta $FF		; 3759: FF
    dta $FF		; 375A: FF
    dta $FF		; 375B: FF
    dta $FF		; 375C: FF
    dta $FF		; 375D: FF
    dta $F9		; 375E: F9
    dta $50		; 375F: 50
    dta $3F		; 3760: 3F
    dta $FF		; 3761: FF
    dta $93		; 3762: 93
    dta $FF		; 3763: FF
    dta $FF		; 3764: FF
    dta $FF		; 3765: FF
    dta $FF		; 3766: FF
    dta $FF		; 3767: FF
    dta $FE		; 3768: FE
    dta $50		; 3769: 50
    dta $55		; 376A: 55
    dta $55		; 376B: 55
    dta $55		; 376C: 55
    dta $55		; 376D: 55
    dta $51		; 376E: 51
    dta $55		; 376F: 55
    dta $55		; 3770: 55
    dta $54		; 3771: 54
    dta $55		; 3772: 55
    dta $55		; 3773: 55
    dta $4F		; 3774: 4F
    dta $FF		; 3775: FF
    dta $F4		; 3776: F4
    dta $55		; 3777: 55
    dta $51		; 3778: 51
    dta $FE		; 3779: FE
    dta $64		; 377A: 64
    dta $3		; 377B: 03
    dta $FF		; 377C: FF
    dta $FF		; 377D: FF
    dta $FF		; 377E: FF
    dta $FF		; 377F: FF
    dta $FF		; 3780: FF
    dta $FF		; 3781: FF
    dta $FF		; 3782: FF
    dta $FF		; 3783: FF
    dta $FF		; 3784: FF
    dta $FF		; 3785: FF
    dta $F9		; 3786: F9
    dta $51		; 3787: 51
    dta $BF		; 3788: BF
    dta $FF		; 3789: FF
    dta $57		; 378A: 57
    dta $FF		; 378B: FF
    dta $FF		; 378C: FF
    dta $FF		; 378D: FF
    dta $FF		; 378E: FF
    dta $FF		; 378F: FF
    dta $C3		; 3790: C3
    dta $14		; 3791: 14
    dta $15		; 3792: 15
    dta $55		; 3793: 55
    dta $55		; 3794: 55
    dta $55		; 3795: 55
    dta $51		; 3796: 51
    dta $55		; 3797: 55
    dta $55		; 3798: 55
    dta $51		; 3799: 51
    dta $55		; 379A: 55
    dta $55		; 379B: 55
    dta $4F		; 379C: 4F
    dta $FF		; 379D: FF
    dta $F4		; 379E: F4
    dta $15		; 379F: 15
    dta $51		; 37A0: 51
    dta $FE		; 37A1: FE
    dta $70		; 37A2: 70
    dta $F		; 37A3: 0F
    dta $FF		; 37A4: FF
    dta $FF		; 37A5: FF
    dta $FF		; 37A6: FF
    dta $FF		; 37A7: FF
    dta $FF		; 37A8: FF
    dta $FF		; 37A9: FF
    dta $FF		; 37AA: FF
    dta $FF		; 37AB: FF
    dta $FF		; 37AC: FF
    dta $FF		; 37AD: FF
    dta $F9		; 37AE: F9
    dta $55		; 37AF: 55
    dta $BF		; 37B0: BF
    dta $FF		; 37B1: FF
    dta $47		; 37B2: 47
    dta $FF		; 37B3: FF
    dta $FF		; 37B4: FF
    dta $FF		; 37B5: FF
    dta $FF		; 37B6: FF
    dta $FF		; 37B7: FF
    dta $94		; 37B8: 94
    dta $15		; 37B9: 15
    dta $55		; 37BA: 55
    dta $55		; 37BB: 55
    dta $55		; 37BC: 55
    dta $55		; 37BD: 55
    dta $51		; 37BE: 51
    dta $55		; 37BF: 55
    dta $55		; 37C0: 55
    dta $45		; 37C1: 45
    dta $55		; 37C2: 55
    dta $55		; 37C3: 55
    dta $4F		; 37C4: 4F
    dta $FF		; 37C5: FF
    dta $F4		; 37C6: F4
    dta $15		; 37C7: 15
    dta $51		; 37C8: 51
    dta $FF		; 37C9: FF
    dta $F8		; 37CA: F8
    dta $3F		; 37CB: 3F
    dta $FF		; 37CC: FF
    dta $FF		; 37CD: FF
    dta $FF		; 37CE: FF
    dta $FF		; 37CF: FF
    dta $FF		; 37D0: FF
    dta $FF		; 37D1: FF
    dta $FF		; 37D2: FF
    dta $FF		; 37D3: FF
    dta $FF		; 37D4: FF
    dta $FF		; 37D5: FF
    dta $F9		; 37D6: F9
    dta $54		; 37D7: 54
    dta $3F		; 37D8: 3F
    dta $FE		; 37D9: FE
    dta $1F		; 37DA: 1F
    dta $FF		; 37DB: FF
    dta $FF		; 37DC: FF
    dta $FF		; 37DD: FF
    dta $FF		; 37DE: FF
    dta $FF		; 37DF: FF
    dta $C5		; 37E0: C5
    dta $51		; 37E1: 51
    dta $55		; 37E2: 55
    dta $55		; 37E3: 55
    dta $55		; 37E4: 55
    dta $55		; 37E5: 55
    dta $51		; 37E6: 51
    dta $55		; 37E7: 55
    dta $55		; 37E8: 55
    dta $15		; 37E9: 15
    dta $55		; 37EA: 55
    dta $55		; 37EB: 55
    dta $4F		; 37EC: 4F
    dta $FF		; 37ED: FF
    dta $F4		; 37EE: F4
    dta $15		; 37EF: 15
    dta $50		; 37F0: 50
    dta $FF		; 37F1: FF
    dta $FF		; 37F2: FF
    dta $FF		; 37F3: FF
    dta $FF		; 37F4: FF
    dta $FF		; 37F5: FF
    dta $FF		; 37F6: FF
    dta $FF		; 37F7: FF
    dta $FF		; 37F8: FF
    dta $FF		; 37F9: FF
    dta $FF		; 37FA: FF
    dta $FF		; 37FB: FF
    dta $FF		; 37FC: FF
    dta $FF		; 37FD: FF
    dta $FC		; 37FE: FC
    dta $54		; 37FF: 54
    dta $7		; 3800: 07
    dta $FF		; 3801: FF
    dta $FF		; 3802: FF
    dta $FF		; 3803: FF
    dta $FF		; 3804: FF
    dta $FF		; 3805: FF
    dta $FF		; 3806: FF
    dta $C3		; 3807: C3
    dta $E5		; 3808: E5
    dta $55		; 3809: 55
    dta $55		; 380A: 55
    dta $55		; 380B: 55
    dta $55		; 380C: 55
    dta $50		; 380D: 50
    dta $11		; 380E: 11
    dta $55		; 380F: 55
    dta $55		; 3810: 55
    dta $15		; 3811: 15
    dta $55		; 3812: 55
    dta $55		; 3813: 55
    dta $F		; 3814: 0F
    dta $FF		; 3815: FF
    dta $F4		; 3816: F4
    dta $95		; 3817: 95
    dta $54		; 3818: 54
    dta $FF		; 3819: FF
    dta $FF		; 381A: FF
    dta $FF		; 381B: FF
    dta $FF		; 381C: FF
    dta $FF		; 381D: FF
    dta $FF		; 381E: FF
    dta $FF		; 381F: FF
    dta $FF		; 3820: FF
    dta $FF		; 3821: FF
    dta $FF		; 3822: FF
    dta $FF		; 3823: FF
    dta $FF		; 3824: FF
    dta $FF		; 3825: FF
    dta $FE		; 3826: FE
    dta $54		; 3827: 54
    dta $47		; 3828: 47
    dta $FF		; 3829: FF
    dta $FF		; 382A: FF
    dta $FF		; 382B: FF
    dta $FF		; 382C: FF
    dta $FF		; 382D: FF
    dta $FF		; 382E: FF
    dta $D0		; 382F: D0
    dta $E5		; 3830: E5
    dta $15		; 3831: 15
    dta $55		; 3832: 55
    dta $55		; 3833: 55
    dta $50		; 3834: 50
    dta $F		; 3835: 0F
    dta $E5		; 3836: E5
    dta $55		; 3837: 55
    dta $54		; 3838: 54
    dta $55		; 3839: 55
    dta $55		; 383A: 55
    dta $55		; 383B: 55
    dta $3C		; 383C: 3C
    dta $17		; 383D: 17
    dta $F4		; 383E: F4
    dta $95		; 383F: 95
    dta $54		; 3840: 54
    dta $FF		; 3841: FF
    dta $FF		; 3842: FF
    dta $FF		; 3843: FF
    dta $FF		; 3844: FF
    dta $FF		; 3845: FF
    dta $FF		; 3846: FF
    dta $FF		; 3847: FF
    dta $FF		; 3848: FF
    dta $FF		; 3849: FF
    dta $FF		; 384A: FF
    dta $FF		; 384B: FF
    dta $FF		; 384C: FF
    dta $FF		; 384D: FF
    dta $FE		; 384E: FE
    dta $55		; 384F: 55
    dta $4F		; 3850: 4F
    dta $FF		; 3851: FF
    dta $FF		; 3852: FF
    dta $FF		; 3853: FF
    dta $FF		; 3854: FF
    dta $FF		; 3855: FF
    dta $E1		; 3856: E1
    dta $C4		; 3857: C4
    dta $24		; 3858: 24
    dta $55		; 3859: 55
    dta $55		; 385A: 55
    dta $55		; 385B: 55
    dta $41		; 385C: 41
    dta $40		; 385D: 40
    dta $45		; 385E: 45
    dta $55		; 385F: 55
    dta $54		; 3860: 54
    dta $55		; 3861: 55
    dta $55		; 3862: 55
    dta $55		; 3863: 55
    dta $3F		; 3864: 3F
    dta $F0		; 3865: F0
    dta $0		; 3866: 00
    dta $95		; 3867: 95
    dta $54		; 3868: 54
    dta $FF		; 3869: FF
    dta $FF		; 386A: FF
    dta $FF		; 386B: FF
    dta $FF		; 386C: FF
    dta $FF		; 386D: FF
    dta $FF		; 386E: FF
    dta $FF		; 386F: FF
    dta $FF		; 3870: FF
    dta $FF		; 3871: FF
    dta $FF		; 3872: FF
    dta $FF		; 3873: FF
    dta $FF		; 3874: FF
    dta $FF		; 3875: FF
    dta $FF		; 3876: FF
    dta $15		; 3877: 15
    dta $E		; 3878: 0E
    dta $67		; 3879: 67
    dta $FF		; 387A: FF
    dta $FF		; 387B: FF
    dta $FF		; 387C: FF
    dta $FF		; 387D: FF
    dta $E4		; 387E: E4
    dta $65		; 387F: 65
    dta $41		; 3880: 41
    dta $55		; 3881: 55
    dta $55		; 3882: 55
    dta $50		; 3883: 50
    dta $7F		; 3884: 7F
    dta $FF		; 3885: FF
    dta $5		; 3886: 05
    dta $55		; 3887: 55
    dta $55		; 3888: 55
    dta $55		; 3889: 55
    dta $55		; 388A: 55
    dta $55		; 388B: 55
    dta $3F		; 388C: 3F
    dta $FF		; 388D: FF
    dta $F4		; 388E: F4
    dta $95		; 388F: 95
    dta $54		; 3890: 54
    dta $FF		; 3891: FF
    dta $FF		; 3892: FF
    dta $FF		; 3893: FF
    dta $FF		; 3894: FF
    dta $FF		; 3895: FF
    dta $FF		; 3896: FF
    dta $FF		; 3897: FF
    dta $FF		; 3898: FF
    dta $FF		; 3899: FF
    dta $FF		; 389A: FF
    dta $FF		; 389B: FF
    dta $FF		; 389C: FF
    dta $FF		; 389D: FF
    dta $FF		; 389E: FF
    dta $15		; 389F: 15
    dta $4C		; 38A0: 4C
    dta $63		; 38A1: 63
    dta $3F		; 38A2: 3F
    dta $FF		; 38A3: FF
    dta $FF		; 38A4: FF
    dta $3C		; 38A5: 3C
    dta $75		; 38A6: 75
    dta $65		; 38A7: 65
    dta $15		; 38A8: 15
    dta $55		; 38A9: 55
    dta $55		; 38AA: 55
    dta $40		; 38AB: 40
    dta $0		; 38AC: 00
    dta $0		; 38AD: 00
    dta $15		; 38AE: 15
    dta $55		; 38AF: 55
    dta $51		; 38B0: 51
    dta $55		; 38B1: 55
    dta $55		; 38B2: 55
    dta $55		; 38B3: 55
    dta $3F		; 38B4: 3F
    dta $FF		; 38B5: FF
    dta $F4		; 38B6: F4
    dta $15		; 38B7: 15
    dta $54		; 38B8: 54
    dta $FF		; 38B9: FF
    dta $FF		; 38BA: FF
    dta $FF		; 38BB: FF
    dta $FF		; 38BC: FF
    dta $FF		; 38BD: FF
    dta $FF		; 38BE: FF
    dta $FF		; 38BF: FF
    dta $FF		; 38C0: FF
    dta $FF		; 38C1: FF
    dta $FF		; 38C2: FF
    dta $FF		; 38C3: FF
    dta $FF		; 38C4: FF
    dta $FF		; 38C5: FF
    dta $FF		; 38C6: FF
    dta $95		; 38C7: 95
    dta $41		; 38C8: 41
    dta $21		; 38C9: 21
    dta $4F		; 38CA: 4F
    dta $FF		; 38CB: FF
    dta $C3		; 38CC: C3
    dta $D		; 38CD: 0D
    dta $35		; 38CE: 35
    dta $0		; 38CF: 00
    dta $55		; 38D0: 55
    dta $55		; 38D1: 55
    dta $54		; 38D2: 54
    dta $1F		; 38D3: 1F
    dta $E3		; 38D4: E3
    dta $FF		; 38D5: FF
    dta $95		; 38D6: 95
    dta $55		; 38D7: 55
    dta $55		; 38D8: 55
    dta $55		; 38D9: 55
    dta $55		; 38DA: 55
    dta $55		; 38DB: 55
    dta $3F		; 38DC: 3F
    dta $FF		; 38DD: FF
    dta $F4		; 38DE: F4
    dta $45		; 38DF: 45
    dta $54		; 38E0: 54
    dta $FF		; 38E1: FF
    dta $FF		; 38E2: FF
    dta $FF		; 38E3: FF
    dta $FF		; 38E4: FF
    dta $FF		; 38E5: FF
    dta $FF		; 38E6: FF
    dta $FF		; 38E7: FF
    dta $FF		; 38E8: FF
    dta $FF		; 38E9: FF
    dta $FF		; 38EA: FF
    dta $FF		; 38EB: FF
    dta $FF		; 38EC: FF
    dta $FF		; 38ED: FF
    dta $FF		; 38EE: FF
    dta $95		; 38EF: 95
    dta $51		; 38F0: 51
    dta $4		; 38F1: 04
    dta $4C		; 38F2: 4C
    dta $38		; 38F3: 38
    dta $D1		; 38F4: D1
    dta $6D		; 38F5: 6D
    dta $14		; 38F6: 14
    dta $55		; 38F7: 55
    dta $55		; 38F8: 55
    dta $55		; 38F9: 55
    dta $50		; 38FA: 50
    dta $0		; 38FB: 00
    dta $1F		; 38FC: 1F
    dta $FF		; 38FD: FF
    dta $95		; 38FE: 95
    dta $55		; 38FF: 55
    dta $45		; 3900: 45
    dta $55		; 3901: 55
    dta $55		; 3902: 55
    dta $54		; 3903: 54
    dta $0		; 3904: 00
    dta $7		; 3905: 07
    dta $F4		; 3906: F4
    dta $45		; 3907: 45
    dta $54		; 3908: 54
    dta $FF		; 3909: FF
    dta $FF		; 390A: FF
    dta $FF		; 390B: FF
    dta $FF		; 390C: FF
    dta $FF		; 390D: FF
    dta $FF		; 390E: FF
    dta $FF		; 390F: FF
    dta $FF		; 3910: FF
    dta $FF		; 3911: FF
    dta $FF		; 3912: FF
    dta $FF		; 3913: FF
    dta $FF		; 3914: FF
    dta $FF		; 3915: FF
    dta $FF		; 3916: FF
    dta $95		; 3917: 95
    dta $51		; 3918: 51
    dta $0		; 3919: 00
    dta $6D		; 391A: 6D
    dta $19		; 391B: 19
    dta $54		; 391C: 54
    dta $60		; 391D: 60
    dta $1		; 391E: 01
    dta $55		; 391F: 55
    dta $55		; 3920: 55
    dta $55		; 3921: 55
    dta $41		; 3922: 41
    dta $FC		; 3923: FC
    dta $BF		; 3924: BF
    dta $FF		; 3925: FF
    dta $95		; 3926: 95
    dta $55		; 3927: 55
    dta $45		; 3928: 45
    dta $55		; 3929: 55
    dta $55		; 392A: 55
    dta $54		; 392B: 54
    dta $FF		; 392C: FF
    dta $F0		; 392D: F0
    dta $14		; 392E: 14
    dta $E5		; 392F: E5
    dta $54		; 3930: 54
    dta $FF		; 3931: FF
    dta $FF		; 3932: FF
    dta $FF		; 3933: FF
    dta $FF		; 3934: FF
    dta $FF		; 3935: FF
    dta $FF		; 3936: FF
    dta $FF		; 3937: FF
    dta $FF		; 3938: FF
    dta $FF		; 3939: FF
    dta $FF		; 393A: FF
    dta $FF		; 393B: FF
    dta $FF		; 393C: FF
    dta $FF		; 393D: FF
    dta $FF		; 393E: FF
    dta $95		; 393F: 95
    dta $55		; 3940: 55
    dta $54		; 3941: 54
    dta $1		; 3942: 01
    dta $49		; 3943: 49
    dta $16		; 3944: 16
    dta $1		; 3945: 01
    dta $55		; 3946: 55
    dta $55		; 3947: 55
    dta $55		; 3948: 55
    dta $55		; 3949: 55
    dta $0		; 394A: 00
    dta $63		; 394B: 63
    dta $FF		; 394C: FF
    dta $FF		; 394D: FF
    dta $15		; 394E: 15
    dta $55		; 394F: 55
    dta $45		; 3950: 45
    dta $55		; 3951: 55
    dta $55		; 3952: 55
    dta $51		; 3953: 51
    dta $FF		; 3954: FF
    dta $FF		; 3955: FF
    dta $E8		; 3956: E8
    dta $F5		; 3957: F5
    dta $54		; 3958: 54
    dta $FF		; 3959: FF
    dta $FF		; 395A: FF
    dta $FF		; 395B: FF
    dta $FF		; 395C: FF
    dta $FF		; 395D: FF
    dta $FF		; 395E: FF
    dta $FF		; 395F: FF
    dta $FF		; 3960: FF
    dta $FF		; 3961: FF
    dta $FF		; 3962: FF
    dta $FF		; 3963: FF
    dta $FF		; 3964: FF
    dta $FF		; 3965: FF
    dta $FF		; 3966: FF
    dta $E5		; 3967: E5
    dta $55		; 3968: 55
    dta $55		; 3969: 55
    dta $55		; 396A: 55
    dta $0		; 396B: 00
    dta $0		; 396C: 00
    dta $D5		; 396D: D5
    dta $55		; 396E: 55
    dta $55		; 396F: 55
    dta $55		; 3970: 55
    dta $54		; 3971: 54
    dta $FF		; 3972: FF
    dta $F		; 3973: 0F
    dta $FF		; 3974: FF
    dta $FF		; 3975: FF
    dta $15		; 3976: 15
    dta $55		; 3977: 55
    dta $5		; 3978: 05
    dta $55		; 3979: 55
    dta $55		; 397A: 55
    dta $51		; 397B: 51
    dta $FF		; 397C: FF
    dta $FF		; 397D: FF
    dta $E1		; 397E: E1
    dta $F1		; 397F: F1
    dta $54		; 3980: 54
    dta $FF		; 3981: FF
    dta $FF		; 3982: FF
    dta $FF		; 3983: FF
    dta $FF		; 3984: FF
    dta $FF		; 3985: FF
    dta $FF		; 3986: FF
    dta $FF		; 3987: FF
    dta $FF		; 3988: FF
    dta $FF		; 3989: FF
    dta $FF		; 398A: FF
    dta $FF		; 398B: FF
    dta $FF		; 398C: FF
    dta $FF		; 398D: FF
    dta $FF		; 398E: FF
    dta $F1		; 398F: F1
    dta $55		; 3990: 55
    dta $55		; 3991: 55
    dta $55		; 3992: 55
    dta $55		; 3993: 55
    dta $55		; 3994: 55
    dta $55		; 3995: 55
    dta $55		; 3996: 55
    dta $55		; 3997: 55
    dta $55		; 3998: 55
    dta $40		; 3999: 40
    dta $8		; 399A: 08
    dta $3F		; 399B: 3F
    dta $FF		; 399C: FF
    dta $FE		; 399D: FE
    dta $55		; 399E: 55
    dta $55		; 399F: 55
    dta $13		; 39A0: 13
    dta $55		; 39A1: 55
    dta $55		; 39A2: 55
    dta $45		; 39A3: 45
    dta $FF		; 39A4: FF
    dta $FF		; 39A5: FF
    dta $F1		; 39A6: F1
    dta $FC		; 39A7: FC
    dta $54		; 39A8: 54
    dta $FF		; 39A9: FF
    dta $FF		; 39AA: FF
    dta $FF		; 39AB: FF
    dta $FF		; 39AC: FF
    dta $FF		; 39AD: FF
    dta $FF		; 39AE: FF
    dta $FF		; 39AF: FF
    dta $FF		; 39B0: FF
    dta $FF		; 39B1: FF
    dta $FF		; 39B2: FF
    dta $FF		; 39B3: FF
    dta $FF		; 39B4: FF
    dta $FF		; 39B5: FF
    dta $FF		; 39B6: FF
    dta $FC		; 39B7: FC
    dta $55		; 39B8: 55
    dta $55		; 39B9: 55
    dta $55		; 39BA: 55
    dta $55		; 39BB: 55
    dta $55		; 39BC: 55
    dta $55		; 39BD: 55
    dta $55		; 39BE: 55
    dta $55		; 39BF: 55
    dta $50		; 39C0: 50
    dta $3C		; 39C1: 3C
    dta $83		; 39C2: 83
    dta $FF		; 39C3: FF
    dta $FF		; 39C4: FF
    dta $FE		; 39C5: FE
    dta $55		; 39C6: 55
    dta $54		; 39C7: 54
    dta $0		; 39C8: 00
    dta $D5		; 39C9: D5
    dta $55		; 39CA: 55
    dta $45		; 39CB: 45
    dta $0		; 39CC: 00
    dta $F		; 39CD: 0F
    dta $F3		; 39CE: F3
    dta $FE		; 39CF: FE
    dta $55		; 39D0: 55
    dta $7F		; 39D1: 7F
    dta $FF		; 39D2: FF
    dta $FF		; 39D3: FF
    dta $FF		; 39D4: FF
    dta $FF		; 39D5: FF
    dta $FF		; 39D6: FF
    dta $FF		; 39D7: FF
    dta $FF		; 39D8: FF
    dta $FF		; 39D9: FF
    dta $FF		; 39DA: FF
    dta $FF		; 39DB: FF
    dta $FF		; 39DC: FF
    dta $FF		; 39DD: FF
    dta $FF		; 39DE: FF
    dta $FF		; 39DF: FF
    dta $95		; 39E0: 95
    dta $55		; 39E1: 55
    dta $55		; 39E2: 55
    dta $55		; 39E3: 55
    dta $55		; 39E4: 55
    dta $55		; 39E5: 55
    dta $55		; 39E6: 55
    dta $55		; 39E7: 55
    dta $46		; 39E8: 46
    dta $20		; 39E9: 20
    dta $3F		; 39EA: 3F
    dta $FF		; 39EB: FF
    dta $FF		; 39EC: FF
    dta $FC		; 39ED: FC
    dta $55		; 39EE: 55
    dta $51		; 39EF: 51
    dta $F0		; 39F0: F0
    dta $35		; 39F1: 35
    dta $55		; 39F2: 55
    dta $1F		; 39F3: 1F
    dta $FF		; 39F4: FF
    dta $E0		; 39F5: E0
    dta $23		; 39F6: 23
    dta $FF		; 39F7: FF
    dta $15		; 39F8: 15
    dta $3F		; 39F9: 3F
    dta $FF		; 39FA: FF
    dta $FF		; 39FB: FF
    dta $FF		; 39FC: FF
    dta $FF		; 39FD: FF
    dta $FF		; 39FE: FF
    dta $FF		; 39FF: FF
    dta $FF		; 3A00: FF
    dta $FF		; 3A01: FF
    dta $FF		; 3A02: FF
    dta $FF		; 3A03: FF
    dta $FF		; 3A04: FF
    dta $FF		; 3A05: FF
    dta $FF		; 3A06: FF
    dta $FF		; 3A07: FF
    dta $E1		; 3A08: E1
    dta $55		; 3A09: 55
    dta $55		; 3A0A: 55
    dta $55		; 3A0B: 55
    dta $55		; 3A0C: 55
    dta $55		; 3A0D: 55
    dta $55		; 3A0E: 55
    dta $55		; 3A0F: 55
    dta $40		; 3A10: 40
    dta $F		; 3A11: 0F
    dta $FF		; 3A12: FF
    dta $FF		; 3A13: FF
    dta $FF		; 3A14: FF
    dta $FC		; 3A15: FC
    dta $55		; 3A16: 55
    dta $53		; 3A17: 53
    dta $FC		; 3A18: FC
    dta $0		; 3A19: 00
    dta $0		; 3A1A: 00
    dta $7F		; 3A1B: 7F
    dta $FF		; 3A1C: FF
    dta $FF		; 3A1D: FF
    dta $CB		; 3A1E: CB
    dta $FF		; 3A1F: FF
    dta $95		; 3A20: 95
    dta $1F		; 3A21: 1F
    dta $FF		; 3A22: FF
    dta $FF		; 3A23: FF
    dta $FF		; 3A24: FF
    dta $FF		; 3A25: FF
    dta $FF		; 3A26: FF
    dta $FF		; 3A27: FF
    dta $FF		; 3A28: FF
    dta $FF		; 3A29: FF
    dta $FF		; 3A2A: FF
    dta $FF		; 3A2B: FF
    dta $FF		; 3A2C: FF
    dta $FF		; 3A2D: FF
    dta $FF		; 3A2E: FF
    dta $FF		; 3A2F: FF
    dta $FC		; 3A30: FC
    dta $5		; 3A31: 05
    dta $55		; 3A32: 55
    dta $55		; 3A33: 55
    dta $55		; 3A34: 55
    dta $55		; 3A35: 55
    dta $55		; 3A36: 55
    dta $55		; 3A37: 55
    dta $4D		; 3A38: 4D
    dta $FF		; 3A39: FF
    dta $FF		; 3A3A: FF
    dta $FF		; 3A3B: FF
    dta $FF		; 3A3C: FF
    dta $FC		; 3A3D: FC
    dta $55		; 3A3E: 55
    dta $47		; 3A3F: 47
    dta $FF		; 3A40: FF
    dta $87		; 3A41: 87
    dta $FF		; 3A42: FF
    dta $DF		; 3A43: DF
    dta $FF		; 3A44: FF
    dta $FF		; 3A45: FF
    dta $CF		; 3A46: CF
    dta $FF		; 3A47: FF
    dta $95		; 3A48: 95
    dta $4F		; 3A49: 4F
    dta $FF		; 3A4A: FF
    dta $FF		; 3A4B: FF
    dta $FF		; 3A4C: FF
    dta $FF		; 3A4D: FF
    dta $FF		; 3A4E: FF
    dta $FF		; 3A4F: FF
    dta $FF		; 3A50: FF
    dta $FF		; 3A51: FF
    dta $FF		; 3A52: FF
    dta $FF		; 3A53: FF
    dta $FF		; 3A54: FF
    dta $FF		; 3A55: FF
    dta $FF		; 3A56: FF
    dta $FF		; 3A57: FF
    dta $FF		; 3A58: FF
    dta $E0		; 3A59: E0
    dta $55		; 3A5A: 55
    dta $55		; 3A5B: 55
    dta $55		; 3A5C: 55
    dta $55		; 3A5D: 55
    dta $55		; 3A5E: 55
    dta $0		; 3A5F: 00
    dta $7F		; 3A60: 7F
    dta $FF		; 3A61: FF
    dta $FF		; 3A62: FF
    dta $E1		; 3A63: E1
    dta $0		; 3A64: 00
    dta $3C		; 3A65: 3C
    dta $55		; 3A66: 55
    dta $4F		; 3A67: 4F
    dta $FF		; 3A68: FF
    dta $F0		; 3A69: F0
    dta $80		; 3A6A: 80
    dta $1F		; 3A6B: 1F
    dta $FF		; 3A6C: FF
    dta $FF		; 3A6D: FF
    dta $5F		; 3A6E: 5F
    dta $FF		; 3A6F: FF
    dta $D5		; 3A70: D5
    dta $51		; 3A71: 51
    dta $FF		; 3A72: FF
    dta $FF		; 3A73: FF
    dta $FF		; 3A74: FF
    dta $FF		; 3A75: FF
    dta $FF		; 3A76: FF
    dta $FF		; 3A77: FF
    dta $FF		; 3A78: FF
    dta $FF		; 3A79: FF
    dta $FF		; 3A7A: FF
    dta $FF		; 3A7B: FF
    dta $FF		; 3A7C: FF
    dta $FF		; 3A7D: FF
    dta $FF		; 3A7E: FF
    dta $FF		; 3A7F: FF
    dta $FF		; 3A80: FF
    dta $FE		; 3A81: FE
    dta $0		; 3A82: 00
    dta $15		; 3A83: 15
    dta $55		; 3A84: 55
    dta $55		; 3A85: 55
    dta $50		; 3A86: 50
    dta $3		; 3A87: 03
    dta $FF		; 3A88: FF
    dta $FF		; 3A89: FF
    dta $FF		; 3A8A: FF
    dta $E9		; 3A8B: E9
    dta $55		; 3A8C: 55
    dta $19		; 3A8D: 19
    dta $55		; 3A8E: 55
    dta $1F		; 3A8F: 1F
    dta $FF		; 3A90: FF
    dta $FE		; 3A91: FE
    dta $5F		; 3A92: 5F
    dta $FF		; 3A93: FF
    dta $FD		; 3A94: FD
    dta $0		; 3A95: 00
    dta $3F		; 3A96: 3F
    dta $FF		; 3A97: FF
    dta $C5		; 3A98: C5
    dta $51		; 3A99: 51
    dta $FF		; 3A9A: FF
    dta $FF		; 3A9B: FF
    dta $FF		; 3A9C: FF
    dta $FF		; 3A9D: FF
    dta $FF		; 3A9E: FF
    dta $FF		; 3A9F: FF
    dta $FF		; 3AA0: FF
    dta $FF		; 3AA1: FF
    dta $FF		; 3AA2: FF
    dta $FF		; 3AA3: FF
    dta $FF		; 3AA4: FF
    dta $FF		; 3AA5: FF
    dta $FF		; 3AA6: FF
    dta $FF		; 3AA7: FF
    dta $FF		; 3AA8: FF
    dta $FF		; 3AA9: FF
    dta $FF		; 3AAA: FF
    dta $80		; 3AAB: 80
    dta $0		; 3AAC: 00
    dta $0		; 3AAD: 00
    dta $0		; 3AAE: 00
    dta $FF		; 3AAF: FF
    dta $FF		; 3AB0: FF
    dta $FF		; 3AB1: FF
    dta $FF		; 3AB2: FF
    dta $E0		; 3AB3: E0
    dta $55		; 3AB4: 55
    dta $51		; 3AB5: 51
    dta $55		; 3AB6: 55
    dta $7F		; 3AB7: 7F
    dta $FF		; 3AB8: FF
    dta $FF		; 3AB9: FF
    dta $87		; 3ABA: 87
    dta $F4		; 3ABB: F4
    dta $0		; 3ABC: 00
    dta $1		; 3ABD: 01
    dta $FF		; 3ABE: FF
    dta $FF		; 3ABF: FF
    dta $E5		; 3AC0: E5
    dta $55		; 3AC1: 55
    dta $7F		; 3AC2: 7F
    dta $FF		; 3AC3: FF
    dta $FF		; 3AC4: FF
    dta $FF		; 3AC5: FF
    dta $FF		; 3AC6: FF
    dta $FF		; 3AC7: FF
    dta $FF		; 3AC8: FF
    dta $FF		; 3AC9: FF
    dta $FF		; 3ACA: FF
    dta $FF		; 3ACB: FF
    dta $FF		; 3ACC: FF
    dta $FF		; 3ACD: FF
    dta $FF		; 3ACE: FF
    dta $FF		; 3ACF: FF
    dta $FF		; 3AD0: FF
    dta $FF		; 3AD1: FF
    dta $FF		; 3AD2: FF
    dta $F0		; 3AD3: F0
    dta $0		; 3AD4: 00
    dta $0		; 3AD5: 00
    dta $3		; 3AD6: 03
    dta $FF		; 3AD7: FF
    dta $FF		; 3AD8: FF
    dta $FF		; 3AD9: FF
    dta $FF		; 3ADA: FF
    dta $80		; 3ADB: 80
    dta $55		; 3ADC: 55
    dta $55		; 3ADD: 55
    dta $54		; 3ADE: 54
    dta $FF		; 3ADF: FF
    dta $FF		; 3AE0: FF
    dta $FF		; 3AE1: FF
    dta $E0		; 3AE2: E0
    dta $FF		; 3AE3: FF
    dta $FF		; 3AE4: FF
    dta $CF		; 3AE5: CF
    dta $FF		; 3AE6: FF
    dta $FF		; 3AE7: FF
    dta $95		; 3AE8: 95
    dta $55		; 3AE9: 55
    dta $1F		; 3AEA: 1F
    dta $FF		; 3AEB: FF
    dta $FF		; 3AEC: FF
    dta $FF		; 3AED: FF
    dta $FF		; 3AEE: FF
    dta $FF		; 3AEF: FF
    dta $FF		; 3AF0: FF
    dta $FF		; 3AF1: FF
    dta $FF		; 3AF2: FF
    dta $FF		; 3AF3: FF
    dta $FF		; 3AF4: FF
    dta $FF		; 3AF5: FF
    dta $FF		; 3AF6: FF
    dta $FF		; 3AF7: FF
    dta $FF		; 3AF8: FF
    dta $FF		; 3AF9: FF
    dta $FF		; 3AFA: FF
    dta $FF		; 3AFB: FF
    dta $FF		; 3AFC: FF
    dta $FF		; 3AFD: FF
    dta $FF		; 3AFE: FF
    dta $FF		; 3AFF: FF
    dta $FF		; 3B00: FF
    dta $FF		; 3B01: FF
    dta $FE		; 3B02: FE
    dta $0		; 3B03: 00
    dta $55		; 3B04: 55
    dta $55		; 3B05: 55
    dta $55		; 3B06: 55
    dta $FF		; 3B07: FF
    dta $FF		; 3B08: FF
    dta $FF		; 3B09: FF
    dta $FF		; 3B0A: FF
    dta $3D		; 3B0B: 3D
    dta $FC		; 3B0C: FC
    dta $3F		; 3B0D: 3F
    dta $FF		; 3B0E: FF
    dta $FE		; 3B0F: FE
    dta $55		; 3B10: 55
    dta $55		; 3B11: 55
    dta $4F		; 3B12: 4F
    dta $FF		; 3B13: FF
    dta $FF		; 3B14: FF
    dta $FF		; 3B15: FF
    dta $FF		; 3B16: FF
    dta $FF		; 3B17: FF
    dta $FF		; 3B18: FF
    dta $FF		; 3B19: FF
    dta $FF		; 3B1A: FF
    dta $FF		; 3B1B: FF
    dta $FF		; 3B1C: FF
    dta $FF		; 3B1D: FF
    dta $FF		; 3B1E: FF
    dta $FF		; 3B1F: FF
    dta $FF		; 3B20: FF
    dta $FF		; 3B21: FF
    dta $FF		; 3B22: FF
    dta $FF		; 3B23: FF
    dta $FF		; 3B24: FF
    dta $FF		; 3B25: FF
    dta $FF		; 3B26: FF
    dta $FF		; 3B27: FF
    dta $FF		; 3B28: FF
    dta $FF		; 3B29: FF
    dta $FC		; 3B2A: FC
    dta $1		; 3B2B: 01
    dta $51		; 3B2C: 51
    dta $55		; 3B2D: 55
    dta $51		; 3B2E: 51
    dta $FF		; 3B2F: FF
    dta $FF		; 3B30: FF
    dta $FF		; 3B31: FF
    dta $FF		; 3B32: FF
    dta $F0		; 3B33: F0
    dta $1		; 3B34: 01
    dta $FF		; 3B35: FF
    dta $FF		; 3B36: FF
    dta $F1		; 3B37: F1
    dta $55		; 3B38: 55
    dta $55		; 3B39: 55
    dta $47		; 3B3A: 47
    dta $FF		; 3B3B: FF
    dta $FF		; 3B3C: FF
    dta $FF		; 3B3D: FF
    dta $FF		; 3B3E: FF
    dta $FF		; 3B3F: FF
    dta $FF		; 3B40: FF
    dta $FF		; 3B41: FF
    dta $FF		; 3B42: FF
    dta $FF		; 3B43: FF
    dta $FF		; 3B44: FF
    dta $FF		; 3B45: FF
    dta $FF		; 3B46: FF
    dta $FF		; 3B47: FF
    dta $FF		; 3B48: FF
    dta $FF		; 3B49: FF
    dta $FF		; 3B4A: FF
    dta $FF		; 3B4B: FF
    dta $FF		; 3B4C: FF
    dta $FF		; 3B4D: FF
    dta $FF		; 3B4E: FF
    dta $FF		; 3B4F: FF
    dta $FF		; 3B50: FF
    dta $FF		; 3B51: FF
    dta $F8		; 3B52: F8
    dta $38		; 3B53: 38
    dta $1		; 3B54: 01
    dta $55		; 3B55: 55
    dta $51		; 3B56: 51
    dta $FF		; 3B57: FF
    dta $FF		; 3B58: FF
    dta $FF		; 3B59: FF
    dta $FF		; 3B5A: FF
    dta $FF		; 3B5B: FF
    dta $FF		; 3B5C: FF
    dta $FF		; 3B5D: FF
    dta $FF		; 3B5E: FF
    dta $C5		; 3B5F: C5
    dta $55		; 3B60: 55
    dta $51		; 3B61: 51
    dta $53		; 3B62: 53
    dta $FF		; 3B63: FF
    dta $FF		; 3B64: FF
    dta $FF		; 3B65: FF
    dta $FF		; 3B66: FF
    dta $FF		; 3B67: FF
    dta $FF		; 3B68: FF
    dta $FF		; 3B69: FF
    dta $FF		; 3B6A: FF
    dta $FF		; 3B6B: FF
    dta $FF		; 3B6C: FF
    dta $FF		; 3B6D: FF
    dta $FF		; 3B6E: FF
    dta $FF		; 3B6F: FF
    dta $FF		; 3B70: FF
    dta $FF		; 3B71: FF
    dta $FF		; 3B72: FF
    dta $FF		; 3B73: FF
    dta $FF		; 3B74: FF
    dta $FF		; 3B75: FF
    dta $FF		; 3B76: FF
    dta $FF		; 3B77: FF
    dta $FF		; 3B78: FF
    dta $FF		; 3B79: FF
    dta $F8		; 3B7A: F8
    dta $78		; 3B7B: 78
    dta $55		; 3B7C: 55
    dta $55		; 3B7D: 55
    dta $51		; 3B7E: 51
    dta $FF		; 3B7F: FF
    dta $FF		; 3B80: FF
    dta $FF		; 3B81: FF
    dta $FF		; 3B82: FF
    dta $FF		; 3B83: FF
    dta $FF		; 3B84: FF
    dta $FF		; 3B85: FF
    dta $FF		; 3B86: FF
    dta $95		; 3B87: 95
    dta $41		; 3B88: 41
    dta $50		; 3B89: 50
    dta $53		; 3B8A: 53
    dta $FF		; 3B8B: FF
    dta $FF		; 3B8C: FF
    dta $FF		; 3B8D: FF
    dta $FF		; 3B8E: FF
    dta $FF		; 3B8F: FF
    dta $FF		; 3B90: FF
    dta $FF		; 3B91: FF
    dta $FF		; 3B92: FF
    dta $FF		; 3B93: FF
    dta $FF		; 3B94: FF
    dta $FF		; 3B95: FF
    dta $FF		; 3B96: FF
    dta $FF		; 3B97: FF
    dta $FF		; 3B98: FF
    dta $FF		; 3B99: FF
    dta $FF		; 3B9A: FF
    dta $FF		; 3B9B: FF
    dta $FF		; 3B9C: FF
    dta $FF		; 3B9D: FF
    dta $FF		; 3B9E: FF
    dta $FF		; 3B9F: FF
    dta $FF		; 3BA0: FF
    dta $FF		; 3BA1: FF
    dta $F9		; 3BA2: F9
    dta $FA		; 3BA3: FA
    dta $15		; 3BA4: 15
    dta $55		; 3BA5: 55
    dta $51		; 3BA6: 51
    dta $FF		; 3BA7: FF
    dta $FF		; 3BA8: FF
    dta $FF		; 3BA9: FF
    dta $FF		; 3BAA: FF
    dta $FF		; 3BAB: FF
    dta $FF		; 3BAC: FF
    dta $FF		; 3BAD: FF
    dta $FF		; 3BAE: FF
    dta $81		; 3BAF: 81
    dta $D		; 3BB0: 0D
    dta $52		; 3BB1: 52
    dta $3		; 3BB2: 03
    dta $FF		; 3BB3: FF
    dta $FF		; 3BB4: FF
    dta $FF		; 3BB5: FF
    dta $FF		; 3BB6: FF
    dta $FF		; 3BB7: FF
    dta $FF		; 3BB8: FF
    dta $FF		; 3BB9: FF
    dta $FF		; 3BBA: FF
    dta $FF		; 3BBB: FF
    dta $FF		; 3BBC: FF
    dta $FF		; 3BBD: FF
    dta $FF		; 3BBE: FF
    dta $FF		; 3BBF: FF
    dta $FF		; 3BC0: FF
    dta $FF		; 3BC1: FF
    dta $FF		; 3BC2: FF
    dta $FF		; 3BC3: FF
    dta $FF		; 3BC4: FF
    dta $FF		; 3BC5: FF
    dta $FF		; 3BC6: FF
    dta $FF		; 3BC7: FF
    dta $FF		; 3BC8: FF
    dta $FF		; 3BC9: FF
    dta $F9		; 3BCA: F9
    dta $F2		; 3BCB: F2
    dta $94		; 3BCC: 94
    dta $0		; 3BCD: 00
    dta $54		; 3BCE: 54
    dta $FF		; 3BCF: FF
    dta $FF		; 3BD0: FF
    dta $FF		; 3BD1: FF
    dta $FF		; 3BD2: FF
    dta $FF		; 3BD3: FF
    dta $FF		; 3BD4: FF
    dta $FF		; 3BD5: FF
    dta $FF		; 3BD6: FF
    dta $91		; 3BD7: 91
    dta $3C		; 3BD8: 3C
    dta $11		; 3BD9: 11
    dta $83		; 3BDA: 83
    dta $FF		; 3BDB: FF
    dta $FF		; 3BDC: FF
    dta $FF		; 3BDD: FF
    dta $FF		; 3BDE: FF
    dta $FF		; 3BDF: FF
    dta $FF		; 3BE0: FF
    dta $FF		; 3BE1: FF
    dta $FF		; 3BE2: FF
    dta $FF		; 3BE3: FF
    dta $FF		; 3BE4: FF
    dta $FF		; 3BE5: FF
    dta $FF		; 3BE6: FF
    dta $FF		; 3BE7: FF
    dta $FF		; 3BE8: FF
    dta $FF		; 3BE9: FF
    dta $FF		; 3BEA: FF
    dta $FF		; 3BEB: FF
    dta $FF		; 3BEC: FF
    dta $FF		; 3BED: FF
    dta $FF		; 3BEE: FF
    dta $FF		; 3BEF: FF
    dta $FF		; 3BF0: FF
    dta $FF		; 3BF1: FF
    dta $F9		; 3BF2: F9
    dta $E0		; 3BF3: E0
    dta $10		; 3BF4: 10
    dta $FF		; 3BF5: FF
    dta $14		; 3BF6: 14
    dta $1F		; 3BF7: 1F
    dta $FF		; 3BF8: FF
    dta $FF		; 3BF9: FF
    dta $FF		; 3BFA: FF
    dta $FF		; 3BFB: FF
    dta $FF		; 3BFC: FF
    dta $FF		; 3BFD: FF
    dta $FF		; 3BFE: FF
    dta $81		; 3BFF: 81
    dta $3F		; 3C00: 3F
    dta $15		; 3C01: 15
    dta $87		; 3C02: 87
    dta $FF		; 3C03: FF
    dta $FF		; 3C04: FF
    dta $FF		; 3C05: FF
    dta $FF		; 3C06: FF
    dta $FF		; 3C07: FF
    dta $FF		; 3C08: FF
    dta $FF		; 3C09: FF
    dta $FF		; 3C0A: FF
    dta $FF		; 3C0B: FF
    dta $FF		; 3C0C: FF
    dta $FF		; 3C0D: FF
    dta $FF		; 3C0E: FF
    dta $FF		; 3C0F: FF
    dta $FF		; 3C10: FF
    dta $FF		; 3C11: FF
    dta $FF		; 3C12: FF
    dta $FF		; 3C13: FF
    dta $FF		; 3C14: FF
    dta $FF		; 3C15: FF
    dta $FF		; 3C16: FF
    dta $FF		; 3C17: FF
    dta $FF		; 3C18: FF
    dta $FF		; 3C19: FF
    dta $FB		; 3C1A: FB
    dta $C0		; 3C1B: C0
    dta $7		; 3C1C: 07
    dta $FF		; 3C1D: FF
    dta $15		; 3C1E: 15
    dta $5F		; 3C1F: 5F
    dta $FF		; 3C20: FF
    dta $FF		; 3C21: FF
    dta $FF		; 3C22: FF
    dta $FF		; 3C23: FF
    dta $FF		; 3C24: FF
    dta $FF		; 3C25: FF
    dta $FF		; 3C26: FF
    dta $0		; 3C27: 00
    dta $3F		; 3C28: 3F
    dta $14		; 3C29: 14
    dta $C7		; 3C2A: C7
    dta $FF		; 3C2B: FF
    dta $FF		; 3C2C: FF
    dta $FF		; 3C2D: FF
    dta $FF		; 3C2E: FF
    dta $FF		; 3C2F: FF
    dta $FF		; 3C30: FF
    dta $FF		; 3C31: FF
    dta $FF		; 3C32: FF
    dta $FF		; 3C33: FF
    dta $FF		; 3C34: FF
    dta $FF		; 3C35: FF
    dta $FF		; 3C36: FF
    dta $FF		; 3C37: FF
    dta $FF		; 3C38: FF
    dta $FF		; 3C39: FF
    dta $FF		; 3C3A: FF
    dta $FF		; 3C3B: FF
    dta $FF		; 3C3C: FF
    dta $FF		; 3C3D: FF
    dta $FF		; 3C3E: FF
    dta $FF		; 3C3F: FF
    dta $FF		; 3C40: FF
    dta $FF		; 3C41: FF
    dta $FF		; 3C42: FF
    dta $C0		; 3C43: C0
    dta $8F		; 3C44: 8F
    dta $FF		; 3C45: FF
    dta $15		; 3C46: 15
    dta $1F		; 3C47: 1F
    dta $FF		; 3C48: FF
    dta $FF		; 3C49: FF
    dta $FF		; 3C4A: FF
    dta $FF		; 3C4B: FF
    dta $FF		; 3C4C: FF
    dta $FF		; 3C4D: FF
    dta $FF		; 3C4E: FF
    dta $1		; 3C4F: 01
    dta $FF		; 3C50: FF
    dta $14		; 3C51: 14
    dta $E7		; 3C52: E7
    dta $FF		; 3C53: FF
    dta $FF		; 3C54: FF
    dta $FF		; 3C55: FF
    dta $FF		; 3C56: FF
    dta $FF		; 3C57: FF
    dta $FF		; 3C58: FF
    dta $FF		; 3C59: FF
    dta $FF		; 3C5A: FF
    dta $FF		; 3C5B: FF
    dta $FF		; 3C5C: FF
    dta $FF		; 3C5D: FF
    dta $FF		; 3C5E: FF
    dta $FF		; 3C5F: FF
    dta $FF		; 3C60: FF
    dta $FF		; 3C61: FF
    dta $FF		; 3C62: FF
    dta $FF		; 3C63: FF
    dta $FF		; 3C64: FF
    dta $FF		; 3C65: FF
    dta $FF		; 3C66: FF
    dta $FF		; 3C67: FF
    dta $FF		; 3C68: FF
    dta $FF		; 3C69: FF
    dta $FF		; 3C6A: FF
    dta $83		; 3C6B: 83
    dta $FF		; 3C6C: FF
    dta $FF		; 3C6D: FF
    dta $95		; 3C6E: 95
    dta $1F		; 3C6F: 1F
    dta $FF		; 3C70: FF
    dta $FF		; 3C71: FF
    dta $FF		; 3C72: FF
    dta $FF		; 3C73: FF
    dta $FF		; 3C74: FF
    dta $FF		; 3C75: FF
    dta $FF		; 3C76: FF
    dta $F		; 3C77: 0F
    dta $FF		; 3C78: FF
    dta $94		; 3C79: 94
    dta $F7		; 3C7A: F7
    dta $FF		; 3C7B: FF
    dta $FF		; 3C7C: FF
    dta $FF		; 3C7D: FF
    dta $FF		; 3C7E: FF
    dta $FF		; 3C7F: FF
    dta $FF		; 3C80: FF
    dta $FF		; 3C81: FF
    dta $FF		; 3C82: FF
    dta $FF		; 3C83: FF
    dta $FF		; 3C84: FF
    dta $FF		; 3C85: FF
    dta $FF		; 3C86: FF
    dta $FF		; 3C87: FF
    dta $FF		; 3C88: FF
    dta $FF		; 3C89: FF
    dta $FF		; 3C8A: FF
    dta $FF		; 3C8B: FF
    dta $FF		; 3C8C: FF
    dta $FF		; 3C8D: FF
    dta $FF		; 3C8E: FF
    dta $FF		; 3C8F: FF
    dta $FF		; 3C90: FF
    dta $FF		; 3C91: FF
    dta $FF		; 3C92: FF
    dta $7		; 3C93: 07
    dta $FF		; 3C94: FF
    dta $FF		; 3C95: FF
    dta $C5		; 3C96: C5
    dta $F		; 3C97: 0F
    dta $FF		; 3C98: FF
    dta $FF		; 3C99: FF
    dta $FF		; 3C9A: FF
    dta $FF		; 3C9B: FF
    dta $FF		; 3C9C: FF
    dta $FF		; 3C9D: FF
    dta $FF		; 3C9E: FF
    dta $F		; 3C9F: 0F
    dta $FF		; 3CA0: FF
    dta $94		; 3CA1: 94
    dta $FF		; 3CA2: FF
    dta $FF		; 3CA3: FF
    dta $FF		; 3CA4: FF
    dta $FF		; 3CA5: FF Access: 1A6D
    dta $FF		; 3CA6: FF
    dta $FF		; 3CA7: FF
    dta $FF		; 3CA8: FF
    dta $FF		; 3CA9: FF
    dta $FF		; 3CAA: FF
    dta $FF		; 3CAB: FF
    dta $FF		; 3CAC: FF
    dta $FF		; 3CAD: FF
    dta $FF		; 3CAE: FF
    dta $FF		; 3CAF: FF
    dta $FF		; 3CB0: FF
    dta $FF		; 3CB1: FF
    dta $FF		; 3CB2: FF
    dta $FF		; 3CB3: FF
    dta $FF		; 3CB4: FF
    dta $FF		; 3CB5: FF
    dta $FF		; 3CB6: FF
    dta $FF		; 3CB7: FF
    dta $FF		; 3CB8: FF
    dta $FF		; 3CB9: FF
    dta $FF		; 3CBA: FF
    dta $F		; 3CBB: 0F
    dta $FF		; 3CBC: FF
    dta $FF		; 3CBD: FF
    dta $E0		; 3CBE: E0
    dta $7		; 3CBF: 07
    dta $FF		; 3CC0: FF
    dta $FF		; 3CC1: FF
    dta $FF		; 3CC2: FF
    dta $FF		; 3CC3: FF
    dta $FF		; 3CC4: FF
    dta $FF		; 3CC5: FF
    dta $FF		; 3CC6: FF
    dta $9F		; 3CC7: 9F
    dta $FF		; 3CC8: FF
    dta $C4		; 3CC9: C4
    dta $BF		; 3CCA: BF
    dta $FF		; 3CCB: FF
    dta $FF		; 3CCC: FF
    dta $FF		; 3CCD: FF
    dta $FF		; 3CCE: FF
    dta $FF		; 3CCF: FF
    dta $FF		; 3CD0: FF
    dta $FF		; 3CD1: FF
    dta $FF		; 3CD2: FF
    dta $FF		; 3CD3: FF
    dta $FF		; 3CD4: FF
    dta $FF		; 3CD5: FF
    dta $FF		; 3CD6: FF
    dta $FF		; 3CD7: FF
    dta $FF		; 3CD8: FF
    dta $FF		; 3CD9: FF
    dta $FF		; 3CDA: FF
    dta $FF		; 3CDB: FF
    dta $FF		; 3CDC: FF
    dta $FF		; 3CDD: FF
    dta $FF		; 3CDE: FF
    dta $FF		; 3CDF: FF
    dta $FF		; 3CE0: FF
    dta $FF		; 3CE1: FF
    dta $FF		; 3CE2: FF
    dta $1F		; 3CE3: 1F
    dta $FF		; 3CE4: FF
    dta $FF		; 3CE5: FF
    dta $FC		; 3CE6: FC
    dta $13		; 3CE7: 13
    dta $FF		; 3CE8: FF
    dta $FF		; 3CE9: FF
    dta $FF		; 3CEA: FF
    dta $FF		; 3CEB: FF
    dta $FF		; 3CEC: FF
    dta $FF		; 3CED: FF
    dta $FF		; 3CEE: FF
    dta $9F		; 3CEF: 9F
    dta $FF		; 3CF0: FF
    dta $F0		; 3CF1: F0
    dta $BF		; 3CF2: BF
    dta $FF		; 3CF3: FF
    dta $FF		; 3CF4: FF
    dta $FF		; 3CF5: FF
    dta $FF		; 3CF6: FF
    dta $FF		; 3CF7: FF
    dta $FF		; 3CF8: FF
    dta $FF		; 3CF9: FF
    dta $FF		; 3CFA: FF
    dta $FF		; 3CFB: FF
    dta $FF		; 3CFC: FF
    dta $FF		; 3CFD: FF
    dta $FF		; 3CFE: FF
    dta $FF		; 3CFF: FF
    dta $FF		; 3D00: FF
    dta $FF		; 3D01: FF
    dta $FF		; 3D02: FF
    dta $FF		; 3D03: FF
    dta $FF		; 3D04: FF
    dta $FF		; 3D05: FF
    dta $FF		; 3D06: FF
    dta $FF		; 3D07: FF
    dta $FF		; 3D08: FF
    dta $FF		; 3D09: FF
    dta $FC		; 3D0A: FC
    dta $FF		; 3D0B: FF
    dta $FF		; 3D0C: FF
    dta $FF		; 3D0D: FF
    dta $FF		; 3D0E: FF
    dta $BF		; 3D0F: BF
    dta $FF		; 3D10: FF
    dta $FF		; 3D11: FF
    dta $FF		; 3D12: FF
    dta $FF		; 3D13: FF
    dta $FF		; 3D14: FF
    dta $FF		; 3D15: FF
    dta $FF		; 3D16: FF
    dta $FF		; 3D17: FF
    dta $FF		; 3D18: FF
    dta $F8		; 3D19: F8
    dta $BF		; 3D1A: BF
    dta $FF		; 3D1B: FF
    dta $FF		; 3D1C: FF
    dta $FF		; 3D1D: FF
    dta $FF		; 3D1E: FF
    dta $FF		; 3D1F: FF
    dta $FF		; 3D20: FF
    dta $FF		; 3D21: FF
    dta $FF		; 3D22: FF
    dta $FF		; 3D23: FF
    dta $FF		; 3D24: FF
    dta $FF		; 3D25: FF
    dta $FF		; 3D26: FF
    dta $FF		; 3D27: FF
    dta $FF		; 3D28: FF
    dta $FF		; 3D29: FF
    dta $FF		; 3D2A: FF
    dta $FF		; 3D2B: FF
    dta $FF		; 3D2C: FF
    dta $FF		; 3D2D: FF
    dta $FF		; 3D2E: FF
    dta $FF		; 3D2F: FF
    dta $FF		; 3D30: FF
    dta $FF		; 3D31: FF
    dta $FF		; 3D32: FF
    dta $FF		; 3D33: FF
    dta $FF		; 3D34: FF
    dta $FF		; 3D35: FF
    dta $FF		; 3D36: FF
    dta $FF		; 3D37: FF
    dta $FF		; 3D38: FF
    dta $FF		; 3D39: FF
    dta $FF		; 3D3A: FF
    dta $FF		; 3D3B: FF
    dta $FF		; 3D3C: FF
    dta $FF		; 3D3D: FF
    dta $FF		; 3D3E: FF
    dta $FF		; 3D3F: FF
    dta $FF		; 3D40: FF
    dta $FC		; 3D41: FC
    dta $BF		; 3D42: BF
    dta $FF		; 3D43: FF
    dta $FF		; 3D44: FF
    dta $FF		; 3D45: FF
    dta $FF		; 3D46: FF
    dta $FF		; 3D47: FF
    dta $FF		; 3D48: FF
    dta $FF		; 3D49: FF
    dta $FF		; 3D4A: FF
    dta $FF		; 3D4B: FF
    dta $FF		; 3D4C: FF
    dta $FF		; 3D4D: FF
    dta $FF		; 3D4E: FF
    dta $FF		; 3D4F: FF
    dta $FF		; 3D50: FF
    dta $FF		; 3D51: FF
    dta $FF		; 3D52: FF
    dta $FF		; 3D53: FF
    dta $FF		; 3D54: FF
    dta $FF		; 3D55: FF
    dta $FF		; 3D56: FF
    dta $FF		; 3D57: FF
    dta $FF		; 3D58: FF
    dta $FF		; 3D59: FF
    dta $FF		; 3D5A: FF
    dta $FF		; 3D5B: FF
    dta $FF		; 3D5C: FF
    dta $FF		; 3D5D: FF
    dta $FF		; 3D5E: FF
    dta $FF		; 3D5F: FF
    dta $FF		; 3D60: FF
    dta $FF		; 3D61: FF
    dta $FF		; 3D62: FF
    dta $FF		; 3D63: FF
    dta $FF		; 3D64: FF
    dta $FF		; 3D65: FF
    dta $FF		; 3D66: FF
    dta $FF		; 3D67: FF
    dta $FF		; 3D68: FF
    dta $FE		; 3D69: FE
    dta $7F		; 3D6A: 7F
    dta $FF		; 3D6B: FF
    dta $FF		; 3D6C: FF
    dta $FF		; 3D6D: FF
    dta $FF		; 3D6E: FF
    dta $FF		; 3D6F: FF
    dta $FF		; 3D70: FF
    dta $FF		; 3D71: FF
    dta $FF		; 3D72: FF
    dta $FF		; 3D73: FF
    dta $FF		; 3D74: FF
    dta $FF		; 3D75: FF
    dta $FF		; 3D76: FF
    dta $FF		; 3D77: FF
    dta $FF		; 3D78: FF
    dta $FF		; 3D79: FF
    dta $FF		; 3D7A: FF
    dta $FF		; 3D7B: FF
    dta $FF		; 3D7C: FF
    dta $FF		; 3D7D: FF
    dta $FF		; 3D7E: FF
    dta $FF		; 3D7F: FF
    dta $FF		; 3D80: FF
    dta $FF		; 3D81: FF
    dta $FF		; 3D82: FF
    dta $FF		; 3D83: FF
    dta $FF		; 3D84: FF
    dta $FF		; 3D85: FF
    dta $FF		; 3D86: FF
    dta $FF		; 3D87: FF
    dta $FF		; 3D88: FF
    dta $FF		; 3D89: FF
    dta $FF		; 3D8A: FF
    dta $FF		; 3D8B: FF
    dta $FF		; 3D8C: FF
    dta $FF		; 3D8D: FF
    dta $FF		; 3D8E: FF
    dta $FF		; 3D8F: FF
    dta $FF		; 3D90: FF
    dta $FF		; 3D91: FF
    dta $FF		; 3D92: FF
    dta $FF		; 3D93: FF
    dta $FF		; 3D94: FF
    dta $FF		; 3D95: FF
    dta $FF		; 3D96: FF
    dta $FF		; 3D97: FF
    dta $FF		; 3D98: FF
    dta $FF		; 3D99: FF
    dta $FF		; 3D9A: FF
    dta $FF		; 3D9B: FF
    dta $FF		; 3D9C: FF
    dta $FF		; 3D9D: FF
    dta $FF		; 3D9E: FF
    dta $FF		; 3D9F: FF
    dta $FF		; 3DA0: FF
    dta $FF		; 3DA1: FF
    dta $FF		; 3DA2: FF
    dta $FF		; 3DA3: FF
    dta $FF		; 3DA4: FF
    dta $FF		; 3DA5: FF
    dta $FF		; 3DA6: FF
    dta $FF		; 3DA7: FF
    dta $FF		; 3DA8: FF
    dta $FF		; 3DA9: FF
    dta $FF		; 3DAA: FF
    dta $FF		; 3DAB: FF
    dta $FF		; 3DAC: FF
    dta $FF		; 3DAD: FF
    dta $FF		; 3DAE: FF
    dta $FF		; 3DAF: FF
    dta $FF		; 3DB0: FF
    dta $FF		; 3DB1: FF
    dta $FF		; 3DB2: FF
    dta $FF		; 3DB3: FF
    dta $FF		; 3DB4: FF
    dta $FF		; 3DB5: FF
    dta $FF		; 3DB6: FF
    dta $FF		; 3DB7: FF
    dta $FF		; 3DB8: FF
    dta $FF		; 3DB9: FF
    dta $FF		; 3DBA: FF
    dta $FF		; 3DBB: FF
    dta $FF		; 3DBC: FF
    dta $FF		; 3DBD: FF
    dta $FF		; 3DBE: FF
    dta $FF		; 3DBF: FF
    dta $FF		; 3DC0: FF
    dta $FF		; 3DC1: FF
    dta $FF		; 3DC2: FF
    dta $FF		; 3DC3: FF
    dta $FF		; 3DC4: FF
    dta $FF		; 3DC5: FF
    dta $FF		; 3DC6: FF
    dta $FF		; 3DC7: FF
    dta $FF		; 3DC8: FF
    dta $FF		; 3DC9: FF
    dta $FF		; 3DCA: FF
    dta $FF		; 3DCB: FF
    dta $FF		; 3DCC: FF
    dta $FF		; 3DCD: FF
    dta $FF		; 3DCE: FF
    dta $FF		; 3DCF: FF
    dta $FF		; 3DD0: FF
    dta $FF		; 3DD1: FF
    dta $FF		; 3DD2: FF
    dta $FF		; 3DD3: FF
    dta $FF		; 3DD4: FF
    dta $FF		; 3DD5: FF
    dta $FF		; 3DD6: FF
    dta $FF		; 3DD7: FF
    dta $FF		; 3DD8: FF
    dta $FF		; 3DD9: FF
    dta $FF		; 3DDA: FF
    dta $FF		; 3DDB: FF
    dta $FF		; 3DDC: FF
    dta $FF		; 3DDD: FF
    dta $FF		; 3DDE: FF
    dta $FF		; 3DDF: FF
    dta $FF		; 3DE0: FF
    dta $FF		; 3DE1: FF
    dta $FF		; 3DE2: FF
    dta $FF		; 3DE3: FF
    dta $FF		; 3DE4: FF
    dta $FF		; 3DE5: FF
    dta $FF		; 3DE6: FF
    dta $FF		; 3DE7: FF
    dta $FF		; 3DE8: FF
    dta $FF		; 3DE9: FF
    dta $FF		; 3DEA: FF
    dta $FF		; 3DEB: FF
    dta $FF		; 3DEC: FF
    dta $FF		; 3DED: FF
    dta $FF		; 3DEE: FF
    dta $FF		; 3DEF: FF
    dta $FF		; 3DF0: FF
    dta $FF		; 3DF1: FF
    dta $FF		; 3DF2: FF
    dta $FF		; 3DF3: FF
    dta $FF		; 3DF4: FF
    dta $FF		; 3DF5: FF
    dta $FF		; 3DF6: FF
    dta $FF		; 3DF7: FF
    dta $FF		; 3DF8: FF
    dta $FF		; 3DF9: FF
    dta $FF		; 3DFA: FF
    dta $FF		; 3DFB: FF
    dta $FF		; 3DFC: FF
    dta $FF		; 3DFD: FF
    dta $FF		; 3DFE: FF
    dta $FF		; 3DFF: FF
    dta $FF		; 3E00: FF
    dta $FF		; 3E01: FF
    dta $FF		; 3E02: FF
    dta $FF		; 3E03: FF
    dta $FF		; 3E04: FF
    dta $FF		; 3E05: FF
    dta $FF		; 3E06: FF
    dta $FF		; 3E07: FF
    dta $FF		; 3E08: FF
    dta $FF		; 3E09: FF
    dta $FF		; 3E0A: FF
    dta $FF		; 3E0B: FF
    dta $FF		; 3E0C: FF
    dta $FF		; 3E0D: FF
    dta $FF		; 3E0E: FF
    dta $FF		; 3E0F: FF
    dta $FF		; 3E10: FF
    dta $FF		; 3E11: FF
    dta $FF		; 3E12: FF
    dta $FF		; 3E13: FF
    dta $FF		; 3E14: FF
    dta $FF		; 3E15: FF
    dta $FF		; 3E16: FF
    dta $FF		; 3E17: FF
    dta $FF		; 3E18: FF
    dta $FF		; 3E19: FF
    dta $FF		; 3E1A: FF
    dta $FF		; 3E1B: FF
    dta $FF		; 3E1C: FF
    dta $FF		; 3E1D: FF
    dta $FF		; 3E1E: FF
    dta $FF		; 3E1F: FF
    dta $FF		; 3E20: FF
    dta $FF		; 3E21: FF
    dta $FF		; 3E22: FF
    dta $FF		; 3E23: FF
    dta $FF		; 3E24: FF
    dta $FF		; 3E25: FF
    dta $FF		; 3E26: FF
    dta $FF		; 3E27: FF
    dta $FF		; 3E28: FF
    dta $FF		; 3E29: FF
    dta $FF		; 3E2A: FF
    dta $FF		; 3E2B: FF
    dta $FF		; 3E2C: FF
    dta $FF		; 3E2D: FF
    dta $FF		; 3E2E: FF
    dta $FF		; 3E2F: FF
    dta $FF		; 3E30: FF
    dta $FF		; 3E31: FF
    dta $FF		; 3E32: FF
    dta $FF		; 3E33: FF
    dta $FF		; 3E34: FF
    dta $FF		; 3E35: FF
    dta $FF		; 3E36: FF
    dta $FF		; 3E37: FF
    dta $FF		; 3E38: FF
    dta $FF		; 3E39: FF
    dta $C3		; 3E3A: C3
    dta $FF		; 3E3B: FF
    dta $FF		; 3E3C: FF
    dta $FF		; 3E3D: FF
    dta $FF		; 3E3E: FF
    dta $E7		; 3E3F: E7
    dta $FF		; 3E40: FF
    dta $9F		; 3E41: 9F
    dta $E7		; 3E42: E7
    dta $FF		; 3E43: FF
    dta $F1		; 3E44: F1
    dta $FF		; 3E45: FF
    dta $8F		; 3E46: 8F
    dta $FF		; 3E47: FF
    dta $E7		; 3E48: E7
    dta $C3		; 3E49: C3
    dta $C3		; 3E4A: C3
    dta $C3		; 3E4B: C3
    dta $FF		; 3E4C: FF
    dta $9F		; 3E4D: 9F
    dta $FF		; 3E4E: FF
    dta $FF		; 3E4F: FF
    dta $83		; 3E50: 83
    dta $FF		; 3E51: FF
    dta $9F		; 3E52: 9F
    dta $FF		; 3E53: FF
    dta $FF		; 3E54: FF
    dta $E7		; 3E55: E7
    dta $FF		; 3E56: FF
    dta $99		; 3E57: 99
    dta $FF		; 3E58: FF
    dta $FF		; 3E59: FF
    dta $E7		; 3E5A: E7
    dta $FF		; 3E5B: FF
    dta $FF		; 3E5C: FF
    dta $FF		; 3E5D: FF
    dta $FF		; 3E5E: FF
    dta $FF		; 3E5F: FF
    dta $FF		; 3E60: FF
    dta $FF		; 3E61: FF
    dta $99		; 3E62: 99
    dta $C3		; 3E63: C3
    dta $83		; 3E64: 83
    dta $99		; 3E65: 99
    dta $83		; 3E66: 83
    dta $FF		; 3E67: FF
    dta $C1		; 3E68: C1
    dta $9F		; 3E69: 9F
    dta $81		; 3E6A: 81
    dta $FF		; 3E6B: FF
    dta $E3		; 3E6C: E3
    dta $C3		; 3E6D: C3
    dta $C7		; 3E6E: C7
    dta $FF		; 3E6F: FF
    dta $C7		; 3E70: C7
    dta $99		; 3E71: 99
    dta $99		; 3E72: 99
    dta $99		; 3E73: 99
    dta $FF		; 3E74: FF
    dta $9F		; 3E75: 9F
    dta $99		; 3E76: 99
    dta $FF		; 3E77: FF
    dta $99		; 3E78: 99
    dta $C3		; 3E79: C3
    dta $9F		; 3E7A: 9F
    dta $C3		; 3E7B: C3
    dta $83		; 3E7C: 83
    dta $81		; 3E7D: 81
    dta $FF		; 3E7E: FF
    dta $99		; 3E7F: 99
    dta $C3		; 3E80: C3
    dta $83		; 3E81: 83
    dta $81		; 3E82: 81
    dta $99		; 3E83: 99
    dta $C3		; 3E84: C3
    dta $83		; 3E85: 83
    dta $FF		; 3E86: FF
    dta $FF		; 3E87: FF
    dta $FF		; 3E88: FF
    dta $FF		; 3E89: FF
    dta $9F		; 3E8A: 9F
    dta $99		; 3E8B: 99
    dta $99		; 3E8C: 99
    dta $99		; 3E8D: 99
    dta $99		; 3E8E: 99
    dta $C7		; 3E8F: C7
    dta $99		; 3E90: 99
    dta $83		; 3E91: 83
    dta $E7		; 3E92: E7
    dta $FF		; 3E93: FF
    dta $E7		; 3E94: E7
    dta $9F		; 3E95: 9F
    dta $E7		; 3E96: E7
    dta $FF		; 3E97: FF
    dta $E7		; 3E98: E7
    dta $C1		; 3E99: C1
    dta $C3		; 3E9A: C3
    dta $F3		; 3E9B: F3
    dta $FF		; 3E9C: FF
    dta $83		; 3E9D: 83
    dta $99		; 3E9E: 99
    dta $FF		; 3E9F: FF
    dta $99		; 3EA0: 99
    dta $99		; 3EA1: 99
    dta $83		; 3EA2: 83
    dta $99		; 3EA3: 99
    dta $99		; 3EA4: 99
    dta $E7		; 3EA5: E7
    dta $FF		; 3EA6: FF
    dta $81		; 3EA7: 81
    dta $F9		; 3EA8: F9
    dta $99		; 3EA9: 99
    dta $E7		; 3EAA: E7 Access: 1B23 1B30
    dta $80		; 3EAB: 80
    dta $F9		; 3EAC: F9
    dta $99		; 3EAD: 99
    dta $FF		; 3EAE: FF
    dta $FF		; 3EAF: FF
    dta $FF		; 3EB0: FF
    dta $FF		; 3EB1: FF
    dta $9F		; 3EB2: 9F
    dta $99		; 3EB3: 99
    dta $99		; 3EB4: 99
    dta $99		; 3EB5: 99
    dta $9F		; 3EB6: 9F
    dta $E7		; 3EB7: E7
    dta $99		; 3EB8: 99
    dta $99		; 3EB9: 99
    dta $E7		; 3EBA: E7
    dta $FF		; 3EBB: FF
    dta $E7		; 3EBC: E7
    dta $9F		; 3EBD: 9F
    dta $E7		; 3EBE: E7
    dta $FF		; 3EBF: FF
    dta $E7		; 3EC0: E7
    dta $F9		; 3EC1: F9
    dta $99		; 3EC2: 99
    dta $E7		; 3EC3: E7
    dta $FF		; 3EC4: FF
    dta $99		; 3EC5: 99
    dta $99		; 3EC6: 99
    dta $FF		; 3EC7: FF
    dta $83		; 3EC8: 83
    dta $99		; 3EC9: 99
    dta $99		; 3ECA: 99
    dta $81		; 3ECB: 81
    dta $9F		; 3ECC: 9F
    dta $E7		; 3ECD: E7
    dta $FF		; 3ECE: FF
    dta $99		; 3ECF: 99
    dta $C1		; 3ED0: C1
    dta $9F		; 3ED1: 9F
    dta $E7		; 3ED2: E7
    dta $80		; 3ED3: 80
    dta $C1		; 3ED4: C1
    dta $99		; 3ED5: 99
    dta $FF		; 3ED6: FF
    dta $FF		; 3ED7: FF
    dta $FF		; 3ED8: FF
    dta $FF		; 3ED9: FF
    dta $99		; 3EDA: 99
    dta $99		; 3EDB: 99
    dta $83		; 3EDC: 83
    dta $C1		; 3EDD: C1
    dta $9F		; 3EDE: 9F
    dta $E7		; 3EDF: E7
    dta $C1		; 3EE0: C1
    dta $99		; 3EE1: 99
    dta $E7		; 3EE2: E7
    dta $FF		; 3EE3: FF
    dta $E3		; 3EE4: E3
    dta $9F		; 3EE5: 9F
    dta $C7		; 3EE6: C7
    dta $FF		; 3EE7: FF
    dta $E7		; 3EE8: E7
    dta $F3		; 3EE9: F3
    dta $99		; 3EEA: 99
    dta $CF		; 3EEB: CF
    dta $FF		; 3EEC: FF
    dta $99		; 3EED: 99
    dta $C1		; 3EEE: C1
    dta $FF		; 3EEF: FF
    dta $93		; 3EF0: 93
    dta $99		; 3EF1: 99
    dta $99		; 3EF2: 99
    dta $9F		; 3EF3: 9F
    dta $9F		; 3EF4: 9F
    dta $E7		; 3EF5: E7
    dta $FF		; 3EF6: FF
    dta $99		; 3EF7: 99
    dta $99		; 3EF8: 99
    dta $9F		; 3EF9: 9F
    dta $E7		; 3EFA: E7
    dta $94		; 3EFB: 94
    dta $99		; 3EFC: 99
    dta $99		; 3EFD: 99
    dta $FF		; 3EFE: FF
    dta $FF		; 3EFF: FF
    dta $FF		; 3F00: FF Access: 3F87
    dta $FF		; 3F01: FF
    dta $C3		; 3F02: C3
    dta $C3		; 3F03: C3
    dta $9F		; 3F04: 9F
    dta $F3		; 3F05: F3
    dta $9F		; 3F06: 9F
    dta $C3		; 3F07: C3
    dta $F9		; 3F08: F9
    dta $99		; 3F09: 99
    dta $F1		; 3F0A: F1
    dta $FF		; 3F0B: FF
    dta $F1		; 3F0C: F1
    dta $C3		; 3F0D: C3
    dta $8F		; 3F0E: 8F
    dta $FF		; 3F0F: FF
    dta $81		; 3F10: 81
    dta $C7		; 3F11: C7
    dta $C3		; 3F12: C3
    dta $81		; 3F13: 81
    dta $FF		; 3F14: FF
    dta $83		; 3F15: 83
    dta $F3		; 3F16: F3
    dta $FF		; 3F17: FF
    dta $99		; 3F18: 99
    dta $C3		; 3F19: C3
    dta $83		; 3F1A: 83
    dta $C3		; 3F1B: C3
    dta $9F		; 3F1C: 9F
    dta $F1		; 3F1D: F1
    dta $FF		; 3F1E: FF
    dta $99		; 3F1F: 99
    dta $C1		; 3F20: C1
    dta $9F		; 3F21: 9F
    dta $F1		; 3F22: F1
    dta $9C		; 3F23: 9C
    dta $C1		; 3F24: C1
    dta $99		; 3F25: 99
    dta $FF		; 3F26: FF
    dta $FF		; 3F27: FF
    dta $FF		; 3F28: FF
    dta $FF		; 3F29: FF
    dta $FF		; 3F2A: FF
    dta $FF		; 3F2B: FF
    dta $9F		; 3F2C: 9F
    dta $87		; 3F2D: 87
    dta $FF		; 3F2E: FF
    dta $FF		; 3F2F: FF
    dta $83		; 3F30: 83
    dta $FF		; 3F31: FF
    dta $FF		; 3F32: FF
    dta $FF		; 3F33: FF
    dta $FF		; 3F34: FF
    dta $FF		; 3F35: FF
    dta $FF		; 3F36: FF
    dta $FF		; 3F37: FF
    dta $FF		; 3F38: FF
    dta $FF		; 3F39: FF
    dta $FF		; 3F3A: FF
    dta $FF		; 3F3B: FF
    dta $FF		; 3F3C: FF
    dta $FF		; 3F3D: FF
    dta $87		; 3F3E: 87
    dta $FF		; 3F3F: FF
    dta $FF		; 3F40: FF
    dta $FF		; 3F41: FF
    dta $FF		; 3F42: FF
    dta $FF		; 3F43: FF
    dta $FF		; 3F44: FF
    dta $FF		; 3F45: FF
    dta $FF		; 3F46: FF
    dta $FF		; 3F47: FF
    dta $FF		; 3F48: FF
    dta $FF		; 3F49: FF
    dta $FF		; 3F4A: FF
    dta $FF		; 3F4B: FF
    dta $FF		; 3F4C: FF
    dta $FF		; 3F4D: FF
    dta $FF		; 3F4E: FF
    dta $FF		; 3F4F: FF
    dta $0		; 3F50: 00
    dta $0		; 3F51: 00
    dta $0		; 3F52: 00
    dta $0		; 3F53: 00
    dta $0		; 3F54: 00
    dta $0		; 3F55: 00
    dta $0		; 3F56: 00
    dta $0		; 3F57: 00
    dta $0		; 3F58: 00
    dta $0		; 3F59: 00
    dta $0		; 3F5A: 00
    dta $0		; 3F5B: 00
    dta $0		; 3F5C: 00
    dta $0		; 3F5D: 00
    dta $0		; 3F5E: 00
    dta $0		; 3F5F: 00
    dta $0		; 3F60: 00
    dta $0		; 3F61: 00
    dta $0		; 3F62: 00
    dta $0		; 3F63: 00
    dta $0		; 3F64: 00
    dta $0		; 3F65: 00
    dta $0		; 3F66: 00
    dta $0		; 3F67: 00
    dta $0		; 3F68: 00
    dta $0		; 3F69: 00
    dta $0		; 3F6A: 00
    dta $0		; 3F6B: 00
    dta $0		; 3F6C: 00
    dta $0		; 3F6D: 00
    dta $0		; 3F6E: 00
    dta $0		; 3F6F: 00
    dta $0		; 3F70: 00
    dta $0		; 3F71: 00
    dta $0		; 3F72: 00
    dta $0		; 3F73: 00
    dta $0		; 3F74: 00
    dta $0		; 3F75: 00
    dta $0		; 3F76: 00
    dta $0		; 3F77: 00
    dta $0		; 3F78: 00
    dta $0		; 3F79: 00
    dta $0		; 3F7A: 00
    dta $0		; 3F7B: 00
    dta $0		; 3F7C: 00
    dta $0		; 3F7D: 00
    dta $0		; 3F7E: 00
    dta $0		; 3F7F: 00
    org r:$7880
;PUTLIN equ $F385
;EOUTCH equ $F6A4
;KGETCH equ $F6E2
OPEN equ $3
PUTREC equ $9
PUTCHR equ $B
GETCHR equ $7
buf
    dta 0,0
PUTLIN
    stx buf
    sty buf+1
    ldx #$00
    lda #PUTREC
    sta ICCOM,x
    mwa #$FF ICBLL,x
    mwa buf ICBAL,x
    jmp CIOV
EOUTCH
    tay
    lda:pha $E407
    lda:pha $E406
    tya
    rts
;    sta buf
;    ldx #$00
;    lda #PUTCHR
;    sta ICCOM,x
;    mwa #1 ICBLL,x
;    mwa #buf ICBAL,x
;    jmp CIOV
KGETCH
    lda:pha $E425
    lda:pha $E424
    rts
main
    lda #$3C		; 3FE7: A9 3C
    sta PACTL		; 3FE9: 8D 02 D3
    lda #$02		; 3FEC: A9 02
    sta z:BOOTQ		; 3FEE: 85 09
    lda #$00		; 3FF0: A9 00
    sta COLDST		; 3FF2: 8D 44 02
u3F80			; Callers: -c 3F80
    ldx #$38		; 3F80: A2 38
l3F82			; Callers: 3F96
    ldy #$00		; 3F82: A0 00
l3F84			; Callers: 3F8B 3F9A
ld
    lda $4000,y		; 3F84: B9 00 78
st
    sta $0700,y		; 3F87: 99 00 3F
    dey    		; 3F8A: 88
    bne l3F84		; 3F8B: D0 F7
    inc ld+2		; 3F8D: EE 86 78
    inc st+2		; 3F90: EE 89 78
    dex    		; 3F93: CA
    bmi l3F9C		; 3F94: 30 06
    bne l3F82		; 3F96: D0 EA
    lda #$80		; 3F98: A9 80
    bne l3F84		; 3F9A: D0 E8
l3F9C			; Callers: 3F94
    lda #$8E		; 3F9C: A9 8E
    sta z:CASINI		; 3F9E: 85 02
    sta z:DOSINI		; 3FA0: 85 0C
    lda #$1D		; 3FA2: A9 1D
    sta z:CASINI+1		; 3FA4: 85 03
    sta z:DOSINI+1		; 3FA6: 85 0D
    jsr u706		; 3FA8: 20 06 07
    jsr l1D8E		; 3FAB: 20 8E 1D
    jmp ($000A)		; 3FAE: 6C 0A 00
CASINI equ $2		; Access: 3F9E
WARMST equ $8		; Access: 1524 1564 1599 1946
BOOTQ equ $9		; Access: 3FEE
DOSVEC equ $A		; Access: 1507 1547 3FAE
DOSINI equ $C		; Access: 1D93 1931 3FA0
POKMSK equ $10		; Access: 1A05 1A09 15D0 1797
ICDNOZ equ $21		; Access: 1174 09D2
ICCOMZ equ $22		; Access: 0A2B 09E3
ICBALZ equ $24		; Access: 0A36 0A9F 0A01
ICBAHZ equ $25		; Access: 0A3A 0AA3
ICBLLZ equ $28		; Access: 0AB5 0A8A 0A8F
ICBLHZ equ $29		; Access: 0AB9 0A91 0A96
STATUS equ $30		; Access: 1A46 1A37 1A2F
CHKSUM equ $31		; Access: 1A1A 1A1E 19FC 1A58 1A5C 1A40
BUNRLO equ $32		; Access: 19E8 19EE 1A14 1A55 1A5E 1A64
BUFRHI equ $33		; Access: 19F2 19EC 1A68 1A62
BFENLO equ $34		; Access: 19F0 1A66
BNENHI equ $35		; Access: 19F4 1A6A
BUFRFL equ $38		; Access: 1A39 1A78
RECVDN equ $39		; Access: 1A4A
CHKSNT equ $3B		; Access: 19F8 1A01
NOCKSM equ $3C		; Access: 1A6E 1A74
SOUNDR equ $41		; Access: 17A7 17AD
FMSZPG equ $43		; Access: 0EA1 0EAA 0EC4 07E3 080B 082A 0871 0875 0863 0851 126A 1273 0758 0760 128B 071C 073B 0741 0745
ATRACT equ $4D		; Access: 2042 1FE7
LMARGN equ $52		; Access: 1DCC
ROWCRS equ $54		; Access: 162B 1660
COLCRS equ $55		; Access: 1664
SAVMSC equ $58		; Access: 1D9B
VDSLST equ $200		; Access: 1DB3
VSERIN equ $20A		; Access: 150F 154F
VSEROR equ $20C		; Access: 1519 1559
CDTMV3 equ $21C		; Access: 1994
CDTMF3 equ $22A		; Access: 199E 19A4
SDLSTL equ $230		; Access: 1DA9 167F
SDLSTH equ $231		; Access: 1DAE 1684
COLDST equ $244		; Access: 1D09
DSKTIM equ $246		; Access: 0D31
SHFLOK equ $2BE		; Access: 1E0C
COLOR0 equ $2C4		; Access: 168B 16DC
GLBABS equ $2E0		; Access: 18C4
MEMTOP equ $2E5		; Access: 1F42
MEMLO equ $2E7		; Access: 0865
DVSTAT equ $2EA		; Access: 081B
CH equ $2FC		; Access: 1FF9 1FA9
DDEVIC equ $300		; Access: 0786
DUNIT equ $301		; Access: 080E 1176 15DB 16A5 16F7 175A 25EA
DCOMND equ $302		; Access: 077C 07B0 07B7 0813 15E0 16AA 16FC 175F 2605 0D24
DSTATS equ $303		; Access: 077F 07C7 07BE 12E5 0FC9 0D29
DBUFLO equ $304		; Access: 107A 10A4 11FA 1225 123A 123F 15EF 16AF 1701 1764 25FB 075D 0D1F 071E
DBUFHI equ $305		; Access: 1075 109F 11FF 1220 1242 1247 15F4 16B4 1706 1769 2600 0766 0D1A 0726
DTIMLO equ $306		; Access: 0789
DBYTLO equ $308		; Access: 079F
DBYTHI equ $309		; Access: 079C
DAUX1 equ $30A		; Access: 076F 122A 1230 124A 15E5 16B9 170B 1771 25F0
DAUX2 equ $30B		; Access: 076C 122D 15EA 16BE 1710 25F6 177C
HATABS equ $31A		; Access: 088A 089D
ICDNO equ $341		; Access: 09CF
ICCOM equ $342		; Access: 1062 19D0 1E9C 1EBA 204A 1F18 2021 258A 25A8 25C3 1F85 1FB5 14F5 14DD 197D 19B8 1878 194C 1954 1970 1728 1732 19AE 0BAA
ICSTA equ $343		; Access: 12D6
ICBAL equ $344		; Access: 0E9E 19BE 1EA1 1EC9 2026 258F 25AD 25C8 1F8A 14E2 1982 187D 1963 1737 18FD
ICBAH equ $345		; Access: 0EA3 19C1 1EA6 1ECE 202B 2594 25B2 25CD 1F8F 14E7 1987 1882 1968 173C 1902
ICBLL equ $348		; Access: 19C6 1EBF 1F1D 25B7 25D2 1F94 1FBA 1959 1907
ICBLH equ $349		; Access: 19CB 1EC4 1F20 1F99 1FBD 195E 190C
ICAX1 equ $34A		; Access: 1EAB 2030 2599 198C 1887 1741 08B1
ICAX2 equ $34B		; Access: 2035 1746
ICSPR equ $34C		; Access: 0CE2 0CC7 0D0C
AUDF1 equ $D200		; Access: 1BD5
AUDC1 equ $D201		; Access: 1AF0
AUDF2 equ $D202		; Access: 1AEB
AUDC2 equ $D203		; Access: 1AF3
SKREST equ $D20A		; Access: 1A28 1D16 1D2B 1D4F 1D31
SEROUT equ $D20D		; Access: 1A16 19FE 1A50 1A3D
IRQEN equ $D20E		; Access: 1A0B 15D3 179C
SKCTL equ $D20F		; Access: 1A25
PACTL equ $D302		; Access: 3FE9
NMIEN equ $D40E		; Access: 1DBD 1DC7 1E95
DSKINV equ $E453
CIOV equ $E456
SIOV equ $E459
SETVBV equ $E45C
CIOINV equ $E46E
WARMSV equ $E474
;PUTLIN equ $F385
;EOUTCH equ $F6A4
;KGETCH equ $F6E2
IRQVEC equ $FFFE

    run main

opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_ser_int
	FNCALL	_main,_txstr
	FNCALL	_main,_rx
	FNCALL	_main,_tx
	FNCALL	_txstr,_tx
	FNROOT	_main
	global	_RCREG
psect	text90,local,class=CODE,delta=2
global __ptext90
__ptext90:
_RCREG	set	26
	global	_RCSTA
_RCSTA	set	24
	global	_TXREG
_TXREG	set	25
	global	_RCIF
_RCIF	set	101
	global	_TXIF
_TXIF	set	100
	global	_SPBRG
_SPBRG	set	153
	global	_TXSTA
_TXSTA	set	152
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_1:	
	retlw	40	;'('
	retlw	69	;'E'
	retlw	109	;'m'
	retlw	98	;'b'
	retlw	101	;'e'
	retlw	84	;'T'
	retlw	114	;'r'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	105	;'i'
	retlw	99	;'c'
	retlw	88	;'X'
	retlw	41	;')'
	retlw	58	;':'
	retlw	32	;' '
	retlw	69	;'E'
	retlw	110	;'n'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	116	;'t'
	retlw	104	;'h'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	108	;'l'
	retlw	101	;'e'
	retlw	116	;'t'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	115	;'s'
	retlw	32	;' '
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	32	;' '
	retlw	107	;'k'
	retlw	101	;'e'
	retlw	121	;'y'
	retlw	98	;'b'
	retlw	111	;'o'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	100	;'d'
	retlw	10
	retlw	13
	retlw	13
	retlw	0
psect	strings
	file	"picuart.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_ser_int
?_ser_int:	; 0 bytes @ 0x0
	global	??_ser_int
??_ser_int:	; 0 bytes @ 0x0
	global	?_txstr
?_txstr:	; 0 bytes @ 0x0
	global	?_tx
?_tx:	; 0 bytes @ 0x0
	global	??_tx
??_tx:	; 0 bytes @ 0x0
	global	??_rx
??_rx:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_rx
?_rx:	; 1 bytes @ 0x0
	global	tx@a
tx@a:	; 1 bytes @ 0x0
	ds	1
	global	??_txstr
??_txstr:	; 0 bytes @ 0x1
	ds	1
	global	txstr@s
txstr@s:	; 1 bytes @ 0x2
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x3
;;Data sizes: Strings 48, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      3       3
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; txstr@s	PTR unsigned char  size(1) Largest target is 48
;;		 -> STR_1(CODE[48]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_txstr
;;   _txstr->_tx
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0      60
;;                            _ser_int
;;                              _txstr
;;                                 _rx
;;                                 _tx
;; ---------------------------------------------------------------------------------
;; (1) _txstr                                                2     2      0      45
;;                                              1 COMMON     2     2      0
;;                                 _tx
;; ---------------------------------------------------------------------------------
;; (1) _tx                                                   1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _rx                                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _ser_int                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _ser_int
;;   _txstr
;;     _tx
;;   _rx
;;   _tx
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      3       3       1       21.4%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 8 in file "C:\Users\HP\OneDrive\Documents\PIC\UART\picuart.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_ser_int
;;		_txstr
;;		_rx
;;		_tx
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\HP\OneDrive\Documents\PIC\UART\picuart.c"
	line	8
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	9
	
l1876:	
;picuart.c: 9: TRISC6=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1086/8)^080h,(1086)&7
	line	10
;picuart.c: 10: TRISC7=1;
	bsf	(1087/8)^080h,(1087)&7
	line	11
	
l1878:	
;picuart.c: 11: ser_int();
	fcall	_ser_int
	line	12
	
l1880:	
;picuart.c: 12: txstr("(EmbeTronicX): Enter the letters in keyboard\n\r\r");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_txstr
	goto	l1882
	line	13
;picuart.c: 13: while(1){
	
l693:	
	line	14
	
l1882:	
;picuart.c: 14: tx(rx());
	fcall	_rx
	fcall	_tx
	goto	l1882
	line	15
	
l694:	
	line	13
	goto	l1882
	
l695:	
	line	15
	
l696:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_txstr
psect	text91,local,class=CODE,delta=2
global __ptext91
__ptext91:

;; *************** function _txstr *****************
;; Defined at:
;;		line 36 in file "C:\Users\HP\OneDrive\Documents\PIC\UART\picuart.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR unsigned char 
;;		 -> STR_1(48), 
;; Auto vars:     Size  Location     Type
;;  s               1    2[COMMON] PTR unsigned char 
;;		 -> STR_1(48), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_tx
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text91
	file	"C:\Users\HP\OneDrive\Documents\PIC\UART\picuart.c"
	line	36
	global	__size_of_txstr
	__size_of_txstr	equ	__end_of_txstr-_txstr
	
_txstr:	
	opt	stack 6
; Regs used in _txstr: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;txstr@s stored from wreg
	movwf	(txstr@s)
	line	37
	
l1868:	
;picuart.c: 37: while(*s){
	goto	l1874
	
l715:	
	line	38
	
l1870:	
;picuart.c: 38: tx(*s++);
	movf	(txstr@s),w
	movwf	fsr0
	fcall	stringdir
	fcall	_tx
	
l1872:	
	movlw	(01h)
	movwf	(??_txstr+0)+0
	movf	(??_txstr+0)+0,w
	addwf	(txstr@s),f
	goto	l1874
	line	39
	
l714:	
	line	37
	
l1874:	
	movf	(txstr@s),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2161
	goto	u2160
u2161:
	goto	l1870
u2160:
	goto	l717
	
l716:	
	line	40
	
l717:	
	return
	opt stack 0
GLOBAL	__end_of_txstr
	__end_of_txstr:
;; =============== function _txstr ends ============

	signat	_txstr,4216
	global	_tx
psect	text92,local,class=CODE,delta=2
global __ptext92
__ptext92:

;; *************** function _tx *****************
;; Defined at:
;;		line 24 in file "C:\Users\HP\OneDrive\Documents\PIC\UART\picuart.c"
;; Parameters:    Size  Location     Type
;;  a               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  a               1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_txstr
;; This function uses a non-reentrant model
;;
psect	text92
	file	"C:\Users\HP\OneDrive\Documents\PIC\UART\picuart.c"
	line	24
	global	__size_of_tx
	__size_of_tx	equ	__end_of_tx-_tx
	
_tx:	
	opt	stack 7
; Regs used in _tx: [wreg]
;tx@a stored from wreg
	movwf	(tx@a)
	line	25
	
l1100:	
;picuart.c: 25: TXREG=a;
	movf	(tx@a),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	line	26
;picuart.c: 26: while(!TXIF);
	goto	l702
	
l703:	
	
l702:	
	btfss	(100/8),(100)&7
	goto	u21
	goto	u20
u21:
	goto	l702
u20:
	
l704:	
	line	27
;picuart.c: 27: TXIF=0;
	bcf	(100/8),(100)&7
	line	28
	
l705:	
	return
	opt stack 0
GLOBAL	__end_of_tx
	__end_of_tx:
;; =============== function _tx ends ============

	signat	_tx,4216
	global	_rx
psect	text93,local,class=CODE,delta=2
global __ptext93
__ptext93:

;; *************** function _rx *****************
;; Defined at:
;;		line 30 in file "C:\Users\HP\OneDrive\Documents\PIC\UART\picuart.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text93
	file	"C:\Users\HP\OneDrive\Documents\PIC\UART\picuart.c"
	line	30
	global	__size_of_rx
	__size_of_rx	equ	__end_of_rx-_rx
	
_rx:	
	opt	stack 7
; Regs used in _rx: [wreg]
	line	31
	
l1094:	
;picuart.c: 31: while(!RCIF);
	goto	l708
	
l709:	
	
l708:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u11
	goto	u10
u11:
	goto	l708
u10:
	
l710:	
	line	32
;picuart.c: 32: RCIF=0;
	bcf	(101/8),(101)&7
	line	33
	
l1096:	
;picuart.c: 33: return RCREG;
	movf	(26),w	;volatile
	goto	l711
	
l1098:	
	line	34
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_rx
	__end_of_rx:
;; =============== function _rx ends ============

	signat	_rx,89
	global	_ser_int
psect	text94,local,class=CODE,delta=2
global __ptext94
__ptext94:

;; *************** function _ser_int *****************
;; Defined at:
;;		line 17 in file "C:\Users\HP\OneDrive\Documents\PIC\UART\picuart.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text94
	file	"C:\Users\HP\OneDrive\Documents\PIC\UART\picuart.c"
	line	17
	global	__size_of_ser_int
	__size_of_ser_int	equ	__end_of_ser_int-_ser_int
	
_ser_int:	
	opt	stack 7
; Regs used in _ser_int: [wreg]
	line	18
	
l1090:	
;picuart.c: 18: TXSTA=0X20;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(152)^080h	;volatile
	line	19
;picuart.c: 19: RCSTA=0b10010000;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(24)	;volatile
	line	20
;picuart.c: 20: SPBRG=17;
	movlw	(011h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	21
	
l1092:	
;picuart.c: 21: TXIF=RCIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(101/8),(101)&7
	bcf	(100/8),(100)&7
	line	22
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_ser_int
	__end_of_ser_int:
;; =============== function _ser_int ends ============

	signat	_ser_int,88
psect	text95,local,class=CODE,delta=2
global __ptext95
__ptext95:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Pass if no sprites on the Screen - by Teo17;
;	Make it act like tile 130.	    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;This block will be passable only if there  ;
;are no sprites on the screen. Otherwise it ;
;will be solid.				    ;
;PS. This is my first real block! :)	    ;
;	     No credit needed.		    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

db $42
JMP Main : JMP Main : JMP Main : JMP Return : JMP Return : JMP Return : JMP Return : JMP Main : JMP Main : JMP Main
JMP Main : JMP Main : JMP Main

Main:
	LDX #$00	;Load 00 to X
Loop:
	CPX #$0D	;If X isn't 0D...
	BEQ SetLoop	;...Then don't branch and...
	LDA $14C8,x	;...check if there are...
	CMP #$00	;...sprites on the screen.
	BNE Return	;If there are, then return.
SetLoop:
	INX		;Increase X by 1.
	CPX #$0C	;If X isn't at least 0C...
	BCC Loop	;...then start looping.
	LDY #$00
	LDA #$25	;If there are no sprites on the screen...
	STA $1693	;...then make the block passable.
Return:
	RTL		;Return.

print "Passable if no sprites remain on the screen."
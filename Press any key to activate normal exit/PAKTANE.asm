;===========================================================
;Press Any Key To Activate Normal Exit (PAKTANE) - Teo17
;As the Title Says, press any key when inside this block
;to end the level with a normal exit.
;More important info in the Readme. No credit needed. =)
;===========================================================

db $42
JMP Main : JMP Main : JMP Main : JMP Return : JMP Return : JMP Return : JMP Return
JMP Main : JMP Main : JMP Main

print "Trigger normal exit if pressing any key"
	!Sound = Yes	;Sound Effect Property. See Readme for more info.

Main:
	LDA $16		;Load First Frame of Controller Data to Accumulator.
	AND #$C0	;Check if Mario is pressing any Functional Key.
	BNE Exit	;If he pressed, activate the exit.
	LDA $18		;Load First Frame of Controller Data 2 to Accumulator.
	AND #$F0	;Check if Mario is pressing any Functional Key.
	BEQ Return	;If he isn't pressing, branch to Return.
Exit:
	LDA #$01	;Load Hexadecimal One into Accumulator.
	TAX		;Transfer Accumulator to Index X.
	LDA $0DD5	;Load Level Exit stuff into Accumulator.
	BEQ $02		;If they are equal to zero, skip the next branch.
	BPL Return	;If they are positive value, branch to Return.
	TXA 		;Transfer Index X to Accumulator.
	STA $13CE 	;Make the Midway Point be crossed.
	STA $0DD5 	;Store Hexadecimal One to Exit Stuff.
	INC $1DE9	;Increase the Enemy Presentation Screen.
	BRA !Sound	;Make a Sound Effect depending on the setting.
Yes:
	LDA #$29	;Load Hexadecimal 29 into Accumulator.
	STA $1DFC	;Produce a Sound Effect of "Correct".
No:
	LDA #$0B	;Load Hexadecimal B into Accumulator.
	STA $0100	;Make the Game fade to Overworld.
	LDY #$01	;Load Hexadecimal One into Index Y.
	LDA #$30	;Load Hex Thirty into Accumulator.
	STA $1693	;Make the block act like a solid Cement Block.
Return:
	RTL		;If anything else touches the block, Return.

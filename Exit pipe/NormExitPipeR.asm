db $42

JMP MarioTop
JMP Side
JMP Side	;MarioSide
JMP Side	;SpriteV
JMP Side	;SpriteH
JMP Side	;MarioCape
JMP Side	;MarioFireBall
JMP Side	;MarioCorner
JMP Side	;MarioBody
JMP Side	;MarioHead

print "Trigger normal exit when going through pipe, right half"

MarioTop:
		LDA $79
		CMP #$62
		BEQ Cont
		LDA #$03
		STA $92
		LDA $93
		BEQ Spec
		LDA $15		;1 frame controller
		AND #$08	;UDLR
		BEQ Spec	;
Cont:
		LDY #$00
		LDA #$25
		STA $1693
		LDA #$62
		STA $79
		LDA #$49
		STA $13D8
		LDA #$0F
		STA $72
		LDA $72
		STA $13E0
		STZ $15
		STZ $16
		STZ $17
		STZ $18
		STZ $7B
		LDA #$E8
		STA $7D
		LDA #$04
		STA $1DF9

		LDA $7C
		CMP #32
		BNE Ending
		
		LDA #$01	;Load Hexadecimal One into Accumulator.
		TAX		;Transfer Accumulator to Index X.
		LDA $0DD5	;Load Level Exit stuff into Accumulator.
		BEQ $02		;If they are equal to zero, skip the next branch.
		BPL Return	;If they are positive value, branch to Return.
		TXA 		;Transfer Index X to Accumulator.
		STA $13CE 	;Make the Midway Point be crossed.
		STA $0DD5 	;Store Hexadecimal One to Exit Stuff.
		INC $1DE9	;Increase the Enemy Presentation Screen.
		LDA #$0B	;Load Hexadecimal B into Accumulator.
		STA $0100	;Make the Game fade to Overworld.
		LDY #$01	;Load Hexadecimal One into Index Y.
		LDA #$30	;Load Hex Thirty into Accumulator.
		STA $1693	;Make the block act like a solid Cement Block.
Return:
		RTL
Nruter:
		RTL		;Return

Side:		LDA $13D8
		CMP #$49
		BEQ Nruter
Spec:
		LDY #$01
		LDA #$30
		STA $1693
		BRA Nruter
Ending:
		INC $7C
		RTL

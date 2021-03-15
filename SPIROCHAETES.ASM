; "Spirochaetes", Atari XL/XE Intro 32B
; (30 bytes of code + 6 bytes of header)
; code by tr1x / Agenda
; requirements: original Atari XL/XE 64KB PAL
; version: 1.0
; release date: 2021-03-13

rtclok	equ $0012
rowcrs	equ $0054
colcrs	equ $0055
atachr	equ $02fb
random	equ $d20a
osgraph	equ $ef9c
ospoint	equ $f1d8


	org $0080

start	lda #$08		; 2
	jsr osgraph		; 3
	sty atachr		; 3

loop1	ldx #$01		; 2

loop2	asl rtclok+2		; 2
	bmi skip1		; 2
	asl random		; 3
	tya			; 1
	sbc rowcrs,x		; 2
skip1	sta rowcrs,x		; 2
	dex			; 1
	bpl loop2		; 2

	jsr ospoint		; 3

	bcs loop1		; 2

	;run start
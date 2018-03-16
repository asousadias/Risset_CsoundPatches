;	RISSET'S GENERATION OF BELL SHAPED CURVES - BELLFUNC.ORC
; As described in Risset, Jean-Claude:
; "An Introdutory Catalogue of Computer Synthesized Sounds" (1969) reprinted
; in Computer Music Currents - 13: The Historical CD of Digital Sound Synthesis.
; booklet accompaining the CD, pp109-254.
; Digital Music Digital - Music with Computers - Wergo: WER 2033-2
; Csound version by Antonio de Sousa Dias - a.sousadias@belasartes.ulisboa.pt
; based on a previous existing version by rp (Russel Pinkston?)
;
;
; INTRODUCTION OF ADDITIONAL PARAMETERS TO CONFORM
; GEN07 OR GEN08 BEHAVIOUR AS DESCRIBED IN RISSET'S TEXT.
; USE ONLY THE COMMAND LINE NEEDED AND "COMMENT" ALL THE OTHERS

; ========================= GEN07
;		SIZE	P5 musicV field
;i07	0	2049	0
;i07	0	512	0
; or a decaying exponential curve
;i07	0	2049	-8
; or a rising exponential curve
;i07	0	2049	8
; ========================= GEN08
; a bell-shaped function with one peak (P5=0)
;		SIZE	P5(n)	P6(m)
;i08	0	2049	0	0
; a bell-shaped function with two peaks (P5>0)
i08	0	2049	8
; a bell-shaped function with three peaks (P5<0)
;i08	0	2049	-8
e


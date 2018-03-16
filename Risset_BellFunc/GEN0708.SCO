;GENERATION OF EXPONENTIAL AND BELL SHAPED CURVES
; As described in Risset, Jean-Claude:
; "An Introdutory Catalogue of Computer Synthesized Sounds" (1969) reprinted
; in Computer Music Currents - 13: The Historical CD of Digital Sound Synthesis.
; booklet accompaining the CD, pp109-254.
; Digital Music Digital - Music with Computers - Wergo: WER 2033-2
; Csound version by Antonio de Sousa Dias - a.sousadias@belasartes.ulisboa.pt
; based upon a previous existing version by rp (Russel Pinkston?)
;
; bellfunc.orc (ORIGINAL CSOUND TEXT)
; "Even though csound only provides a limited number of stock gen subroutines,
; it includes one (gen 1) which can read in an external file.  Hence, you
; can use a standalone program to generate functions that aren't standard.
; In fact, as this example shows, you can use csound itself to create them. [...] rp"
; Finally, rename the output name to soundin.X (X - any number) so that your score
; can read it in via Gen01. Example of score line (just copy it):
; f5       0       <size>       1       	<soundin number>	0    4	0
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
;i08	0	2049	8
; a bell-shaped function with three peaks (P5<0)
;i08	0	2049	-8
e


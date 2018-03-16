<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
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

; bellfunc.orc (ORIGINAL TEXT)
; Even though csound only provides a limited number of stock gen subroutines,
; it includes one (gen 1) which can read in an external file.  Hence, you
; can use a standalone program to generate functions that aren't standard.
; In fact, as this example shows, you can use csound itself to create them.
; You just have to remember to perf with the floating point option (-f)...
; This orchestra will generate a bell-shaped function with max amp of 1.0 --
; required by endless.orc for an amplitude control function.
; Say "perf -f bellfunc.orc bellfunc.sco" to run it, then rename the output
; test.sf file to soundin.10 so that endless.sco can read it in via Gen 1.  rp
;
sr	=	1	;N.B. we're not generating audio here, just...
kr	=	1	;a bunch of values for an array, so the...
ksmps	=	1	;sr and kr don't really matter.  However,...
				;it's convenient to make them = 1, so that...
nchnls	=	1	;p3 can be used to specify the number of...
				;values to compute directly.
; INTRODUCTION OF CONDITIONAL POSSIBILITIES TO CONFORM
; GEN07 AND GEN08 BEHAVIOUR AS DESCRIBED IN RISSET'S TEXT.

instr	7	; GEN 7 FOR GLISSANDI OR EXPONENTIAL DECAYS
igen	=	p1	; Only to document the instrument
iatime	=	p2	; Allways 0
isampl	= p3	; Table size
i_n	=	p4	; P5 parameter field in MUSIC V GEN subroutine 7
ival	=	(i_n == 0 ? 0 : 2^(-abs(i_n)))
itwopi	=	taninv( 1. ) * 8	; computes 2*PI
iln008	=	log( .008 )
isize	=	isampl-1	;since sr=1, p3 has number of locs to generate
kx	init	0

if i_n == 0  goto bellshape
if i_n > 0  goto exp_rising
exp_falling:
aval	expon	1, isampl, ival
	goto	contin
exp_rising:
aval	expon	ival, isampl, 1
	goto	contin
bellshape:
; Risset's formula (from Dodge):  exp(-4.8283*(1-cos(2*pi*(x-255.5)/511)))
aval	=	exp(iln008*(1-cos(itwopi*(kx-(isize*.5))/isize)))
kx	=	kx+1
contin:
	out	aval
endin

instr	8	; GEN 8 FOR 1, 2, 3 PEAK CURVES
igen	=	p1	; Only to document the instrument
iatime	=	p2	; Allways 0
isampl	= p3	; Table size
i_n	=	p4	; P5 parameter field in MUSIC V GEN subroutine 8
i_m	=	p5	; P6
i_m	=	(i_m == 0 ? 1 : i_m)	; default value 1
itwopi	=	taninv( 1. ) * 8	; computes 2*PI
iln008	=	log( .008 )
isize	=	isampl-1	;since sr=1, p3 has number of locs to generate
iconst	=	(i_n == 0 ? i_m / 2 : abs( i_n ) / 2 )
idefsz	=	(i_n == 0 ? isize / 2 : isize / 8 )
idefsz	=	(i_n < 0 ? isize / 12 : idefsz )
insz	=	(i_n == 0 ? (isize-1) : isize / 2 )
insz	=	(i_n < 0 ? isize / 3 : insz )
kx	init	0

bellshape:

aval	=	exp( iln008*iconst*(1-cos(itwopi*(kx-idefsz)/insz)) )
kx	=	kx+1
contin:
	out	aval
endin



</CsInstruments>
<CsScore>
;	RISSET'S GENERATION OF BELL SHAPED CURVES - BELLFUNC.ORC
; As described in Risset, Jean-Claude:
; "An Introdutory Catalogue of Computer Synthesized Sounds" (1969) reprinted
; in Computer Music Currents - 13: The Historical CD of Digital Sound Synthesis.
; booklet accompaining the CD, pp109-254.
; Digital Music Digital - Music with Computers - Wergo: WER 2033-2
; Csound version by Antonio de Sousa Dias - sousa.dias@wanadoo.fr
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
;		SIZE	P5(n)P6(m)
;i08	0	2049	0	0

; a bell-shaped function with two peaks (P5>0)
;		SIZE	P5(n)
;i08	0	2049	8

; a bell-shaped function with three peaks (P5<0)
;		SIZE	P5(n)
;i08	0	2049	-8
e


</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>72</x>
 <y>179</y>
 <width>400</width>
 <height>200</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>slider1</objectName>
  <x>5</x>
  <y>5</y>
  <width>20</width>
  <height>100</height>
  <uuid>{2ea31cb2-0836-400e-8fc4-a2bcf98a35e0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>

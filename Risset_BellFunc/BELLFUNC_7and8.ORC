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


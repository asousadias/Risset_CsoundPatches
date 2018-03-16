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
sr	=	1	;N.B. we're not generating audio here, just...
kr	=	1	;a bunch of values for an array, so the...
ksmps	=	1	;sr and kr don't really matter.  However,...
				;it's convenient to make them = 1, so that...
nchnls	=	1	;p3 can be used to specify the number of...
				;values to compute directly.
; USE OF ADDITIONAL POSSIBILITIES TO CONFORM
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


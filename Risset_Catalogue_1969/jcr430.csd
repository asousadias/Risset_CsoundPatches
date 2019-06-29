<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
; --------------------- JCR 430 ------------------
; BELL EXPERIMENTS
; ORIGINAL SAMPLING RATE 5000 HZ

; As described in Risset, Jean-Claude
; "An Introdutory Catalogue of Computer Synthesized Sounds" (1969) reprinted
; in Computer Music Currents - 13 The Historical CD of Digital Sound Synthesis.
; booklet accompaining the CD, pp109-254.
; Digital Music Digital - Music with Computers - Wergo WER 2033-2

; Csound version by Antonio de Sousa Dias - a.sousadias@belasartes.ulisboa.pt

/*************************


*************************/


sr	= 44100
kr	= 4410
ksmps	= 10
nchnls	= 1

giamp_fact	= 16	; Amplitude factor (not in the original orchestra)


instr	1
iP4	= p3
iP5	= p4 * giamp_fact
iP6	= p5
iP7	= (p6 == 0 ? 1/ iP4 : 1/ p6)

iF1 = 1
iF2 = 2

aB3	oscil iP5 , iP7, iF2
aB3	oscil aB3 , iP6, iF1
	out	aB3
endin

</CsInstruments>
<CsScore>

f01	0 512	10	1
f02 0 512 25 0 0.000001 1 1 511 0.0009765625
; NOTE extra point added in the rise of curve at the beginning to avoid artifacts due to cycle calculations

; Synchronous Decay:
i 1 1 20 250 224.5 20
i 1 1 20 400 368.5 20
i 1 1 20 400 476 20
i 1 1 20 250 684 20
i 1 1 20 220 800 20
i 1 1 20 200 1096 20
i 1 1 20 200 1200 20
i 1 1 20 150 1504 20
i 1 1 20 200 1628 20
f0 21
s
; Non Synchronous Decay:
i 1 1 20 250 224 20
i 1 1 12 400 368.5 12
i 1 1 6.5 400 476 6.5
i 1 1 7 250 684 7
i 1 1 5 220 800 5
i 1 1 4 200 1096 4
i 1 1 3 200 1200 3
i 1 1 2 150 1504 2
i 1 1 1.5 200 1628 1.5
f0 21
s
; Non Synchronous Decay and Two Split Partials:
i 1 1 20 150 224 20
i 1 1 18 100 225 18
i 1 1 13 150 368 13
i 1 1 11 270 369.7 11
i 1 1 6.5 400 476 6.5
i 1 1 7 250 680 7
i 1 1 5 220 800 5
i 1 1 4 200 1096 4
i 1 1 3 200 1200 3
i 1 1 2 150 1504 2
i 1 1 1.5 200 1628 1.5
f0 21
s
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
 <bsbObject type="BSBVSlider" version="2">
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

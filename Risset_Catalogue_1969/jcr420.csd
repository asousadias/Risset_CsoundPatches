<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
; --------------------- JCR 420 ------------------
; GONG LIKE SOUNDS
; ORIGINAL SAMPLING RATE 20000 HZ

; As described in Risset, Jean-Claude
; "An Introdutory Catalogue of Computer Synthesized Sounds" (1969) reprinted
; in Computer Music Currents - 13 The Historical CD of Digital Sound Synthesis.
; booklet accompaining the CD, pp109-254.
; Digital Music Digital - Music with Computers - Wergo WER 2033-2

; Csound version by Antonio de Sousa Dias - a.sousadias@belasartes.ulisboa.pt

/*************************
Gong like sounds
Orignal Sampling Rate 20000 Hz
Play at a sampling rate of 5000 Hz;
hence durations multiplied by 4. frequencies divided by 4
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
iP7	= (p6 == 0 ? 1/iP4 : 1/p6)

iF1 = 1
iF2 = 2

aB3	oscil iP5 , iP7, iF2
aB3	oscil aB3 , iP6, iF1
	out	aB3
endin

</CsInstruments>
<CsScore>

f01	0 512	10	1
f02 0 512 25 0 0.000001 1 1 511 0.0078125
; NOTE extra point added in the rise of curve at the beginning to avoid artifacts due to cycle calculations


; For demonstration first note with synchronous decay:
i 1 1 2.5 300 960 0
i 1 1 2.5 250 1110 0
i 1 1 2.5 200 1540 0
i 1 1 2.5 300 2420 0
i 1 1 2.5 100 1360 0
i 1 1 2.5 100 2680 0
i 1 1 2.5 100 3250 0
f0 5
s
i 1 1 2.5 300 960 0
i 1 1 2.4 250 1110 0
i 1 1 2.2 200 1540 0
i 1 1 0.4 300 2420 0
i 1 1 2.0 100 1360 0
i 1 1 1.3 100 2680 0
i 1 1 2.0 100 3250 0
f0 6
s
i 1 1 2.5 300 960 0
i 1 1 2.4 250 1110 0
i 1 1 2.2 200 1540 0
i 1 1 0.4 300 2420 0
i 1 1 2.0 100 1360 0
i 1 1 1.3 100 2680 0
i 1 1 1.0 100 3250 0

i 1 5 2.0 300 970 0
i 1 5 1.9 250 1230 0
i 1 5 1.7 200 1360 0
i 1 5 1.2 300 1536 0
i 1 5 0.9 100 2048 0
i 1 5 0.7 100 3280 0
f0 8
s
i 1 1 2.5 150 960 0
i 1 1 2.4 125 1110 0
i 1 1 2.2 150 1540 0
i 1 1 0.8 100 2420 0
i 1 1 2.0 50 1360 0
i 1 1 1.3 50 2680 0
i 1 1 1.0 50 3250 0

i 1 1.7 2.2 200 965 0
i 1 1.7 2.1 150 1050 0
i 1 1.7 1.0 250 1430 0
i 1 1.7 1.3 100 1210 0
i 1 1.7 1.1 100 1260 0
i 1 1.7 1.9 100 1540 0
i 1 1.7 1.6 100 1930 0

i 1 1.8 2.9 300 970 0
i 1 1.8 2.7 250 1230 0
i 1 1.8 2.6 100 1360 0
i 1 1.8 1.6 200 1536 0
i 1 1.8 1.2 100 2048 0
i 1 1.8 1.1 150 3280 0

i 1 3.2 3.4 150 960 0
i 1 3.2 3.2 125 1110 0
i 1 3.2 3.0 150 1540 0
i 1 3.2 2.1 50 2420 0
i 1 3.2 0.8 100 1360 0
i 1 3.2 1.6 50 2680 0
i 1 3.2 1.1 50 3250 0
f0 8; TER 8
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

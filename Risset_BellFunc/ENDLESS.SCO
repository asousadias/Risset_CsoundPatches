; Generate 240 seconds of endless glissando with a 120 second cycle time
; Function 03 reads BELLFUNC.res/soundin.6 the bell shaped curve specified by Risset in Dodge

;n.      t       size              gen       p5       p6       ...
f1       0       512              10       1
f2       0       513              7       0       512       1

; indicar aqui BELLFUNC or soundin.6
f3 0       2049  1	88	0    4	0
f4 0       513   5	1  512  .0009766

;in     st      dur          p4        p5           p6
i1       0       120       10000       5000       120

e

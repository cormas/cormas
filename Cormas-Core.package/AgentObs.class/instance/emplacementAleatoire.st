deplacement
emplacementAleatoire
	
	| x y start endX endY extX extY r |
	r := self agentSource class image rMax * self agentSource class image size.
	start := Cadre origin x + r.
	endX := Cadre corner x - r.
	endY := Cadre corner y - r.
	extX := endX - start.
	extY := endY - start.
	x := (self Rand * extX + start) rounded.
	y := (self Rand * extY + start) rounded.
	centre := x @ y
deplacement
emplacementCircle: angle
	
	| x y distanceFromCenter |
	self agentSource class image rMax * self agentSource class image size.
	distanceFromCenter := (Cadre height min: Cadre width) / 2 - 20.
	x := distanceFromCenter * angle cos.
	y := distanceFromCenter * angle sin.
	centre := (Cadre center x + x) @ (Cadre center y + y)
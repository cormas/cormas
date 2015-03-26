deplacement
Force: unAgentObs valeur: uneVal
	
	| D d |
	D := unAgentObs center - centre.
	D rrr = 0 ifTrue: [^D].
	d := self
		distance: unAgentObs center
		fromEllipse: self A @ self B.
	D rrr < d ifTrue: [^10 * D unitVector negated * d / D rrr].
	(self Attirant: unAgentObs)
		ifTrue:
			[d := self
				distance: unAgentObs center
				fromEllipse: self AA @ self BB.
			D rrr <= d ifTrue: [^0 @ 0].	"/10"
			^uneVal * D unitVector]
		ifFalse: [^0 @ 0]
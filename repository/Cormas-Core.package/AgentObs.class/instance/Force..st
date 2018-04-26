deplacement
Force: unePref
	
	| D d |
	D := unePref agent agentObs center - centre.
	D rrr = 0 ifTrue: [^D].
	d := self
		distance: unePref agent agentObs center
		fromEllipse: self A @ self B.
	D rrr < d ifTrue: [^D unitVector negated * d / D rrr].
	(fonction niveauxCompatibles: level @ unePref agent agentObs level)
		ifFalse: [^0 @ 0].
	(self Attirant: unePref)
		ifTrue:
			[d := self
				distance: unePref agent agentObs center
				fromEllipse: self AA @ self BB.
			D rrr <= d ifTrue: [^0 @ 0].
			^(self valAtt: unePref agent) * 10 * D unitVector]
		ifFalse: [^0 @ 0]
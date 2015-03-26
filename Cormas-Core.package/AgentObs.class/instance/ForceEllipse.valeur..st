display forces
ForceEllipse: unAgent valeur: uneVal
	
	| D d |
	D := unAgent center - centre.
	D rrr = 0 ifTrue: [^D].
	d := self
		distance: unAgent center
		fromEllipse: A @ B.
	D rrr < d ifTrue: [^D unitVector negated * d / D rrr].
	(self Attirant: unAgent)
		ifTrue:
			[d := self
				distance: unAgent center
				fromEllipse: A @ B + Extent.
			D rrr <= d ifTrue: [^0 @ 0].
			^uneVal / nbMsg * D]
		ifFalse: [^0 @ 0]
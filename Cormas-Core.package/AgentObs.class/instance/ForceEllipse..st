display forces
ForceEllipse: unePref
	
	| D d |
	D := unePref agent center - centre.
	D rrr = 0 ifTrue: [^D].
	d := self
		distance: unePref agent center
		fromEllipse: A @ B.
	D rrr < d ifTrue: [^D unitVector negated * d / D rrr].
	(self Attirant: unePref)
		ifTrue:
			[d := self
				distance: unePref agent center
				fromEllipse: A @ B + Extent.
			D rrr <= d ifTrue: [^0 @ 0].
			^unePref pref / nbMsg * D]
		ifFalse: [^0 @ 0]
display forces
showForces: aGC
	
	| V D d |
	Eint asStroker
		displayOn: (aGC paint: (ColorValue perform: #black))
		at: centre.
	Eext asStroker
		displayOn: (aGC paint: (ColorValue perform: #green))
		at: centre.
	preferences
		keysAndValuesDo:
			[:unAgent :uneVal | 
			D := unAgent center - centre.
			D rrr = 0
				ifFalse:
					[d := self
						distance: unAgent center
						fromEllipse: A @ B.
					D rrr < d
						ifTrue:
							[V := D unitVector negated * d / D rrr.
							(aGC paint: (ColorValue perform: #red))
								displayLineFrom: unAgent center
								to: V + unAgent center]
						ifFalse:
							[(self Attirant: unAgent)
								ifTrue:
									[d := self
										distance: unAgent center
										fromEllipse: A @ B + Extent.
									D rrr <= d
										ifTrue: [V := 0 @ 0]
										ifFalse:
											[V := uneVal / nbMsg * ((unAgent preferences at: self) / unAgent nbMsg) * D].
									(aGC paint: (ColorValue perform: #royalBlue))
										displayLineFrom: unAgent center
										to: V + unAgent center]]]].
	V := 0 @ 0.
	preferences
		keysAndValuesDo:
			[:unAgent :uneVal | V := V + (self ForceEllipse: unAgent valeur: uneVal)].
	(aGC paint: (ColorValue perform: #black))
		displayLineFrom: centre
		to: V + centre
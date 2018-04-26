- image
imageAtPov: selectorName
	"Returns an EntityPOV according to the a Symbol (selectorName).
selectorName = <Symbol>.ex: #povId.
An EntityPOV, stored in povs, may be defined to see an entity on the grid but also on another space (ex: communication space)"
	
	| currentClass im |
	currentClass := self.
	[currentClass == CMEntity]
		whileFalse:
			[im := currentClass povDict
				at: selectorName
				ifAbsent: [nil].
			im ifNotNil: [^im].
			currentClass := currentClass superclass].
	^self povDict
		at: selectorName
		put: self defaultImage
resources
vectorLib: numero
	
	| num |
	(num := (self imLibPage - 1) * 12 + numero)
		> (self class organization listAtCategoryNamed: #'images - vector') size
		ifTrue: [^self blankImage].
	^self
		loadVectorialPOV:
			((self class organization listAtCategoryNamed: #'images - vector') at: num)
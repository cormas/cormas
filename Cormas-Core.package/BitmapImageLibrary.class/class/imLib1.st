resources
imLib1
	
	| num |
	(num := (self imLibPage - 1) * 12 + 1)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
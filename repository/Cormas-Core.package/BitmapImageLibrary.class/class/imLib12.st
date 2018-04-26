resources
imLib12
	
	| num |
	(num := (self imLibPage - 1) * 12 + 12)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
resources
imLib5
	
	| num |
	(num := (self imLibPage - 1) * 12 + 5)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
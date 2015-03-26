resources
imLib6
	
	| num |
	(num := (self imLibPage - 1) * 12 + 6)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
resources
imLib10
	
	| num |
	(num := (self imLibPage - 1) * 12 + 10)
		> (self class organization listAtCategoryNamed: #'images - bitmap') size
		ifTrue: [^self blankImage].
	^self
		perform:
			((self class organization listAtCategoryNamed: #'images - bitmap') at: num)
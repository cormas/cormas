accessing
imLibPage: aNumber
	
	imLibPage := (aNumber max: 1)
		min:
			(self class organization listAtCategoryNamed: #'images - bitmap') size //
					12 + 1.
	^self
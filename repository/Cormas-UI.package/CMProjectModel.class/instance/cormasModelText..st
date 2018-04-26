accessing
cormasModelText: aString 
	" See comment in CMProjectManager>>cormasModelText: "

	self codeGenerator 
		generateMethod: aString 
		selector: #comments 
		inClass: self cormasModelClass class.

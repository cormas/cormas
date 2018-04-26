accessing
cormasModelAuthors: aString 
	" See comment in CMProjectManager>>cormasModelAuthors: "
	
	self codeGenerator 
		generateMethod: aString 
		selector: #authors 
		inClass: self cormasModelClass class.

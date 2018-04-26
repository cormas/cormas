accessing
cormasModelEmails: aString 
	" See comment in CMProjectManager>>cormasModelEmails: "

	self codeGenerator 
		generateMethod: aString 
		selector: #emails 
		inClass: self cormasModelClass class.

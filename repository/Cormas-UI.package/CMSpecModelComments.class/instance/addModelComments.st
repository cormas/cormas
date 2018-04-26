callbacks
addModelComments
	" Private - User has clicked Ok to add model comments "
	
	self projectManager 
		cormasModelCreationDate: self creationDate textValuePending;
		cormasModelVersion: self versionName textValuePending;
		cormasModelAuthors: self authorList authors;
		cormasModelEmails: self authorList emails;
		cormasModelText: self modelText textValuePending.
		

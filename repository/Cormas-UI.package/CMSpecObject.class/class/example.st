examples
example

	^ self basicNew 
		projectManager: (CMProjectManager new projectWindow: self);
		translator: (CMTranslator newForLanguage: #EN);
		initialize;
		openWithSpec
model entities
edit: aClass selector: aSymbol
	
	self
		withBrowserDo:
			[:b | 
			(b navigator)
				selectClass: aClass;
				beHierarchy;
				setSelector: aSymbol;
				changed]
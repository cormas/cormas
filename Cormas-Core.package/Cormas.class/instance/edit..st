model entities
edit: aClass
	"Cormas new edit: Agent"
	
	self
		withBrowserDo:
			[:b | 
			(b navigator)
				selectClass: aClass;
				beHierarchy;
				changed]
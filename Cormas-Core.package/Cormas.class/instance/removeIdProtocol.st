version
removeIdProtocol
	
	self cormasModelClass allClasses
		do:
			[:class | 
			class class removeCategory: 'id'.
			class removeSelector: #initId]
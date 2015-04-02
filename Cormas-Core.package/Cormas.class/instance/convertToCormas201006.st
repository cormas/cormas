version
convertToCormas201006
	"Add the 'isAbtract' method to the entity classes of the model"
	
	self cormasModelClass environment allClasses
		do:
			[:cl | 
			cl class
				compile: 'isAbstract \^false' withCRs
				classified: 'testing'
				notifying: nil]
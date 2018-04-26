initialization
newTabFor: anEntity
	| tab modelClass |
	
	modelClass := self findPovSetterTabFor: anEntity.
	(tab := self newTab)
		label: anEntity labelName; " Cell, Node, Arc, etc "
		model: modelClass;
		owner: self.			
	^ tab
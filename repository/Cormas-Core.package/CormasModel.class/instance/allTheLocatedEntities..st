accessing - entities
allTheLocatedEntities: aClass
	"Returns a collection of all the Located Entities (AgentLocation & ObjectLocation) of the model"
	
	| theLocatedObjects |
	theLocatedObjects := OrderedCollection new.
	self spaceModel elementaryEntities
		do:
			[:cell | 
			aClass withAllSubclasses
				do:
					[:class | 
					theLocatedObjects
						addAll:
							(cell theOccupants
								at: class name
								ifAbsent: [Array new])]].
	^theLocatedObjects
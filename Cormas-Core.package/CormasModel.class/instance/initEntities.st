init entities
initEntities
	"Initialize all the Entity classes of the model"
	"Remove all the PassiveObjects and Located Objects"
	
	self class passiveClasses
		do:
			[:aClass | 
			((aClass inheritsFrom: Msg) or: [aClass isAbstract])
				ifFalse:
					[(aClass inheritsFrom: ObjectLocation)
						ifTrue:
							[(self theEntities: aClass) isNil
								ifFalse: [(self theEntities: aClass) do: [:LO | LO leave]]].
					self initializeTheEntity: aClass]].	"Remove all the Agents from previous simulation"
	self class socialClasses
		do:
			[:aClass | 
			aClass isAbstract
				ifFalse:
					[(aClass inheritsFrom: AgentLocation)
						ifTrue:
							[(self theEntities: aClass) isNil
								ifFalse: [(self theEntities: aClass) do: [:LO | LO leave]]].
					self initializeTheEntity: aClass]].
	self spaceModel isNil
		ifFalse: [self spaceModel resetSpatialEntitiesButCells]
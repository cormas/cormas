instance creation
initializeWithoutVS
	"set the cellClass, spatialClasses, socialClasses and passiveClasses.
Set the Charts"
	
	| collec subset |
	self visualStateIsOpen: false.
	self
		cellClass:
			(self allClassesInCategory
				detect: [:i | i inheritsFrom: SpatialEntityElement]
				ifNone: [nil]).
	collec := self allClassesInCategory copy.
	collec removeAllSuchThat: [:c | c inheritsFrom: CormasModel].
	subset := collec
		select:
			[:e | e inheritsFrom: SpatialEntity	"and: [e subclasses isEmpty]"].
	self spatialClasses: subset.
	collec removeAll: subset.
	subset := collec
		select: [:e | e inheritsFrom: Agent	"and: [e subclasses isEmpty]"].
	self socialClasses: subset.
	collec removeAll: subset.
	self passiveClasses: collec.
	self passiveClasses
		removeAllSuchThat:
			[:c | 
			(c inheritsFrom: ApplicationModel)
				or:
					[(c inheritsFrom: VisualComponent) or: [c inheritsFrom: Controller]]].	"sinon ca bug a cause des ID"
	self charts: OrderedCollection new.
	self charts
		addAll:
			((self organization listAtCategoryNamed: #graphiques) asOrderedCollection
				select:
					[:n | 
					n asString last ~= $:
						and:
							[n size <= 4
								or:
									[(n
										findString: 'Data'
										startingAt: n size - 4) = 0]]])
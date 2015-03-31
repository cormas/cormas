refresh display methods
displayMethodsForObservedEntity
	
	| anEntity aPovList aInfoList |
	anEntity := self observedEntitiesList selection.
	anEntity
		ifNil:
			[self povMethodsList
				setList: List new
				selecting: Array new.
			self attributesList
				setList: List new
				selecting: Array new.
			self infoMethodsList
				setList: List new
				selecting: Array new.
			^self probeMethodsList
				setList: List new
				selecting: Array new].	"Prepare list for pov methods which will  include a specific sign for the default pov"
	aPovList := (self povMethodsFor: anEntity) copy.
	(self defaultPovFor: anEntity)
		ifNotNil:
			[aPovList remove: (self defaultPovFor: anEntity).
			aPovList add: (self defaultPov at: anEntity) , ' ->D'.
			aPovList sort: [:x :y | x < y]].	"Prepare list for info  methods which will  include a specific sign for the default info"
	aInfoList := (self infoMethodsFor: anEntity) copy.
	(self defaultInfoFor: anEntity)
		ifNotNil:
			[aInfoList remove: (self defaultInfoFor: anEntity).
			aInfoList add: (self defaultInfo at: anEntity) , ' ->D'.
			aInfoList sort: [:x :y | x < y]].
	self povMethodsList
		setList: aPovList
		selecting: Array new.
	self attributesList
		setList: (self attributesFor: anEntity)
		selecting: Array new.
	self infoMethodsList
		setList: aInfoList
		selecting: Array new.
	self probeMethodsList
		setList: (self probeMethodsFor: anEntity)
		selecting: Array new
"
CormasModel is one of the main class of Cormas. It is the super class of your model class.

When you create a new model in Cormas (ex: MyModel), a sub class of CormasModel is created; its name is the name of your model. 
For example:
CormasNS.Models.MyModel defineClass: #MyModel
	superclass: #{CormasNS.Kernel.CormasModel}
	indexedType: #none
	private: false
	instanceVariableNames: ''
	classInstanceVariableNames: ''
	imports: ''
	category: 'MyModelCategory'  
This class allows to initiate a simulation and to schedule it.
Your subclass will contain attributs like 'theCells' for example which are OrderedCollections storing the instances of your entities.

Instance Variables
	activeControl	<Symbol>	it memorizes the name of the control method that have been selected by the user (ex: #stepSynchronously)
	activeInit	<Symbol>	it memorizes the name of the control method that have been selected by the user (ex: #init)
	channel	<Channel>	a channel for messages communication
	data	<Dictionary of Dictionaries>	It stocks the values of the probes selected by the user.
			The key of the first Dictionary is the name of the class contzining the probes. This key 			points to another Dictionary. Each key of this second dictionary is the name of the probe; 			it points to a List of values of the probe.
			(ex: 
			Dictionary (#Conway->Dictionary (#alive->List () 
											 #dead->List () ) 
					    #Cell->Dictionary (#isAlive->Dictionary () ) )
	periodicity	<Integer>	It may be used into the step method by calling 'testPeriod' : it tests if the timeStep is at the begining of the periodicity
	simManager	<SimulationsManager>	see description of SimManager
	spaceModel	<SpaceModel>	see description of SpaceModel
	timeStep	<Integer>	describes the current time step


"
Class {
	#name : 'CMAbstractModel',
	#superclass : 'Object',
	#traits : 'TCMRandom',
	#classTraits : 'TCMRandom classTrait',
	#instVars : [
		'spaceModel',
		'entityGetters',
		'cellClass',
		'agentClasses'
	],
	#classInstVars : [
		'cellClass',
		'agentClasses'
	],
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
CMAbstractModel class >> aboutThisModel [
	" Answer a <String> which is the main description of the receiver's purpose "
	
	^ '# About this model
	
	Edit this file to document your model using [Microdown](https://github.com/pillar-markup/Microdown) - Pharo''s dialect of [Markdown](https://en.wikipedia.org/wiki/Markdown).'
	

]

{ #category : 'managing classes' }
CMAbstractModel class >> allEntityClasses [
	"return all the classes of the model (except the classes that inheriting from Msg and other classes like Interface etc"

	^ self package classes
		removeAllSuchThat: [ :class | (class inheritsFrom: CMEntity) not ]
]

{ #category : 'available methods' }
CMAbstractModel class >> availableControlSelectors [

	^ (Pragma allNamed: #control in: self) collect: [ :each | each method selector ]
]

{ #category : 'available methods' }
CMAbstractModel class >> availableInitSelectors [

	^ (Pragma allNamed: #init in: self) collect: [ :each | each method selector ]
]

{ #category : 'available probes' }
CMAbstractModel class >> availableProbes [

	| colorString color |

	^ (Pragma allNamed: #probeNamed:color: in: self) collect: [ :pragma |
		colorString := pragma arguments second.
		
		color := [ CMColor perform: colorString asSymbol ]
			onErrorDo: [ Color fromHexString: colorString ].
		
		CMProbe new
			name: pragma arguments first;
			color: color;
			method: pragma method;
			yourself ].
]

{ #category : 'initialization' }
CMAbstractModel class >> initializeParameters [

	"Initialize parameters of all entity classes. This method can be overriden by subclasses to initialize model parameters. Implementors should always call super initializeParameters, same as for the initialize method"
	
	self allEntityClasses do: #initializeParameters. 
]

{ #category : 'testing' }
CMAbstractModel class >> isCormasModelClass [

	^ true
]

{ #category : 'instance creation' }
CMAbstractModel class >> newWithoutParameters [

	^ self basicNew
		initializeWithoutParameters;
		yourself
]

{ #category : 'accessing' }
CMAbstractModel class >> parameters [
	"Find all class side variables that have getter and setter accessors in model and all entity classes"
	| classes |
	
	classes := self allEntityClasses asOrderedCollection.
	classes add: self.

	^ classes flatCollect: [ :aClass |
		aClass class slots flatCollect: [ :slot |
			((aClass respondsTo: slot name) and: [ aClass respondsTo: slot name, ':' ])
				ifTrue: [
					aClass withAllSubclasses collect: [ :receiverClass |
						CMParameter
							getterSelector: slot name
							setterSelector: (slot name, ':')
							receiver: receiverClass ] ]
				ifFalse: [ OrderedCollection new ] ] ]
]

{ #category : 'accessing' }
CMAbstractModel >> agentClasses [

	^ agentClasses
]

{ #category : 'accessing' }
CMAbstractModel >> agentClasses: aCollection [

	agentClasses := aCollection
]

{ #category : 'accessing - entities' }
CMAbstractModel >> agents [

	^ self agentClasses flatCollect: [ :eachClass |
		self entitiesOfClass: eachClass ].
]

{ #category : 'accessing - entities' }
CMAbstractModel >> allTheEntities [
	"Returns a collection of all the instances of the Entity (and sub classes) collected by cormasModel"
	
	| coll |
	coll := OrderedCollection new.
	self class allEntityClasses do: [:cl | coll addAll: (self entitiesOfClass: cl)].
	^coll
]

{ #category : 'accessing - entities' }
CMAbstractModel >> allTheEntities: aClass [
	" Answer a <Collection> of all the instances of aClass (and sub classes) collected by cormasModel. 
	Usefull for abstract classes

	Example: (self allTheEntities: Forager) is returning all the instances of restrained and unrestrained foragers "
	
	| coll |
	coll := OrderedCollection new.
	aClass withAllSubclasses do: [:cl | cl isAbstract ifFalse: [coll addAll: (self entitiesOfClass: cl)]].
	^ coll
]

{ #category : 'accessing - entities' }
CMAbstractModel >> allTheEntitiesOfClassOrCollec: aCollecOrClass [
	"Purpose:  In case aCollecOrClass is a class or a class name (symbol), the method returns all the entities of the class and subclasses. In case aCollecOrClass is a collection of entities, the method return the same collection
Examples:
self  entitiesFromACollecOrClass: #Farmer
self  entitiesFromACollecOrClass: Farmer
self  entitiesFromACollecOrClass: self theFarmers"
	
	aCollecOrClass isSymbol
		ifTrue: [^self allTheEntities: aCollecOrClass class].
	aCollecOrClass isCollection ifTrue: [^aCollecOrClass].
	aCollecOrClass isCormasEntity
		ifTrue: [^Array with: aCollecOrClass].
	(aCollecOrClass isKindOf: CMEntity class)
		ifTrue: [^self allTheEntities: aCollecOrClass].
	^nil
]

{ #category : 'accessing - entities' }
CMAbstractModel >> allTheLocatedEntities: aClass [
	"Returns a collection of all the Located Entities (AgentLocation & ObjectLocation) of the model"
	
	| theLocatedObjects |
	theLocatedObjects := OrderedCollection new.
	self cells
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
]

{ #category : 'accessing - entities' }
CMAbstractModel >> allTheLocatedObjects [
	"Returns a collection of all the instances of ObjectLocation (and sub classes) collected by cormasModel"
	
	^self allTheEntities select: [:entity | entity isObjectLocation]
]

{ #category : 'accessing - entities' }
CMAbstractModel >> allThePassiveObjects [
	"Returns a collection of all the instances of PassiveObject (and sub classes) collected by cormasModel"
	
	^self allTheEntities select: [:entity | entity isPassiveObject]
]

{ #category : 'accessing - entities' }
CMAbstractModel >> allTheSituatedEntities [
	" Answer a <Collection> of all the instances of AgentLocation and of ObjectLocation (and sub classes) collected by cormasModel, which are situated on a patch "
	
	^ self allTheEntities select: #isSituated
]

{ #category : 'control' }
CMAbstractModel >> ask: aCollectionOrClass toDo: aBlock [
	"Purpose: To ask a collection of instances or all the instances of a class to execute a method named by aSymbol. In case aCollecOrClass is a 	class, the entities are ordered according to their id. In case aCollecOrClass is a collection of instances, the order of the collection is 	kept.
	Example: self ask: Fireman toDo: #move
	Example: self ask: (self theAnimals select:[:f | f energy > 10]) toDo: #reproduce"

	| collecEntities |
	collecEntities := self allTheEntitiesOfClassOrCollec: aCollectionOrClass.
	collecEntities do: [ :c | aBlock value: c ]
]

{ #category : 'control' }
CMAbstractModel >> askRandom: aCollectionOrClass toDo: aBlock [
	"Ask a collection of instances or all the instances of a class to execute a block. The instances are randomly mixed.
Example: self askRandom: Fireman toDo: #move
Example: self askRandom: (self theAnimals select:[:f | f energy > 10]) toDo: #reproduce"

	| collecEntities |
	(collecEntities := self allTheEntitiesOfClassOrCollec:
		                   aCollectionOrClass) ifNotEmpty: [
		(self shuffled: collecEntities) do: [ :c | aBlock value: c ] ]
]

{ #category : 'accessing - entities' }
CMAbstractModel >> cellAt: id [
	"Purpose: returns the cell with id = id"

	^ self cells at: id
]

{ #category : 'accessing' }
CMAbstractModel >> cellAt: aRowIndex at: aColumnIndex [ 
	
	^ self spaceModel cellAt: aRowIndex at: aColumnIndex
]

{ #category : 'accessing' }
CMAbstractModel >> cellClass [

	^ cellClass
]

{ #category : 'accessing' }
CMAbstractModel >> cellClass: aClass [

	cellClass := aClass
]

{ #category : 'accessing - entities' }
CMAbstractModel >> cells [
	
	^ self entitiesOfClass: self cellClass
]

{ #category : 'accessing - entities' }
CMAbstractModel >> centralCell [
	"Purpose: returns the cell located at the center of the spatial grid. Number of lines and number of columns of the spatial grid have to be odd"

	^ self spaceModel centralCell
]

{ #category : 'referencing entities' }
CMAbstractModel >> collectEntity: anEntity [
	"adds anEntity to the collection called theXXXs (where XXX is equal to the class name)"
	
	| collection |
	collection := self entitiesOfClass: anEntity class.
	collection isArray
		ifTrue:
			[self
				setTheEntity: anEntity class
				with: (OrderedCollection withAll: collection).
			collection := self entitiesOfClass: anEntity class].
	collection add: anEntity
]

{ #category : 'instance creation - aggregates' }
CMAbstractModel >> createAggregate: aggregateClass from: aCollectionOfSpatialEntities [
	"Purpose: Creates and returns an instance of aggregateClass composed with a set of cells.
Arguments: 	aCollectionOfSpatialEntities = a collection of base entities (inheriting from <SpatialEntity>) 
	aggregateClass = a Class inheriting from <SpatialEntityAggregate>
Note that this method is not destructive.

Example: self createAggregate: Plot from: (self centalCell recursiveNeighbourhood: 5)"

	| anAggregate |
	anAggregate := self newEntity: aggregateClass.
	anAggregate addComponents:
		aCollectionOfSpatialEntities asOrderedCollection.
	^ anAggregate
]

{ #category : 'instance creation - aggregates' }
CMAbstractModel >> createAggregates: aggregateType from: baseEntityType attribute: attributeName [
	"Purpose: Create n aggregates that will occupy the whole grid. Each aggregate is composed of baseEntities that have the same value for #attributeName. 
	<baseEntityType> is a Class name inheriting from SpatialEntityElement. 
	<attributeName> is a symbol referring to a baseEntity's attribute name. 
	<aggregateType> is a Class name inheriting from SpatialEntitySet.
Note that this method is not destructive.
Example: self createAggregates: ZoneArea from: Cell attribute: #landCover"

	^ self spaceModel createAggregates: aggregateType from: baseEntityType attribute: attributeName minimumSize: 1
]

{ #category : 'instance creation - aggregates' }
CMAbstractModel >> createAggregates: aggregateType from: baseEntityType attribute: attributeName minimumSize: integer [
	"Purpose: Create n aggregates that will occupy the whole grid. Each aggregate is composed of baseEntities that have the same value for #attributeName. 
	<baseEntityType> is a Class name inheriting from SpatialEntityElement. 
	<attributeName> is a symbol referring to a baseEntity's attribute name. 
	<aggregateType> is a Class name inheriting from SpatialEntitySet.
Note that this method is not destructive.
Example: self createAggregates: ZoneArea from: Cell attribute: #landCover"

	^ self spaceModel
		  createAggregates: aggregateType
		  from: baseEntityType
		  attribute: attributeName
		  minimumSize: integer
]

{ #category : 'instance creation - aggregates' }
CMAbstractModel >> createAggregates: aggregateType from: baseEntityType verifying: aBlock [
	"Purpose: Create and return N instances of aggregateType of minimumSize = 1, so it is possible to get aggregates made of only 1 component. The previous aggregates are not removed.
baseEntityType = a subClass of  <SpatialEntity>
aBlock example = [:cell | cell state = #tree]
aggregateType = a subClass of  <SpatialEntitySet> "

	^ self createAggregates: aggregateType from: baseEntityType verifying: aBlock minimumSize: 1
]

{ #category : 'instance creation - aggregates' }
CMAbstractModel >> createAggregates: aggregateType from: baseEntityType verifying: aBlock minimumSize: integer [
	"Purpose: Create and return N instances of aggregateType of minimumSize. 
baseEntityType = a subClass of  <SpatialEntity>
aBlock is the condition written as a block refering to a test on each of the base entity. 
	example = [:cell | cell state = #tree]
aggregateType = a subClass of  <SpatialEntityAggregate>
integer = <integer> must be >= 1
Note that this method is not destructive: The previous aggregates are not removed.
Example: self createAggregates: Forest from: Cell verifying: [:aCell | aCell isTree] minimumSize: 3"

	^ self spaceModel
		  createAggregates: aggregateType
		  from: baseEntityType
		  verifying: aBlock
		  minimumSize: integer
]

{ #category : 'instance creation - aggregates' }
CMAbstractModel >> createAggregates: aggregateType horizontalDividers: xRatio verticalDividers: yRatio [
	"Purpose: Creates (xRatio x yRatio) rectangular aggregates by dividing the grid by yRatio columns and xRatio lines. The aggregates will  occupy the whole grid. 
	aggregateType = a subClass of  <SpatialEntityAggregate>
Note that this method is not destructive.
Example: self createAggregates: SquareArea horizontalDividers: 5 verticalDividers: 4 
		--> for a spatial grid of 41 * 41, it will create 20 aggregates: 5 along the horizontal direction and 4 along the vertical direction"

	^ self spaceModel
		  createAggregates: aggregateType
		  horizontalDividers: xRatio
		  verticalDividers: yRatio
]

{ #category : 'instance creation - spatial grid' }
CMAbstractModel >> createGridNumberOfRows: aNumberOfRows numberOfColumns: aNumberOfColumns neighbourhood: aNumber closed: aBoolean [
	"Create a spatial grid made of cells"

	self spaceModel
		initializeRegularNumberOfRows: aNumberOfRows
		numberOfColumns: aNumberOfColumns
		neighbourhood: aNumber
		closed: aBoolean
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber entity: aClass [
	"Return a collection of aNumber of entities of aClass for wich the init method has been send.
	ex: self createN: 10 entity: Predator "
	
	^self createN: aNumber entity: aClass initMethod: #init arguments: #()
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber entity: aClass initMethod: aSymbol [
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	ex: self createN: 10 entity: Predator initMethod: #initAge"
	
	^self createN: aNumber entity: aClass initMethod: aSymbol arguments: #()
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber entity: aCMEntityClass initMethod: aSymbol arguments: anArray [
	"Return a collection of aNumber of entities of aCMEntityClass for wich the init method 'aSymbol' with a set of arguments 'anArray' has been send.
	ex: self createN: 10 entity: Predator initMethod: #initAge:energy: arguments: #(0 50) "

	| args |
	args := anArray asArray.
	^ (1 to: aNumber)
		collect: [ :i | 
			(self newEntity: aCMEntityClass)
				perform: aSymbol withArguments: args;
				yourself ]
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedAloneEntities: aClass [
	"Return a collection of aNumber of entities of aClass for wich the 'init' method has been send.
	The new entities are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedAloneEntities: Predator"
	
	self createN: aNumber randomlyLocatedAloneEntities: aClass initMethod:
			#init arguments: #()
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedAloneEntities: aClass initMethod: aSymbol [
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	The new entities are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedAloneEntities: Predator initMethod: #initAge  "
	
	^self createN: aNumber randomlyLocatedAloneEntities: aClass initMethod:
			aSymbol arguments: #()
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedAloneEntities: aClass initMethod: aSymbol arguments: aCollec [

	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send.
	The new entities are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedAloneEntities: Predator initMethod: #initAge:energy: arguments: #(0 50) "

	| a freeCell newEntities |
	newEntities := OrderedCollection new.
	aNumber timesRepeat: [ 
		(freeCell := self pickRandomUnoccupiedCell) ifNil: [ self error: 'No free cell. The simulation will stop' ].
		a := self newEntity: aClass.
		a moveTo: freeCell.
		a perform: aSymbol withArguments: aCollec.
		newEntities add: a ].
	^ newEntities
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedEntities: aClass [
	" Answer a <Collection> of aNumber of entities of aClass for wich the 'init' method 'has been send.
	The new entities are randomly located on the grid. ex: 
	
	self createN: 10 randomlyLocatedEntities: Predator
	"
	
	^ self 
		createN: aNumber 
		randomlyLocatedEntities: aClass 
		initMethod: #init
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedEntities: aClass constrainedBy: aBlock [
	" Answer a <Collection> of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	The new entities are randomly located on the grid on cells that verify the constraint. ex: 
	
	self createN: 10 randomlyLocatedEntities: Predator constrainedBy: [:c | c noOccupant and: [c energy > 1]]
	"
	
	^ self 
		createN: aNumber 
		randomlyLocatedEntities: aClass 
		initMethod: #init
		arguments: #() 
		constrainedBy: aBlock
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedEntities: aClass initMethod: aSymbol [
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	The new entities are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedEntities: Predator initMethod: #initAge "

	^ self
		createN: aNumber
		randomlyLocatedEntities: aClass
		initMethod: aSymbol
		arguments: #()
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedEntities: aClass initMethod: aSymbol arguments: aCollec [
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send. 
	The new entities are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedEntities: Predator initMethod: #initAge:energy: arguments: #(0 50) "

	| anAgent newEntities |
	newEntities := OrderedCollection new.
	aNumber
		timesRepeat: [ anAgent := self newEntity: aClass.
			anAgent moveTo: self pickRandomCell.
			anAgent perform: aSymbol withArguments: aCollec.
			newEntities add: anAgent ].
	^ newEntities
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedEntities: aClass initMethod: aSymbol arguments: aCollec constrainedBy: aBlock [

	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send.
	The new entities are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedEntities: Predator initMethod: #initAge constrainedBy: [:cell | cell energy > 1] "

	| a targetCell newEntities |
	newEntities := OrderedCollection new.
	aNumber timesRepeat: [ 
		(targetCell := self pickRandomCellConstrainedBy: aBlock) 
			ifNil: [ self error: 'No available cell for the constraint. The simulation will stop' ].
		a := self newEntity: aClass.
		a moveTo: targetCell.
		a perform: aSymbol withArguments: aCollec.
		newEntities add: a ].
	^ newEntities
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedEntitiesFrom: aCollectionOfClasses [
	"Return a collection of aNumber of entities of aClass for wich the 'init' method 'has been send.
	The new entities are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedEntities: Predator"
	
	^ self 
		createN: aNumber 
		randomlyLocatedEntitiesFrom: aCollectionOfClasses 
		initMethod: #init
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedEntitiesFrom: aCollectionOfClasses initMethod: aSymbol [
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	The new entities are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedEntities: Predator initMethod: #initAge "

	^ self
		createN: aNumber 
		randomlyLocatedEntitiesFrom: aCollectionOfClasses 
		initMethod: aSymbol 
		arguments: #()
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> createN: aNumber randomlyLocatedEntitiesFrom: aCollectionOfClasses initMethod: aSymbol arguments: aCollec [
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send. 
	The new entities are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedEntities: Predator initMethod: #initAge:energy: arguments: #(0 50) "

	| anAgent newEntities |
	newEntities := OrderedCollection new.
	aNumber
		timesRepeat: [ 
			anAgent := self newEntity: aCollectionOfClasses atRandom.
			anAgent moveTo: self pickRandomCell.
			anAgent perform: aSymbol withArguments: aCollec.
			newEntities add: anAgent ].
	^ newEntities
]

{ #category : 'utilities - space metrics' }
CMAbstractModel >> distanceFromCell: cell1 toCell: cell2 [
	"Purpose: return the distance in number of cells (also known as Manhattan distance)"
	
	^self spaceModel distanceFromCell: cell1 toCell: cell2
]

{ #category : 'utilities - space metrics' }
CMAbstractModel >> dominance: anAttribute [
	"Purpose: Return the Dominance-Index of SpatialEntityElements instances (theCells for example). The Dominance-Index is used as an index of biodiversity. It gives the information if there is one dominant category of cells in the spatial grid or if all categories have more or less the same relative proportions. Categories of cells are cells that have a different value of anAttribute (see the method nClasses: anAttribute).
Argument: anAttribute is the name of the attribute, ex #state
Return Value: Depending of the proportions the results range between 0 and 1.
Example: self dominance: #groupNumber"

	^ self spaceModel dominance: anAttribute
]

{ #category : 'accessing - entities' }
CMAbstractModel >> entitiesOfClass: aClass [
	"Returns a collection of all the instances of aClass"

	| getter |
	
	aClass isAbstract ifTrue: [ ^ OrderedCollection new ].
	
	getter := self getterForEntityClass: aClass.
	
	^ self perform: getter.
]

{ #category : 'utilities - space metrics' }
CMAbstractModel >> euclideanDistanceFromCell: cell1 toCell: cell2 [
	"Purpose: return the euclidian distance (unit = cell) using the Euclidean distance formula : square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]"
	
	^self spaceModel euclideanDistanceFromCell: cell1 toCell: cell2
]

{ #category : 'utilities - files' }
CMAbstractModel >> getAttributesType: attributes fromInstances: instanceCollection [
	
	| firstInstance firstValue type dicoAttConv |
	dicoAttConv := Dictionary new.
	attributes
		do:
			[:att | 
			firstInstance := instanceCollection
				detect: [:p | (p perform: att asSymbol) isNil not]
				ifNone: [nil].
			firstInstance isNil
				ifTrue: [firstValue := nil]
				ifFalse: [firstValue := firstInstance perform: att asSymbol].
			firstValue isSymbol
				ifTrue:
					[type := '(Symbol)'.
					dicoAttConv
						at: att asSymbol
						put: #(#asString '(Symbol)')]
				ifFalse:
					[firstValue isNumber
						ifTrue:
							[type := '(Number)'.
							dicoAttConv
								at: att asSymbol
								put: #(#printString '(Number)')]
						ifFalse:
							[firstValue isString
								ifTrue:
									[type := '(String)'.
									dicoAttConv
										at: att asSymbol
										put: #(#asString '(String)')]
								ifFalse:
									[(firstValue isKindOf: Boolean)
										ifTrue:
											[type := '(Boolean)'.
											dicoAttConv
												at: att asSymbol
												put: #(#printString '(Boolean)')]
										ifFalse:
											[type := '(nil)'.
											dicoAttConv
												at: att asSymbol
												put: #(#printString '(nil)')]]]]].
	^dicoAttConv
]

{ #category : 'accessing - entities' }
CMAbstractModel >> getterForEntityClass: aClass [
	
	^ entityGetters at: aClass name
		ifAbsent: [ self error: 'Getter for class #', aClass name, ' was not found in the dictionary' ].
]

{ #category : 'init-release entities' }
CMAbstractModel >> initEntities [
	"Initialize all the Entity classes of the model"

	"Remove all the entities from previous simulation and reset the ID counter"

	self agentClasses do: [ :aClass |
		self initializeAgentsOfClass: aClass ].
	self class allEntityClasses do: [ :cl | self resetEntities: cl ]
]

{ #category : 'initialization' }
CMAbstractModel >> initialize [

	super initialize.
	self initializeModelClasses.
	self initializeWithoutParameters.
	self initializeParameters.
]

{ #category : 'accessing' }
CMAbstractModel >> initializeAgentsOfClass: aClass [

	(aClass isAbstract not and: [ aClass isLocated ]) ifTrue: [ 
		(self entitiesOfClass: aClass) do: [ :each | each leave ] ].
		
	self resetEntities: aClass
]

{ #category : 'initialization' }
CMAbstractModel >> initializeEntityGetters [
	"Create a dictionary of getters for entity classes based on accessors with pragmas"

	| pragmas className selector |
	pragmas := Pragma allNamed: #getterFor: in: self class.
	
	entityGetters := Dictionary newFrom: (pragmas collect: [ :pragma |
		className := pragma arguments first.
		selector := pragma method selector.
		
		className -> selector ])
]

{ #category : 'initialization' }
CMAbstractModel >> initializeModelClasses [

	| classes |
	
	classes := self class allEntityClasses.
	
	self cellClass: (classes
		detect: [ :each | each inheritsFrom: CMSpatialEntityElement ]
		ifNone: [ nil ]).
	
	self agentClasses: (classes select: [ : each | each inheritsFrom: CMAgent ]).
]

{ #category : 'initialization' }
CMAbstractModel >> initializeParameters [

	self class initializeParameters. 
]

{ #category : 'initialization' }
CMAbstractModel >> initializeSpaceModel [
	" Private - Setup the receiver's space model only if the model has a spatial entity cell class defined "

	self cellClass ifNil: [ ^ nil ].
	self spaceModel: (CMSpaceModel forModel: self).

]

{ #category : 'initialization' }
CMAbstractModel >> initializeWithoutParameters [

	super initialize.
	self randomNumberGenerator: PMFishmanMooreRandomGenerator new.
	
	self initializeEntityGetters.
	self initializeSpaceModel.

]

{ #category : 'accessing - entities' }
CMAbstractModel >> lowerLeftCell [
	"Purpose: returns the cell located at the lower left location of the spatial grid"

	^ self spaceModel lowerLeftCell
]

{ #category : 'accessing - entities' }
CMAbstractModel >> lowerRightCell [
	"Purpose: returns the cell located at the lower right location of the spatial grid"

	^ self spaceModel lowerRightCell
]

{ #category : 'utilities - space metrics' }
CMAbstractModel >> nearestNeighbourProbaAttribute: anAttribute state1: x1 state2: x2 [
	"Purpose: Return the probability to have aCell having x2 as value for anAttribute in the direct neighbourhood (distance = 1) of aCell which has x1 as value for anAttribute.
Argument: anAttribute is the name of the attribute, ex #state, X1 and x2 being two possible values.
Example: self nearestNeighbourProbaAttribute: #landUse state1: #field state2: #forest"
	
	^self spaceModel nearestNeighbourProbaAttribute: anAttribute state1: x1
		state2: x2
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> newEntity: aClass [
	"Creates a new instance of aClass and collects it, immediately, at the level of theXXXs collection."

	| anEntity |
	anEntity := aClass basicNew
		            cormasModel: self;
		            randomNumberGenerator: randomNumberGenerator;
		            initialize;
		            yourself.

	self collectEntity: anEntity.
	^ anEntity
]

{ #category : 'instance creation - agents & objects' }
CMAbstractModel >> newEntity: aClass locatedAt: aCell [
	"Creates a new instance of aClass and collects it, immediately, at the level of theXXXs collection."

	| entity |
	entity := self newEntity: aClass.
	entity moveTo: aCell
]

{ #category : 'accessing - entities' }
CMAbstractModel >> pickCellAt: aPointLocation [
	"Purpose: return a spatialEntityElement (aCell) picked randomly from the spatial grid.
	Example: self pickCell"

	^ self cells detect: [ : cellEntity | cellEntity coordinates = aPointLocation ]
]

{ #category : 'accessing - entities' }
CMAbstractModel >> pickRandomCell [
	"Purpose: return a spatialEntityElement (aCell) picked randomly from the spatial grid.
	Example: self pickCell"

	^ self selectRandomlyFrom: self cells
]

{ #category : 'accessing - entities' }
CMAbstractModel >> pickRandomCellConstrainedBy: aBlock [
	"Purpose: return a random cell of the grid. The cell verifies the block condition.
	Example:  self pickCellConstrainedBy: [:cell | state=#land] or self pickCellConstrainedBy: [: cell | cell energy > 1] "

	^ self selectRandomlyFrom: (self cells asArray select: [ :cell | aBlock value: cell ])
]

{ #category : 'accessing - entities' }
CMAbstractModel >> pickRandomCellWithoutAnyOccupantsOfClass: aClass [
	"Return a cell (picked randomly) without any instance of aClassName"

	^ self pickRandomCellConstrainedBy: [ :cell | (cell occupantsOfClass: aClass) isEmpty ]
]

{ #category : 'accessing - entities' }
CMAbstractModel >> pickRandomCells: anInteger [
	"Return a collection of spatialEntityElements (some Cells) picked randomly from the spatial grid (without replacement)"

	^ self selectRandomlyFrom: self cells size: anInteger
]

{ #category : 'accessing - entities' }
CMAbstractModel >> pickRandomEntities: anInteger ofClass: aClass [
	"Return a collection of entities belonging to a class"

	^ self
		selectRandomlyFrom: (self allTheEntities: aClass)
		size: anInteger
]

{ #category : 'accessing - entities' }
CMAbstractModel >> pickRandomEntities: anInteger ofClass: aClass constrainedBy: aBlock [
	"Return a collection of entities belonging to a class and verifying a condition"

	^ self
		selectRandomlyFrom: ((self allTheEntities: aClass) select: [ :c | aBlock value: c ])
		size: anInteger
]

{ #category : 'accessing - entities' }
CMAbstractModel >> pickRandomEntityOfClass: aClass [
	"Return an entity belonging to a class, picked randomly"

	^ self selectRandomlyFrom: (self allTheEntities: aClass)
]

{ #category : 'accessing - entities' }
CMAbstractModel >> pickRandomEntityOfClass: aClass constrainedBy: aBlock [
	"Return a random entity belonging to a class and verifying the block condition"

	^ self selectRandomlyFrom: ((self allTheEntities: aClass) select: [ :c | aBlock value: c ])
]

{ #category : 'accessing - entities' }
CMAbstractModel >> pickRandomUnoccupiedCell [
	"Purpose: return a random cell not occuppied of the grid
	Return Value: a cell"

	^ self pickRandomCellConstrainedBy: [ :cell | cell hasNoOccupants ]
]

{ #category : 'printing' }
CMAbstractModel >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream
		space;
		<< '(entities: ';
		<< self allTheEntities size asString;
		<< ')'
]

{ #category : 'initialization' }
CMAbstractModel >> release [

	super release.
	self spaceModel release.
	self spaceModel: nil.
	
	self cells do: #initOccupants
]

{ #category : 'init-release entities' }
CMAbstractModel >> releaseAggregateType: aggregateClass [
"Delete the instances of aggregateClass, and clean up their components"
	(self entitiesOfClass: aggregateClass) do: [ :agg | agg release ].
	self resetEntities: aggregateClass
]

{ #category : 'referencing entities' }
CMAbstractModel >> removeDeadEntities [
	"removes all the dead or destroyed intances"
	
	self removeDestroyedEntities
]

{ #category : 'referencing entities' }
CMAbstractModel >> removeDestroyedEntities [
	"removes all the dead or destroyed intances"
	
	self class allEntityClasses do: [:aClass | self removeDestroyedEntities: aClass]
]

{ #category : 'referencing entities' }
CMAbstractModel >> removeDestroyedEntities: aClass [

	"removes all the dead or destroyed intances of type: aClass"

	| theEntities destroyedEntities |
	theEntities := self entitiesOfClass: aClass.
	theEntities ifNotNil: [ 
		destroyedEntities := theEntities select: [ :a | a isDead ].
		destroyedEntities do: [ :a | 
			a isSituated ifTrue: [ a leave ].
			theEntities remove: a ] ]
]

{ #category : 'referencing entities' }
CMAbstractModel >> removeEntity: anEntity [
	"removes the dead or destroyed Entity"
	
	anEntity isSituated ifTrue: [anEntity leave].
	(self entitiesOfClass: anEntity class)
		remove: anEntity
		ifAbsent: [nil]
]

{ #category : 'init-release entities' }
CMAbstractModel >> resetEntities: aClass [
	"Initialize the Entity classes of the model and creates the new collector (OrderedCollection)"
	
	| entities |
	
	entities := self entitiesOfClass: aClass.
	entities reverseDo: [:anEntity | anEntity delete].
	aClass currentId: 0.
	entities removeAll
]

{ #category : 'accessing - entities' }
CMAbstractModel >> selectCellsBetweenRow: lineNumber1 andRow: lineNumber2 column: colNumber1 andColumn: colNumber2 [
	"Purpose: Return the cells between the lines lineNumber1 and lineNumber2, and between the columns colNumber1 and colNumber2 of the spatial grid. The Cells are sorted by id.
Arguments: lineNumber1   <Integer> lineNumber = Positive Integer
Arguments: lineNumber2   <Integer> colNumber = Positive Integer
Arguments: colNumber1   <Integer> lineNumber = Positive Integer
Arguments: colNumber2   <Integer> colNumber = Positive Integer
Example:  cellsBetweenLine1: 1 line2: 6 andColumn1: 2 column2: 3  ->  a collection of cells between columns 2 and 3, and between lines 1 and 6, and ordered from line 1 to line 6"

	^ self spaceModel
		cellsBetweenRow: lineNumber1
		andRow: lineNumber2
		column: colNumber1
		andColumn: colNumber2
]

{ #category : 'accessing - entities' }
CMAbstractModel >> selectCellsInRectangleOriginCell: cell1 cornerCell: cell2 [
	"Purpose: return a collection of the cells located in a rectangle defined by an origin cell and a cell at the opposit corner of the rectangle. The collection of cells is ordered from cell1 to cell2.
	Arguments : cell1   <SpatialEntityElement>
	Arguments : cell2   <SpatialEntityElement>
	Example: self createAggregate: City from: (self selectCellsInRectangleOriginCell: self upperLeftCell  cornerCell: self pickCell)"

	^ self spaceModel cellsInRectangleFrom: cell1 to: cell2
]

{ #category : 'accessing - entities' }
CMAbstractModel >> selectCellsOfColumn: colNumber [
	"Purpose: return a collection of the cells belonging to the specified column of the spatial grid.
	Arguments: colNumber   <Integer> colNumber = Positive Integer
	Example: self ask: (self selectCellsOfColumn: 2) toDo: #flash"

	^ self spaceModel cellsOfColumn: colNumber
]

{ #category : 'accessing - entities' }
CMAbstractModel >> selectCellsOfLine: lineNumber [
	"Purpose: return a collection of the cells belonging to the specified line of the spatial grid.
	Arguments : lineNumber   <Integer> lineNumber = Positive Integer
	Example: self ask: (self selectCellsOfLine: 2) toDo: #flash"

	^ self spaceModel cellsOfRow: lineNumber
]

{ #category : 'init - spatial entities' }
CMAbstractModel >> setLinearGradientForAttribute: aString centralValue: cv borderValue: bv [
	"Purpose: Set the value of anAttribute of all spatial entity elements of the spatial grid in order to create a linear gradient for anAttribute starting from centre of the spatial grid with the value cv to the border of the spatial grid with the value bv. The horizontal and vertical grid dimensions have to be an odd number.
Arguments: cv and bv are numbers (integer or float). anAttribute is the name of the attribute as symbol. 
Example: self setLinearGradientForAttribute: #energy centralValue: 10 borderValue: 0.1"
	
	^self spaceModel setLinearGradientForAttribute: aString centralValue: cv
		borderValue: bv
]

{ #category : 'init - spatial entities' }
CMAbstractModel >> setLinearGradientForAttribute: anAttribute centralValue: cv borderValue: bv bySections: anArray [
	"Purpose: Set the value of anAttribute of all spatial entity elements of the spatial grid in order to create a gradient by layers for anAttribute starting from centre of the spatial grid with the value cv to the border of the spatial grid with the value bv. The horizontal and vertical grid dimensions have to be an odd number.
Arguments: cv and bv are numbers (integer or float). anAttribute is the name of the attribute as symbol. 
anArray is an array made of two values arrays. The first value specifies the number of layers affected and the second value is a factor affecting the gradient for the concerned layer.
Example: self setLinearGradientForAttribute: #energy centralValue: 10 borderValue: 0.1 bySections: #( #(2 0.5) #(4 1) #(2 0.5))"
	
	^self spaceModel setLinearGradientForAttribute: anAttribute centralValue:
			cv borderValue: bv bySections: anArray
]

{ #category : 'accessing - entities' }
CMAbstractModel >> setTheEntity: aClass with: aSet [
	
	^self
		perform: (self setterForEntityClass: aClass)
		with: aSet
]

{ #category : 'accessing - entities' }
CMAbstractModel >> setterForEntityClass: aClass [
	"Return a Symbol as a name for the setter accessor for the entity class aClass.
	ex : Object -> #theObjects: 

	self basicNew setterForEntityClass: Object
	"
	
	^ (self getterForEntityClass: aClass) asMutator
]

{ #category : 'accessing' }
CMAbstractModel >> spaceModel [
	
	spaceModel ifNil: [ self initializeSpaceModel ].
	^ spaceModel
]

{ #category : 'accessing' }
CMAbstractModel >> spaceModel: aSpaceModel [
	spaceModel := aSpaceModel
]

{ #category : 'control' }
CMAbstractModel >> stepAsynchronouslyCA: t [
	"Purpose: To active the transition function and to update asynchronously a cellular automata"
	
	self cells
		do:
			[:a | 
			a
				newState;
				updateState]
]

{ #category : 'control' }
CMAbstractModel >> stepEntities: aCollecOrClass [
	"Purpose: Iteration over aCollec or the entities of a class. 
	In case aCollecOrClass is a class, the entities are ordered according to their id. 
	In case aCollecOrClass is a collection of instances, the order of the collection is kept.
	
	Example: self stepEntities: Farmer
	Example: self stepEntities: (self theForagers select:[:f| f energy > 10]) "
	
	self ask: aCollecOrClass toDo: #step
]

{ #category : 'control' }
CMAbstractModel >> stepEntitiesRandom: aCollecOrClass [
	" Iterate over aCollecOrClass or the entities of a class. 
	The elements of aCollec / or the instances of the class, are randomly mixed"

	self askRandom: aCollecOrClass toDo: #step
]

{ #category : 'Olddeprecated' }
CMAbstractModel >> stepSynchronously: t [
	"Purpose: To active the transition function and to update synchronously a cellular automata
Example: See the models Conway http://cormas.cirad.fr/en/applica/conway.htm or Fire http://cormas.cirad.fr/en/applica/fireautomata.htm "
	
	self stepSynchronouslyCA: t
]

{ #category : 'control' }
CMAbstractModel >> stepSynchronouslyCA: t [
	"Purpose: To active the transition function and to update synchronously a cellular automata
Example: See the models Conway http://cormas.cirad.fr/en/applica/conway.htm or Fire http://cormas.cirad.fr/en/applica/fireautomata.htm"
	
	self cells do: [:a | a newState].
	self cells do: [:a | a updateState]
]

{ #category : 'accessing - entities' }
CMAbstractModel >> upperLeftCell [
	"Purpose: returns the cell located at the upper left location of the spatial grid"

	^ self spaceModel upperLeftCell
]

{ #category : 'accessing - entities' }
CMAbstractModel >> upperRightCell [
	"Purpose: return the cell located at the upper right location of the spatial grid"

	^ self spaceModel upperRightCell
]

{ #category : 'utilities - space metrics' }
CMAbstractModel >> wayFromCell: cell1 toCell: cell2 [
	"Purpose: return a collection of cells from cell1 to cell2 (including cell1 and cell2)"
	
	^self spaceModel wayFromCell: cell1 toCell: cell2
]

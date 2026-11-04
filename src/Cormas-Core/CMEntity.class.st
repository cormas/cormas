"
The root class of the entities of the models.
The Id of each instance of the subclass is defined at the level of the class (it is not an OID) and reset at each simulation initialisation.


Subclasses must implement the following messages:
	Instance protocol:
		init
			initId
	Class protocol:
		accessing
			CurrentId


Instance Variables:
	id	<Integer>  The Id of each instance of the subclass is defined at the level of the class (it is not an OID) and reset at each simulation initialisation.
	flag	<Boolean>  Used to perform some processes
	request	<OrderedCollection>  Each element is an array made of three items: <Symbol> <Number> <Entity>. The first item is the name ot the common-pool resource stored by the entity, the second one is a quantity of CPR, the last one is the requester (an instance of Entity) of that amount of CPR


Class Instance Variables:
	isGeneric	<Boolean>  comment
	activePov	<Symbol>  The current pov. ex: #pov
	colorsDict	<Dictionary>  a Dictionary with the ColorValue of the activePov.
				ex: Dictionary (#alive->(ColorValue red: 0.0 green: 0.670004 blue: 0.0) 
									    #dead->ColorValue black )
	image	<Image>  of the entity
	pdvDict	<Dictionary>  ex: Dictionary (#pov->OrderedCollection () )
	activeProbes	<OrderedCollection>  ex: OrderedCollection (#isAlive)

"
Class {
	#name : 'CMEntity',
	#superclass : 'Object',
	#traits : 'TCMRandom + TCMMath',
	#classTraits : 'TCMRandom classTrait + TCMMath classTrait',
	#instVars : [
		'id',
		'context',
		'cormasModel',
		'group',
		'links'
	],
	#classInstVars : [
		'currentId',
		'activePovSelector'
	],
	#category : 'Cormas-Core-Entities',
	#package : 'Cormas-Core',
	#tag : 'Entities'
}

{ #category : 'accessing' }
CMEntity class >> activePovSelector [

	^ activePovSelector ifNil: [ activePovSelector := #pov ]
]

{ #category : 'accessing' }
CMEntity class >> activePovSelector: aSymbol [

	(self availablePov includes: aSymbol)
		ifFalse: [ ^ self inform: 'The class ' , self name , ' does not have a pov called ' , aSymbol ].

	activePovSelector := aSymbol
]

{ #category : 'accessing - methods & classes' }
CMEntity class >> availablePov [
	"Purpose: returns the list of available pov methods
	Return value: <OrderedCollection>"
	
	| pragmas |
	pragmas := Pragma allNamed: 'pov' from: self to: CMEntity.

	^ (pragmas collect: [ :pragma |
		pragma method selector ]) asSet asOrderedCollection
]

{ #category : 'as yet unclassified' }
CMEntity class >> classSideParameters [

	^ self parameters select: [ :p | p isClassSide ]
]

{ #category : 'accessing' }
CMEntity class >> currentId [
	"Getter accessor with default value = 0 "
	
	^ currentId ifNil: [ currentId := 0]
]

{ #category : 'accessing' }
CMEntity class >> currentId: anInteger [
	
	currentId := anInteger. 
	^ anInteger
]

{ #category : 'accessing - methods & classes' }
CMEntity class >> genericEntities [
	
	| kernel |
	kernel := self package classes.
	^ self withAllSubclasses select: [ :cl | cl package classes = kernel]
]

{ #category : 'as yet unclassified' }
CMEntity class >> instanceSideParameters [

	^ self parameters select: [ :p | p isInstanceSide ]
]

{ #category : 'testing' }
CMEntity class >> isAbstract [
	"Purpose: to test the existence of subclasses"
	
	^self subclasses notEmpty
]

{ #category : 'testing' }
CMEntity class >> isLocated [

	^ false
]

{ #category : 'testing' }
CMEntity class >> isSpatialClass [
	
	^false
]

{ #category : 'testing' }
CMEntity class >> isSpatialEntityElementClass [
	
	^false
]

{ #category : 'utilities - classes' }
CMEntity class >> modelClass [
	"Purpose: returns the Class of the current model.
	Return value: <class>
	Example: CMECECRestrained modelClass -> ECEC "

	^ self package classes
		detect: [ :cl | cl superclass = CMModel ]
		ifNone: [ nil ]
]

{ #category : 'accessing' }
CMEntity class >> parameters [
	"Collect all parameters of this entity. Those are all parameters defined by its class or any of its superclasses. If parameter of a superclass is redefined by one of its subclasses, keep only the final definition"
		
	| classes parameters |
	classes := self allSuperclassesIncluding: CMEntity.
	classes addFirst: self.
	
	parameters := OrderedCollection new.
	
	classes do: [ :aClass |
		(CMParameter collectAllParametersFrom: aClass) do: [ :parameter |
			(parameters noneSatisfy: [ :existingParameter |
				existingParameter getterSelector = parameter getterSelector ])
				ifTrue: [ parameters add: parameter ] ] ].
		
	^ parameters
]

{ #category : 'accessing' }
CMEntity class >> resetActivePovSelector [

	activePovSelector := nil
]

{ #category : 'initialization' }
CMEntity class >> resetClassSideParameters [

	self parameters do: [ :parameter |
		parameter isClassSide ifTrue: [ 
			parameter setDefaultValueFor: self ] ]
]

{ #category : 'pragmas' }
CMEntity >> actionSelectors [

	^ (Pragma allNamed: 'action' from: self class to: CMEntity)
		collect: [ :each | each method selector ]
]

{ #category : 'pov' }
CMEntity >> activePov [
	"Answer the point of view currently selected for the class of the receiver. This is how visualizations should ask an entity how to display itself."

	^ self perform: self class activePovSelector
]

{ #category : 'links - private' }
CMEntity >> addLink: aLink [

	links ifNil: [ links := OrderedCollection new ].
	links add: aLink
]

{ #category : 'converting' }
CMEntity >> asString [
	" After adding the name of this entity, add its id "

	^ String streamContents: [ : stream |
		stream 
			<< super asString;
			crtab;		
			<< 'id: ';
			<< id asString ]
	
]

{ #category : 'accessing' }
CMEntity >> classSideParameters [

	^ self class classSideParameters
]

{ #category : 'accessing' }
CMEntity >> cormasModel [
	^ cormasModel
]

{ #category : 'accessing' }
CMEntity >> cormasModel: aCMAbstractModel [
	cormasModel := aCMAbstractModel
]

{ #category : 'accessing' }
CMEntity >> currentTimeStep [
	<api>
	^ context currentTimeStep
]

{ #category : 'controlling' }
CMEntity >> delete [
	"Purpose: indicates that the instance has to be removed"
	
	self isDead: true
]

{ #category : 'initialize-release' }
CMEntity >> destroyed [
	"Answer if the entity is destroyed or not"
	
	self subclassResponsibility
]

{ #category : 'links - direct entities' }
CMEntity >> entitiesLinkedBy: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to follow. Instances of its subclasses are followed too'>
	<returnType: #OrderedCollection description:
	'The entities directly linked to this one by links of the given class, in either direction'>
	<doc:
	'Answer a new collection with the entities at the other end of the links of the given class, or of its subclasses, in either direction. Each entity appears once, in the order its first link was created. Dead entities appear until they are removed from the model.'>
	<example: 'self entitiesLinkedBy: Trust'>
	<seeAlso:
	#( linkedEntities nextEntitiesLinkedBy: previousEntitiesLinkedBy:
	   allEntitiesLinkedBy: linksOfClass: )>
	^ self otherEndsOf: (self linksOfClass: aLinkClass)
]

{ #category : 'accessing' }
CMEntity >> group [

	^ group
]

{ #category : 'accessing' }
CMEntity >> group: aGroup [

	group := aGroup
]

{ #category : 'accessing' }
CMEntity >> id [
	"Purpose: integer value, assigned at creation, used to identify the instance"
	
	^id
]

{ #category : 'accessing' }
CMEntity >> id: aNumber [

	id := aNumber
]

{ #category : 'links - direct links' }
CMEntity >> incomingLinks [

	<api>
	<returnType: #OrderedCollection description:
	'The links that lead to the entity'>
	<doc:
	'Answer a new collection with the links that lead to this entity, of every class. These are the directed links ending here and all the undirected links, which go both ways.'>
	<example: 'self incomingLinks'>
	<example: 'self incomingLinks isEmpty'>
	<seeAlso:
	#( incomingLinksOfClass: outgoingLinks links previousEntities )>
	^ self links select: [ :each | each isIncomingTo: self ]
]

{ #category : 'links - direct links' }
CMEntity >> incomingLinksOfClass: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to answer. Instances of its subclasses are included'>
	<returnType: #OrderedCollection description:
	'The links of the given class that lead to the entity'>
	<doc:
	'Answer a new collection with the links of the given class, or of its subclasses, that lead to this entity. These are the directed links ending here and all the undirected links, which go both ways.'>
	<example: 'self incomingLinksOfClass: River'>
	<example: '(self incomingLinksOfClass: River) isEmpty'>
	<seeAlso:
	#( incomingLinks outgoingLinksOfClass: linksOfClass: previousEntitiesLinkedBy: )>
	^ self incomingLinks select: [ :each | each isKindOf: aLinkClass ]
]

{ #category : 'initialization' }
CMEntity >> initialize [

	super initialize.
	self initializeEntityId.
	self initializeInstanceSideParameters
]

{ #category : 'initialize-release' }
CMEntity >> initializeEntityId [
	" Private - Set the receiver's internal identifier. "

	self id: (self class currentId: self class currentId + 1)
]

{ #category : 'initialization' }
CMEntity >> initializeInstanceSideParameters [

	self instanceSideParameters do: [ :p | p setDefaultValueFor: self ]
]

{ #category : 'accessing' }
CMEntity >> instanceSideParameters [

	^ self class instanceSideParameters
]

{ #category : 'initialize-release' }
CMEntity >> isDead: aBoolean [
	
	aBoolean ifTrue: [self release]
]

{ #category : 'testing' }
CMEntity >> isLink [

	^ false
]

{ #category : 'testing' }
CMEntity >> isOnGrid [

	<api>
	<returnType: #Boolean description:
	'Whether the entity currently has a location on the spatial grid'>
	<doc:
	'Answer whether the entity is currently located on the spatial grid. An entity can be on the grid and still be invisible, or be off the grid and still exist in the model.

An agent is on the grid while it has a cell, a cell when it belongs to a grid, and an aggregate when it has at least one cell. Other entities are not on the grid.'>
	<example: 'self isOnGrid'>
	<example: '(self agents select: [ :each | each isOnGrid ]) size'>
	^ false
]

{ #category : 'testing' }
CMEntity >> isSituated [
	
	^false
]

{ #category : 'testing' }
CMEntity >> isSpatialEntity [
	
	^false
]

{ #category : 'testing' }
CMEntity >> isSpatialEntityElement [
	
	^false
]

{ #category : 'testing' }
CMEntity >> isSpatialEntitySet [
	
	^false
]

{ #category : 'links - direct entities' }
CMEntity >> linkedEntities [

	<api>
	<returnType: #OrderedCollection description:
	'The entities directly linked to this one, in either direction'>
	<doc:
	'Answer a new collection with the entities at the other end of the links of this entity, in either direction. Each entity appears once, in the order its first link was created.

This follows every kind of link, so adding a new link class to a model changes the answer. Use entitiesLinkedBy: to follow only one kind. Dead entities appear until they are removed from the model.'>
	<example: 'self linkedEntities'>
	<seeAlso:
	#( entitiesLinkedBy: nextEntities previousEntities allLinkedEntities
	   links )>
	^ self otherEndsOf: self links
]

{ #category : 'links - direct links' }
CMEntity >> links [

	<api>
	<returnType: #OrderedCollection description:
	'All the links of the entity, in either direction'>
	<doc:
	'Answer a new collection with all the links that have this entity at one of their ends, of every class and in either direction.'>
	<example: 'self links'>
	<example: 'self links size'>
	<seeAlso: #( linksOfClass: outgoingLinks incomingLinks allLinks )>
	^ links ifNil: [ OrderedCollection new ] ifNotNil: [ links copy ]
]

{ #category : 'links - direct links' }
CMEntity >> linksOfClass: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to answer. Instances of its subclasses are included'>
	<returnType: #OrderedCollection description:
	'The links of the entity of the given class, in either direction'>
	<doc:
	'Answer a new collection with the links of the given class, or of its subclasses, that have this entity at one of their ends, in either direction.'>
	<example: 'self linksOfClass: Road'>
	<seeAlso: #( links outgoingLinksOfClass: incomingLinksOfClass:
	   allLinksOfClass: )>
	^ self links select: [ :each | each isKindOf: aLinkClass ]
]

{ #category : 'links - direct entities' }
CMEntity >> nextEntities [

	<api>
	<returnType: #OrderedCollection description:
	'The entities that the links of this entity lead to'>
	<doc:
	'Answer a new collection with the entities that the outgoing links of this entity lead to, one step away. Each entity appears once, in the order its first link was created.

This follows every kind of link, so adding a new link class to a model changes the answer. Use nextEntitiesLinkedBy: to follow only one kind. Dead entities appear until they are removed from the model.'>
	<example: 'self nextEntities'>
	<seeAlso: #( nextEntitiesLinkedBy: previousEntities linkedEntities
	   allDownstreamEntities outgoingLinks )>
	^ self otherEndsOf: self outgoingLinks
]

{ #category : 'links - direct entities' }
CMEntity >> nextEntitiesLinkedBy: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to follow. Instances of its subclasses are followed too'>
	<returnType: #OrderedCollection description:
	'The entities that the links of the given class lead to'>
	<doc:
	'Answer a new collection with the entities that the outgoing links of the given class, or of its subclasses, lead to, one step away. Each entity appears once, in the order its first link was created. Dead entities appear until they are removed from the model.'>
	<example: 'self nextEntitiesLinkedBy: River'>
	<seeAlso:
	#( nextEntities previousEntitiesLinkedBy: entitiesLinkedBy:
	   allDownstreamEntitiesLinkedBy: outgoingLinksOfClass: )>
	^ self otherEndsOf: (self outgoingLinksOfClass: aLinkClass)
]

{ #category : 'links - private' }
CMEntity >> otherEndsOf: aCollectionOfLinks [
	"Answer the entities at the far end of the given links, each one once, in the order of the links"

	| entities |
	entities := OrderedCollection new.
	aCollectionOfLinks do: [ :each |
			| otherEnd |
			otherEnd := each otherEndOf: self.
			(entities identityIncludes: otherEnd) ifFalse: [
				entities add: otherEnd ] ].
	^ entities
]

{ #category : 'links - direct links' }
CMEntity >> outgoingLinks [

	<api>
	<returnType: #OrderedCollection description:
	'The links that lead away from the entity'>
	<doc:
	'Answer a new collection with the links that lead away from this entity, of every class. These are the directed links starting here and all the undirected links, which go both ways.'>
	<example: 'self outgoingLinks'>
	<seeAlso: #( outgoingLinksOfClass: incomingLinks links nextEntities )>
	^ self links select: [ :each | each isOutgoingFrom: self ]
]

{ #category : 'links - direct links' }
CMEntity >> outgoingLinksOfClass: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to answer. Instances of its subclasses are included'>
	<returnType: #OrderedCollection description:
	'The links of the given class that lead away from the entity'>
	<doc:
	'Answer a new collection with the links of the given class, or of its subclasses, that lead away from this entity. These are the directed links starting here and all the undirected links, which go both ways.'>
	<example: 'self outgoingLinksOfClass: River'>
	<seeAlso:
	#( outgoingLinks incomingLinksOfClass: linksOfClass: nextEntitiesLinkedBy: )>
	^ self outgoingLinks select: [ :each | each isKindOf: aLinkClass ]
]

{ #category : 'accessing' }
CMEntity >> parameters [

	^ self class parameters
]

{ #category : 'accessing' }
CMEntity >> pov [
	"Default point of view"
	<pov>
	^ CMPointOfView new
]

{ #category : 'pov' }
CMEntity >> povClassName [
	"Assign unique color to each class name"
	
	<pov>
	^ CMPointOfView color: (CMColor colorOfNumber: self class name hash)
]

{ #category : 'pov' }
CMEntity >> povId [
	"Purpose: Returns a Color from the existing 31 constant names: #(#black #blue #brown #chartreuse #cyan #darkCyan #darkGray #darkGreen #darkMagenta #darkRed #gray #green #lightCyan #lightGray #lightYellow #magenta #navy #olive #orange #orchid #paleGreen #pink #purple #red #royalBlue #salmon #springGreen #veryDarkGray #veryLightGray #white #yellow). The id is used to determine the index at which the color name is picked in the array. 
Example: for an instance with id = 65, the returned color will be brown (65= 2*31+3)"

	<pov>
	^ CMPointOfView color: (CMColor colorOfNumber: self id)
]

{ #category : 'pov' }
CMEntity >> povInvisible [

	<pov>
	^ CMPointOfView color: Color transparent
]

{ #category : 'links - direct entities' }
CMEntity >> previousEntities [

	<api>
	<returnType: #OrderedCollection description:
	'The entities whose links lead to this entity'>
	<doc:
	'Answer a new collection with the entities that the incoming links of this entity come from, one step away. Each entity appears once, in the order its first link was created.

This follows every kind of link, so adding a new link class to a model changes the answer. Use previousEntitiesLinkedBy: to follow only one kind. Dead entities appear until they are removed from the model.'>
	<example: 'self previousEntities'>
	<seeAlso: #( previousEntitiesLinkedBy: nextEntities linkedEntities
	   allUpstreamEntities incomingLinks )>
	^ self otherEndsOf: self incomingLinks
]

{ #category : 'links - direct entities' }
CMEntity >> previousEntitiesLinkedBy: aLinkClass [

	<api>
	<argument: #aLinkClass type: #Class description:
	'The class of links to follow. Instances of its subclasses are followed too'>
	<returnType: #OrderedCollection description:
	'The entities whose links of the given class lead to this entity'>
	<doc:
	'Answer a new collection with the entities that the incoming links of the given class, or of its subclasses, come from, one step away. Each entity appears once, in the order its first link was created. Dead entities appear until they are removed from the model.'>
	<example: 'self previousEntitiesLinkedBy: River'>
	<seeAlso:
	#( previousEntities nextEntitiesLinkedBy: entitiesLinkedBy:
	   allUpstreamEntitiesLinkedBy: incomingLinksOfClass: )>
	^ self otherEndsOf: (self incomingLinksOfClass: aLinkClass)
]

{ #category : 'printing' }
CMEntity >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream
		space; 
		<< $-;
		<< 'id: ';
		<< self id asString
]

{ #category : 'links - private' }
CMEntity >> removeLink: aLink [

	links remove: aLink ifAbsent: [ ]
]

{ #category : 'initialize-release' }
CMEntity >> removedFromModel [
	"The model has just stopped holding me, so my links can no longer exist. This holds for every way of removing an entity"

	links ifNotNil: [ links copy do: [ :each | each delete ] ]
]

{ #category : 'accessing' }
CMEntity >> simulationContext [
	<api>
	^ context 
]

{ #category : 'accessing' }
CMEntity >> simulationContext: aContext [

	context := aContext 
]

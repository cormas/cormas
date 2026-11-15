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
	image	<Image>  of the entity
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
		'group'
	],
	#classInstVars : [
		'currentId',
		'instanceSideParameters'
	],
	#category : 'Cormas-Core-Entities',
	#package : 'Cormas-Core',
	#tag : 'Entities'
}

{ #category : 'aspects' }
CMEntity class >> aspectSelectors [
	"Answer the selectors of my aspects, the ones I define and the ones I inherit, sorted"

	^ ((Pragma allNamed: #aspect from: self to: CMEntity)
		   collect: [ :each | each method selector ]
		   as: Set) asArray sorted
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

{ #category : 'parameters' }
CMEntity class >> instanceSideParameters [
	"Collected once, because each new entity needs them. A new model collects them again (see resetParameters), so that changes to their definitions are taken into account"

	^ instanceSideParameters ifNil: [
			  instanceSideParameters := self parameters select: [ :p |
				                            p isInstanceSide ] ]
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

{ #category : 'aspects' }
CMEntity class >> lookClass [
	"Answer the class of the looks that describe how my instances appear in a view"

	^ self subclassResponsibility
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

{ #category : 'aspects' }
CMEntity class >> nameOfAspect: aSelector [
	"Answer the words of aSelector without its aspect prefix and its colon: #aspectClassName: is named 'Class name'"

	| words |
	words := (((aSelector withoutPrefix: 'aspect') withoutSuffix: ':')
		          piecesCutWhere: [ :a :b | b isUppercase ]) collect: [
		         :each | each asLowercase ].
	words at: 1 put: words first capitalized.
	^ ' ' join: words
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

{ #category : 'parameters' }
CMEntity class >> resetParameters [
	"Set my class-side parameters to their default values, and collect my instance-side parameters again, since their definitions may have changed"

	| parameters |
	parameters := self parameters.
	instanceSideParameters := parameters select: [ :p | p isInstanceSide ].
	parameters do: [ :parameter |
		parameter isClassSide ifTrue: [ parameter setDefaultValueFor: self ] ]
]

{ #category : 'pragmas' }
CMEntity >> actionSelectors [

	^ (Pragma allNamed: 'action' from: self class to: CMEntity)
		collect: [ :each | each method selector ]
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

{ #category : 'aspects' }
CMEntity >> aspectClassName: look [
	"Give all the entities of a class the same color, and different classes different colors"

	<aspect>
	look colorGroupedBy: self class name
]

{ #category : 'aspects' }
CMEntity >> aspectDefault: look [
	"Leave the look with its defaults. Redefine this aspect in a subclass to change how its instances appear when no other aspect is chosen"

	<aspect>
	
]

{ #category : 'aspects' }
CMEntity >> aspectId: look [
	"Give each entity its own color, chosen by its id"

	<aspect>
	look colorGroupedBy: self id
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
CMEntity >> isLinkable [

	<api>
	<returnType: #Boolean description:
	'Whether the entity can be an end of a link'>
	<doc:
	'Answer whether the entity can be an end of a link. Things such as cells, agents and aggregates can. A link cannot, because it is a connection and not a thing.'>
	<example: 'self isLinkable'>
	<seeAlso: #( isOnGrid )>
	^ false
]

{ #category : 'testing' }
CMEntity >> isNetwork [

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

{ #category : 'accessing' }
CMEntity >> parameters [

	^ self class parameters
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

{ #category : 'initialize-release' }
CMEntity >> removedFromModel [
	"The model has just stopped holding me. Every way of removing an entity sends me this once"
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

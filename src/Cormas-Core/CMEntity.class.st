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
		'group'
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

{ #category : 'accessing' }
CMEntity class >> systemIconName [

	^ #cormasIcon
]

{ #category : 'as yet unclassified' }
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

{ #category : 'as yet unclassified' }
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
	self initializeInstanceSideParameters.
	self class resetActivePovSelector
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

{ #category : 'as yet unclassified' }
CMEntity >> instanceSideParameters [

	^ self class instanceSideParameters
]

{ #category : 'initialize-release' }
CMEntity >> isDead: aBoolean [
	
	aBoolean ifTrue: [self release]
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

{ #category : 'as yet unclassified' }
CMEntity >> simulationContext [
	<api>
	^ context 
]

{ #category : 'as yet unclassified' }
CMEntity >> simulationContext: aContext [

	context := aContext 
]

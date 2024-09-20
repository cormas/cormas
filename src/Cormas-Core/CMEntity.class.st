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
		'flag',
		'cormasModel'
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

{ #category : 'utilities - colors' }
CMEntity class >> colorNames [
    | colorSpecs |
    colorSpecs := Color defaultColors, Color defaultColors2, Color defaultColors3, Color defaultColors4.
    ^ Array streamContents: [:stream | 1 to: colorSpecs size by: 4 do: [ :i | stream nextPut: (colorSpecs at: i) ]]
]

{ #category : 'utilities - colors' }
CMEntity class >> colorOfNumber: aNumber [
	"Purpose: Returns a Color from the existing 38 constant names: #(#black #veryVeryDarkGray #veryDarkGray #darkGray #gray #lightGray #veryLightGray #veryVeryLightGray #white #red #yellow #green #cyan #blue #magenta #brown #orange #lightRed #lightYellow #lightGreen #lightCyan #lightBlue #lightMagenta #lightBrown #lightOrange #pink #purple #tan #veryPaleRed #paleYellow #paleTan #paleRed #palePeach #paleOrange #paleMagenta #paleGreen #paleBuff #paleBlue).
	Argument: aNumber = <Integer> is the index at which the color name is picked in the array. It can be greater than 38.
	Example: CMEntity colorOfNumber: 65  -> Color palePeach"

	^ Color
		perform:
			(self colorNames
				at: (aNumber - 1) \\ self colorNames size + 1)
				asSymbol
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

{ #category : 'utilities - colors' }
CMEntity class >> defaultColor [
	"Purpose: return the default color of the current class name.
	Example: CMEntity defaultColor => Color lightBrown ; CMFireman defaultColor => Color paleRed"

	^ self colorOfNumber: self hash
]

{ #category : 'accessing - methods & classes' }
CMEntity class >> genericEntities [
	
	| kernel |
	kernel := self package classes.
	^ self withAllSubclasses select: [ :cl | cl package classes = kernel]
]

{ #category : 'initialization' }
CMEntity class >> initializeParameters [

	"Do nothing. This method can be overriden by subclasses to initialize entity parameters. Implementors should always call super initializeParameters, same as for the initialize method"
]

{ #category : 'testing' }
CMEntity class >> isAbstract [
	"Purpose: to test the existence of subclasses"
	
	^self subclasses notEmpty
]

{ #category : 'testing' }
CMEntity class >> isCellularAutomatonClass [
	
	^false
]

{ #category : 'testing' }
CMEntity class >> isCompoundSpatialClass [
	
	^self isSpatialClass and: [self isSpatialEntityElementClass not]
]

{ #category : 'testing' }
CMEntity class >> isCormasEntityClass [

	^ true
]

{ #category : 'testing' }
CMEntity class >> isGenericEntity [
	
	^self genericEntities includes: self
]

{ #category : 'testing' }
CMEntity class >> isNodeClass [
	
	^false
]

{ #category : 'testing' }
CMEntity class >> isObjectLocationClass [
	
	^false
]

{ #category : 'testing' }
CMEntity class >> isSituatedClass [
	
	^false
]

{ #category : 'testing' }
CMEntity class >> isSpatialClass [
	
	^false
]

{ #category : 'testing' }
CMEntity class >> isSpatialEntityElementClass [
	
	^false
]

{ #category : 'testing' }
CMEntity class >> isSpatialEntitySetClass [
	
	^false
]

{ #category : 'utilities - colors' }
CMEntity class >> lightColors [
	"Purpose: Returns the light Color from the existing constant color values.
Example: CMEntity lightColors => an OrderedCollection('veryPaleRed' 'magenta' 'brown' 'red' 'paleBlue' 'palePeach' 'white' 'transparent' 'blue' 'yellow' 'lightGreen' 'purple' 'lightGray' 'paleGreen' 'paleYellow' 'paleBuff' 'tan' 'lightBlue' 'lightRed' 'paleOrange' 'paleRed' 'orange' 'lightBrown' 'lightOrange' 'paleMagenta' 'pink' 'paleTan' 'gray' 'green' 'lightMagenta' 'lightCyan' 'lightYellow' 'cyan' 'veryLightGray' 'veryVeryLightGray')"

	| colors |
	colors := Color registeredColorNames asOrderedCollection.
	colors
		removeAllSuchThat: [ :symb | 
			(symb indexOfSubCollection: 'dark' startingAt: 1) ~= 0
				or: [ (symb indexOfSubCollection: 'Dark' startingAt: 1) ~= 0 ] ].
	colors remove: #black.
	^ colors
]

{ #category : 'utilities - classes' }
CMEntity class >> modelClass [
	"Purpose: returns the Class of the current model.
	Return value: <class>
	Example: CMECECRestrained modelClass -> ECEC "

	^ self package classes
		detect: [ :cl | cl superclass = CMAbstractModel ]
		ifNone: [ nil ]
]

{ #category : 'accessing' }
CMEntity class >> resetActivePovSelector [

	activePovSelector := nil
]

{ #category : 'as yet unclassified' }
CMEntity >> actionSelectors [

	^ (Pragma allNamed: 'action' from: self class to: CMEntity)
		collect: [ :each | each method selector ]
]

{ #category : 'converting' }
CMEntity >> asString [
	" Private - See superimplementor's comment "

	^ String streamContents: [ : stream |
		stream 
			<< super asString;
			crtab;		
			<< 'id: ';
			<< id asString ]
	
]

{ #category : 'displaying' }
CMEntity >> center: x [
	"do nothing"
	
	
]

{ #category : 'displaying' }
CMEntity >> changed [
	"an entityChange of type #valueChanged is sent to the cormasModel which delays it or not and then send it to the spaceModel which will then notify the spaceInterfaces (on the server or clients side)
The notification is sent not from self but from an entityReference of self which stores the class and id of the entity. The class and id will be sent has value passMode to the remote computers while the entity will be sent has reference passMode to the remote computers. The remote  computers are supposed to use has much as possible the class and id values instead of the enity reference in order to limit the messages from the client to the server"
	
"	^self isSituated
		ifTrue:
			[self currentSimulation
				registerEntityChange: #valueChanged
				with: (EntityReference on: self patch)
				from: (EntityReference on: self)]
		ifFalse:
			[self currentSimulation
				registerEntityChange: #valueChanged
				from: (EntityReference on: self)]"
]

{ #category : 'utilities - color' }
CMEntity >> colorAttribute: aSymbol min: minValue color: startColor max: maxValue color: stopColor [
	"Purpose: returns a color among a palette of colors correlatively to the value of the attribute.
Arguments: aSymbol = <Symbol>, the name of the attribute
			minValue = <Integer>, the minimum value of the attribute
		 	maxValue = <Integer>, the maximum value of the attribute
			startColor = <ColorValue  or Symbol>, the color associated to the minimum value of the attribute
			stopColor = <ColorValue  or Symbol>, the color associated to the maximum value of the attribute
Return value: a colorValue"
	
	^self
		colorValue: (self perform: aSymbol)
		min: minValue
		color: startColor
		max: maxValue
		color: stopColor
]

{ #category : 'utilities - color' }
CMEntity >> colorAttribute: aSymbol min: minValue max: maxValue color: baseColor [
	"Purpose: returns a color among a gradient correlatively to the value of the attribute.
Arguments: aSymbol = <Symbol>, the name of the attribute
			minValue = <Integer>, the minimum value of the attribute
		 	maxValue = <Integer>, the maximum value of the attribute
			color = <ColorValue  or Symbol>, the color itself or its name
Return value: a colorValue"
	
	^self
		colorValue: (self perform: aSymbol)
		min: minValue
		max: maxValue
		color: baseColor
]

{ #category : 'utilities - color' }
CMEntity >> colorFromName: aName [
	"returns a specific color from a name"

	^ self colorOfNumber: aName hash
]

{ #category : 'utilities - color' }
CMEntity >> colorId [
	"Returns a Color from the id (there is only 38 colors)."

	^ self colorOfNumber: self id
]

{ #category : 'utilities - color' }
CMEntity >> colorOfNumber: aNumber [
	"Returns a Color for aNumber (there is only 38 colors)."

	^ self class colorOfNumber: aNumber
]

{ #category : 'utilities - color' }
CMEntity >> colorValue: aValue min: minValue color: startColor max: maxValue color: stopColor [
	"Return a Color associated to aValue amongs a palette of colors.
aValue = <Number> ; minValue = <Integer> ; maxValue = <Integer> ; startColor = <Color or Symbol> ; stopColor = <Color  or Symbol>"

	| alpha rv gv bv value start_Color stop_Color |
	(aValue isNil or: [ aValue isNumber not ]) ifTrue: [ ^ Color white ].
	value := aValue max: minValue.
	value := aValue min: maxValue.
	start_Color := Color colorFrom: startColor.
	stop_Color := Color colorFrom: stopColor.
	alpha := value - minValue / (maxValue - minValue).
	rv := (stop_Color red * alpha)
	      + (start_Color red * (1 - alpha)).
	gv := (stop_Color green * alpha)
	      + (start_Color green * (1 - alpha)).
	bv := (stop_Color blue * alpha)
	      + (start_Color blue * (1 - alpha)).
	^ Color r: rv g: gv b: bv
]

{ #category : 'utilities - color' }
CMEntity >> colorValue: aValue min: minValue max: maxValue color: baseColor [

	"Return a Color for aValue, in the interval of minValue and maxValue. 
Works even if this value is less or up to minValue or maxValue
aValue = <Number> ; minValue = <Integer> ; maxValue = <Integer> ; baseColor = <ColorValue  or Symbol>"

	| index value color |
	(aValue isNil or: [ aValue isNumber not ]) ifTrue: [ 
		^ Color white ].
	value := aValue.
	value := value max: minValue.
	value := value min: maxValue.
	index := maxValue = minValue
		         ifTrue: [ 0.8 ]
		         ifFalse: [ maxValue - value / (maxValue - minValue) ].
	color := Color colorFrom: baseColor.
	^ Color
		  h: color hue
		  s: color saturation * (1 - (index raisedTo: 10))
		  v: color brightness * index
]

{ #category : 'accessing' }
CMEntity >> cormasModel [
	^ cormasModel
]

{ #category : 'accessing' }
CMEntity >> cormasModel: aCMAbstractModel [
	cormasModel := aCMAbstractModel
]

{ #category : 'controlling' }
CMEntity >> delete [
	"Purpose: indicates that the instance has to be removed"
	
	self destroyed: true
]

{ #category : 'initialize-release' }
CMEntity >> destroyed [
	"Answer if the entity is destroyed or not"
	
	self subclassResponsibility
]

{ #category : 'initialize-release' }
CMEntity >> destroyed: aBoolean [
	
	aBoolean ifTrue: [self release]
]

{ #category : 'accessing' }
CMEntity >> flag [
	
	^flag
]

{ #category : 'accessing' }
CMEntity >> flag: aValue [
	
	flag := aValue
]

{ #category : 'displaying' }
CMEntity >> getInfoFor: aSelectorName [
	"Returns a String according to the aSelectorName.
aSelectorName = <ByteSymbol>."
	
	| info |
	aSelectorName = #nil ifTrue: [^''].
	aSelectorName ifNil: [^''].
	info := self perform: aSelectorName.
	info isString ifTrue: [^info].
	info isSymbol ifTrue: [^info asString].
	^info printString
]

{ #category : 'displaying' }
CMEntity >> getPovResultFor: selectorName [
	"Returns the povSymbol for a selectorName"
	
	selectorName ifNil: [^nil].
	^selectorName = #nil
		ifFalse:
			[self perform: selectorName	"ifNil:
					[Dialog warn: 'The pov metod #' , selectorName , ' did not return a symbol or a colorValue, but a nil value.
This is not allowed!']"]
		ifTrue: [selectorName]
]

{ #category : 'accessing' }
CMEntity >> hasCustomShape [

	^ false
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

{ #category : 'initialize-release' }
CMEntity >> init [
	
	
]

{ #category : 'initialize-release' }
CMEntity >> initId [
	" Private - Set the receiver's internal identifier. "

	self id: (self class currentId: self class currentId + 1)
]

{ #category : 'initialization' }
CMEntity >> initialize [

	super initialize.
	self initId.
	self class resetActivePovSelector
]

{ #category : 'printing' }
CMEntity >> interestingDetails [
	" Answer a <Collection> of interesting receiver's attributes, from a modeler point of view, to display in a popup for example "

	^ { 
		'Id: ' -> (self id)
		}
]

{ #category : 'testing' }
CMEntity >> isAgent [
	
	^false
]

{ #category : 'testing' }
CMEntity >> isArcEntity [
	
	^false
]

{ #category : 'utilities - attributes' }
CMEntity >> isAttributeValueABoolean: aSymbol [
	
	| aClass |
	aClass := (self perform: aSymbol) class.
	^aClass = Boolean or: [aClass inheritsFrom: Boolean]
]

{ #category : 'utilities - attributes' }
CMEntity >> isAttributeValueANumber: aSymbol [
	
	| aClass |
	aClass := (self perform: aSymbol) class.
	^aClass = Number or: [aClass inheritsFrom: Number]	"or:[(aValue contains: [:char | char isDigit not and:[char ~= $.]]) not]"
]

{ #category : 'utilities - attributes' }
CMEntity >> isAttributeValueASymbol: aSymbol [
	
	| aClass |
	aClass := (self perform: aSymbol) class.
	^aClass = Symbol or: [aClass inheritsFrom: Symbol]
]

{ #category : 'testing' }
CMEntity >> isCellularAutomatonCell [
	
	^false
]

{ #category : 'testing' }
CMEntity >> isCommunicatingEntity [
	
	^false
]

{ #category : 'testing' }
CMEntity >> isCormasEntity [

	^ true
]

{ #category : 'testing' }
CMEntity >> isLocatedEntity [
	
	^false
]

{ #category : 'testing' }
CMEntity >> isObjectLocation [
	
	^false
]

{ #category : 'testing' }
CMEntity >> isPassiveObject [
	
	^false
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
CMEntity >> modelClass [
	"Purpose: returns the Class of the current model
	Return value: a class
	Example: self modelClass -> ECEC"

	^ cormasModel ifNotNil: #class ifNil: [ self class modelClass ]
]

{ #category : 'accessing' }
CMEntity >> parameters [
	"Find all instance variables that have getter and setter accessors"
	
	| relevantClasses slots |
	
	relevantClasses := self class withAllSuperclasses
		select: [ :each | each package = self class package ].
	
	slots := relevantClasses flatCollect: #slots.
	
	"Must have both getter and setter accessors"
	slots := slots select: [ :slot |
		(self respondsTo: slot name) and: [ self respondsTo: slot name, ':' ] ].
	
	"Must not be defined by Cormas traits"
	slots := slots reject: [ :slot |
		slot definingClass isNotNil and: [
			slot definingClass isTrait and: [ 
				slot definingClass package ~= self class package ] ] ].

	^ slots collect: [ :slot |
		CMInstanceParameter
			getterSelector: slot name
			setterSelector: (slot name, ':')
			receiver: self ]
]

{ #category : 'accessing' }
CMEntity >> patch [
	
	^nil
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
	^ CMPointOfView color: (self colorFromName: self class name)
]

{ #category : 'pov' }
CMEntity >> povId [
	"Purpose: Returns a Color from the existing 31 constant names: #(#black #blue #brown #chartreuse #cyan #darkCyan #darkGray #darkGreen #darkMagenta #darkRed #gray #green #lightCyan #lightGray #lightYellow #magenta #navy #olive #orange #orchid #paleGreen #pink #purple #red #royalBlue #salmon #springGreen #veryDarkGray #veryLightGray #white #yellow). The id is used to determine the index at which the color name is picked in the array. 
Example: for an instance with id = 65, the returned color will be brown (65= 2*31+3)"

	<pov>
	^ CMPointOfView color: (self class colorOfNumber: self id)
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

{ #category : 'initialize-release' }
CMEntity >> reset [
	"Purpose: to reset all the attributes that have to be cleaned by the beginning of a new simulation"
	
	self resetFlag
]

{ #category : 'initialize-release' }
CMEntity >> resetFlag [
	
	flag := nil
]

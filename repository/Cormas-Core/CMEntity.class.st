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
	#instVars : [
		'id',
		'flag',
		'collector',
		'cormasModel'
	],
	#classInstVars : [
		'currentId',
		'activeProbes'
	],
	#category : 'Cormas-Core-Entities',
	#package : 'Cormas-Core',
	#tag : 'Entities'
}

{ #category : 'probes' }
CMEntity class >> activeProbes [
	^ activeProbes
		ifNil: [ self defaultProbes ]
		ifNotNil: [ activeProbes ]
]

{ #category : 'probes' }
CMEntity class >> activeProbes: anObject [
	
	activeProbes := anObject
]

{ #category : 'accessing' }
CMEntity class >> addRandomAttributes: anArray [
	"' Compile #randomAttributes by adding anArray: #(#attribute scopeLevel #randFloat min max) "
	
	| list code oldLine |
	list := self randomAttributes asList.
	oldLine := list
		detect:
			[:line | (line at: 1) = (anArray at: 1) and: [(line at: 2) = (anArray at: 2)]]
		ifNone: [nil].
	oldLine isNil
		ifTrue: [list add: anArray]
		ifFalse:
			[oldLine := oldLine asArray.
			oldLine
				at: 3
				put: (anArray at: 3).
			oldLine
				at: 4
				put: (anArray at: 4).
			oldLine
				at: 5
				put: (anArray at: 5)].
	code := 'randomAttributes \	"Returns a list of randomAttributes: a List of arrays: [#(#attributeName scopeLevel #randomFloat min max) #(...) #(...) ... ].

	This method is automatically redefined when creating new random attributes" 	\'
		withCRs.
	code := code ,
			'	| list |
	list := List new. \'.
	list do: [:line | code := code , '	list add: ' , line printString , '. \'].
	code := (code , '	^list') withCRs.
	self class
		compile: code
		classified: '- accessing' asString
		notifying: nil
]

{ #category : 'accessing - methods & classes' }
CMEntity class >> availableInfo [
	"Purpose: returns the list of available info methods
Return value: <OrderedCollection>"
	
	| collec |
	collec := OrderedCollection new.
	self withAllSuperclasses
		do:
			[:cl | 
			collec
				addAll: (cl organization listAtCategoryNamed: '* info' asSymbol);
				addAll: (cl organization listAtCategoryNamed: #info)].
	collec addFirst: #nil.
	^collec
]

{ #category : 'accessing - methods & classes' }
CMEntity class >> availablePov [
	"Purpose: returns the list of available pov methods
	Return value: <OrderedCollection>"
	
	| pragmas |
	pragmas := Pragma allNamed: 'pov' from: self to: CMEntity.

	^ pragmas collect: [ :pragma |
		pragma method selector ]
]

{ #category : 'accessing' }
CMEntity class >> buildGetterForEntityClass [
	" Create the getter selector for the entity class aClass.
	CMEntity asGetterForEntityClass -> #theEntities"

	^ (String streamContents: [ : stream | 
		stream 
			<< 'the';
			<< self entityName asPlural capitalized]) asSymbol
]

{ #category : 'deprecated' }
CMEntity class >> classFromSymbol: aSymbol [
	self deprecated: 'Use class method on Symbol instead of classFromSymbol:'.
	^ aSymbol class
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
				at: (Cormas number: aNumber onCycle: self colorNames size))
				asSymbol
]

{ #category : 'probes' }
CMEntity class >> colorOfProbe: aProbeSymbol [
	"answer the color of a local probe (to display the curve in ChartsInterface)"
	
	| selectorName |
	selectorName := (#colorOfProbe_ , aProbeSymbol) asSymbol.
	self class methodDictionary
		at: selectorName
		ifAbsent: [^nil].
	^self perform: selectorName
]

{ #category : 'utilities - colors' }
CMEntity class >> colorWithout: aColorName OfNumber: aNumber [
	"Purpose: Returns a Color from the existing constant names: #(#black #veryVeryDarkGray #veryDarkGray #darkGray #gray #lightGray #veryLightGray #veryVeryLightGray #white #red #yellow #green #cyan #blue #magenta #brown #orange #lightRed #lightYellow #lightGreen #lightCyan #lightBlue #lightMagenta #lightBrown #lightOrange #pink #purple #tan #veryPaleRed #paleYellow #paleTan #paleRed #palePeach #paleOrange #paleMagenta #paleGreen #paleBuff #paleBlue) except the one given as the first argument.
	Arguments: aColorName : <Symbol>
			aNumber = <Integer> is the index at which the color name is picked in the array. It can be greater than 38.
	Example: CMEntity colorWithout: #white OfNumber: 30  -> Color gray "

	| colors |
	colors := Color registeredColorNames asOrderedCollection.
	colors remove: aColorName ifAbsent: [ nil ].
	^ Color
		perform: (colors at: (Cormas number: aNumber onCycle: colors size) asSymbol)
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
CMEntity class >> darkColorOfNumber: aNumber [
	"Purpose: Returns a dark Color from the existing 38 constant names: #(#black #veryVeryDarkGray #veryDarkGray #darkGray #gray #lightGray #veryLightGray #veryVeryLightGray #white #red #yellow #green #cyan #blue #magenta #brown #orange #lightRed #lightYellow #lightGreen #lightCyan #lightBlue #lightMagenta #lightBrown #lightOrange #pink #purple #tan #veryPaleRed #paleYellow #paleTan #paleRed #palePeach #paleOrange #paleMagenta #paleGreen #paleBuff #paleBlue).
Argument: aNumber = <Integer> is the index at which the color name is picked in the array. It can be greater than 25.
Example: CMEntity darkColorOfNumber:  30 -> Color brown"

	| colors |
	colors := self darkColors.
	^ Color
		perform: (colors at: (Cormas number: aNumber onCycle: colors size)) asSymbol
]

{ #category : 'utilities - colors' }
CMEntity class >> darkColors [
	"Purpose: Returns the dark ColorValues from the existing constant color values.
Example: CMEntity darkColors -> an OrderedCollection('veryPaleRed' 'magenta' 'brown' 'red' 'paleBlue' 'darkGray' 'palePeach' 'transparent' 'blue' 'purple' 'paleGreen' 'paleYellow' 'paleBuff' 'tan' 'paleOrange' 'veryVeryDarkGray' 'paleRed' 'orange' 'paleMagenta' 'black' 'pink' 'paleTan' 'gray' 'green' 'veryDarkGray' 'cyan' 'brickDarken')"
	| colors |
	colors := Color registeredColorNames asOrderedCollection.
	colors
		removeAllSuchThat: [ :symb | 
			(symb indexOfSubCollection: 'light' startingAt: 1) ~= 0
				or: [ (symb indexOfSubCollection: 'Light' startingAt: 1) ~= 0 ] ].
	colors remove: #white.
	colors remove: #yellow.
	^ colors
]

{ #category : 'utilities - colors' }
CMEntity class >> defaultColor [
	"Purpose: return the default color of the current class name.
	Example: CMEntity defaultColor => Color lightBrown ; CMFireman defaultColor => Color paleRed"

	^ self colorOfNumber: self hash
]

{ #category : 'probes' }
CMEntity class >> defaultProbes [
	
	^Array new
]

{ #category : 'default value' }
CMEntity class >> destroyed_default [
	
	^false
]

{ #category : 'accessing' }
CMEntity class >> entityName [
	" Answer a <String> with the entity name without prefixes ('CM' and the model name)"

	^ (self name beginsWith: 'CM')
		ifTrue: [ 
			((self name allButFirst: 2) beginsWith: self modelClass shortName)
				ifTrue: [ self name allButFirst: 2 + self modelClass shortName size ]
				ifFalse: [ self name allButFirst: 2 ] ]
		ifFalse: [ self name ]
]

{ #category : 'accessing - methods & classes' }
CMEntity class >> genericEntities [
	
	| kernel |
	kernel := self package classes.
	^ self withAllSubclasses select: [ :cl | cl package classes = kernel]
]

{ #category : 'instance creation' }
CMEntity class >> ghostInstance [
	
	^super new
]

{ #category : 'accessing' }
CMEntity class >> hasRandomAttribute: anAttributeName [
	"' Answer if anAttributeName defined at class or instance level is a random attribute"
	
	^self randomAttributes contains: [:line | (line at: 1) = anAttributeName]
]

{ #category : 'accessing' }
CMEntity class >> hasRandomAttribute: anAttributeName classVariable: boolean value: aString [
	"' Answer if anAttributeName defined at level (#instance or #class) is already defined with the same value as aString.
randomAttributes = #(#bioma #instance #randomFloat 0 1). "
	
	| level anArray otherString include |
	(self isRandomAttribute: anAttributeName classVariable: boolean)
		ifFalse: [^false].
	level := boolean
		ifTrue: [#class]
		ifFalse: [#instance].
	anArray := self randomAttributes
		detect:
			[:line | (line at: 1) = anAttributeName and: [(line at: 2) = level]].
	otherString := (anArray at: 3) asString.
	otherString = 'randomFloat'
		ifTrue: [include := false]
		ifFalse: [include := true].
	include
		ifTrue: [otherString := otherString , ': [']
		ifFalse: [otherString := otherString , ': ]'].
	otherString := otherString , (anArray at: 4) asString.
	otherString := otherString , ' ; '.
	otherString := otherString , (anArray at: 5) asString.
	include
		ifTrue: [otherString := otherString , ']']
		ifFalse: [otherString := otherString , '['].
	^otherString = aString
]

{ #category : 'default value' }
CMEntity class >> id_default [
	
	^0
]

{ #category : 'testing' }
CMEntity class >> isAbstract [
	"Purpose: to test the existence of subclasses"
	
	^self subclasses notEmpty
]

{ #category : 'testing' }
CMEntity class >> isAgentCommClass [
	
	^false
]

{ #category : 'testing' }
CMEntity class >> isArcClass [
	
	^false
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

{ #category : 'accessing' }
CMEntity class >> isRandomAttribute: anAttributeName classVariable: boolean [
	"' Answer if anAttributeName defined at level (#instance or #class) is a random attribute"
	
	^self
		isRandomAttribute: anAttributeName
		scopeLevel:
			(boolean
				ifTrue: [#class]
				ifFalse: [#instance])
]

{ #category : 'accessing' }
CMEntity class >> isRandomAttribute: anAttributeName scopeLevel: level [
	"' Answer if anAttributeName defined at level (#instance or #class) is a random attribute"
	
	^self randomAttributes
		contains:
			[:line | (line at: 1) = anAttributeName and: [(line at: 2) = level]]
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
CMEntity class >> lightColorOfNumber: aNumber [
	"Purpose: Returns a light ColorValue from the existing 38 constant names: #(#black #veryVeryDarkGray #veryDarkGray #darkGray #gray #lightGray #veryLightGray #veryVeryLightGray #white #red #yellow #green #cyan #blue #magenta #brown #orange #lightRed #lightYellow #lightGreen #lightCyan #lightBlue #lightMagenta #lightBrown #lightOrange #pink #purple #tan #veryPaleRed #paleYellow #paleTan #paleRed #palePeach #paleOrange #paleMagenta #paleGreen #paleBuff #paleBlue).
Argument: aNumber = <Integer> is the index at which the color name is picked in the array. It can be greater than 38.
Example: CMEntity lightColorOfNumber:  30 => Color lightMagenta"

	| colors |
	colors := self lightColors.
	^ Color
		perform: (colors at: (Cormas number: aNumber onCycle: colors size)) asSymbol
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

{ #category : 'doc' }
CMEntity class >> listing: fileName [
	"Creates a simple listing of the attributes and methods of this class into fileName"
	
	| bufferText stream |
	bufferText := Text new.
	bufferText := bufferText , '***** Attributs'' list *****\' withCRs.
	self instVarNames
		do: [:iv | bufferText := bufferText , '  -' , iv asString , '\' withCRs].
	bufferText := bufferText , '\\\***** Methodes'' list ***** ' withCRs.
	self organization categories
		do:
			[:protoc | 
			bufferText := bufferText , '\\Protocol: ' , protoc asString , '\\' withCRs.
			(self organization listAtCategoryNamed: protoc)
				do:
					[:meth | bufferText := bufferText , '  #' , meth asString , '\' withCRs]].
	stream := fileName asFilename writeStream.
	stream nextPutAll: bufferText withCRs.
	stream close
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

{ #category : 'instance creation' }
CMEntity class >> new [
	
	^super new initId
]

{ #category : 'instance creation' }
CMEntity class >> new: x [
	
	^super new initId
]

{ #category : 'instance creation' }
CMEntity class >> newAndCollect: aCollector [
	"Creates a new instance of Entity and add it immediatelly to cormasModel collection (theXXXs)"
	
	| anInstance |
	anInstance := self new.
	anInstance collector: aCollector.
	aCollector collect: anInstance.
	aCollector updateEntities.
	^anInstance
]

{ #category : 'probes' }
CMEntity class >> probes [
	"self superClassesUntilEntity"
	
	| coll |
	coll := OrderedCollection new.
	self withAllSuperclasses
		do: [:cl | coll addAll: ((Pragma allNamed: #probes in: cl) collect: #selector)].
	^coll asSortedCollection
	

]

{ #category : 'accessing' }
CMEntity class >> randomAttributes [
	"' Returns a list of randomAttributes (List of arrays: #(#attribute scopeLevel #randFloat min max) ).
	This method is automatically redefined when creating new random attributes"
	
	^#()
]

{ #category : 'accessing' }
CMEntity class >> removeRandomAttributes: anArray [
	"' Compile #randomAttributes by removing anArray: #(#attribute scopeLevel #randFloat min max) "
	
	| list code |
	list := self randomAttributes asList.
	list
		remove: anArray
		ifAbsent: [nil].
	code := 'randomAttributes \	"Returns a list of randomAttributes: a List of arrays: [#(#attributeName scopeLevel #randFloat min max) #(...) #(...) ... ].

	This method is automatically redefined when creating new random attributes" 	\'
		withCRs.
	code := code ,
			'	| list |
	list := List new. \'.
	list do: [:line | code := code , '	list add: ' , line printString , '. \'].
	code := (code , '	^list') withCRs.
	self class
		compile: code
		classified: '- accessing' asString
		notifying: nil
]

{ #category : 'probes' }
CMEntity class >> setColor: aColorValue forProbe: aSymbol [
	"creates a color mathod at class level, such as :
colorOfProbe_aSymbol
	^ ColorValue yellow"
	
	self class
		compile:
			('colorOfProbe_' , aSymbol asString , '\  ^ ' , aColorValue printString)
				withCRs
		classified: '- probes'
		notifying: nil
]

{ #category : 'accessing - methods & classes' }
CMEntity class >> superClassesUntil: aSuperClass [
	"Purpose: returns the list of super classes of the receiver up to aSuperClass
Return value: an orderedCollection
Example: GroupLocation superClassesUntil: Agent"
	
	| coll |
	coll := self withAllSuperclasses
		select: [:aClass | aClass inheritsFrom: aSuperClass].
	coll add: aSuperClass.
	^coll
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

{ #category : 'collector' }
CMEntity >> collect: anEntity [
	"Collects anEntity at the level of the model (theXXXs collection)"
	
	self collector collect: anEntity
]

{ #category : 'accessing' }
CMEntity >> collector [
	"Getter accessor without default value "
	
	^collector
]

{ #category : 'accessing' }
CMEntity >> collector: aCollector [
	collector := aCollector
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

{ #category : 'accessing' }
CMEntity >> cormasModel [
	^ cormasModel
]

{ #category : 'accessing' }
CMEntity >> cormasModel: aCMAbstractModel [
	cormasModel := aCMAbstractModel
]

{ #category : 'accessing' }
CMEntity >> currentSimulation [
	"Direct access to the current simulation registered by the current cormas"

	^ cormasModel
]

{ #category : 'accessing - scheduling' }
CMEntity >> currentTime [
	"Purpose: returns the current time step of the simulation
	Return value = <Integer>"

	^ self modelClass timeStep
]

{ #category : 'pov' }
CMEntity >> defaultPOV [
	" Answer a <Color> representing the receiver "

	<pov>
	^ self pov
]

{ #category : 'displaying' }
CMEntity >> defineVisualState [
	"DEPRECATED. Should use :"
	
	self changed
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
CMEntity >> isGenericEntity [ 

	^ self class isGenericEntity
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

{ #category : 'instance creation' }
CMEntity >> newAndCollect: aClass [
	"Purpose: creates a new instance of aClass and IMMEDIATELY collects it at the level of the model (theXXXs collection)
Return value: an instance of aClass
Example: newBorn := self newAndCollect: self class"
	
	| anEntity |
	anEntity := self newEntity: aClass.
	anEntity collector updateEntities.
	^anEntity
]

{ #category : 'instance creation' }
CMEntity >> newEntity: aClass [
	"Purpose: creates a new instance of aClass. This new instance will be collected at the level of the model (theXXXs collection) at the end of the current timestep
Return value: an instance of aClass
Example: newBorn := self newEntity: self class"

	| anEntity |
	anEntity := aClass new.
	anEntity
		cormasModel: self cormasModel;
		collector: self collector.
	self collect: anEntity.
	^ anEntity
]

{ #category : 'accessing' }
CMEntity >> patch [
	
	^nil
]

{ #category : 'accessing' }
CMEntity >> pov [
	" For compatibility we answer a <Color> which could be considered neutral "

	^ Color gray
]

{ #category : 'pov' }
CMEntity >> povAttribute: aSymbol min: minValue color: startColor max: maxValue color: stopColor [
	"Purpose: returns a color among a palette of colors correlatively to the value of the attribute.
Arguments: aSymbol = <Symbol>, the name of the attribute
			minValue = <Integer>, the minimum value of the attribute
		 	maxValue = <Integer>, the maximum value of the attribute
			startColor = <ColorValue  or Symbol>, the color associated to the minimum value of the attribute
			stopColor = <ColorValue  or Symbol>, the color associated to the maximum value of the attribute
Return value: a colorValue
Example : self povAttribute: #energy min: 0 color: (ColorValue yellow) max: (self class K) color: ColorValue red
Example : self povAttribute: #energy min: 0 color: #yellow max: (self class K) color: #red"
	
	^self
		povValue: (self perform: aSymbol)
		min: minValue
		color: startColor
		max: maxValue
		color: stopColor
]

{ #category : 'pov' }
CMEntity >> povAttribute: aSymbol min: minValue max: maxValue color: baseColor [
	"Purpose: returns a color among a gradient correlatively to the value of the attribute.
Arguments: aSymbol = <Symbol>, the name of the attribute
			minValue = <Integer>, the minimum value of the attribute
		 	maxValue = <Integer>, the maximum value of the attribute
			color = <ColorValue  or Symbol>, the color itself or its name
Return value: a colorValue
Example : self povAttribute: #energy min: 0 max: self class K color: ColorValue green
Or : 	    self povAttribute: #energy min: 0 max: 10 color: #green"
	
	^self
		povValue: (self perform: aSymbol)
		min: minValue
		max: maxValue
		color: baseColor
]

{ #category : 'pov' }
CMEntity >> povAttribute: aSymbol minPalette: startArray maxPalette: stopArray [
	"Purpose: returns a color among a palette of colors correlatively to the value of the attribute.
Arguments: aSymbol = <Symbol>, the name of the attribute
			minPalette = <Array(Nuimber Symbol)> (minimum value of the attribute; name of color) 
		 	maxPalette = <Array(Number Symbol)> (maximum value of the attribute; name of color)
			color = <Color  or Symbol>, the color itself or its name
Return value: a Color
Example : self povAttribute: #boisMort minPalette:#(1 #red) maxPalette: #(15 #green)"

	^ self
		povValue: (self perform: aSymbol)
		min: startArray first
		color: startArray last
		max: stopArray first
		color: stopArray last
]

{ #category : 'pov' }
CMEntity >> povClassName [
	"Purpose: returns the class name, to be added as an associated symbol in the Pov Setter Interface
	Return value: <ByteSymbol>"

	^ self class name
]

{ #category : 'pov' }
CMEntity >> povId [
	"Purpose: Returns a Color from the existing 31 constant names: #(#black #blue #brown #chartreuse #cyan #darkCyan #darkGray #darkGreen #darkMagenta #darkRed #gray #green #lightCyan #lightGray #lightYellow #magenta #navy #olive #orange #orchid #paleGreen #pink #purple #red #royalBlue #salmon #springGreen #veryDarkGray #veryLightGray #white #yellow). The id is used to determine the index at which the color name is picked in the array. 
Example: for an instance with id = 65, the returned color will be brown (65= 2*31+3)"

	<pov>
	^ self class colorOfNumber: self id
]

{ #category : 'utilities - color' }
CMEntity >> povValue: aValue min: minValue color: startColor max: maxValue color: stopColor [
	"Return a Color associated to aValue amongs a palette of colors.
aValue = <Number> ; minValue = <Integer> ; maxValue = <Integer> ; startColor = <Color or Symbol> ; stopColor = <Color  or Symbol>
ECEC example : 
	povValue: 10 min: 0 color: #yellow max: 100 color: #red  or 
	povValue: (self energy) min: 0 color: (Color yellow) max: (self class K) color: Color red"
	
	| alpha rv gv bv value start_Color stop_Color |
	(aValue isNil or: [aValue isNumber not])
		ifTrue: [^Color white].
	value := aValue <= minValue
		ifTrue: [minValue]
		ifFalse: [aValue].
	value := aValue >= maxValue
		ifTrue: [maxValue]
		ifFalse: [aValue].
	start_Color := Color colorFrom: startColor.
	stop_Color := Color colorFrom: stopColor.
	alpha := (value - minValue) / (maxValue - minValue).
	rv := (stop_Color red * alpha) rounded
		+ (start_Color red * (1 - alpha)) rounded.
	gv := (stop_Color green * alpha) rounded
		+ (start_Color green * (1 - alpha)) rounded.
	bv := (stop_Color blue * alpha) rounded
		+ (start_Color blue * (1 - alpha)) rounded.
	^Color red: rv green: gv blue: bv
]

{ #category : 'utilities - color' }
CMEntity >> povValue: aValue min: minValue max: maxValue color: baseColor [

	"Return a Color for aValue, in the interval of minValue and maxValue. 
Works even if this value is less or up to minValue or maxValue
aValue = <Number> ; minValue = <Integer> ; maxValue = <Integer> ; baseColor = <ColorValue  or Symbol>
ECEC example : 
	povAttribute: #energy min: 0 max: self class K color: ColorValue green"

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

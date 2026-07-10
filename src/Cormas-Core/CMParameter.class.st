Class {
	#name : 'CMParameter',
	#superclass : 'Object',
	#instVars : [
		'customName',
		'targetClass',
		'isClassSide',
		'getterSelector',
		'setterSelector',
		'defaultValue'
	],
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'instance creation' }
CMParameter class >> collectAllParametersFrom: aClass [
	"Collect all types of parameters (boolean, integer, etc.) from aClass"

	^ self concreteSubclasses flatCollect: [ :parameterClass |
		parameterClass collectParametersFromInstanceAndClassSideOf: aClass ]
]

{ #category : 'instance creation' }
CMParameter class >> collectParametersFrom: aClass [
	"Used by subclasses to collect parameters of that type (boolean, integer, etc.) from aClass"

	| parameters |
	
	parameters := OrderedCollection new.

	self pragmaDict keysAndValuesDo: [ :pragmaSelector :buildSelector |
		(Pragma allNamed: pragmaSelector in: aClass) do: [ :pragma | 
			parameters add: (self perform: buildSelector with: pragma) ] ].
	
	^ parameters 
]

{ #category : 'instance creation' }
CMParameter class >> collectParametersFromInstanceAndClassSideOf: aClass [

	| instanceSideClass parameters |
	
	instanceSideClass := self ensureInstanceSideOf: aClass.
	
	parameters := self collectParametersFrom: instanceSideClass.
	parameters addAll: (self collectParametersFrom: instanceSideClass class).
	
	^ parameters
]

{ #category : 'as yet unclassified' }
CMParameter class >> compatibeSamplingMethods [

	self subclassResponsibility
]

{ #category : 'testing' }
CMParameter class >> concreteSubclasses [
	"A parameter class is concrete if it defines the #pragmaDict method"

	^ self allSubclasses select: [ :each |
		[ each pragmaDict. true ] on: SubclassResponsibility do: [ false ] ]
]

{ #category : 'as yet unclassified' }
CMParameter class >> ensureInstanceSideOf: aClass [
	"For uniformity, we always want to store the reference to the instance side of each class. Even if we receive the reference to the class side"
	
	^ aClass isInstanceSide
		ifTrue: [ aClass ]
		ifFalse: [ aClass instanceSide ]
]

{ #category : 'instance creation' }
CMParameter class >> fromMethod: aMethod [
	"For testing"
	
	| pragma buildSelector |
	
	aMethod pragmas size = 1 ifFalse: [ 
		self error: 'Method must contain exactly one pragma' ].
	
	pragma := aMethod pragmas first.
	
	buildSelector := self pragmaDict at: pragma selector ifAbsent: [ 
		self error: (self name, ' does not understand pragma #', pragma selector) ].
	
	^ self perform: buildSelector with: pragma
	
]

{ #category : 'instance creation' }
CMParameter class >> getterSelector: aGetterSelector setterSelector: aSetterSelector receiver: anObject [

	^ self new
		initailizeGetterSelector: aGetterSelector
		setterSelector: aSetterSelector
		receiver: anObject;
		yourself
]

{ #category : 'instance creation' }
CMParameter class >> newFromPragmaDefault: aPragma [

	^ (self preBuildFromPragma: aPragma)
		defaultValue: aPragma arguments first;
		yourself
]

{ #category : 'instance creation' }
CMParameter class >> newFromPragmaNamedDefault: aPragma [

	^ (self preBuildFromPragma: aPragma)
		customName: aPragma arguments first;
		defaultValue: aPragma arguments second;
		yourself
]

{ #category : 'as yet unclassified' }
CMParameter class >> pragmaDict [

	self subclassResponsibility
]

{ #category : 'instance creation' }
CMParameter class >> preBuildFromPragma: aPragma [

	| getter setter aClass |
	
	getter := aPragma method selector.
	setter := getter asMutator.
	aClass := aPragma method methodClass.
	
	(aClass canUnderstand: setter) ifFalse: [ 
		self error: 'You must create a setter for parameter #', getter ].

	^ self new
		targetClass: (self ensureInstanceSideOf: aClass);
		isClassSide: aPragma method isClassSide;
		getterSelector: getter;
		setterSelector: setter;
		yourself
]

{ #category : 'testing' }
CMParameter >> customName: aString [

	customName := aString
]

{ #category : 'accessing' }
CMParameter >> defaultValue [

	^ defaultValue
]

{ #category : 'accessing' }
CMParameter >> defaultValue: anObject [

	(self isValidValue: anObject) ifFalse: [
		self error: 'Invalid default value of #', getterSelector asString, ' parameter' ].
	
	defaultValue := anObject
]

{ #category : 'accessing' }
CMParameter >> getterSelector [

	^ getterSelector
]

{ #category : 'accessing' }
CMParameter >> getterSelector: anObject [

	getterSelector := anObject
]

{ #category : 'testing' }
CMParameter >> hasCustomName [

	^ customName isNotNil
]

{ #category : 'accessing' }
CMParameter >> isClassSide [

	^ isClassSide
]

{ #category : 'accessing' }
CMParameter >> isClassSide: anObject [

	isClassSide := anObject
]

{ #category : 'accessing' }
CMParameter >> isInstanceSide [

	^ isClassSide not
]

{ #category : 'testing' }
CMParameter >> isValidValue: aValue [

	self subclassResponsibility
]

{ #category : 'accessing' }
CMParameter >> name [

	^ self hasCustomName
		ifTrue: [ customName ]
		ifFalse: [ getterSelector ]
]

{ #category : 'evaluating' }
CMParameter >> setDefaultValueFor: aTarget [

	aTarget perform: setterSelector with: defaultValue
]

{ #category : 'evaluating' }
CMParameter >> setValue: aValue for: aTarget [
	"Set value of a parameter on aTarget which can be an instance or a class"
	
	(self isValidValue: aValue) ifFalse: [
		self error: 'Invalid value of #', getterSelector asString, ' parameter' ].
	
	aTarget perform: setterSelector with: aValue
]

{ #category : 'accessing' }
CMParameter >> setterSelector [

	^ setterSelector
]

{ #category : 'accessing' }
CMParameter >> setterSelector: anObject [

	setterSelector := anObject
]

{ #category : 'accessing' }
CMParameter >> targetClass [

	^ targetClass
]

{ #category : 'accessing' }
CMParameter >> targetClass: anObject [

	targetClass := anObject
]

{ #category : 'evaluating' }
CMParameter >> valueFor: aTarget [
	"Get value of a parameter for aTarget which can be a class or an instance"

	^ aTarget perform: getterSelector
]

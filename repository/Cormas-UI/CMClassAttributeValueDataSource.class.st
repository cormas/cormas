Class {
	#name : #CMClassAttributeValueDataSource,
	#superclass : #FTSimpleDataSource,
	#instVars : [
		'allClasses'
	],
	#category : #'Cormas-UI-Attributes'
}

{ #category : #accessing }
CMClassAttributeValueDataSource class >> attributsFromClass: aClass [
	"returns a list of ClassAttributeValues of Entities"
	"Add the attributs"
	
	| set |
	set := OrderedCollection new.
	aClass superclass = CMSpatialEntityCell
		ifTrue:
			[set add: 'state'	"Parmis les attributs herites, il n'y a que state qui puisse etre un nombre"].
	(aClass superclass = CormasModelGameInterface
		or: [aClass superclass = CMAbstractModel])
		ifTrue:
			[set add: 'periodicity'	"Parmis les attributs herites, il n'y a que periodicity qui puisse etre un nombre a analyser"].
	set addAll: aClass instVarNames.	"and add attributs superclasses except from Entities"
	set addAll: (self inheritedInstVarNamesForClass: aClass).	"Remove all collections of CormasModel automaticaly buid from a model classes . i.e: theCells  "	"(aClass superclass = CormasModelGameInterface or:[aClass superclass = CormasModel])
		ifTrue: [aClass spatialClasses do: [:c | set remove: (CMAbstractModel getterForEntityClass: c)  ifAbsent:[]].
			    aClass socialClasses do: [:c | set remove: (CMAbstractModel getterForEntityClass: c) ifAbsent:[]].
			    aClass passiveClasses do: [:c | set remove: (CMAbstractModel getterForEntityClass: c) ifAbsent:[]]   ]."
	^set
]

{ #category : #accessing }
CMClassAttributeValueDataSource class >> attributsWithAccessorsFromClass: aClass [
	"returns a list of ClassAttributeValues of Entities that present the two accessors (setter & getter).
	!! All attributs without accessors are removed from the set "
	
	| set |
	set := OrderedCollection new.
	(self attributsFromClass: aClass)
		do:
			[:anAttribut | 
			((aClass compiledMethodAt: anAttribut asSymbol ifAbsent:[nil]) isNil
				or: [(aClass compiledMethodAt: (anAttribut , ':') asSymbol ifAbsent:[nil]) isNil])
				ifFalse: [set add: anAttribut asString]].
	^set
]

{ #category : #'instance creation' }
CMClassAttributeValueDataSource class >> forClass: aClass [

	^ self basicNew 
		initializeForClass: aClass;
		yourself
]

{ #category : #'instance creation' }
CMClassAttributeValueDataSource class >> forSuperclass: aClass [

	^ self basicNew 
		initializeForSuperclass: aClass;
		yourself
]

{ #category : #accessing }
CMClassAttributeValueDataSource class >> getDefaultValueOfAttribut: anAttribut ofClass: aClass [
	"Returns the default value of anAttribut (static or instance) of aClass, using the  'anAttribut_default' accessor  located into the ' - default value ' protocol.
Compatibility with previous Cormas version: before changing, it tests if the default class method exists otherwise compiles it

	anAttribut = <Symbol>
	aClass = <Class>"
	
	| default classLevel inst |
	aClass isMeta
		ifTrue: [classLevel := aClass soleInstance]
		ifFalse: [classLevel := aClass].
	default := self
		tryMethod: (anAttribut , '_default') asSymbol
		onClass: classLevel.
	default = 'Non ca n a pas marche du tout. VA falloir traiter ca'
		ifTrue:
			[classLevel isGenericEntity ifTrue: [^nil].
			aClass isMeta
				ifTrue:
					[default := self
						tryMethod: anAttribut asSymbol
						onClass: classLevel]
				ifFalse:
					[inst := aClass basicNew.
					default := self
						tryMethod: anAttribut asSymbol
						onClass: inst].
			default = 'Non ca n a pas marche du tout. VA falloir traiter ca'
				ifTrue: [^nil]
				ifFalse:
					[default isLiteral
						ifTrue:
							[self
								defineDefaultClassMethod: anAttribut asString
								ofClass: aClass
								withDefaultValue: default]]].
	^default
]

{ #category : #accessing }
CMClassAttributeValueDataSource class >> getDefaultValuesForClass: aClass attributs: attributs [
	"attributs is a Set of static attributs or instance attributs"
	"Returns the default value of anAttribut (static or instance) of aClass, using the  'anAttribut_default' accessor  located into the ' - default value ' protocol.
	anAttribut = <Symbol>
	aClass = <Class>"
	
	| infoList default defaultParameters |
	defaultParameters := OrderedCollection new: attributs size.
	attributs do: [:anAttribut | 
		(aClass methodDictionary at: anAttribut asSymbol ifAbsent: [ nil ]) isNil
			ifFalse: 	[
				infoList := Array new: 3.
				default := self getDefaultValueOfAttribut: anAttribut ofClass: aClass.
				infoList
					at: 1 put: aClass;
					at: 2 put: anAttribut asSymbol;
					at: 3 put: default.
				defaultParameters add: infoList	
						"default isNil 
						ifFalse: [defaultParameters add: infoList]"]].
	^defaultParameters
]

{ #category : #accessing }
CMClassAttributeValueDataSource class >> inheritedInstVarNamesForClass: aClass [
	"Return an array of the attributs of the superclass"
	
	| list entityClasses allEntityClasses aSuperclass |
	list := OrderedCollection new.
	entityClasses := ('Cormas-Core' asPackage classTagNamed: 'Entities') classes.
	entityClasses
		addAll:
			(('Cormas-Core' asPackage classTagNamed: 'Interface') classes).
	entityClasses
		addAll:
			(('Cormas-Core' asPackage classTagNamed: 'Communication') classes).
	allEntityClasses := entityClasses copy.
	entityClasses do: [:c | allEntityClasses add: c class].
	aSuperclass := aClass superclass.	"I just want the attributs of the super class until the Entities class"
	[(allEntityClasses includes: aSuperclass)
		or: [aSuperclass = Object or: [aSuperclass = Object class]]]
		whileFalse:
			[list addAll: aSuperclass instVarNames.
			aSuperclass := aSuperclass superclass].
	^list
]

{ #category : #accessing }
CMClassAttributeValueDataSource class >> staticAttributsFromClass: aClass [
	"Return a set containing the static variable names (as string) of aClass and all its super classes until the Cormas entity classes."
	
	| set |
	set := OrderedCollection new.	"Add the class variables"
	set addAll: aClass class instVarNames.	"list addAll: aClass classVarNames."	"ne marche pas !"	"and add attributs superclasses except from Entities"
	set addAll: (self inheritedInstVarNamesForClass: aClass class).
	set
		remove: 'CurrentId'
		ifAbsent: [].
	^set
]

{ #category : #accessing }
CMClassAttributeValueDataSource class >> staticAttributsWithAccessorsFromClass: aClass [
	"Return a set containing the static variable names (as string) of aClass and all its super classes until the Cormas entity classes.
!! All attributs without accessors are removed from the set "
	
	| set |
	set := Set new.
	(self staticAttributsFromClass: aClass)
		do:
			[:anAttribut | 
			((aClass class compiledMethodAt: anAttribut asSymbol ifAbsent: [nil]) isNil
				or: [(aClass class compiledMethodAt: (anAttribut , ':') asSymbol ifAbsent: [nil]) isNil])
				ifFalse: [set add: anAttribut asString]].
	^set
]

{ #category : #accessing }
CMClassAttributeValueDataSource class >> tryMethod: aMethod onClass: aClassOrInstance [
	
	| result |
	
	^ [ result := aClassOrInstance perform: aMethod]
	on: Exception
	do: [ : ex | ex return: 'Non ca n a pas marche du tout. VA falloir traiter ca' ]
]

{ #category : #accessing }
CMClassAttributeValueDataSource >> attributeColumn: column row: rowIndex [

	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) targetAttribute asStringMorph;
		yourself
]

{ #category : #accessing }
CMClassAttributeValueDataSource >> cellColumn: column row: rowIndex [ 

	column id = '#' ifTrue: [ ^ FTCellMorph new addMorph: rowIndex asMorph ].
	column id = 'Class' ifTrue: [ ^ self classColumn: column row: rowIndex ].
	column id = 'Attribute' ifTrue: [ ^ self attributeColumn: column row: rowIndex ].
	column id = 'Value' ifTrue: [ ^ self valueColumn: column row: rowIndex ].
	
	self error: 'Invalid column'
]

{ #category : #accessing }
CMClassAttributeValueDataSource >> classColumn: column row: rowIndex [

	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) targetClass asStringMorph;
		yourself
]

{ #category : #initialization }
CMClassAttributeValueDataSource >> collectAttributesFrom: aClass in: attributColl [

	allClasses := aClass superClassesUntilEntity.
	allClasses remove: aClass.
	allClasses do: [ : cls | self collectAttributesFromClass: cls in: attributColl ].
]

{ #category : #initialization }
CMClassAttributeValueDataSource >> collectAttributesFromClass: aClass in: attributColl [

	| attributs |

	attributs := self class staticAttributsWithAccessorsFromClass: aClass.
	self 
		rejectCormasModelClassAttributes: attributs;
		rejectCormasModelAttributes: attributs.
	
	attributColl addAll: (self class getDefaultValuesForClass: aClass class attributs: attributs).
	
	attributs := self class attributsWithAccessorsFromClass: aClass.
	self rejectCormaslAttributesWithAccessors: attributs.
	
	attributColl addAll: (self class getDefaultValuesForClass: aClass attributs: attributs)
]

{ #category : #initialization }
CMClassAttributeValueDataSource >> collectClassAttributesFrom: attributColl [

	^ (attributColl 
			collect: [ :coll | self newClassAttributeValue: coll ]
			as: Set) asArray
]

{ #category : #initialization }
CMClassAttributeValueDataSource >> collectUnmodifiedClassAttributesFrom: attributColl [

	^ (attributColl collect: [ : coll | 
		 (self newClassAttributeValue: coll) hasBeenModified: false ]) asArray
]

{ #category : #initialization }
CMClassAttributeValueDataSource >> initializeForClass: aClass [

	| attributs attributColl |

	attributColl := OrderedCollection new.
	attributs := self class staticAttributsWithAccessorsFromClass: aClass.
	attributColl addAll: (self class
		getDefaultValuesForClass: aClass class
		attributs: attributs).
	attributs := self class attributsWithAccessorsFromClass: aClass.
	attributColl addAll: (self class getDefaultValuesForClass: aClass attributs: attributs).
	self elements: (self collectUnmodifiedClassAttributesFrom: attributColl).
	self initialize
]

{ #category : #initialization }
CMClassAttributeValueDataSource >> initializeForSuperclass: aClass [ 
	"Create a list of ClassAttributeValue of the superclasses of aClass"

	| attributColl |

	(aClass inheritsFrom: CMAbstractModel)
		ifTrue: [ ^ nil ].
	attributColl := OrderedCollection new.
	self collectAttributesFrom: aClass in: attributColl.
	self elements: (self collectClassAttributesFrom: attributColl).
	self initialize
]

{ #category : #initialization }
CMClassAttributeValueDataSource >> modelAttributesInCormasToReject [

	^ #('spatialClasses' 'povColorsDict' 'socialClasses' 'cellClass' 'visualStateIsOpen' 'savedWindowInformation' 'passiveClasses' 'timeStep' 'charts' 'cormasModel')
]

{ #category : #initialization }
CMClassAttributeValueDataSource >> modelAttributesToReject [
	" Answer a <Collection> of attributes to be rejected from the display of the receiver "

	^ #('bounds' 'povDict' 'activityDiagrams' 'colorsDict' 'activeProbes' 'image') 
]

{ #category : #initialization }
CMClassAttributeValueDataSource >> modelAttributesWithAccessorsToReject [
	" Answer a <Collection> of attributes to be rejected from the display of the receiver "
	
	^ #('povs' 'outline' 'edge' 'orderedNeighbourhood' 'flag' 'collector' 'request' 'includedEntities' 'state' 'bufferState' 'cormasModel')
]

{ #category : #initialization }
CMClassAttributeValueDataSource >> newClassAttributeValue: coll [

	^ CMClassAttributeValue
		newClass: coll first
		attribute: coll second
		value: coll third
]

{ #category : #initialization }
CMClassAttributeValueDataSource >> rejectCormasModelAttributes: attributs [

	self modelAttributesInCormasToReject do: [ :att | attributs remove: att ifAbsent: [  ] ].
]

{ #category : #initialization }
CMClassAttributeValueDataSource >> rejectCormasModelClassAttributes: attributs [
	"remove attributs of CormasModel"

	self modelAttributesToReject do: [ :att | attributs remove: att ifAbsent: [  ] ].
]

{ #category : #initialization }
CMClassAttributeValueDataSource >> rejectCormaslAttributesWithAccessors: attributs [

	self modelAttributesWithAccessorsToReject do: [ :att | attributs remove: att ifAbsent: [  ] ].
]

{ #category : #accessing }
CMClassAttributeValueDataSource >> valueColumn: column row: rowIndex [

	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) currentValue asStringMorph;
		yourself
]

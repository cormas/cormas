"
AttributAdder is allows to add and remove attributes of a Class. Then it allows to set and change the default values of the parameters.
If the user changes the value of a parameter (xxx for instance), the reader accessor (#xxx) of the attribute is compiled with the new value assigned by user (as well as the default value that is stored into #xxx_default method at the class level).

Instance Variables:
	remove	<LensAbsentee | Object>	description of remove
	superClassAttribValue_List	<SelectionInList>	description of superClassAttribValue_List
	targetClass	<Behavior>	description of targetClass


"
Class {
	#name : #AttributeAdder,
	#superclass : #Object,
	#instVars : [
		'targetClass',
		'superClassAttribValue_List',
		'getterAccessor',
		'setterAccessor',
		'remove',
		'dialogValue',
		'setChanged',
		'setNotification',
		'typeOfValue',
		'randomValueHolder'
	],
	#category : #'Cormas-Core-Others'
}

{ #category : #'instance creation' }
AttributeAdder class >> newAttributWindowOn: aClass model: cormasModel [
	
	| inst |
	inst := self new.
	inst cormasModel: cormasModel.
	inst initForClass: aClass.
	^inst
]

{ #category : #'actions_butons' }
AttributeAdder >> addAttribut [
	
	| variableName aCAV |
	variableName := self addAttributDefaultName: ''.
	variableName ifNil: [^self].
	aCAV := self openValueChooserInterface.
	aCAV acceptValue.
	aCAV targetAttribute: variableName asSymbol.
	self addCAV: aCAV.	"save automatically the default value of this new attribute"
	aCAV compileDefaultValue isNil ifFalse: [aCAV setAttributeNewValue].
	aCAV hasBeenModified: false	"Building the Setter method code"	"	self setterAccessor value ifTrue:[ 
		self setNotification value 
			ifFalse:[ self class defineSetterMethod: variableName ofClass: targetClass protocol: 'accessing'] 
			ifTrue:[ self class silentlyDefineSetterMethodWithObserverNotification: variableName ofClass: targetClass protocol: 'accessing']]."	"Building the getter method code"	"	self getterAccessor value ifFalse: [^nil] on interdit de ne pas avoir de getter"	"Warning accessor already exist"	"	getterMethod := variableName asString asSymbol.
	(targetClass canUnderstand: getterMethod)
		ifTrue: [(Dialog confirm: ('Getter accessor already defined. \Overwrite it  ?' withCRs))
				ifFalse: [^self]]. 
	defaultValue := self defaultValueHolder value.
	self class defineGetterMethod: variableName ofClass: targetClass withDefaultValue: defaultValue protocol: 'accessing'.
	^self addCAVfromClass: targetClass attribute: getterMethod value: defaultValue"
]

{ #category : #'actions_butons' }
AttributeAdder >> addAttributDefaultName: defaultName [
	"Compile class adding the defaultName attribute, after having verifying that defaultName is a valid name.
defaultName =<String>"
	
	| newAttributName wrongCharactPlace |
	"Name verification"
	newAttributName := Cormas current request:
			'Enter an attribute name (without white space, number nor symbol)'
		initialAnswer: defaultName.
	newAttributName isNil ifTrue: [^nil].
	newAttributName isEmpty ifTrue: [^nil].
	(newAttributName at: 1) isUppercase
		ifTrue:
			[newAttributName
				at: 1
				put: (newAttributName at: 1) asLowercase].
	wrongCharactPlace := OrderedCollection new.
	1
		to: newAttributName size
		do:
			[:i | 
			| char |
			char := newAttributName at: i.
			char isDigit ifTrue: [wrongCharactPlace add: i].
			(char isAlphaNumeric or: [char = $_])
				ifFalse: [wrongCharactPlace add: i]].
	wrongCharactPlace isEmpty
		ifFalse:
			[self cormas warn: '<1s> is not a valid name. Please, enter a valid name'
				with: newAttributName.
			wrongCharactPlace do: [:n | newAttributName at: n put: $_].
			^self addAttributDefaultName: newAttributName].
	targetClass withAllSuperclasses
		do:
			[:cl | 
			(cl instVarNames includes: newAttributName)
				ifTrue:
					[self cormas
						warn:
							'The class <1s> already defines the attribute <2s> ! <n> Only a new reader accessor will be redefined for new default value.'
						with: targetClass name asString
						with: newAttributName]].
	^newAttributName	"Compile class adding the attribute"	"	aRefactoring := Refactory.Browser.AddInstanceVariableRefactoring variable:
			newAttributName class: targetClass.
	aRefactoring execute.
	^newAttributName"
]

{ #category : #'initialize-release' }
AttributeAdder >> addCAV: aCAV [
	"Add aCAV from the list of ClassAttributeValues"
	
	| aList |
	aList := self classAttribValue_List list.
	(aList includes: aCAV) ifFalse: [aList add: aCAV].
	self classAttribValue_List list: aList.
	^aCAV
]

{ #category : #'initialize-release' }
AttributeAdder >> addCAVfromClass: aClass attribute: anAttribute value: aValue [
	"Add aCAV from the list of ClassAttributeValues"
	
	| aList aCAV |
	aList := self classAttribValue_List list.
	aList
		add:
			(aCAV := CMClassAttributeValue newClass: aClass attribute: anAttribute value:
					aValue).
	self classAttribValue_List list: aList.
	^aCAV
]

{ #category : #'actions_butons' }
AttributeAdder >> addClassVarDefaultName: defaultName [
	"Compile class adding the defaultName attribute, after having verifying that defaultName is a valid name.
defaultName =<String>"
	
	| newAttributName wrongCharactPlace |
	"Name verification"
	newAttributName := self cormas request:
			'Enter a class variable name (without white space, number nor symbol)'
		initialAnswer: defaultName.
	newAttributName isNil ifTrue: [^nil].
	newAttributName isEmpty ifTrue: [^nil].
	wrongCharactPlace := OrderedCollection new.
	1
		to: newAttributName size
		do:
			[:i | 
			| char |
			char := newAttributName at: i.
			char isDigit ifTrue: [wrongCharactPlace add: i].
			(char isAlphaNumeric or: [char = $_])
				ifFalse: [wrongCharactPlace add: i]].
	wrongCharactPlace isEmpty
		ifFalse:
			[self cormas warn: '<1s> is not a valid name. Please, enter a valid name'
				with: newAttributName.
			wrongCharactPlace do: [:n | newAttributName at: n put: $_].
			^self addClassVarDefaultName: newAttributName].
	targetClass class withAllSuperclasses
		do:
			[:cl | 
			(cl instVarNames includes: newAttributName)
				ifTrue:
					[self cormas
						warn:
							'The class <1s> already defines the attribute <2s> ! <n> Only a new reader accessor will be redefined for new default value.'
						with: targetClass name asString
						with: newAttributName]].
	^newAttributName
]

{ #category : #'actions_butons' }
AttributeAdder >> addClassVariable [
	"	| variableName getterMethod defaultValue |"
	
	| variableName aCAV |
	variableName := self addClassVarDefaultName: ''.
	variableName ifNil: [^self].
	aCAV := self openValueChooserInterface.
	aCAV acceptValue.
	aCAV targetClass: targetClass class.
	aCAV targetAttribute: variableName asSymbol.
	self addCAV: aCAV.	"save automatically the default value of this new class variable"
	aCAV compileDefaultValue isNil ifFalse: [aCAV setAttributeNewValue].
	aCAV hasBeenModified: false	"variableName := self addClassVarDefaultName: ''.
	variableName = self ifTrue:[^self].
	self openValueChooserInterface."	"Building the Setter method code"	"self setterAccessor value ifTrue:[self class defineSetterMethod: variableName ofClass: targetClass class protocol: 'accessing']."	"Building the getter method code"	"defaultValue := self defaultValueHolder value.
	self getterAccessor value ifFalse: [^nil]."	"Warning accessor already exist"	"	getterMethod := variableName asString asSymbol.
	(targetClass class canUnderstand: getterMethod)
		ifTrue: [(Dialog confirm: ('Getter accessor already defined. \Overwrite it  ?' withCRs))
				ifFalse: [^self]]. 
	defaultValue := self defaultValueHolder value.
	self class defineGetterMethod: variableName ofClass: targetClass class withDefaultValue: defaultValue protocol: 'accessing'.
	^self addCAVfromClass: targetClass class attribute: getterMethod value: defaultValue"
]

{ #category : #'actions_butons' }
AttributeAdder >> createAccessorsForAttribute: variableName [
	
	| needsGetter needsSetter getterMethod defaultValue |
	self openValueChooserInterface.
	self dialogValue cancel value ifTrue: [^nil].
	needsGetter := self getterAccessor value.
	needsSetter := self setterAccessor value.
	needsSetter
		ifTrue:
			[(targetClass canUnderstand: (variableName asString , ':') asSymbol)
				ifFalse: [self defineSetterMethod]].
	needsGetter ifFalse: [^nil].	"Warning accessor already exist"
	getterMethod := variableName asString asSymbol.
	(targetClass canUnderstand: getterMethod)
		ifTrue:
			[(self cormas
				confirm: 'Getter accessor already defined.\    Overwrite it  ?' withCRs)
				ifFalse: [^self]].	"Building the method code"
	defaultValue := self defaultValueHolder value.
	self class defineGetterMethod: variableName ofClass: targetClass
		withDefaultValue: defaultValue protocol: 'accessing'.
	^self
]

{ #category : #accessing }
AttributeAdder >> dialogValue [
	
	^dialogValue
]

{ #category : #accessing }
AttributeAdder >> dialogValue: anObject [
	
	dialogValue := anObject
]

{ #category : #aspects }
AttributeAdder >> getterAccessor [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^getterAccessor isNil
		ifTrue: [getterAccessor := true asValue]
		ifFalse: [getterAccessor]
]

{ #category : #'initialize-release' }
AttributeAdder >> initForClass: aClass [
	"Create a list of ClassAttributeValue"
	
	| aList attributColl attributs aCAV |
	self initForSuperClassOf: aClass.
	aList := OrderedCollection new.
	attributColl := OrderedCollection new.
	attributs := self class staticAttributsWithAccessorsFromClass: aClass.
	attributColl
		addAll:
			(self class
				getDefaultValuesForClass: aClass class
				attributs: attributs).
	attributs := self class attributsWithAccessorsFromClass: aClass.
	attributColl
		addAll:
			(self class getDefaultValuesForClass: aClass attributs: attributs).
	attributColl
		do:
			[:coll | 
			aCAV := CMClassAttributeValue
				newClass: coll first
				attribute: (coll at: 2)
				value: (coll at: 3).
			aCAV hasBeenModified: false.
			aList add: aCAV].
	self classAttribValue_List list: aList.
	targetClass := aClass.
	super initialize
]

{ #category : #'initialize-release' }
AttributeAdder >> initForSuperClassOf: aClass [
	"Create a list of ClassAttributeValue of the superclasses of aClass"

	| aList attributColl attributs allClasses |
	(aClass inheritsFrom: CMAbstractModel)
		ifTrue: [ ^ nil ].
	aList := Set new.
	attributColl := OrderedCollection new.
	allClasses := aClass superClassesUntilEntity.
	allClasses remove: aClass.
	allClasses
		do: [ :cl | 
			attributs := self class staticAttributsWithAccessorsFromClass: cl.
			#('bounds' 'povDict' 'activityDiagrams' 'colorsDict' 'activeProbes' 'image')
				do: [ :att | attributs remove: att ifAbsent: [  ] ].	"remove attributs of CormasModel"
			#('spatialClasses' 'povColorsDict' 'socialClasses' 'cellClass' 'visualStateIsOpen' 'savedWindowInformation' 'passiveClasses' 'timeStep' 'charts')
				do: [ :att | attributs remove: att ifAbsent: [  ] ].
			attributColl
				addAll:
					(self class getDefaultValuesForClass: cl class attributs: attributs).
			attributs := self class attributsWithAccessorsFromClass: cl.
			#('povs' 'outline' 'edge' 'orderedNeighbourhood' 'flag' 'collector' 'request' 'includedEntities')
				do: [ :att | attributs remove: att ifAbsent: [  ] ].
			attributs remove: 'povs' ifAbsent: [  ].
			attributColl
				addAll: (self class getDefaultValuesForClass: cl attributs: attributs) ].
	attributColl
		do: [ :coll | 
			aList
				add:
					(CMClassAttributeValue
						newClass: coll first
						attribute: (coll at: 2)
						value: (coll at: 3)) ].
	self superClassAttribValue_List list: aList.
	super initialize
]

{ #category : #'actions_menu' }
AttributeAdder >> newRandomValue [
	
	| aCAV |
	aCAV := self selectedRow value.
	aCAV isNil ifTrue: [^self cormas warn: 'Please, select a row.'].
	self openValueChooserInterfaceOfCAV: aCAV.
	self addCAV: aCAV
]

{ #category : #defaultParameters }
AttributeAdder >> nilAsValue [
	
	self dialogValue close.
	self dialogValue cancel value: true.
	self dialogValue accept value: false.
	self defaultValueHolder value: nil
]

{ #category : #defaultParameters }
AttributeAdder >> openValueChooserInterface [
	
	| aCAV |
	aCAV := CMClassAttributeValue new.
	aCAV targetClass: targetClass.	"dialogValue := SimpleDialog new. 
	dialogValue openFor: aCAV interface: #valueChooserWindow."
	aCAV openDialogInterface: #valueChooserWindow.
	^aCAV
]

{ #category : #defaultParameters }
AttributeAdder >> openValueChooserInterfaceOfCAV: aCAV [
	"dialogValue := SimpleDialog new.
	dialogValue openFor: aCAV interface: #valueChooserWindow.	"
	"	aCAV openDialogInterface: #valueChooserWindow."
	
	aCAV openDialogInterface: #valueChooserWindow.
	aCAV acceptValue
]

{ #category : #aspects }
AttributeAdder >> randomValueHolder [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^randomValueHolder isNil
		ifTrue: [randomValueHolder := String new asValue]
		ifFalse: [randomValueHolder]
]

{ #category : #'actions_menu' }
AttributeAdder >> removeAttribute [
	"Remove the attribute targeted by the selected row, but also the reader and writter acccessors"
	
	| aCAV |
	aCAV := self selectedRow value.
	aCAV isNil ifTrue: [^self cormas warn: 'Please, select a row.'].
	self removeAttributeOf: aCAV
]

{ #category : #'actions_menu' }
AttributeAdder >> removeAttributeOf: aCAV [
	"Remove the attribute targeted by aCAV, but also the reader & writter acccessors and the default accessor at class level.
	aCAV =<ClassAttributeValue>"
	
	(self cormas
		confirm:
			'Do you really want to remove the attribute ''<1s> '' and its accessors?'
		with: aCAV targetAttribute asString) ifFalse: [^nil].
	aCAV valueType = Random ifTrue: [aCAV removeRandomAttribute].
	(aCAV targetClass instVarNames includes: aCAV targetAttribute asString)
		ifTrue:
			[aCAV targetClass removeInstVarName: aCAV targetAttribute asString]
		ifFalse:
			[aCAV targetClass withAllSuperclasses
				do:
					[:cl | 
					(cl instVarNames includes: aCAV targetAttribute asString)
						ifTrue:
							[self cormas
								warn:
									'Be careful ! The attribute ''<1s>'' is defined in the super class <2s>.<n>Cormas will just only remove the getter accessor (with its default value) defined at <3s> level.'
								with: aCAV targetAttribute asString
								with: cl name
								with: aCAV targetClass name]]].
	self
		removeSelector: aCAV targetAttribute
		from: aCAV targetClass.
	self
		removeSelector: (aCAV targetAttribute , '_default') asSymbol
		from: aCAV targetClass class.
	self
		removeSelector: (aCAV targetAttribute , '_default') asSymbol
		from: aCAV targetClass.
	self
		removeSelector: (aCAV targetAttribute , ':') asSymbol
		from: aCAV targetClass.
	self classAttribValue_List listHolder value remove: aCAV
]

{ #category : #private }
AttributeAdder >> removeSelector: aSelector from: aClass [
	"remove a selector from aClass. Do nothing if aSelector is absent for aClass"
	
	aClass removeSelector: aSelector	"No need for check"
]

{ #category : #'actions_menu' }
AttributeAdder >> renameAttribute [
	"Rename the attribute targeted by the selected row, but also the reader and writter acccessors + the default accessor at class level."
	
	| aCAV newName oldName |
	aCAV := self selectedRow value.
	aCAV isNil ifTrue: [^self cormas warn: 'Please, select a row.'].
	oldName := aCAV targetAttribute.
	newName := Cormas current
		request: 'Enter new attribute name'
		initialAnswer: oldName asString.
	newName = '' ifTrue: [^nil].	"Renaming the attribute"
	(aCAV targetClass instVarNames includes: oldName asString)
		ifTrue:
			[Cormas
				renameAttribute: oldName
				to: newName
				inClass: aCAV targetClass]
		ifFalse:
			[aCAV targetClass withAllSuperclasses
				do:
					[:cl | 
					(cl instVarNames includes: oldName asString)
						ifTrue:
							[(self cormas
								confirm:
									'Be careful ! The attribute ''<1s>'' is defined in the super-class <2s>.<n>Cormas will rename this attribute and all its accessors defined in <2s> and its super-classes.'
								with: oldName asString
								with: cl name asString)
								ifFalse: [^nil]
								ifTrue: [Cormas renameAttribute: oldName to: newName inClass: cl]]]].	"Renaming the accessors of the target class and its super classes and sub classes"
	((aCAV targetClass withAllSuperclasses)
		addAll: aCAV targetClass allSubclasses;
		yourself)
		do:
			[:cl | 
			(cl includesSelector: oldName)
				ifTrue:
					[Cormas
						renameSelector: oldName asSymbol
						to: newName asSymbol
						nbArguments: 0
						inClass: cl].
			(cl includesSelector: (oldName , ':') asSymbol)
				ifTrue:
					[Cormas
						renameSelector: (oldName , ':') asSymbol
						to: (newName , ':') asSymbol asSymbol
						nbArguments: 1
						inClass: cl].
			(cl class includesSelector: ('default_' , oldName) asSymbol)
				ifTrue:
					[Cormas
						renameSelector: ('default_' , oldName) asSymbol
						to: ('default_' , newName) asSymbol asSymbol
						nbArguments: 1
						inClass: cl class]].	"Refreshing the list"
	aCAV targetAttribute: newName asSymbol.	"self classAttribValue_List refreshList: self classAttribValue_List listHolder value"
	self classAttribValue_List
		list: self classAttribValue_List listHolder value.
	self superClassAttribValue_List listHolder value
		do:
			[:cav | 
			cav targetAttribute = oldName
				ifTrue: [cav targetAttribute: newName asSymbol]].
	self superClassAttribValue_List
		list: self superClassAttribValue_List listHolder value
]

{ #category : #aspects }
AttributeAdder >> setChanged [
	"add the 'self changed' instruction of  setter accessor of the attribute targeted by the selected row"
	
	| aCAV |
	aCAV := self selectedRow value.
	aCAV isNil ifTrue: [^self cormas warn: 'Please, select a row.'].
	(self class
		isChangedPerformedForAttribut: aCAV targetAttribute
		ofClass: aCAV targetClass)
		ifFalse:
			[(self cormas confirm:
					'Do you want to update the space window and the other observers each time the value of this attribute is changed ?')
				ifTrue:
					[self class
						silentlyDefineSetterMethodWithObserverNotification:
							aCAV targetAttribute
						ofClass: aCAV targetClass
						protocol: 'accessing']]
		ifTrue:
			[(self cormas confirm:
					'Do you want to remove the update of the space window and the other observers when the value of this attribute is changed ?')
				ifTrue:
					[self class
						silentlyDefineSetterMethod: aCAV targetAttribute
						ofClass: aCAV targetClass
						protocol: 'accessing']]
]

{ #category : #aspects }
AttributeAdder >> setNotification [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^setNotification isNil
		ifTrue: [setNotification := true asValue]
		ifFalse: [setNotification]
]

{ #category : #aspects }
AttributeAdder >> setterAccessor [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^setterAccessor isNil
		ifTrue: [setterAccessor := true asValue]
		ifFalse: [setterAccessor]
]

{ #category : #accessing }
AttributeAdder >> targetClass: aClass [
	
	targetClass := aClass 
]

{ #category : #aspects }
AttributeAdder >> typeOfValue [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^typeOfValue isNil
		ifTrue: [typeOfValue := nil asValue]
		ifFalse: [typeOfValue]
]

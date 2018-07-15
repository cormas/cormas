Class {
	#name : #ClassAttributeValue,
	#superclass : #UIApplicationModel,
	#instVars : [
		'targetClass',
		'targetAttribute',
		'currentValue',
		'valueType',
		'hasBeenModified',
		'isHidden',
		'randInteger',
		'maxValueHolder',
		'minValueHolder',
		'intOrFloat',
		'upperConstraint',
		'lowerConstraint',
		'setNotification',
		'setterAccessor',
		'typeOfValue',
		'defaultValueHolder',
		'randomValueHolder',
		'getterAccessor',
		'entityInstances'
	],
	#category : 'Cormas-Core-Others'
}

{ #category : #new }
ClassAttributeValue class >> newClass: aClass attribute: attributeSymbol value: value [
	
	| inst |
	inst := self new.
	inst setClass: aClass attribut: attributeSymbol value: value.
	^inst
]

{ #category : #'interface specs' }
ClassAttributeValue class >> randomChooserWindow [
	"Tools.UIPainter new openOnClass: self andSelector: #randomChooserWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Random chooser' 
			#min: #(Point 229 211) 
			#max: #(Point 329 311) 
			#bounds: #(Rectangle 720 450 949 661)) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 21 73) 
				#name: #Label1 
				#label: 'Enter the range limits:' 
				#style: #systemDefault) #(InputFieldSpec 
				#layout: #(Rectangle 43 117.5 94 142.5) 
				#model: #minValueHolder 
				#helpText: 'Write a number, a String or a Symbol as default value for this attribute' 
				#type: #object) #(ActionButtonSpec 
				#layout: #(Rectangle 25 171 106 194) 
				#name: #ActionButton1 
				#model: #accept 
				#label: 'OK' 
				#isDefault: true 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 128 171 209 194) 
				#name: #ActionButton2 
				#model: #cancel 
				#label: 'Cancel' 
				#defaultable: true) #(GroupBoxSpec 
				#layout: #(Rectangle 13 6 211 70) 
				#name: #GroupBox1 
				#label: 'Number type' 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 134 118 185 142) 
				#name: #InputField1 
				#model: #maxValueHolder 
				#type: #object) #(LabelSpec 
				#layout: #(Point 148 95) 
				#name: #Label2 
				#label: 'and:' 
				#style: #small) #(LabelSpec 
				#layout: #(Point 42 95) 
				#name: #Label3 
				#label: 'between:' 
				#style: #small) #(RadioButtonSpec 
				#layout: #(Point 62 22) 
				#name: #RadioButton1 
				#model: #intOrFloat 
				#label: 'random Integer' 
				#select: #randomInteger) #(RadioButtonSpec 
				#layout: #(Point 62 45) 
				#name: #RadioButton2 
				#model: #intOrFloat 
				#label: 'random Float' 
				#select: #randomFloat) #(InputFieldSpec 
				#layout: #(Rectangle 24 115 42 143) 
				#name: #lowerConstraint 
				#flags: 0 
				#model: #lowerConstraint 
				#tabable: false 
				#style: #large 
				#isReadOnly: true) #(InputFieldSpec 
				#layout: #(Rectangle 186 115 204 143) 
				#name: #upperConstraint 
				#flags: 0 
				#model: #upperConstraint 
				#tabable: false 
				#style: #large 
				#isReadOnly: true) #(LabelSpec 
				#layout: #(Point 108 120) 
				#name: #Label4 
				#label: ';'))))
]

{ #category : #'interface specs' }
ClassAttributeValue class >> valueChooserWindow [
	"Tools.UIPainter new openOnClass: self andSelector: #valueChooserWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #DefaultValueChooser 
				#defaultString: 'Default value chooser') 
			#min: #(Point 323 214) 
			#max: #(Point 355 311) 
			#bounds: #(Rectangle 720 450 1043 664)) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 119 79 303 103) 
				#name: #defaultInputField 
				#model: #defaultValueHolder 
				#helpText: 'Enter a number, a ''String'' or a Symbo as default value for this attribute' 
				#type: #object) #(ActionButtonSpec 
				#layout: #(Rectangle 121 183 202 206) 
				#name: #ActionButton1 
				#model: #accept 
				#label: 'OK' 
				#isDefault: true 
				#defaultable: true) #(CheckBoxSpec 
				#layout: #(Point 23 8) 
				#name: #CheckBox1 
				#model: #setterAccessor 
				#helpText: 'Select to define a Setter accessor' 
				#label: #(UserMessage 
					#key: #setterAccessor 
					#defaultString: 'Setter accessor')) #(CheckBoxSpec 
				#layout: #(Point 23 33) 
				#name: #CheckBox2 
				#model: #getterAccessor 
				#helpText: 'Select to define a Getter accessor' 
				#label: #(UserMessage 
					#key: #getterAccessor 
					#defaultString: 'Getter accessor')) #(CheckBoxSpec 
				#layout: #(Point 138 10) 
				#name: #setNotification 
				#model: #setNotification 
				#helpText: 'add ''''self changed'''' in Getter method' 
				#label: 'Notify observers when changed') #(RadioButtonSpec 
				#layout: #(Point 22 80) 
				#name: #RadioButton1 
				#model: #typeOfValue 
				#helpText: 'Select this option to set a default value' 
				#label: 'Fixed value' 
				#select: #fixedValue) #(RadioButtonSpec 
				#layout: #(Point 22 113) 
				#name: #RadioButton2 
				#model: #typeOfValue 
				#helpText: 'Select this option to define a random value' 
				#label: 'Random value' 
				#select: #randomValue) #(GroupBoxSpec 
				#layout: #(Rectangle 9 57 314 175) 
				#name: #GroupBox1 
				#label: 'Enter a default value for this attribute') #(RadioButtonSpec 
				#layout: #(Point 22 146) 
				#name: #RadioButton3 
				#model: #typeOfValue 
				#helpText: 'Select this option if the attribute has no default value' 
				#label: 'Without default value' 
				#select: #nilAsValue) #(InputFieldSpec 
				#layout: #(Rectangle 119 110 303 135) 
				#name: #randomField 
				#model: #randomValueHolder 
				#isReadOnly: true))))
]

{ #category : #actions }
ClassAttributeValue >> accept [
	"This stub method was generated by UIDefiner"
	
	^self
]

{ #category : #actions }
ClassAttributeValue >> acceptValue [
	
	| value |
	value := self defaultValueHolder value.
	self typeOfValue value = #randomValue
		ifFalse:
			[self valueType: value class.
			self currentValue: value].
	self hasBeenModified: true	"	self closeAndUnschedule.
	^self closeRequest"
]

{ #category : #random }
ClassAttributeValue >> addRandomAttribute [
	"' Compile #randomAttributes as class method into targetClass by adding an array: #(#attribute scopeLevel #randFloat min max) "
	
	| aList theClass |
	self valueType: Random.
	self targetClass isMeta
		ifTrue:
			[theClass := self targetClass instanceBehavior.
			aList := List
				with: self targetAttribute
				with: #class
				with: self intOrFloat value]
		ifFalse:
			[theClass := self targetClass.
			aList := List
				with: self targetAttribute
				with: #instance
				with: self intOrFloat value].
	aList
		add: self minValueHolder value;
		add: self maxValueHolder value.
	theClass addRandomAttributes: (Array withAll: aList)
]

{ #category : #'access as String' }
ClassAttributeValue >> asString [
	"Ex: 'Predator_energy: 12'  "
	
	^self classNameAsString , '_' , self attributeAsString , ': '
		, self currentValueAsString
]

{ #category : #'access as String' }
ClassAttributeValue >> attributeAsString [
	
	^self targetAttribute
]

{ #category : #actions }
ClassAttributeValue >> cancel [
	"This stub method was generated by UIDefiner"
	
	^self
]

{ #category : #random }
ClassAttributeValue >> chooseRandomness [
	"Open a random dialog to choose the type of randomness (float or Integer) and to set the range limits"
	
	| dialogValue |
	dialogValue := SimpleDialog new.
	dialogValue openFor: self interface: #randomChooserWindow.
	dialogValue accept value ifFalse: [^nil].
	self minValueHolder value < self maxValueHolder value
		ifFalse:
			[Dialog warn: 'Low limit must be lower than the upper limit'.
			^self chooseRandomness].
	self valueType: Random.
	^self currentValue: self randomAsString
]

{ #category : #'access as String' }
ClassAttributeValue >> classNameAsString [
	
	^self targetClass name
]

{ #category : #compiling }
ClassAttributeValue >> compileDefaultValue [
	"Save definitively the changed parameters with the Initial value: compiles the attribute reader accessor and compiles the attribute_default method"
	
	self createAttribute.
	self valueType = Random ifTrue: [self addRandomAttribute].	"Building the Setter method code"
	self setterAccessor value
		ifTrue:
			[self setNotification value
				ifFalse:
					[DefaultAttributesSetter
						defineSetterMethod: self targetAttribute
						ofClass: self targetClass
						protocol: 'accessing']
				ifTrue:
					[DefaultAttributesSetter
						defineSetterMethodWithObserverNotification: self targetAttribute
						ofClass: self targetClass
						protocol: 'accessing']].	"Building the getter method code"	"self getterAccessor value ifFalse: [^nil] on interdit de ne pas avoir de getter"	"Warning accessor already exist"	"getterMethod := self targetAttribute asSymbol.
	(self targetClass canUnderstand: getterMethod)
		ifTrue:
			[(self confirmRedefine) ifFalse: [^nil]]."
	DefaultAttributesSetter defineGetterMethodFrom: self protocol: 'accessing'.
	DefaultAttributesSetter
		defineDefaultClassMethod: self targetAttribute
		ofClass: self targetClass
		withDefaultValue: self currentValue.
	self setAttributeNewValue
]

{ #category : #confirm }
ClassAttributeValue >> confirmRedefine [
	" 'Getter accessor for 'XXX already defined. 
	Overwrite it  ?"
	
	| text |
	" 'Getter accessor for ', getterMethod asString, ' already defined. \Overwrite it  ?' withCRs"
	text := 'Getter accessor for ' asText.
	text := text
		, (self targetAttribute asString asText emphasizeAllWith: #bold).
	text := text , ' (defaultValue: ' asText.
	text := text
		, (self currentValue asString asText emphasizeAllWith: #(#italic)).
	text := text , ') is already defined. \Overwrite it  ?' asText withCRs.	"	(defAttrib currentValueAsString asText
						emphasizeAllWith: #color -> ColorValue red) asText."
	^Dialog confirm: text asText
]

{ #category : #accessing }
ClassAttributeValue >> cormas [
	
	^Cormas current
]

{ #category : #compiling }
ClassAttributeValue >> createAttribute [
	"Save definitively the changed parameters with the Initial value: compiles the attribute reader accessor and compiles the attribute_default method"
	
	| aRefactoring |
	targetClass withAllSuperclasses
		do:
			[:cl | 
			(cl instVarNames includes: self targetAttribute asString)
				ifTrue: [^targetAttribute]].	"Compile class adding the attribute"
	targetClass isMeta
		ifFalse:
			[aRefactoring := AddInstanceVariableRefactoring
				variable: targetAttribute asString
				class: targetClass.
			aRefactoring execute]
		ifTrue:
			[aRefactoring := AddInstanceVariableRefactoring
				variable: targetAttribute asString
				class: targetClass.
			aRefactoring transform.
			RefactoringManager instance addRefactoring: aRefactoring].
	^targetAttribute
]

{ #category : #accessing }
ClassAttributeValue >> currentValue [
	
	^currentValue
]

{ #category : #accessing }
ClassAttributeValue >> currentValue: anObject [
	"self hasBeenModified: (currentValue = anObject) not."
	
	currentValue := anObject.
	self valueType = Random ifFalse: [valueType := anObject class].
	^anObject
]

{ #category : #'access as String' }
ClassAttributeValue >> currentValueAsString [
	
	(currentValue isKindOf: ClassAttributeValue) ifTrue: [^nil].
	self currentValue isSymbol ifTrue: [^self currentValue printString].
	self currentValue isString ifTrue: [^self currentValue printString].
	^self currentValue asString
]

{ #category : #'access as String' }
ClassAttributeValue >> currentValueAsString: anObject [
	
	anObject isNil
		ifTrue:
			["text := 'Undefined Object.\\Please use quote for a string (ex: ''Zorba'') \\If ' withCRs asText.
text := text, (self targetAttribute asText emphasizeAllWith: #(#bold #italic #color -> ColorValue red)).
text := text, ' is without default value, write ' asText.
text := text, ('''nil''' asText emphasizeAllWith: #(#bold)).
text := text, ' (with quote). \If ' withCRs.
text := text, (self targetAttribute asText emphasizeAllWith: #(#bold #italic #color -> ColorValue red)).
text := text, ' is a random value, write ' asText.
text := text, ('''random''' asText emphasizeAllWith: #(#bold)).
text := text, ' (with quote).' withCRs.
^Dialog warn: text"
			^nil].
	self hasBeenModified: (currentValue = anObject) not.
	(anObject isString
		and: [(anObject findString: 'random' startingAt: 1) = 1])
		ifTrue:
			[| theClass |
			"test if already defined"
			theClass := targetClass isMeta
				ifTrue: [targetClass instanceBehavior]
				ifFalse: [targetClass].
			(theClass
				hasRandomAttribute: targetAttribute
				classVariable: targetClass isMeta
				value: anObject) ifFalse: [^self chooseRandomness]].
	(anObject isKindOf: Array)
		ifTrue: [^self currentValue: (Array withAll: anObject)].
	anObject = 'nil' ifTrue: [^self currentValue: nil].
	^self currentValue: anObject
]

{ #category : #aspects }
ClassAttributeValue >> defaultValueHolder [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^defaultValueHolder isNil
		ifTrue: [defaultValueHolder := nil asValue]
		ifFalse: [defaultValueHolder]
]

{ #category : #accessing }
ClassAttributeValue >> entityInstances [
	
	^entityInstances
]

{ #category : #accessing }
ClassAttributeValue >> entityInstances: anObject [
	
	entityInstances := anObject
]

{ #category : #aspects }
ClassAttributeValue >> getterAccessor [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^getterAccessor isNil
		ifTrue: [getterAccessor := true asValue]
		ifFalse: [getterAccessor]
]

{ #category : #accessing }
ClassAttributeValue >> hasBeenModified [
	
	^hasBeenModified ifNil: [hasBeenModified := false]
]

{ #category : #accessing }
ClassAttributeValue >> hasBeenModified: anObject [
	"anObject ifTrue:[self halt]."
	
	hasBeenModified := anObject
]

{ #category : #'initialize-release' }
ClassAttributeValue >> initialize [
	
	self intOrFloat onChangeSend: #rangeConstraintsChanged to: self.
	self typeOfValue onChangeSend: #typeChanged to: self.
	^super initialize
]

{ #category : #aspects }
ClassAttributeValue >> intOrFloat [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^intOrFloat isNil
		ifTrue: [intOrFloat := #randomFloat asValue]
		ifFalse: [intOrFloat]
]

{ #category : #accessing }
ClassAttributeValue >> isHidden [
	
	^isHidden ifNil: [isHidden := false]
]

{ #category : #accessing }
ClassAttributeValue >> isHidden: anObject [
	
	isHidden := anObject
]

{ #category : #aspects }
ClassAttributeValue >> lowerConstraint [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^lowerConstraint isNil
		ifTrue: [lowerConstraint := ']' asValue]
		ifFalse: [lowerConstraint]
]

{ #category : #aspects }
ClassAttributeValue >> maxValueHolder [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^maxValueHolder isNil
		ifTrue: [maxValueHolder := 1 asValue]
		ifFalse: [maxValueHolder]
]

{ #category : #aspects }
ClassAttributeValue >> minValueHolder [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^minValueHolder isNil
		ifTrue: [minValueHolder := 0 asValue]
		ifFalse: [minValueHolder]
]

{ #category : #'access as String' }
ClassAttributeValue >> randomAsString [
	"'example: 'randFloat: ]0 ; 10.2['   "
	
	| text |
	text := self intOrFloat value asString , ': '.
	text := text , self lowerConstraint value.
	text := text , self minValueHolder value printString , ' ; '.
	text := text , self maxValueHolder value printString.
	text := text , self upperConstraint value.
	^text
]

{ #category : #aspects }
ClassAttributeValue >> randomValueHolder [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^randomValueHolder isNil
		ifTrue: [randomValueHolder := String new asValue]
		ifFalse: [randomValueHolder]
]

{ #category : #random }
ClassAttributeValue >> rangeConstraintsChanged [
	
	self intOrFloat value = #randomFloat
		ifTrue:
			[upperConstraint value: '['.
			lowerConstraint value: ']']
		ifFalse:
			[upperConstraint value: ']'.
			lowerConstraint value: '[']
]

{ #category : #random }
ClassAttributeValue >> removeRandomAttribute [
	"' Compile #randomAttributes as class method into targetClass by removing an array: #(#attribute scopeLevel #randFloat min max) "
	
	| aList theClass |
	self targetClass isMeta
		ifTrue:
			[theClass := self targetClass instanceBehavior.
			aList := List
				with: self targetAttribute
				with: #class
				with: self intOrFloat value]
		ifFalse:
			[theClass := self targetClass.
			aList := List
				with: self targetAttribute
				with: #instance
				with: self intOrFloat value].
	aList
		add: self minValueHolder value;
		add: self maxValueHolder value.
	theClass removeRandomAttributes: (Array withAll: aList)
]

{ #category : #actions }
ClassAttributeValue >> setAttributeInitialValue [
	"reset the parameter of the target classe to nil, then calls the attribut reader accessors to set the initial value"
	
	| writeAccessor allInstances |
	writeAccessor := (self targetAttribute , ':') asSymbol.
	allInstances := self targetClass allInstances.
	allInstances isEmpty
		ifTrue:
			[allInstances := OrderedCollection with: self targetClass basicNew].
	allInstances
		do:
			[:instance | 
			instance perform: writeAccessor with: nil.
			self currentValue: (instance perform: self targetAttribute)].
	self hasBeenModified: false.
	self setAttributeNewValue
]

{ #category : #actions }
ClassAttributeValue >> setAttributeNewValue [
	"set the attribut (of targetAttribute) to its new value (currentValue) by calling the writter accessor of the attribute"
	
	| writeAccessor allInstances |
	writeAccessor := (self targetAttribute , ':') asSymbol.
	allInstances := self entityInstances
		ifNil: [self targetClass allInstances].
	self valueType = Random
		ifTrue:
			[allInstances do: [:instance | instance perform: writeAccessor with: nil]]
		ifFalse:
			[allInstances
				do:
					[:instance | 
					instance
						perform: writeAccessor
						with: self currentValue]]
]

{ #category : #actions }
ClassAttributeValue >> setClass: class attribut: attrib value: valor [
	
	| theClass |
	targetClass := class.
	targetAttribute := attrib.
	theClass := class isMeta
		ifTrue: [class instanceBehavior]
		ifFalse: [class].
	(theClass
		isRandomAttribute: targetAttribute
		classVariable: (theClass = class) not) ifTrue: [^valueType := Random].
	theClass isGenericEntity
		ifTrue: [currentValue := valor]
		ifFalse:
			[(class instVarNames includes: attrib asString)
				ifFalse: [currentValue := valor]
				ifTrue: [currentValue := self currentValueAsString: valor]].
	valor isString
		ifTrue:
			[(valor findString: 'random' startingAt: 1) = 1
				ifTrue: [^valueType := Random]].
	valueType := valor class
]

{ #category : #aspects }
ClassAttributeValue >> setNotification [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^setNotification isNil
		ifTrue: [setNotification := false asValue]
		ifFalse: [setNotification]
]

{ #category : #aspects }
ClassAttributeValue >> setterAccessor [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^setterAccessor isNil
		ifTrue: [setterAccessor := true asValue]
		ifFalse: [setterAccessor]
]

{ #category : #accessing }
ClassAttributeValue >> targetAttribute [
	
	^targetAttribute
]

{ #category : #accessing }
ClassAttributeValue >> targetAttribute: anObject [
	
	targetAttribute := anObject
]

{ #category : #accessing }
ClassAttributeValue >> targetClass [
	
	^targetClass
]

{ #category : #accessing }
ClassAttributeValue >> targetClass: anObject [
	
	targetClass := anObject
]

{ #category : #actions }
ClassAttributeValue >> testIfModified [
	"test If the parameter initial value has been modified, then store information in hasBeenModified "
	
	| default initial |
	self valueType = Random ifTrue: [^self hasBeenModified: false].
	default := DefaultAttributesSetter
		getDefaultValueOfAttribut: self targetAttribute
		ofClass: self targetClass.
	initial := DefaultAttributesSetter
		getInitialValueOfAttribut: self targetAttribute
		ofClass: self targetClass.
	default = initial
		ifTrue: [self hasBeenModified: false]
		ifFalse:
			[default isNil
				ifTrue: [self hasBeenModified: false]
				ifFalse:
					[default class = initial class
						ifFalse:
							[self hasBeenModified: true.
							^true].
					default cormasHelper isTypeSet
						ifTrue:
							[self
								hasBeenModified:
									(default cormasHelper elementsOf: default equalElemenstOf: initial) not]
						ifFalse: [self hasBeenModified: true]]].
	^self hasBeenModified
]

{ #category : #random }
ClassAttributeValue >> typeChanged [
	
	| result |
	self typeOfValue value = #nilAsValue
		ifTrue:
			[self randomValueHolder value: nil.
			^self defaultValueHolder value: nil].
	self typeOfValue value = #fixedValue
		ifTrue: [^self randomValueHolder value: nil].
	result := self chooseRandomness.
	self randomValueHolder value: result.
	result ifNil: [^self typeOfValue value: #fixedValue].
	self defaultValueHolder value: nil
]

{ #category : #aspects }
ClassAttributeValue >> typeOfValue [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^typeOfValue isNil
		ifTrue: [typeOfValue := #fixedValue asValue]
		ifFalse: [typeOfValue]
]

{ #category : #aspects }
ClassAttributeValue >> upperConstraint [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^upperConstraint isNil
		ifTrue: [upperConstraint := '[' asValue]
		ifFalse: [upperConstraint]
]

{ #category : #accessing }
ClassAttributeValue >> valueType [
	
	^valueType
]

{ #category : #accessing }
ClassAttributeValue >> valueType: anObject [
	
	valueType := anObject
]

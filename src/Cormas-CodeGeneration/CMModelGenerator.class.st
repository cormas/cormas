Class {
	#name : 'CMModelGenerator',
	#superclass : 'Object',
	#instVars : [
		'modelName',
		'modelClassName',
		'prefix',
		'description',
		'shouldGenerateTestPackage',
		'shouldGenerateBaseline',
		'modelClass',
		'testClass',
		'baselineClass'
	],
	#category : 'Cormas-CodeGeneration',
	#package : 'Cormas-CodeGeneration'
}

{ #category : 'entity names' }
CMModelGenerator >> baselineClassName [

	| basename |
	basename := self basename.
	basename ifEmpty: [ ^ '' ].
	
	"If basename looks like a prefix then we add 'Model' to it. Because BaselineOfFFModel and BaselineOfMooModel looks better than BaselineOfFF and BaselineOfMoo"	
	((basename allSatisfy: [ :char | char isUppercase ]) or: [ basename size <= 3 ])
		ifTrue: [ basename := basename, 'Model' ].

	^ 'BaselineOf', basename
]

{ #category : 'entity names' }
CMModelGenerator >> baselinePackageName [

	^ self baselineClassName
]

{ #category : 'accessing' }
CMModelGenerator >> basename [
	"Basename is the camelcase name of the model without spaces and without the word 'Model' at the end. It is used to infer names for packages, classes, etc."
	
	^ (self basenameFrom: modelName)
		ifEmpty: [ (self basenameFrom: modelClassName)
			ifEmpty: [ prefix ] ]
]

{ #category : 'accessing' }
CMModelGenerator >> basenameFrom: aString [

	| basename |
	basename := aString asCamelCase.
	
	(basename asLowercase endsWith: 'model') ifTrue: [ 
		basename := basename copyFrom: 1 to: basename size - 'model' size ].
	
	^ basename
]

{ #category : 'accessing' }
CMModelGenerator >> description [

	^ description
]

{ #category : 'accessing' }
CMModelGenerator >> description: anObject [

	description := anObject
]

{ #category : 'code generation' }
CMModelGenerator >> generate [

	(self packageOrganizer hasPackage: self modelPackageName) ifTrue: [
		self error: 'Package ', self modelPackageName, ' already exists. Please choose a different model name' ].

	self generatePackagesAndClasses.
	self generateMethods.
]

{ #category : 'code generation' }
CMModelGenerator >> generateDescriptionMethod [

	| method |
	
	method := modelClass compiler compile: ('aboutThisModel
	"Use this method to provide a detailed description of your model in Microdown"
	^ ''', description, '''').

	modelClass class
		addSelector: #aboutThisModel
		withMethod: method.
]

{ #category : 'code generation' }
CMModelGenerator >> generateMethods [

	self generateModelNameMethod.
	self generatePrefixMethod.
	
	description ifNotEmpty: [ self generateDescriptionMethod ]
]

{ #category : 'code generation' }
CMModelGenerator >> generateModelNameMethod [

	| method |
	
	method := modelClass compiler compile: ('modelName
	"A human-friendly name of the model"
	^ ''', modelName, '''').

	modelClass class
		addSelector: #modelName
		withMethod: method.
]

{ #category : 'code generation' }
CMModelGenerator >> generatePackagesAndClasses [

	shouldGenerateTestPackage ifTrue: [ 
		testClass := (TestCase << self testClassName asSymbol
			package: self testPackageName) install ].
		
	shouldGenerateBaseline ifTrue: [ 
		baselineClass := (BaselineOf << self baselineClassName asSymbol
			package: self baselinePackageName) install ].

	modelClass := (CMAbstractModel << self modelClassName asSymbol
		package: self modelPackageName) install.
]

{ #category : 'code generation' }
CMModelGenerator >> generatePrefixMethod [

	| method |
	
	method := modelClass compiler compile: ('prefix
	"Every class name in model package must begin with this prefix"
	^ ''', prefix, '''.').
	
	method protocol: 'accessing'.

	modelClass class
		addSelector: #prefix
		withMethod: method.
]

{ #category : 'initialization' }
CMModelGenerator >> initialize [

	super initialize.
	
	modelName := ''.
	prefix := ''.
	modelClassName := ''.
	description := ''.
	shouldGenerateTestPackage := true.
	shouldGenerateBaseline := true
]

{ #category : 'accessing' }
CMModelGenerator >> modelClassName [

	modelClassName ifNotEmpty: [ ^ modelClassName ].
	self prefix ifNotEmpty: [ ^ self modelClassNameFromPrefix ].
	^ ''
]

{ #category : 'accessing' }
CMModelGenerator >> modelClassName: aString [

	self validateModelClassName: aString.
	modelClassName := aString
]

{ #category : 'as yet unclassified' }
CMModelGenerator >> modelClassNameFromPrefix [

	^ self prefix, 'Model'
]

{ #category : 'accessing' }
CMModelGenerator >> modelName [

	^ modelName
]

{ #category : 'accessing' }
CMModelGenerator >> modelName: aString [

	self validateModelName: aString.
	modelName := aString
]

{ #category : 'entity names' }
CMModelGenerator >> modelPackageName [

	^ self basename
		ifNotEmpty: [ :aName | aName, '-Model' ]
		ifEmpty: [ '' ]
]

{ #category : 'accessing' }
CMModelGenerator >> prefix [

	^ prefix ifEmpty: [ self prefixFromBasename ]
]

{ #category : 'accessing' }
CMModelGenerator >> prefix: aString [

	self validatePrefix: aString.
	prefix := aString
]

{ #category : 'as yet unclassified' }
CMModelGenerator >> prefixFromBasename [

	| basename capitalLetters |
	
	basename := self basename select: [ :char | char isAlphaNumeric ].
	
	capitalLetters := basename select: [ :char | char isUppercase ].
	capitalLetters size > 1 ifTrue: [ ^ capitalLetters ].
	
	^ basename first: (3 min: basename size)
]

{ #category : 'accessing' }
CMModelGenerator >> shouldGenerateBaseline [

	^ shouldGenerateBaseline
]

{ #category : 'accessing' }
CMModelGenerator >> shouldGenerateBaseline: anObject [

	shouldGenerateBaseline := anObject
]

{ #category : 'accessing' }
CMModelGenerator >> shouldGenerateTestPackage [

	^ shouldGenerateTestPackage
]

{ #category : 'accessing' }
CMModelGenerator >> shouldGenerateTestPackage: anObject [

	shouldGenerateTestPackage := anObject
]

{ #category : 'entity names' }
CMModelGenerator >> testClassName [

	^ self modelClassName
		ifNotEmpty: [ :className | className, 'Test' ]
		ifEmpty: [ '' ]
]

{ #category : 'entity names' }
CMModelGenerator >> testPackageName [

	^ self modelPackageName
		ifNotEmpty: [ :aName | aName, '-Tests' ]
		ifEmpty: [ '' ]
]

{ #category : 'validation' }
CMModelGenerator >> validateModelClassName: aString [
	"Raise exception if any of the validity conditions are not satisfied"

	aString ifEmpty: [ 
		self error: 'A class name must not be empty!' ].

	aString isAllAlphaNumerics ifFalse: [
		self error: 'A class name must only contain letters or digits!' ].
	
	aString first isLetter ifFalse: [ 
		self error: 'A class name must begin with a letter!' ].
	
	aString first isUppercase ifFalse: [ 
		self error: 'A class name must begin with an uppercase letter!' ].
]

{ #category : 'validation' }
CMModelGenerator >> validateModelName: aString [
	"Raise exception if any of the validity conditions are not satisfied"

	aString ifEmpty: [ 
		self error: 'Model name must not be empty!' ]
]

{ #category : 'validation' }
CMModelGenerator >> validatePrefix: aString [
	"Raise exception if any of the validity conditions are not satisfied"

	aString ifEmpty: [ 
		self error: 'Prefix must not be empty!' ].

	aString isAllAlphaNumerics ifFalse: [
		self error: 'Prefix must only contain letters or digits!' ].
	
	aString first isLetter ifFalse: [ 
		self error: 'Prefix must begin with a letter!' ].
	
	aString first isUppercase ifFalse: [ 
		self error: 'Prefix must begin with an uppercase letter!' ].
]

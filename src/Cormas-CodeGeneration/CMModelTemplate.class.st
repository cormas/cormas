Class {
	#name : 'CMModelTemplate',
	#superclass : 'Object',
	#instVars : [
		'name',
		'prefix',
		'description',
		'shouldGenerateTestPackage',
		'modelClass',
		'testClass'
	],
	#category : 'Cormas-CodeGeneration',
	#package : 'Cormas-CodeGeneration'
}

{ #category : 'accessing' }
CMModelTemplate >> clearNameAndPrefix [

	name := ''.
	prefix := ''.
]

{ #category : 'accessing' }
CMModelTemplate >> description [

	^ description
]

{ #category : 'accessing' }
CMModelTemplate >> description: anObject [

	description := anObject
]

{ #category : 'code generation' }
CMModelTemplate >> generate [

	(self packageOrganizer hasPackage: self modelPackageName) ifTrue: [
		self error: 'Package ', self modelPackageName, ' already exists. Please choose a different model name' ].

	self generatePackagesAndClasses.
	self generateMethods.
]

{ #category : 'code generation' }
CMModelTemplate >> generateDescriptionMethod [

	| method |
	
	method := modelClass compiler compile: ('aboutThisModel
	"Use this method to provide a detailed description of your model in Microdown"
	^ ''', description, '''').

	modelClass class
		addSelector: #aboutThisModel
		withMethod: method.
]

{ #category : 'code generation' }
CMModelTemplate >> generateMethods [

	self generateModelNameMethod.
	self generatePrefixMethod.
	self generateDescriptionMethod
]

{ #category : 'code generation' }
CMModelTemplate >> generateModelName [

	| method |
	
	method := modelClass compiler compile: ('aboutThisModel
	"Use this method to provide a detailed description of your model in Microdown"
	^ ''', description, '''').

	modelClass class
		addSelector: #aboutThisModel
		withMethod: method.
]

{ #category : 'code generation' }
CMModelTemplate >> generateModelNameMethod [

	| method |
	
	method := modelClass compiler compile: ('modelName
	"A human-friendly name of the model"
	^ ''', name, '''').

	modelClass class
		addSelector: #modelName
		withMethod: method.
]

{ #category : 'code generation' }
CMModelTemplate >> generatePackagesAndClasses [

	shouldGenerateTestPackage ifTrue: [ 
		testClass := (TestCase << self testClassName asSymbol
			package: self testPackageName) install ].

	modelClass := (CMAbstractModel << self modelClassName asSymbol
		package: self modelPackageName) install.
]

{ #category : 'code generation' }
CMModelTemplate >> generatePrefixMethod [

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
CMModelTemplate >> initialize [

	super initialize.
	
	name := ''.
	prefix := ''.
	description := ''.
	shouldGenerateTestPackage := true.
]

{ #category : 'entity names' }
CMModelTemplate >> modelClassName [

	^ prefix, 'Model'
]

{ #category : 'entity names' }
CMModelTemplate >> modelPackageName [

	^ name, '-Model'
]

{ #category : 'accessing' }
CMModelTemplate >> name [

	^ name
]

{ #category : 'accessing' }
CMModelTemplate >> name: aString [

	aString ifEmpty: [ 
		self error: 'Model name must not be empty!' ].

	aString isAllAlphaNumerics ifFalse: [
		self error: 'Model name must only contain letters or digits!' ].
	
	aString first isLetter ifFalse: [ 
		self error: 'Model name must begin with a letter!' ].
	
	aString first isUppercase ifFalse: [ 
		self error: 'Model name must begin with an uppercase letter!' ].
	
	name := aString
]

{ #category : 'accessing' }
CMModelTemplate >> prefix [

	^ prefix
]

{ #category : 'accessing' }
CMModelTemplate >> prefix: aString [

	aString ifEmpty: [ 
		self error: 'Prefix must not be empty!' ].

	aString isAllAlphaNumerics ifFalse: [
		self error: 'Prefix must only contain letters or digits!' ].
	
	aString first isLetter ifFalse: [ 
		self error: 'Prefix must begin with a letter!' ].
	
	aString first isUppercase ifFalse: [ 
		self error: 'Prefix must begin with an uppercase letter!' ].

	prefix := aString
]

{ #category : 'accessing' }
CMModelTemplate >> shouldGenerateTestPackage [

	^ shouldGenerateTestPackage
]

{ #category : 'accessing' }
CMModelTemplate >> shouldGenerateTestPackage: anObject [

	shouldGenerateTestPackage := anObject
]

{ #category : 'entity names' }
CMModelTemplate >> testClassName [

	^ prefix, 'ModelTest'
]

{ #category : 'entity names' }
CMModelTemplate >> testPackageName [

	^ name, '-Model-Tests'
]

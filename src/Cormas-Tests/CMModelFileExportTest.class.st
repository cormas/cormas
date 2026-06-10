Class {
	#name : 'CMModelFileExportTest',
	#superclass : 'TestCase',
	#instVars : [
		'dummyModelClassName',
		'dummyModelAllClassNames',
		'dummyModelAllPackageNames'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'as yet unclassified' }
CMModelFileExportTest >> deleteDummyModel [

	(Smalltalk at: dummyModelClassName ifAbsent: [ ^ self ]) deleteModel
	
	
]

{ #category : 'as yet unclassified' }
CMModelFileExportTest >> doesClassExist: aClassName [

	^ self class environment hasClassNamed: aClassName 
]

{ #category : 'as yet unclassified' }
CMModelFileExportTest >> doesPackageExist: aPackageName [

	^ self packageOrganizer hasPackage: aPackageName 
]

{ #category : 'as yet unclassified' }
CMModelFileExportTest >> dummyModelClass [

	^ Smalltalk at: dummyModelClassName
]

{ #category : 'as yet unclassified' }
CMModelFileExportTest >> generateDummyModel [

	CMModelGenerator new
		modelClassName: dummyModelClassName;
		generate
	
	
]

{ #category : 'testing' }
CMModelFileExportTest >> isDummyModelFullyLoaded [

	dummyModelAllPackageNames do: [ :packageName |
		(self doesPackageExist: packageName) ifFalse: [ ^ false ] ].
	
	dummyModelAllClassNames do: [ :className |
		(self doesClassExist: className) ifFalse: [ ^ false ] ].
	
	^ self dummyModelClass methods isNotEmpty
]

{ #category : 'testing' }
CMModelFileExportTest >> isDummyModelFullyUnloaded [

	dummyModelAllPackageNames do: [ :packageName |
		(self doesPackageExist: packageName) ifTrue: [ ^ false ] ].
	
	dummyModelAllClassNames do: [ :className |
		(self doesClassExist: className) ifTrue: [ ^ false ] ].
	
	^ true
]

{ #category : 'running' }
CMModelFileExportTest >> setUp [

	super setUp.
	dummyModelClassName := #DummyModelForTesting.
	
	dummyModelAllClassNames := { 
		dummyModelClassName .
		(dummyModelClassName asString, 'Test') asSymbol .
		('BaselineOf', dummyModelClassName asString) asSymbol }.
		
	dummyModelAllPackageNames := { 
		dummyModelClassName asString, '-Model' .
		dummyModelClassName asString, '-Model-Tests' .
		'BaselineOf', dummyModelClassName asString }
]

{ #category : 'running' }
CMModelFileExportTest >> tearDown [

	self deleteDummyModel.
	super tearDown
]

{ #category : 'tests' }
CMModelFileExportTest >> testGenerateAndDeleteDummyModel [

	self assert: self isDummyModelFullyUnloaded.
	
	self generateDummyModel.
	
	self assert: self isDummyModelFullyLoaded.
	
	self deleteDummyModel.
	
	self assert: self isDummyModelFullyUnloaded.
	
	
]

{ #category : 'tests' }
CMModelFileExportTest >> testSaveThenLoadFromFile [

	| fs file modelClass |
	
	self generateDummyModel.
	
	fs := FileSystem memory.
	file := fs / 'model.cmx'.
	
	self dummyModelClass saveToFile: file.
	
	self deleteDummyModel.
	self assert: self isDummyModelFullyUnloaded.
	
	modelClass := CMModel installModelFromFile: file.
	
	self assert: modelClass name equals: dummyModelClassName.
	self assert: self isDummyModelFullyLoaded.
	
	self deleteDummyModel
]

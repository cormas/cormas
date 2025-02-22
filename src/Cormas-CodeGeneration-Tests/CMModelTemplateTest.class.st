Class {
	#name : 'CMModelTemplateTest',
	#superclass : 'TestCase',
	#instVars : [
		'modelTemplate',
		'modelName',
		'prefix'
	],
	#category : 'Cormas-CodeGeneration-Tests',
	#package : 'Cormas-CodeGeneration-Tests'
}

{ #category : 'testing' }
CMModelTemplateTest >> areClassNamesAvailable [
	"Check if expected names for model and test classes are available. Names are generated based on a prefix. If names are not available, a different prefix has to be selected"
	
	^ (self doesClassExist: self expectedModelClassName) not and: [ 
		(self doesClassExist: self expectedTestClassName) not ]
]

{ #category : 'testing' }
CMModelTemplateTest >> arePackageNamesAvailable [
	"Check if expected names for model and test packages are available. Names are generated based on a model name. If names are not available, a different model name has to be selected"

	^ (self doesPackageExist: self expectedModelPackageName) not and: [ 
		(self doesPackageExist: self expectedTestPackageName) not ]
]

{ #category : 'as yet unclassified' }
CMModelTemplateTest >> doesClassExist: aClassName [

	^ self class environment hasClassNamed: aClassName 
]

{ #category : 'as yet unclassified' }
CMModelTemplateTest >> doesPackageExist: aPackageName [

	^ self packageOrganizer hasPackage: aPackageName 
]

{ #category : 'accessing' }
CMModelTemplateTest >> expectedModelClass [

	^ self class environment classNamed: self expectedModelClassName
]

{ #category : 'accessing' }
CMModelTemplateTest >> expectedModelClassName [

	^ prefix, 'Model'
]

{ #category : 'accessing' }
CMModelTemplateTest >> expectedModelPackageName [

	^ modelName, '-Model'
]

{ #category : 'accessing' }
CMModelTemplateTest >> expectedTestClass [

	^ self class environment classNamed: self expectedTestClassName
]

{ #category : 'accessing' }
CMModelTemplateTest >> expectedTestClassName [

	^ prefix, 'ModelTest'
]

{ #category : 'accessing' }
CMModelTemplateTest >> expectedTestPackageName [

	^ modelName, '-Model-Tests'
]

{ #category : 'running' }
CMModelTemplateTest >> setUp [

	super setUp.
	modelTemplate := CMModelTemplate new.
	
	modelName := 'DummyModel'.
	prefix := 'Dum'.
	
	"if name is not available, append a char and try again"
	[ self arePackageNamesAvailable ] whileFalse: [ 
		modelName := modelName, '0' ].
	
	[ self areClassNamesAvailable ] whileFalse: [ 
		prefix := prefix, '0' ].
]

{ #category : 'running' }
CMModelTemplateTest >> tearDown [

	self class environment removeClassNamed: self expectedModelClassName.
	self class environment removeClassNamed: self expectedTestClassName.
	self packageOrganizer removePackage: self expectedModelPackageName.
	self packageOrganizer removePackage: self expectedTestPackageName.
	
	super tearDown
]

{ #category : 'tests' }
CMModelTemplateTest >> testClearNameAndPrefix [

	modelTemplate name: 'FooBar'.
	modelTemplate prefix: 'FB'.
	modelTemplate clearNameAndPrefix.
	
	self assert: modelTemplate name equals: ''.
	self assert: modelTemplate prefix equals: ''
]

{ #category : 'accessing' }
CMModelTemplateTest >> testDefaultValues [

	self assert: modelTemplate name equals: ''.
	self assert: modelTemplate prefix equals: ''.
	self assert: modelTemplate description equals: ''.
	self assert: modelTemplate shouldGenerateTestPackage.
]

{ #category : 'tests' }
CMModelTemplateTest >> testGeneratePackagesAndClasses [

	modelTemplate name: modelName; prefix: prefix.
	modelTemplate generatePackagesAndClasses.
	
	self assert: (self doesPackageExist: self expectedModelPackageName).
	self assert: (self doesPackageExist: self expectedTestPackageName).
	self assert: (self doesClassExist: self expectedModelClassName).
	self assert: (self doesClassExist: self expectedTestClassName).
]

{ #category : 'tests' }
CMModelTemplateTest >> testGeneratePrefixMethod [

	modelTemplate name: modelName; prefix: prefix.
	
	"We must generate package and class first"
	modelTemplate generatePackagesAndClasses.
	modelTemplate generatePrefixMethod.
	
	self assert: (self expectedModelClass respondsTo: #prefix)
	
]

{ #category : 'tests' }
CMModelTemplateTest >> testModelClassName [

	modelTemplate prefix: 'FB'.
	self assert: modelTemplate modelClassName equals: 'FBModel'
]

{ #category : 'tests' }
CMModelTemplateTest >> testModelPackageName [

	modelTemplate name: 'FooBar'.
	self assert: modelTemplate modelPackageName equals: 'FooBar-Model'
]

{ #category : 'tests' }
CMModelTemplateTest >> testName [

	modelTemplate name: 'FooBar'.
	self assert: modelTemplate name equals: 'FooBar'
]

{ #category : 'tests' }
CMModelTemplateTest >> testNameEmptyError [

	self should: [ modelTemplate name: '' ] raise: Error.
]

{ #category : 'tests' }
CMModelTemplateTest >> testNameHasNonAlphanumericsError [

	self should: [ modelTemplate name: 'foo_bar' ] raise: Error.
]

{ #category : 'tests' }
CMModelTemplateTest >> testNameHasSpacesError [

	self should: [ modelTemplate name: 'foo bar' ] raise: Error.
]

{ #category : 'tests' }
CMModelTemplateTest >> testNameStartsWithLowercaseError [

	self should: [ modelTemplate name: 'fooBar' ] raise: Error.
]

{ #category : 'tests' }
CMModelTemplateTest >> testNameStartsWithNumberError [

	self should: [ modelTemplate name: '1FooBar' ] raise: Error.
]

{ #category : 'tests' }
CMModelTemplateTest >> testNameWithNumbers [

	modelTemplate name: 'FooBar42'.
	self assert: modelTemplate name equals: 'FooBar42'
]

{ #category : 'tests' }
CMModelTemplateTest >> testPrefix [

	modelTemplate prefix: 'FB'.
	self assert: modelTemplate prefix equals: 'FB'
]

{ #category : 'tests' }
CMModelTemplateTest >> testPrefixEmptyError [

	self should: [ modelTemplate prefix: '' ] raise: Error.
]

{ #category : 'tests' }
CMModelTemplateTest >> testPrefixHasNonAlphanumericsError [

	self should: [ modelTemplate prefix: 'F_B' ] raise: Error.
]

{ #category : 'tests' }
CMModelTemplateTest >> testPrefixHasSpacesError [

	self should: [ modelTemplate name: 'F B' ] raise: Error.
]

{ #category : 'tests' }
CMModelTemplateTest >> testPrefixStartsWithLowercaseError [

	self should: [ modelTemplate prefix: 'fB' ] raise: Error.
]

{ #category : 'tests' }
CMModelTemplateTest >> testPrefixStartsWithNumberError [

	self should: [ modelTemplate prefix: '1FB' ] raise: Error.
]

{ #category : 'tests' }
CMModelTemplateTest >> testPrefixWithNumbers [

	modelTemplate prefix: 'FB42'.
	self assert: modelTemplate prefix equals: 'FB42'
]

{ #category : 'tests' }
CMModelTemplateTest >> testTestClassName [

	modelTemplate prefix: 'FB'.
	self assert: modelTemplate testClassName equals: 'FBModelTest'
]

{ #category : 'tests' }
CMModelTemplateTest >> testTestPackageName [

	modelTemplate name: 'FooBar'.
	self assert: modelTemplate testPackageName equals: 'FooBar-Model-Tests'
]

Class {
	#name : 'CMMethodDescriptionTest',
	#superclass : 'TestCase',
	#instVars : [
		'minimalMethodDescription',
		'detailedMethodDescription',
		'emptyMethodDescription'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'examples' }
CMMethodDescriptionTest >> exampleMethod [
	<api>
	<doc: 'This is a method with no arguments and no return type'>
	
	^ 'Booo'
]

{ #category : 'examples' }
CMMethodDescriptionTest >> exampleMethod: arg1 and: arg2 [
	<api>
	<argument: #arg1 type: #Float description: 'A dummy argument'>
	<argument: #arg2 type: #String description: 'Another dummy argument'>
	<returnType: #Integer description: 'Something returned'>
	<doc: 'This is a very powerful method. Use it wisely!'>
	<example: 'self exampleMethod: 0.1 and: ''Hello'''>
	<example: 'self exampleMethod: -10.5 and: ''world!'''>
	<seeAlso: #(exampleMethod)>
	
	^ 'Lorem ipsum dolor sit amet'
]

{ #category : 'examples' }
CMMethodDescriptionTest >> exampleMethodWithSeeAlsoError [
	<api>
	<seeAlso: #(thisMethodDoesNotExist)>
	
	^ 'Oops'
]

{ #category : 'removing' }
CMMethodDescriptionTest >> removeFirstLineAndSpaces: aString [
	"Removes first line (method name) from the source code and trims whitespaces"
	
	^ (aString allButFirst: aString lines first size) trimBoth
]

{ #category : 'running' }
CMMethodDescriptionTest >> setUp [

	super setUp.
	minimalMethodDescription := CMMethodDescription for: (self class >> #exampleMethod).
	detailedMethodDescription := CMMethodDescription for: (self class >> #exampleMethod:and:).
	emptyMethodDescription := CMMethodDescription for: (self class >> #setUp)
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testArguments [

	| expectedArg1 expectedArg2 |
	
	expectedArg1 := { 
		'name' -> #arg1 .
		'type' -> #Float .
		'description' -> 'A dummy argument'
	} asDictionary.
		
	expectedArg2 := { 
		'name' -> #arg2 .
		'type' -> #String .
		'description' -> 'Another dummy argument'
	} asDictionary.
		
	self
		assertCollection: detailedMethodDescription arguments
		hasSameElements: { expectedArg1 . expectedArg2 }
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testArgumentsWhenNoArguments [

	self assert: minimalMethodDescription arguments isEmpty
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testDocumentationString [

	self
		assert: minimalMethodDescription documentationString
		equals: 'This is a method with no arguments and no return type'.
	
	self
		assert: detailedMethodDescription documentationString
		equals: 'This is a very powerful method. Use it wisely!'.
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testDocumentationStringWhenNone [

	self
		assert: emptyMethodDescription documentationString
		equals: ''
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testExamples [

	| expected |
	
	expected := { 
		'self exampleMethod: 0.1 and: ''Hello''' .
		'self exampleMethod: -10.5 and: ''world!''' }.
		
	self
		assertCollection: detailedMethodDescription examples
		hasSameElements: expected 
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testExamplesWhenNoExamples [
		
	self assert: minimalMethodDescription examples isEmpty 
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testHasArguments [

	self assert: detailedMethodDescription hasArguments.
	self deny: minimalMethodDescription hasArguments.
	self deny: emptyMethodDescription hasArguments
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testHasDocumentationString [

	self assert: detailedMethodDescription hasDocumentationString.
	self assert: minimalMethodDescription hasDocumentationString.
	self deny: emptyMethodDescription hasDocumentationString
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testHasExamples [

	self assert: detailedMethodDescription hasExamples.
	self deny: minimalMethodDescription hasExamples.
	self deny: emptyMethodDescription hasExamples
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testHasRelatedMethods [

	self assert: detailedMethodDescription hasRelatedMethods.
	self deny: minimalMethodDescription hasRelatedMethods.
	self deny: emptyMethodDescription hasRelatedMethods
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testHasReturnInfo [

	self assert: detailedMethodDescription hasReturnInfo.
	self deny: minimalMethodDescription hasReturnInfo.
	self deny: emptyMethodDescription hasReturnInfo
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testMethod [

	self
		assert: minimalMethodDescription method
		equals: (self class >> #exampleMethod).
	
	self
		assert: detailedMethodDescription method
		equals: (self class >> #exampleMethod:and:).
		
	self
		assert: emptyMethodDescription method
		equals: (self class >> #setUp).
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testRelatedMethods [

	| expected |
	expected := self class >> #exampleMethod.
		
	self
		assertCollection: detailedMethodDescription relatedMethods
		hasSameElements: { expected }
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testRelatedMethodsWhenNone [
		
	self assert: minimalMethodDescription relatedMethods isEmpty
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testRelatedMethodsWithError [
		
	self
		should: [ CMMethodDescription for: (self class >> #exampleMethodWithSeeAlsoError) ]
		raise: Error
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testReturnInfo [

	| expected |
	
	expected := {
		'type' -> #Integer .
		'description' -> 'Something returned'
	} asDictionary.
		
	self
		assert: detailedMethodDescription returnInfo
		equals: expected
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testReturnInfoWhenNoReturn [

	self assert: minimalMethodDescription returnInfo isNil
]

{ #category : 'tests' }
CMMethodDescriptionTest >> testSourceCode [

	| code1 code2 code3 |
	
	code1 := self removeFirstLineAndSpaces: minimalMethodDescription sourceCode.
	code2 := self removeFirstLineAndSpaces: detailedMethodDescription sourceCode.
	code3 := self removeFirstLineAndSpaces: emptyMethodDescription sourceCode.

	self assert: code1 equals: '^ ''Booo'''.
	self assert: code2 equals: '^ ''Lorem ipsum dolor sit amet'''.
	self assert: code3 isNotEmpty
]

"
A CMProjectModelTest is a test class for testing the behavior of CMProjectModel
"
Class {
	#name : #CMProjectModelTest,
	#superclass : #CMAbstractModelTest,
	#instVars : [
		'projectModel'
	],
	#category : #'Cormas-Tests-Project'
}

{ #category : #running }
CMProjectModelTest >> newTestModel [
	" See superimplementor's comment "

	^ super newTestModel 
		projectManager: CMProjectManager new;
		yourself
]

{ #category : #accessing }
CMProjectModelTest >> projectModel [
	^ projectModel
]

{ #category : #accessing }
CMProjectModelTest >> projectModel: anObject [
	projectModel := anObject
]

{ #category : #running }
CMProjectModelTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	super setUp.
	self projectModel: (CMProjectModel for: self newTestModel).
	CGSmalltalk new removeClass: #ToBeDeleted.
]

{ #category : #running }
CMProjectModelTest >> tearDown [
	"Hooks that subclasses may override to define the fixture of test."

	CGSmalltalk new removeClass: self sampleModelName.
	super tearDown.	

]

{ #category : #test }
CMProjectModelTest >> testCodeGenerator [

	self assert: (self projectModel codeGenerator isKindOf: CGStCormas).


]

{ #category : #test }
CMProjectModelTest >> testCormasModel [

	self assert: (self projectModel cormasModel isKindOf: CMAbstractModel).
	self projectModel cormasModel: nil.
	self assert: self projectModel cormasModel isNil.
]

{ #category : #test }
CMProjectModelTest >> testCormasModelAuthors [

	| modelAuthors |
	
	modelAuthors := 'Author1;author1@cormas.org
Author2;author2@cormas.org'.
	self projectModel cormasModelAuthors: modelAuthors.
	self assert: self projectModel cormasModelAuthors equals: modelAuthors.
]

{ #category : #test }
CMProjectModelTest >> testCormasModelClass [

	self assert: (self projectModel cormasModelClass isKindOf: CMAbstractModel class).
	self projectModel cormasModelClass: nil.
	self assert: (self projectModel cormasModelClass isKindOf: CMAbstractModel class).
]

{ #category : #test }
CMProjectModelTest >> testCormasModelComment [

	| modelComment |
	
	modelComment := 'This is a model comment'.
	self projectModel cormasModelComment: modelComment.
	self assert: (self projectModel respondsTo: #cormasModelComment).
	self assert: self projectModel cormasModelComment equals: modelComment.
]

{ #category : #test }
CMProjectModelTest >> testCormasModelName [

	self assert: (self projectModel cormasModelName isKindOf: String).
	self assert: self projectModel cormasModelName equals: 'CMMockModel'.

]

{ #category : #test }
CMProjectModelTest >> testCormasModelVersion [

	| modelVersion |
	
	modelVersion := '1.0'.
	self projectModel cormasModelVersion: modelVersion.
	self assert: (self projectModel cormasModelClass respondsTo: #cmVersion).
	self assert: self projectModel cormasModelClass cmVersion equals: modelVersion.
]

{ #category : #test }
CMProjectModelTest >> testCreateClassModelNamed [

	| modelClassname |
	
	modelClassname := self sampleModelName.
	self assert: ((self projectModel createClassModelNamed: modelClassname) isKindOf: Class).
	self assert: (self class environment hasClassNamed: modelClassname).

]

{ #category : #test }
CMProjectModelTest >> testDefaultCormasModelName [

	self assert: (self projectModel defaultCormasModelName isKindOf: String).
	self assert: self projectModel defaultCormasModelName equals: 'Unnamed'.

]

{ #category : #test }
CMProjectModelTest >> testDefaultStdCormasCategoryName [

	self assert: (self projectModel defaultStdCormasCategoryName isKindOf: String).
	self assert: self projectModel defaultStdCormasCategoryName equals: self projectModel defaultCormasModelName, '-Model'.

]

{ #category : #test }
CMProjectModelTest >> testDefaultStdCormasModelName [

	self assert: (self projectModel defaultStdCormasModelName isKindOf: String).
	self assert: self projectModel defaultStdCormasModelName equals: 'CM' , self projectModel defaultCormasModelName , 'Model'

]

{ #category : #test }
CMProjectModelTest >> testGitBridge [

	self assert: (self projectModel gitBridge isKindOf: CMGitBridge)
]

{ #category : #test }
CMProjectModelTest >> testHasCormasModelClass [

	self assert: self projectModel hasCormasModelClass.


]

{ #category : #test }
CMProjectModelTest >> testProjectName [

	self assert: (self projectModel projectName isKindOf: String).
	self assert: self projectModel projectName equals: 'CMMockModel'.

]

{ #category : #tests }
CMProjectModelTest >> testTranslator [

	self assert: (projectModel translator isKindOf: CMAbstractTranslator)
]

{ #category : #test }
CMProjectModelTest >> testUserProvidedName [

	self assert: (self projectModel userProvidedName isKindOf: String).
	self assert: self projectModel userProvidedName equals: self projectModel defaultCormasModelName.

]

{ #category : #test }
CMProjectModelTest >> testValidateCormasModelName [

	self assert: (self projectModel validateCormasModelName: 'CMPruebaModel') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: '_CMPruebaModel') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: 'CMPruebaModel_') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: 'CM_PruebaModel') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: '_CMPruebaModel_') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: '_CM_Prueba_Model_') equals: 'CMPruebaModel'.

	self assert: (self projectModel validateCormasModelName: 'CMPruebaModel') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: '-CMPruebaModel-') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: 'CMPruebaModel-') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: 'CM-PruebaModel') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: '-_CMPruebaModel-') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: '-CM-Prueba_Model-') equals: 'CMPruebaModel'.

	self assert: (self projectModel validateCormasModelName: 'CMPruebaModel') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: ' CMPruebaModel ') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: 'CMPruebaModel ') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: 'CM PruebaModel') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: ' CMPruebaModel ') equals: 'CMPruebaModel'.
	self assert: (self projectModel validateCormasModelName: ' CM Prueba Model ') equals: 'CMPruebaModel'.
]

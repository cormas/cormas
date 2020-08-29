"
A CMProjectModelTest is a test class for testing the behavior of CMProjectModel
"
Class {
	#name : #CMProjectModelTest,
	#superclass : #CMAbstractModelTest,
	#instVars : [
		'projectModel'
	],
	#category : #'Cormas-UI-Tests-Project'
}

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
	self projectModel: (CMProjectModel for: self newTestModel)
]

{ #category : #test }
CMProjectModelTest >> testCormasModelClass [

	self assert: (self projectModel cormasModelClass isKindOf: CMAbstractModel class).
	self projectModel cormasModelClass: nil.
	self assert: (self projectModel cormasModelClass isKindOf: CMAbstractModel class).
]

{ #category : #test }
CMProjectModelTest >> testCormasModelName [

	self assert: (self projectModel cormasModelName isKindOf: String).
	self assert: self projectModel cormasModelName equals: 'CMTestModel'.

]

{ #category : #test }
CMProjectModelTest >> testDefaultCormasModelName [

	self assert: (self projectModel defaultCormasModelName isKindOf: String).
	self assert: self projectModel defaultCormasModelName equals: 'Unnamed'.

]

{ #category : #test }
CMProjectModelTest >> testDefaultStdCormasCategoryName [

	self assert: (self projectModel defaultStdCormasCategoryName isKindOf: String).
	self assert: self projectModel defaultStdCormasCategoryName equals: 'Cormas-Model-' , self projectModel defaultCormasModelName.

]

{ #category : #test }
CMProjectModelTest >> testDefaultStdCormasModelName [

	self assert: (self projectModel defaultStdCormasModelName isKindOf: String).
	self assert: self projectModel defaultStdCormasModelName equals: 'CM' , self projectModel defaultCormasModelName , 'Model'

]

{ #category : #test }
CMProjectModelTest >> testHasCormasModelClass [

	self assert: self projectModel hasCormasModelClass.


]

{ #category : #test }
CMProjectModelTest >> testProjectName [

	self assert: (self projectModel projectName isKindOf: String).
	self assert: self projectModel projectName equals: 'CMTestModel'.

]

{ #category : #test }
CMProjectModelTest >> testUserProvidedName [

	self assert: (self projectModel userProvidedName isKindOf: String).
	self assert: self projectModel userProvidedName equals: self projectModel defaultCormasModelName.

]

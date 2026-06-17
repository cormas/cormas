"
A CormasEntityTest is a test class for testing the behavior of CormasEntity
"
Class {
	#name : 'CMEntityTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests-Model',
	#package : 'Cormas-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
CMEntityTest >> testAvailablePov [

	self assertCollection: CMMockAnimal availablePov hasSameElements: #(pov povClassName povId povInvisible).
	self assertCollection: CMMockCow availablePov hasSameElements: #(pov povClassName povId povInvisible).
	self assertCollection: CMMockGoat availablePov hasSameElements: #(pov povClassName povId povInvisible).
	self assertCollection: CMMockCell availablePov hasSameElements: #(pov povClassName povId povInvisible).
]

{ #category : 'tests' }
CMEntityTest >> testColorOfNumber [
	self assert: (CMColor colorOfNumber: 65) equals: Color purple
]

{ #category : 'tests' }
CMEntityTest >> testCormasEntityIsAbstract [
	self assert: CMEntity isAbstract
]

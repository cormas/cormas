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

{ #category : 'running' }
CMEntityTest >> tearDown [

	CMMockCow resetActivePovSelector.
	super tearDown
]

{ #category : 'tests' }
CMEntityTest >> testActivePovAnswersDefaultPov [

	| cow |
	cow := CMMockModel new newEntity: CMMockCow.

	self assert: cow activePov color equals: Color red
]

{ #category : 'tests' }
CMEntityTest >> testActivePovAnswersSelectedPov [

	| cow |
	cow := CMMockModel new newEntity: CMMockCow.

	CMMockCow activePovSelector: #povInvisible.

	self assert: cow activePov color equals: Color transparent
]

{ #category : 'tests' }
CMEntityTest >> testAvailablePov [

	self assertCollection: CMMockAnimal availablePov hasSameElements: #(pov povClassName povId povInvisible).
	self assertCollection: CMMockCow availablePov hasSameElements: #(pov povClassName povId povInvisible).
	self assertCollection: CMMockGoat availablePov hasSameElements: #(pov povClassName povId povInvisible).
	self assertCollection: CMMockCell availablePov hasSameElements: #(pov povClassName povId povInvisible).
]

{ #category : 'tests' }
CMEntityTest >> testCormasEntityIsAbstract [
	self assert: CMEntity isAbstract
]

{ #category : 'tests' }
CMEntityTest >> testPovClassNameGivesSameColorToEntitiesOfSameClass [

	| model firstCow secondCow |
	model := CMMockModel new.
	firstCow := model newEntity: CMMockCow.
	secondCow := model newEntity: CMMockCow.

	self assert: (firstCow povClassName color isKindOf: Color).
	self
		assert: firstCow povClassName color
		equals: secondCow povClassName color
]

{ #category : 'tests' }
CMEntityTest >> testPovIdGivesDifferentColorsToDifferentEntities [

	| model firstCow secondCow |
	model := CMMockModel new.
	firstCow := model newEntity: CMMockCow.
	secondCow := model newEntity: CMMockCow.

	self assert: (firstCow povId color isKindOf: Color).
	self deny: firstCow povId color equals: secondCow povId color
]

Class {
	#name : #CMSpatialEntityTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'cellWithNoAgents',
		'cellWithOneAgent',
		'cellWithTwoAgentsOfSameClass',
		'cellWithTwoAgentsOfDifferentClasses',
		'cowAlice',
		'cowMaria',
		'cowAnna',
		'cowJudy',
		'goatBob'
	],
	#category : #'Cormas-Tests-Model'
}

{ #category : #initialization }
CMSpatialEntityTest >> setUp [

	super setUp.
		
	cellWithNoAgents := CMMockCell new.
	cellWithOneAgent := CMMockCell new.
	cellWithTwoAgentsOfSameClass := CMMockCell new.
	cellWithTwoAgentsOfDifferentClasses := CMMockCell new.
	
	cowAlice := CMMockCow new.
	cowMaria := CMMockCow new.
	cowAnna := CMMockCow new.
	cowJudy := CMMockCow new.
	goatBob := CMMockGoat new.
	
	cowAlice moveTo: cellWithOneAgent.
	
	cowMaria moveTo: cellWithTwoAgentsOfSameClass.
	cowAnna moveTo: cellWithTwoAgentsOfSameClass.
	
	cowJudy moveTo: cellWithTwoAgentsOfDifferentClasses.
	goatBob moveTo: cellWithTwoAgentsOfDifferentClasses.
]

{ #category : #tests }
CMSpatialEntityTest >> testAllOccupants [

	self
		assert: cellWithTwoAgentsOfDifferentClasses allOccupants
		equals: { cowJudy . goatBob } asOrderedCollection
]

{ #category : #tests }
CMSpatialEntityTest >> testHasNoOccupants [

	self assert: cellWithNoAgents hasNoOccupants.
	self deny: cellWithOneAgent hasNoOccupants.
	self deny: cellWithTwoAgentsOfSameClass hasNoOccupants.
	self deny: cellWithTwoAgentsOfDifferentClasses hasNoOccupants.
]

{ #category : #tests }
CMSpatialEntityTest >> testHasNoOccupantsExcept [

	self assert: (cellWithNoAgents hasNoOccupantsExcept: cowAlice).
	self assert: (cellWithOneAgent hasNoOccupantsExcept: cowAlice).
	self deny: (cellWithOneAgent hasNoOccupantsExcept: cowMaria).
	self deny: (cellWithTwoAgentsOfSameClass hasNoOccupantsExcept: cowMaria).
	self deny: (cellWithTwoAgentsOfDifferentClasses hasNoOccupantsExcept: cowJudy).
]

{ #category : #tests }
CMSpatialEntityTest >> testHasOccupants [

	self deny: cellWithNoAgents hasOccupants.
	self assert: cellWithOneAgent hasOccupants.
	self assert: cellWithTwoAgentsOfSameClass hasOccupants.
	self assert: cellWithTwoAgentsOfDifferentClasses hasOccupants.
]

{ #category : #tests }
CMSpatialEntityTest >> testHasOccupantsOfClass [

	self deny: (cellWithNoAgents hasOccupantsOfClass: CMMockCow).
	self assert: (cellWithOneAgent hasOccupantsOfClass: CMMockCow).
	self deny: (cellWithOneAgent hasOccupantsOfClass: CMMockGoat).
	self assert: (cellWithTwoAgentsOfDifferentClasses hasOccupantsOfClass: CMMockCow).
	self assert: (cellWithTwoAgentsOfDifferentClasses hasOccupantsOfClass: CMMockGoat).
	
]

{ #category : #tests }
CMSpatialEntityTest >> testOccupantsOfClass [

	self
		assert: (cellWithTwoAgentsOfDifferentClasses occupantsOfClass: CMMockCow)
		equals: { cowJudy } asOrderedCollection
]

{ #category : #tests }
CMSpatialEntityTest >> testOccupantsOfClassNamed [

	self
		assert: (cellWithTwoAgentsOfDifferentClasses occupantsOfClassNamed: 'CMMockGoat')
		equals: { goatBob } asOrderedCollection
]

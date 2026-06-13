Class {
	#name : 'CMSpatialEntityElementTest',
	#superclass : 'TestCase',
	#instVars : [
		'model'
	],
	#category : 'Cormas-Tests-Model',
	#package : 'Cormas-Tests',
	#tag : 'Model'
}

{ #category : 'initialization' }
CMSpatialEntityElementTest >> setUp [

	super setUp.
	
	model := CMMockModel new.
	model initFixed.
]

{ #category : 'tests' }
CMSpatialEntityElementTest >> testMoveTowardsConstraintOnPath [

	| agent destination expectedPathOfIds |
	
	agent := (model @@ CMMockCow) anyOne.
	destination := model cellAt: 2 at: 3.
	
	expectedPathOfIds := #(5 9 14 11 7) asOrderedCollection.
	
	expectedPathOfIds do: [ :expectedCellId |
		self assert: agent cell id equals: expectedCellId.
		agent moveTowards: destination constraintOnPath: [ :cell | cell isAliveCell ] ].
	
	self assert: agent cell id equals: destination id.
]

{ #category : 'tests' }
CMSpatialEntityElementTest >> testWayToConstrained [

	| origin destination path pathOfIds expectedPathOfIds |
	
	origin := model cellAt: 2 at: 1.
	destination := model cellAt: 2 at: 3.
	
	path := origin wayTo: destination constraint: [ :cell | cell isAliveCell ].
	pathOfIds := path collect: [ :cell | cell id ].
	
	expectedPathOfIds := #(5 9 14 11 7) asOrderedCollection.
	self assert: pathOfIds equals: expectedPathOfIds.
]

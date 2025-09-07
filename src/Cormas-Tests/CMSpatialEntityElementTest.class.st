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
	destination := model pickCellAt: 3 @ 2.
	
	expectedPathOfIds := #(5 9 14 11 7) asOrderedCollection.
	
	expectedPathOfIds do: [ :expectedCellId |
		self assert: agent patch id equals: expectedCellId.
		agent moveTowards: destination constraintOnPath: [ :cell | cell isAliveCell ] ].
	
	self assert: agent patch id equals: destination id.
]

{ #category : 'tests' }
CMSpatialEntityElementTest >> testWayToConstrained [

	| origin destination path pathOfIds expectedPathOfIds |
	
	origin := model pickCellAt: 1 @ 2.
	destination := model pickCellAt: 3 @ 2.
	
	path := origin wayTo: destination constraint: [ :cell | cell isAliveCell ].
	pathOfIds := path collect: [ :cell | cell id ].
	
	expectedPathOfIds := #(5 9 14 11 7) asOrderedCollection.
	self assert: pathOfIds equals: expectedPathOfIds.
]

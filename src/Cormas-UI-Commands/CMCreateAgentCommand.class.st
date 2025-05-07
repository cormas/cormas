Class {
	#name : 'CMCreateAgentCommand',
	#superclass : 'CMSpacePresenterToggleCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMCreateAgentCommand class >> order [

	^ 5
]

{ #category : 'action' }
CMCreateAgentCommand >> actionWhenOff [

	owner spaceBuilder whenLeftClickOnCellDo: [ :cell | "do nothing" ].
]

{ #category : 'action' }
CMCreateAgentCommand >> actionWhenOn [
	| agentClasses selectedClass |
	
	agentClasses := (owner cormasModel class allEntityClasses 
		select: [ :aClass | aClass isCormasAgentClass and: [ aClass subclasses isEmpty ] ]) asArray.
	
	selectedClass := UIManager default 
		chooseFrom: (agentClasses collect: [:each | each name])
		values: agentClasses
		title: 'Create Agent'.
		
	selectedClass ifNil: [ ^ self ].
	
	owner spaceBuilder whenLeftClickOnCellDo: [ :cell |
		| newAgent |
		newAgent := owner cormasModel newEntity: selectedClass locatedAt: cell.
		owner updateDiagram ].

]

{ #category : 'accessing' }
CMCreateAgentCommand >> iconWhenOff [

	^ self iconNamed: #smallAdd
]

{ #category : 'accessing' }
CMCreateAgentCommand >> iconWhenOn [

	^ self iconNamed: #changeRemove
]

{ #category : 'accessing' }
CMCreateAgentCommand >> nameWhenOff [

	^ 'Create'
]

{ #category : 'accessing' }
CMCreateAgentCommand >> nameWhenOn [

	^ 'Stop'
]

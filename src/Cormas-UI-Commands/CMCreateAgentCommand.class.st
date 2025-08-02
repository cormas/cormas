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

	| agentClass |
	
	agentClass := owner cormasModel class allEntityClasses
		detect: [ :aClass | aClass isCormasAgentClass and: [ aClass subclasses isEmpty ] ].
	
	owner spaceBuilder whenLeftClickOnCellDo: [ :cell |
		owner cormasModel newEntity: agentClass locatedAt: cell.
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

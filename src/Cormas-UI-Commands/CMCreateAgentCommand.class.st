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

{ #category : 'accessing' }
CMCreateAgentCommand >> actionWhenOff [

	owner spaceBuilder whenLeftClickOnCellDo: [ :cell | "do nothing" ].
]

{ #category : 'accessing' }
CMCreateAgentCommand >> actionWhenOn [

	| agentClass |
	
	agentClass := owner cormasModel class allEntityClasses
		detect: [ :aClass | aClass isCormasAgentClass and: [ aClass subclasses isEmpty ] ].
	
	owner spaceBuilder whenLeftClickOnCellDo: [ :cell |
		owner cormasModel newEntity: agentClass locatedAt: cell.
		owner updateDiagram ].
]

{ #category : 'as yet unclassified' }
CMCreateAgentCommand >> iconWhenOff [

	^ self iconNamed: #smallAdd
]

{ #category : 'as yet unclassified' }
CMCreateAgentCommand >> iconWhenOn [

	^ self iconNamed: #changeRemove
]

{ #category : 'as yet unclassified' }
CMCreateAgentCommand >> nameWhenOff [

	^ 'Create'
]

{ #category : 'as yet unclassified' }
CMCreateAgentCommand >> nameWhenOn [

	^ 'Stop'
]

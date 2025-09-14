Extension { #name : 'Class' }

{ #category : '*Cormas-Core' }
Class >> concreteSubclasses [

	^ self allSubclasses select: [ : cls | cls subclasses isEmpty ]

]

{ #category : '*Cormas-Core' }
Class >> isCormasAgentClass [

	^ false
]

{ #category : '*Cormas-Core' }
Class >> isCormasCellClass [

	^ false
]

{ #category : '*Cormas-Core' }
Class >> isCormasModelClass [

	^ false
]

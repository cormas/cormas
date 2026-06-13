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

{ #category : '*Cormas-Core' }
Class >> publicMethods [

	| methods |
	
	methods := self withAllSuperclasses flatCollect: [ :aClass |
		(Pragma allNamed: #api in: aClass) collect: #method ].
	
	^ methods sorted: [ :a :b | a selector < b selector ]
]

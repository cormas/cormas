control
newState
	self state = #tree
		ifTrue: [( (self neighbourhood anySatisfy: [ :a | a state = #fire ]) and:[Cormas random < 0.5])
				ifTrue: [ self bufferState: #fire ]
				ifFalse: [ self bufferState: #tree ] ].
	self state = #fire
		ifTrue: [ Cormas random < 0.05
						ifTrue: [self bufferState: #ash]
						ifFalse: [self bufferState: #fire] ].
	self state = #ash
		ifTrue: [ Cormas random < 0.2
						ifTrue: [self bufferState: #empty ]
						ifFalse: [self bufferState: #ash]].
	self state = #empty
		ifTrue: [ self bufferState: #empty ]
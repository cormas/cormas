controle
newState
	self state = #tree
		ifTrue: [ 
			(self neighbourhood contains: [ :a | a state = #fire ])
				ifTrue: [ self bufferState: #fire ]
				ifFalse: [ self bufferState: #tree ] ].
	self state = #fire
		ifTrue: [ self bufferState: #ash ].
	self state = #ash
		ifTrue: [ self bufferState: #empty ].
	self state = #empty
		ifTrue: [ self bufferState: #empty ]
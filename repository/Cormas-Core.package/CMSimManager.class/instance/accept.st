actions
accept
	
	self listInit selection isNil
		ifTrue: [^self inform: 'Please, select a method of #initialization']
		ifFalse: [self cormasModel activeInit: self listInit selection].
	self listControle selection isNil
		ifTrue: [^self inform: 'Please, select a method of #control']
		ifFalse: [self cormasModel activeControl: self listControle selection].
	self closeRequest.
	self setActiveProbes.
	self initScenario.
	^true
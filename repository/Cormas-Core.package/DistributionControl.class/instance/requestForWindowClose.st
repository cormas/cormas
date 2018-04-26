interface closing
requestForWindowClose
	
	self brokerStarted
		ifTrue:
			[Dialog warn: 'Please, stop the broker before closing this windows'.
			^false].
	^true
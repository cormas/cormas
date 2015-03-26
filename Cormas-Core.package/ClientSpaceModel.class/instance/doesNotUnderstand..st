error handling
doesNotUnderstand: aMessage
	
	(self remoteSelectors includes: aMessage selector)
		ifTrue:
			[^self remoteSpaceModel
				perform: aMessage selector
				withArguments: aMessage arguments].
	self halt.
	^self
		perform: aMessage selector
		withArguments: aMessage arguments
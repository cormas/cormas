error handling
doesNotUnderstand: aMessage
	
	(self remoteSelectors includes: aMessage selector)
		ifTrue:
			[^remoteCormas
				perform: aMessage selector
				withArguments: aMessage arguments].
	self halt: aMessage selector.
	^self
		perform: aMessage selector
		withArguments: aMessage arguments
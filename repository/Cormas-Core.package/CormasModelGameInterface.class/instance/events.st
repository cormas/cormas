decisions sheets
events
	
	(self blocks includesKey: #Events)
		ifTrue:
			[self model updateName: 'Events'.
			self blocks keys do: [:bn | self setInvisibleBlock: bn].
			self setVisibleBlock: #Events.
			self resetBlock: #Events]
		ifFalse: [self halt]
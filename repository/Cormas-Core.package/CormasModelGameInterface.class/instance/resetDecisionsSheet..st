decisions sheets
resetDecisionsSheet: aName
	
	self model updateName: aName.
	(self model playersBlocks includesKey: aName)
		ifTrue:
			[(self blocks includesKey: 'Events')
				ifTrue: [self setInvisibleBlock: 'Events'].
			self blocks keys
				do:
					[:bn | 
					((self model playersBlocks at: aName) includes: bn)
						ifTrue:
							[self setVisibleBlock: bn.
							self resetBlock: bn]
						ifFalse: [self setInvisibleBlock: bn]]]
		ifFalse:
			[aName = 'Events'
				ifTrue:
					[self setVisibleBlock: #Events.
					self resetBlock: #Events]
				ifFalse: [self halt]]
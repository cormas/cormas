menu-display options
delimiterSize
	
	^delimiterSize isNil
		ifTrue:
			[delimiterSize := self spaceInterface
				ifNotNil: [:si | si delimiterSize]
				ifNil: [#pixel1 asValue]]
		ifFalse: [delimiterSize]
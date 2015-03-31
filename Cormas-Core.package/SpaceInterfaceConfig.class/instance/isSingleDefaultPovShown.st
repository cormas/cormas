accessing
isSingleDefaultPovShown
	
	^isSingleDefaultPovShown
		ifNil:
			[isSingleDefaultPovShown := builder
				ifNil: [true]
				ifNotNil:
					[:b | 
					((b menuAt: #displayOptionsMenu) value atNameKey:
							#toggleShowSingleDefaultPov) isOn]]
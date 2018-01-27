accessing
isSingleDefaultInfoShown
	
	^isSingleDefaultInfoShown
		ifNil:
			[isSingleDefaultInfoShown := builder
				ifNil: [true]
				ifNotNil:
					[:b | 
					((b menuAt: #displayOptionsMenu) value atNameKey:
							#toggleShowSingleDefaultInfo) isOn]]
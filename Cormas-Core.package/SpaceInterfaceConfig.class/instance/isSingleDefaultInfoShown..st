accessing
isSingleDefaultInfoShown: aBoolean
	
	| menuDyn |
	isSingleDefaultInfoShown := aBoolean.
	builder
		ifNotNil:
			[:b | 
			menuDyn := (b menuAt: #displayOptionsMenu) value atNameKey:
					#toggleShowSingleDefaultInfo.
			aBoolean
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]]
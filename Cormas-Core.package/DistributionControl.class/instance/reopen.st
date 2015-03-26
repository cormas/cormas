interface opening
reopen
	
	| w |
	w := self mainWindow.
	(w isNil or: [w isOpen not])
		ifTrue: [self open]
		ifFalse:
			[w raise.
			w expand]
display
displayOn: aGC
	
	aGC paint: ColorValue veryLightGray.
	vue bounds asFiller displayOn: aGC.
	self isInitialized ifFalse: [^self].
	agents
		do: [:a | (fonction estPresent: a level) ifTrue: [a displayOn: aGC]]
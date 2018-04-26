model saving&loading POV
symbolNameOfSelector: selector
	
	| stream |
	stream := selector readStream.
	stream upTo: $_.
	^stream upToEnd asSymbol
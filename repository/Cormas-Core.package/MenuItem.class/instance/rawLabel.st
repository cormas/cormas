labeling
rawLabel
	
	^[label evaluate]
		on: Error
		do: [:ex | ex return: label printString]
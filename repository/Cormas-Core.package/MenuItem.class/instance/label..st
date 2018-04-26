labeling
label: aString
	"Set the label to be a String.  Labels ending in an ellipsis (...) (three consecutive periods) denote that the menu item initiates the beginning of an action (rather than the whole action).  A particular LookPolicy may modify the ending ellipsis (when the label is displayed) if another convention is used for that meaning."
	
	| readStream writeStream |
	readStream := aString readStream.
	writeStream := (String new: aString size) writeStream.
	[readStream atEnd]
		whileFalse:
			[| thisCharacter |
			thisCharacter := readStream next.
			(thisCharacter = $& and: [readStream atEnd not])
				ifTrue: [writeStream nextPut: $&].
			writeStream nextPut: thisCharacter].
	self rawLabel: writeStream contents
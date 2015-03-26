converting
asRetainedMedium
	"Answer the cached retained medium (pixmap or mask).
	The medium you get should not be modified because it is shared."
	
	(retainedMedium == nil or: [retainedMedium isOpen not])
		ifTrue:
			[conversionMessage == nil
				ifTrue: [retainedMedium := image asRetainedMedium]
				ifFalse:
					[retainedMedium := self perform: conversionMessage with: image]].
	^retainedMedium
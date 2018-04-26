aspects
classes
	
	^classes isNil
		ifTrue:
			[classes := SelectionInList new.
			classes selectionIndexHolder
				compute: [:v | self selectedClass value: classes selection].
			classes]
		ifFalse: [classes]
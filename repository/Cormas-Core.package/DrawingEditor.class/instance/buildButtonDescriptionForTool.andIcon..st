private
buildButtonDescriptionForTool: aString andIcon: iconSymbol
	
	| tool icon |
	tool := Tool toolFor: aString.
	tool passInputDown: (self activeToolNames includes: aString).
	icon := (self class respondsTo: iconSymbol)
		ifTrue: [self class perform: iconSymbol]
		ifFalse: [self class selectionIcon].
	^ButtonDescription icon: icon value: tool
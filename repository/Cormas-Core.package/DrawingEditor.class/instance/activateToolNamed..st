tool hotDraw
activateToolNamed: aString
	"Activate the tool button in the toolbar which name = aString. (Desactivate the other buttons). Example: aString: 'Inspect Tool' or 'CreateEntity Tool'  "
	
	| anIndex |
	1
		to: buttons list size
		do:
			[:i | 
			| each |
			each := buttons list at: i.
			each value
				ifNotNil:
					[each value initialState name = aString ifTrue: [anIndex := i]]].
	buttons selectionIndex: anIndex
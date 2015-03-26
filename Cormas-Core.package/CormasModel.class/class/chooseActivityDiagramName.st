+ activityEditor
chooseActivityDiagramName
	" Purpose: user can choose an ActivityDiagramEditor.
ex:   Entity chooseActivityDiagramName inspect   "
	
	| list dialogValue |
	list := self allActivitySelectors asSortedCollection.
	dialogValue := DiagramChooser new.
	dialogValue diagramList list: list.
	dialogValue open.
	dialogValue cancel value ifTrue: [^nil].
	^dialogValue
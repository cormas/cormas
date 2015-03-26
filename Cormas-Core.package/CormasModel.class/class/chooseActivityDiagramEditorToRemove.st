+ activityEditor
chooseActivityDiagramEditorToRemove
	" Purpose: user can choose and remove an ActivityDiagramEditor.
ex:   Entity chooseActivityDiagramEditorToRemove   "
	
	| operationName list |
	list := self allActivitySelectors asSortedCollection.
	operationName := Dialog
		choose: 'Which activity diagram to remove?'
		fromList: list
		values: list
		lines: 8
		cancel: [#Cancel].
	operationName = #Cancel ifTrue: [^nil].
	^self removeActivityDiagram: operationName
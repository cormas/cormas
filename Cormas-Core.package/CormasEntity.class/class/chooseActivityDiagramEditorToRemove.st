+ activityDiagram - editor
chooseActivityDiagramEditorToRemove
	"Purpose: a user interface to remove an activity diagram
Example: CormasNS.Kernel.Entity chooseActivityDiagramEditorToRemove   "
	
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
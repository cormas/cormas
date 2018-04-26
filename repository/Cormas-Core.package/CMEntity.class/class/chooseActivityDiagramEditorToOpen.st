+ activityDiagram - editor
chooseActivityDiagramEditorToOpen
	"Purpose: a user interface to choose and reOpen an ActivityDiagramEditor.
Example: CormasNS.Kernel.Entity chooseActivityDiagramEditorToOpen   "
	
	| chooser |
	chooser := self chooseActivityDiagramName.
	chooser ifNil: [^nil].
	chooser action = #new ifTrue: [^self openBlankActivityDiagramEditor].
	chooser action = #remove
		ifTrue: [^self removeActivityDiagram: chooser diagramList selection].
	^self openActivityDiagram: chooser diagramList selection
+ activityEditor
chooseActivityDiagramEditorToOpen
	" Purpose: user can choose and reOpen an ActivityDiagramEditor.
ex:   CormasModel chooseActivityDiagramEditorToOpen   "
	
	| chooser |
	chooser := self chooseActivityDiagramName.
	chooser ifNil: [^nil].
	chooser action = #new ifTrue: [^self openBlankActivityDiagramEditor].
	chooser action = #remove
		ifTrue: [^self removeActivityDiagram: chooser diagramList selection].
	^self openActivityDiagram: chooser diagramList selection
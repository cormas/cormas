+ diagram
performActivityDiagram: aName
	"Purpose: This is the main method to execute an activity diagram.
After having found the initial dot (StartFigure), it performs each activity of the diagram, following the way of the transitions, until the stop dot (EndFigure).
aName = <Symbol>
Example: Entity new performActivityDiagram: #exampleTest"
	
	| editor nextActivityModel result |
	editor := self class activityDiagramsAt: aName.
	editor class = ActivityDiagramEditor ifFalse: [^self].
	nextActivityModel := (editor drawing components
		detect: [:fig | fig class = StartFigure]) model outgoing first.	" Loop over the activities "
	[nextActivityModel class = EndPointModel]
		whileFalse:
			["          *****************************************************************      "
			"          ******************      Performs the Activity     ******************      "
			"          *****************************************************************      "
			result := self
				perform: nextActivityModel selectedActivity value asSymbol.	"          *****************************************************************      "	"		select the next activity to be performed "
			nextActivityModel class = ActivityModel
				ifTrue: [nextActivityModel := nextActivityModel outgoing first]
				ifFalse:
					[(result isKindOf: Boolean)
						ifFalse:
							[self cormas warn:
									'The decision method called %<%<<1s>>> did not return a Boolean. It returns: '
								with: aName with: result.
							^self].
					result
						ifTrue: [nextActivityModel := nextActivityModel outgoingTrue]
						ifFalse: [nextActivityModel := nextActivityModel outgoingFalse]]]
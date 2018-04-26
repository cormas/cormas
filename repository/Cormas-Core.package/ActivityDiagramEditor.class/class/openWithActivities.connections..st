instance creation
openWithActivities: activityFigures connections: transitionModels
	"Open an Editor interface and display the activity diagram from the activityFigures and the transitionModels"
	
	| editor |
	editor := self newWithActivities: activityFigures connections:
			transitionModels.
	editor open.
	^editor
instance creation
openWithActivities: activityFigures connections: transitionModels forClass: destinationClass
	"Open an Editor interface and display the activity diagram from the activityFigures and the transitionModels.
	The activities created are installed on anEntityClass"
	
	| editor |
	editor := self openWithActivities: activityFigures connections:
			transitionModels.
	editor targetClass: destinationClass.
	editor setTitle.
	^editor
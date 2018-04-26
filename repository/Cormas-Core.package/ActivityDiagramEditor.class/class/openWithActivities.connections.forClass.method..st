instance creation
openWithActivities: activityFigures connections: transitionModels forClass: destinationClass method: aMethodName
	"Open an Editor interface and display the activity diagram from the activityFigures and the transitionModels.
	The activities created are installed on anEntityClass as aMethodName"
	
	| editor |
	editor := self openWithActivities: activityFigures connections:
			transitionModels.
	editor targetClass: destinationClass.
	editor name: aMethodName.
	editor setTitle.
	^editor
instance creation
newWithActivities: activityFigures connections: transitionModels forClass: destinationClass method: aMethodName
	"Create an Editor interface with the activity diagram from the activityFigures and the transitionModels. Do not display the editor"
	"Set the attributes targetClass as destinationClass and name as aMethodName"
	
	| editor |
	editor := self newWithActivities: activityFigures connections:
			transitionModels.
	editor targetClass: destinationClass.
	editor name: aMethodName.
	^editor
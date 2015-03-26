instance creation
newWithActivities: activityFigures connections: transitionModels
	"Create an Editor interface with the activity diagram from the activityFigures and the transitionModels. Do not display the editor"
	
	| transitionFigures editor figure fromFigure |
	editor := self new.
	editor drawing addAll: activityFigures.
	transitionFigures := OrderedCollection new.
	transitionModels
		do:
			[:aTransitionModel | 
			fromFigure := activityFigures
				detect: [:fig | fig id = aTransitionModel from id].
			figure := fromFigure
				connectFromPoint: aTransitionModel points first
				to: (activityFigures detect: [:fig | fig id = aTransitionModel to id])
				at: aTransitionModel points last.
			figure
				points: aTransitionModel points;
				recomputePreferredBounds.
			transitionFigures add: figure].
	editor drawing addAll: transitionFigures.
	^editor
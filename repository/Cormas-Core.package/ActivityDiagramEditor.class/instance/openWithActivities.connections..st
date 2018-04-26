interface opening
openWithActivities: activityFigures connections: transitionModels
	
	| transitionFigures figure |
	self open.
	self drawing addAll: activityFigures.
	transitionFigures := OrderedCollection new.
	transitionModels
		do:
			[:aTransitionModel | 
			figure := (activityFigures
				detect: [:fig | fig id = aTransitionModel from id])
				connectFromPoint: aTransitionModel points first
				to: (activityFigures detect: [:fig | fig id = aTransitionModel to id])
				at: aTransitionModel points last.
			figure
				points: aTransitionModel points;
				recomputePreferredBounds.
			transitionFigures add: figure].
	self drawing addAll: transitionFigures.
	self setTitle
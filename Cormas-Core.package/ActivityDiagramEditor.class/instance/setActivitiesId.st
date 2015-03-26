actions
setActivitiesId
	
	| id |
	id := 1.
	(self drawing components select: [:fig | fig class = StartFigure])
		do:
			[:act | 
			act id: id.
			act model id: id.
			id := id + 1].
	(self drawing components select: [:fig | fig class = EndFigure])
		do:
			[:act | 
			act id: id.
			act model id: id.
			id := id + 1].
	(self drawing components
		select: [:fig | fig isActivityFigure or: [fig isDiamondFigure]])
		do:
			[:act | 
			act id: id.
			act model id: id.
			id := id + 1]
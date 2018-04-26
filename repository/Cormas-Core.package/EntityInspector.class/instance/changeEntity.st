actions
changeEntity
	
	| eNames choice |
	eNames := ((self linkedSI drawing components
		select: [:fig | fig class ~= TrackFigure])
		collect: [:f | f model entity class name]) asSet asSortedCollection.
	choice := Dialog choose: 'Select an entity' fromList: eNames values:
			eNames lines: 8 cancel: nil.
	choice ifNotNil: [self goToEntityType: choice]
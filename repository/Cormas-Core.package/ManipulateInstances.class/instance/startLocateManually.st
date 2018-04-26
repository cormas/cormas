locate manually
startLocateManually
	
	(self entityClass isNil not and: [self nbEntitiesToCreate value > 0])
		ifTrue:
			[(self builder namedComponents at: #createNentity) disable.
			self class
				entitiesToCreateForSpaceView:
					(Array
						with: self entityClass
						with: initMethod value)	"	self changeCursorToInstanceFigure."]
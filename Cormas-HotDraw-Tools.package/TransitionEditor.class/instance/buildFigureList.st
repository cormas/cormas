initialize-release
buildFigureList
	
	self figureList
		list:
			(Figure withAllSubclasses asSortedCollection: [:a :b | a name < b name])
				asList
actions
validateWindowMifMid
	
	self supervisor spaceModel
		loadMifMid:
			((Cormas mapsPath: self supervisor spaceModel cormasModelClass name)
				construct: self listMifFiles selection)
		entity: self listEntities selection
		neighbourhood: self processNeighbourhood value.
	self closeRequest
initialize-release
initSigParametres: model
	
	| liste |
	liste := Filename
		filesMatching:
			((Cormas mapsPath: model name) construct: '*.mif') asString.
	liste := liste collect: [:f | (Filename splitPath: f) at: 2].
	self listMifFiles list: liste.
	self listMifFiles list isEmpty
		ifFalse: [self listMifFiles selection: self listMifFiles list first].
	self listEntities list: model spatialClasses asList.
	self listEntities list isEmpty
		ifFalse: [self listEntities selection: self listEntities list first].
	self processNeighbourhood value: false
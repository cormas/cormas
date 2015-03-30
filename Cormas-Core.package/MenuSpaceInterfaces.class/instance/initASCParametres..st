initialize-release
initASCParametres: model
	
	| liste |
	liste := Filename
		filesMatching:
			((Cormas mapsPath: model name) construct: '*.asc') asString.
	liste := liste collect: [:f | (Filename splitPath: f) at: 2].
	self listASCFiles list: liste asList
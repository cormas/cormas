CSE (general) - import - export
saveNeighboorsClass: class separator: aChar
	"Creates in maps directory a file named 'class_Neighboors.agg' which contains lines representing each intance of class 'class'. 
Each line contains the id of the instance as first element and the id of all its neighboors separated by aChar"
	
	| stream filename |
	filename := (Cormas mapsPath: self cormasModelClass name)
		construct: class name asString , '_Neighboors.agg'.
	stream := filename asFilename writeStream.
	(self spatialEntities notNil
		and:
			[self spatialEntities isEmpty not
				and:
					[(self spatialEntities includesKey: class name)
						and: [(self spatialEntities at: class name) isEmpty not]]])
		ifTrue:
			[(self spatialEntities at: class name)
				do:
					[:a | stream nextPutAll: ((a neighborsStringWithSeparator: aChar) , '\') withCRs]].
	stream close
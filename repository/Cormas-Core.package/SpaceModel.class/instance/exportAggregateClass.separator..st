import - export
exportAggregateClass: class separator: aChar
	"Creates in maps directory a file named 'class.agg' which contains lines representing each intance of class 'class'. 
Each line contains the id of the instance as first element and the id of all its components separated by aChar"
	
	| stream file |
	file := Dialog
		requestNewFileName:
			(UserMessage defaultString: 'Save as' key: #saveas) asString
		default:
			((Cormas mapsPath: self cormasModelClass name)
				construct: class name asString , '.agg').
	file isEmpty
		ifFalse:
			[stream := file asFilename writeStream.
			(self spatialEntities notNil
				and:
					[self spatialEntities isEmpty not
						and:
							[(self spatialEntities includesKey: class name)
								and: [(self spatialEntities at: class name) isEmpty not]]])
				ifTrue:
					[(self spatialEntities at: class name)
						do:
							[:a | stream nextPutAll: ((a stringWithSeparator: aChar) , '\') withCRs]].
			stream close]
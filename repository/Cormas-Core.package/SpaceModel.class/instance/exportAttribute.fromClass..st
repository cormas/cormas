import - export
exportAttribute: attributeName fromClass: className
	
	| stream filename |
	filename := (Cormas mapsPath: self cormasModelClass name)
		construct: className asString , attributeName asString , '.txt'.
	stream := filename asFilename writeStream.
	(self spatialEntities notNil
		and:
			[self spatialEntities isEmpty not
				and:
					[(self spatialEntities includesKey: className)
						and: [(self spatialEntities at: className) isEmpty not]]])
		ifTrue:
			[(self spatialEntities at: className)
				do:
					[:a | 
					stream
						store: (a perform: attributeName);
						cr]].
	stream close
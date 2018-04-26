import - export
importAttribute: attributeName fromClass: className
	
	| stream filename fileData |
	filename := (Cormas mapsPath: self cormasModelClass name)
		construct: className asString , attributeName asString , '.txt'.
	stream := filename asFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	fileData := OrderedCollection new.
	[[stream atEnd] whileFalse: [fileData add: (stream upTo: Character cr)]]
		valueNowOrOnUnwindDo: [stream close].
	(self spatialEntities notNil
		and:
			[self spatialEntities isEmpty not
				and:
					[(self spatialEntities includesKey: className)
						and: [(self spatialEntities at: className) isEmpty not]]])
		ifTrue:
			[(self spatialEntities at: className)
				with: fileData
				do:
					[:a :x | 
					a
						perform: (attributeName asString , ':') asSymbol
						with: (Compiler evaluate: x)]]
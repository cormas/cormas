ESE initialize-release
loadEnvironmentFromFile: aName
	"Load a grid stored as filename.
	aName = <String> or aName = <Filename> . If aName = <String>, it creates a Filename from maps directory.
	Example:	aName = 'test.env'  or
				aName = a FATFilename('d:\Vw5i.4\cormas\Models\JLB\maps\test.env')"
	
	| stream label dimX dimY ce cp delimiteur backgroundColor |
	stream := (self stringToFilename: aName) readStream.	"Lecture des 4 premieres lignes : topologie de la grille"	"On devine le format des lignes"
	stream lineEndAuto.
	label := stream upTo: Character tab.
	label ~= 'dimensions'
		ifTrue:
			[^self cormas warn: (UserMessage defaultString: '' key: #readError)].
	dimX := (stream upTo: Character space) asNumber.
	dimY := (stream upTo: Character cr) asNumber.
	label := stream upTo: Character tab.
	label ~= 'cloture'
		ifTrue:
			[^self cormas warn: (UserMessage defaultString: '' key: #readError)].
	ce := (stream upTo: Character cr) asSymbol.
	label := stream upTo: Character tab.
	label ~= 'connexite'
		ifTrue:
			[^self cormas warn: (UserMessage defaultString: '' key: #readError)].
	cp := (stream upTo: Character cr) asSymbol.
	label := stream upTo: Character tab.
	(label ~= 'delimiteur' and: [label ~= 'backgroundColor'])
		ifTrue:
			[^self cormas warn: (UserMessage defaultString: '' key: #readError)].	"prise en charge du nouveau format des fichiers ENV de la version Cormas MVC"
	label = 'delimiteur'
		ifTrue:
			["read data"
			delimiteur := stream upTo: Character cr.	"process data"
			delimiteur = 1
				ifTrue:
					[self cormasModel registerSpaceModelChange: #delimitorSize with: #pixel1]
				ifFalse:
					[self cormasModel registerSpaceModelChange: #delimitorSize with: #pixel0]].
	label = 'backgroundColor'
		ifTrue:
			[backgroundColor := ColorValue
				red: (stream upTo: Character space) asNumber
				green: (stream upTo: Character space) asNumber
				blue: (stream upTo: Character cr) asNumber.	"process data"
			self cormasModel registerSpaceModelChange: #backgroundColor with:
					backgroundColor].
	self line: dimX column: dimY.
	self nbNeighbours: cp.
	cp = #six
		ifTrue: [self gridCellShape: #hexagonal]
		ifFalse: [self gridCellShape: #squared].
	self resetSpatialEntities.
	self createCells.
	self boundaries: ce.
	self setSpatialEntitiesAttributsValueFromStream: stream
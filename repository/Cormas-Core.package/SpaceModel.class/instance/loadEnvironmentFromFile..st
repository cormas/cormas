ESE initialize-release
loadEnvironmentFromFile: aName
	"Load a grid stored as filename.
	aName = <String> or aName = <Filename> . If aName = <String>, it creates a Filename from maps directory.
	Example:	aName = 'test.env'  or
				aName = a FATFilename('d:\Vw5i.4\cormas\Models\JLB\maps\test.env')"
	
	| stream label dimX dimY ce cp aFile delimiteur |
	aFile := (self stringToFilename: aName).
	aFile exists ifFalse: [self error:'Missing environment file'].
	stream := aFile readStream.	"Lecture des 4 premieres lignes : topologie de la grille"	"On devine le format des lignes"
"	stream installLineEndConventionInConverter."
	label := stream upTo: Character tab.
	label ~= 'dimensions'
		ifTrue:
			[^self cormas warn: (ErrorDialogWindow defaultString: '' key: #readError)].
	dimX := (stream upTo: Character space) asNumber.
	dimY := (stream upTo: Character cr) asNumber.
	stream skipSeparators.
	label := stream upTo: Character tab.
	label ~= 'cloture'
		ifTrue:
			[^self cormas warn: (ErrorDialogWindow defaultString: '' key: #readError)].
	ce := (stream upTo: Character cr) asSymbol.
	stream skipSeparators.
	label := stream upTo: Character tab.
	label ~= 'connexite'
		ifTrue:
			[^self cormas warn: (ErrorDialogWindow defaultString: '' key: #readError)].
	cp := (stream upTo: Character cr) asSymbol.
	stream skipSeparators.
	label := stream upTo: Character tab.
	
	label = 'delimiteur'
		ifTrue:
			["read data"
			stream skipSeparators.
			delimiteur := stream upTo: Character cr.	"process data"
			"delimiteur = 1
				ifTrue:
					[self cormasModel registerSpaceModelChange: #delimitorSize with: #pixel1]
				ifFalse:
					[self cormasModel registerSpaceModelChange: #delimitorSize with: #pixel0]"].
	self line: dimX column: dimY.
	self nbNeighbours: cp.
	cp = #six
		ifTrue: [self gridCellShape: #hexagonal]
		ifFalse: [self gridCellShape: #squared].
	self resetSpatialEntities.
	self createCells.
	self boundaries: ce.
	self setSpatialEntitiesAttributsValueFromStream: stream
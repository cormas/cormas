ESE initialize-release
addEnvironmentDataFromFile: aName
	"Add attributs value to cells from an .env file"
	"aName = <String> or aName = <Filename> . If aName = <String>, it creates a Filename from maps directory.
	Example:	aName = 'test.env'  or
				aName = a FATFilename('d:\Vw5i.4\cormas\Models\JLB\maps\test.env')"
	
	| stream |
	stream := (self stringToFilename: aName) readStream.	"Lecture des 4 premieres lignes : topologie de la grille"	"On devine le format des lignes"
	stream lineEndAuto.
	stream upTo: Character tab.
	(stream upTo: Character space) asNumber.
	(stream upTo: Character cr) asNumber.
	stream upTo: Character tab.
	(stream upTo: Character cr) asSymbol.
	stream upTo: Character tab.
	(stream upTo: Character cr) asSymbol.
	stream upTo: Character tab.
	(stream upTo: Character cr) asNumber.
	self setSpatialEntitiesAttributsValueFromStream: stream
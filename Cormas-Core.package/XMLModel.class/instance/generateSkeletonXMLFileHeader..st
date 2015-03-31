private
generateSkeletonXMLFileHeader: aStream
	"Generate the header of the skeleton XML file."
	
	| spaceModel |
	spaceModel := model spaceModel.
	aStream
		nextPutAll: '<?xml version="1.0" encoding="ISO-8859-1" ?>';
		cr;
		nextPutAll:
				'<!DOCTYPE modele PUBLIC "modele-xml" "http://www-poleia.lip6.fr/~guyot/files/modele-xml.dtd">';
		cr;
		nextPutAll: '<modele>';
		cr;
		nextPutAll:
				'<dimension x="' , spaceModel line printString , '" y="'
						, spaceModel column printString , '"/>';
		cr;
		nextPutAll: '<cloture value="' , spaceModel boundaries asString , '"/>';
		cr;
		nextPutAll:
				'<connexite value="' , spaceModel nbNeighbours printString , '"/>';
		cr;
		nextPutAll:
				'<delimiteur value="' , spaceModel delimiter printString , '"/>';
		cr
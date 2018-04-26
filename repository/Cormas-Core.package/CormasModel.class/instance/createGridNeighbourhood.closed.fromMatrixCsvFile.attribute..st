+ instance creation - spatial entities
createGridNeighbourhood: anInteger closed: aBoolean fromMatrixCsvFile: aString attribute: aName
	"Purpose: Create a spatial grid made of cells from a csv file in a matrix format providing values for a given attribute.
The file has to be located into /data folder.
Arguments: 
	anInteger <Integer> is the neighbourhood type. It must 4, 6 or 8
	aBoolean <Boolean> to inform if it is closed or torroidal space.
	aString <String>: the name of the csv datafile. The file has to be located in the 'data' subdirectory of the model.
	anAttributeName <String>: attribute's name.

Example: 	self createGridNeighbourhood: 8 closed: true fromMatrixCsvFile: 'map.csv' attribute: 'cover'. "
	
	| matrix nbLines nbCols collec |
	matrix := self readCsvFile: aString.
	nbLines := matrix size.
	nbCols := matrix first size.
	self createGridX: nbCols Y: nbLines neighbourhood: anInteger closed:
			aBoolean.
	collec := OrderedCollection new.
	matrix do: [:line | collec addAll: line].
	collec
		with: self theCMConwayCells
		do:
			[:string :c | 
			c
				perform: (aName , ':') asSymbol
				with: (Cormas stringAsObjectType: string)]
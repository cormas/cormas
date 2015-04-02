+ utilities - files
saveElementsOfCollec: aCollec inFile: aFilename
	"Purpose: Save a Collection of literals (characters, numbers, strings...) into a defined file. Each element of the collection is saved into a separate line of the file. If the file already exists, the elements of the collection are saved starting frm the end of the file.
Arguments: aColllec is the collection to be savec ; aFilename is a filename object indicatng the name, the extension and the path of the file
Example: Cormas saveElementsOfCollec: #(abc ?? 67) inFile: ((Cormas modelPath: #ECEC) construct: 'test.txt')     "
	
	| file lastData i |
	file := aFilename appendStream.
	lastData := aCollec size.
	i := 1.
	aCollec
		do:
			[:a | 
			i = lastData
				ifFalse: [file nextPutAll: a asString , '\' withCRs]
				ifTrue: [file nextPutAll: a asString].
			i := i = 1].
	file close
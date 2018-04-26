+ utilities - files
saveCollec: aCollec asLineOfFile: aFilename separator: aChar
	"Purpose: Save a Collection of literals (characters, numbers, strings...) into a defined file. The elements of the collection are saved into a single line, each one separated by aChar. If the file already exists, the elements of the collection are saved after the last line of the file.
Arguments: aColllec is the collection to be savec ; aFilename is a filename object indicatng the name, the extension and the path of the file  ; aChar the character of the separator writen between each element
Example: Cormas saveCollec: #(abc '??' 67) asLineOfFile: ((Cormas modelPath: #ECEC) construct: 'test.csv')   separator: $;  "
	
	| stream |
	stream := aFilename appendStream.
	1
		to: aCollec size - 1
		do:
			[:i | stream nextPutAll: (aCollec at: i) printString , aChar asSymbol asString].
	stream nextPutAll: aCollec last printString.
	stream nextPutAll: '\' withCRs.
	stream close
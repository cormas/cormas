action
confirmAttValues: choice for: valuesTextLine

	^ self confirm: (String streamContents: [ : stream |
			stream 
				nextPutAll: self translator tFoundValues;
				nextPutAll: choice;
				nextPutTerminator;
				nextPutAll: valuesTextLine;
				nextPutTerminator;
				nextPutAll: self translator tAddSymbols ])
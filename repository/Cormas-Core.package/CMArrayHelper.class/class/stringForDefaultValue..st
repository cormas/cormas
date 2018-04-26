helping
stringForDefaultValue: aDefaultValue
	" return a string that is used to save a default value depending on its type "
	
	^ String streamContents: [ : stream |
			stream 
				nextPutAll: 'Array withAll: ';
				nextPutAll: aDefaultValue asString ]
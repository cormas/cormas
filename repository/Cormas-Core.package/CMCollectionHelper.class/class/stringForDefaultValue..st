helping
stringForDefaultValue: aDefaultValue
	"return a string that is used to save a default value depending on its type"
	
	| defaultString coll |
	aDefaultValue isEmpty
		ifTrue: [ defaultString := String 
						streamContents: [ : stream | 
								stream 
									nextPutAll: aDefaultValue class name asString; 
									nextPutAll: ' new' ] ]
		ifFalse: [ 
			defaultString := String empty.
			coll := aDefaultValue asString substrings asOrderedCollection.
			coll add: 'withAll:' beforeIndex: 2.
			coll do: [ : sub | defaultString := 
				String 
						streamContents: [ : stream | 
								stream 
									nextPutAll: defaultString;
									nextPutAll: sub;
									nextPutAll: ' ' ] ] ].
	^ defaultString
helping
stringForDefaultValue: aDefaultValue
	"return a string that is used to save a default value depending on its type"
	
	aDefaultValue isEmpty
		ifTrue: [ ^ String 
						streamContents: [ : stream | 
								stream 
									nextPutAll: aDefaultValue class name asString;
									nextPutAll: ' new' ] ]
		ifFalse: [ self halt ]
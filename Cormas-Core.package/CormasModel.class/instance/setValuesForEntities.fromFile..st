+ utilities - save load attributes
setValuesForEntities: aClass fromFile: aStringOrFilename
	"Load data from a File and set the values of the attributs according to the format declared into the file"
	
	| stream aFilename attype dataLine couple name type numLigne i valeur instances method fileSize getter |
	aFilename := self stringToFilename: aStringOrFilename.
	fileSize := (self getDataLinesFromFile: aStringOrFilename) size.
	getter := self getterForEntityClass: aClass.
	instances := self perform: getter.
	fileSize - 1 = instances size
		ifFalse:
			[self cormas
				warn: 'Different number of instances declared in <1s> and in <2s> !!'
				with: aStringOrFilename asString
				with: getter.
			self halt].	"Reading the datafile, line by line, each line is giving the values for the attributes of an instance of the class"
	aFilename exists
		ifFalse:
			[self cormas warn: 'This particular datafile does not exist !!'.
			^nil].
	stream := aFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	attype := OrderedCollection new.
	dataLine := (stream upTo: Character cr) readStream.
	[dataLine atEnd]
		whileFalse:
			[couple := OrderedCollection new.
			name := dataLine upTo: $(.
			name := (name , ':') asSymbol.
			type := dataLine upTo: $).
			type := ('as' , type) asSymbol.
			dataLine skipSeparators.
			couple
				add: name;
				add: type.
			attype add: couple].
	dataLine close.	"lecture des valeurs des attributs, et maj des entites spatiales a 
	partir de ces valeurs"	"balayage de gauche a droite et de bas en haut"
	numLigne := 0.
	[stream atEnd]
		whileFalse:
			[dataLine := (stream upTo: Character cr) readStream.
			numLigne := numLigne + 1.
			i := 0.
			[dataLine atEnd]
				whileFalse:
					[i := i + 1.
					valeur := dataLine upTo: $,.
					method := (attype at: i) first.
					valeur = 'nil'
						ifFalse: [valeur := valeur perform: (attype at: i) last]
						ifTrue: [valeur := nil].
					valeur isNil
						ifFalse:
							[method = #patchID:
								ifTrue:
									[(aClass inheritsFrom: AgentLocation) ifTrue: [method := #moveTo:].
									(aClass inheritsFrom: ObjectLocation)
										ifTrue: [method := #isMovedTo:].
									valeur := self spaceModel elementaryEntities
										detect: [:cell | cell id = valeur]]].
					(instances at: numLigne) perform: method with: valeur].
			dataLine close].
	stream close
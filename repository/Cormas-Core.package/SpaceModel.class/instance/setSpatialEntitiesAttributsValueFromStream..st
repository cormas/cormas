ESE initialize-release
setSpatialEntitiesAttributsValueFromStream: aStream
	"lecture des valeurs des attributs, et maj des entites spatiales a 
	partir de ces valeurs"
	"balayage de gauche a droite et de bas en haut"
	"Lecture de la 5e ligne: noms des attributs et leur type pour 
	conversion"
	
	| numLigne dataLine i valeur attype label couple name type aCell |
	attype := OrderedCollection new.
	aStream skipSeparators.
	dataLine := (aStream upTo: Character cr) readStream.	
	label := dataLine upTo: Character tab.
	label ~= 'attributs'
		ifTrue:
			[^self cormas warn: (ErrorDialogWindow defaultString: '' key: #readError)].
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
	dataLine close.
	numLigne := 0.
	[aStream atEnd]
		whileFalse:
			[dataLine skipSeparators.
			 dataLine := (aStream upTo: Character cr) readStream.
			numLigne := numLigne + 1.
			i := 0.
			[dataLine atEnd]
				whileFalse:
					[i := i + 1.
					dataLine skipSeparators.
					valeur := dataLine upTo: $,.
					aCell := self elementaryEntities at: numLigne.
					(attype at: i) last = #asEntity
						ifTrue:
							[valeur := (valeur tokensBasedOn: $.) last asSymbol.
							aCell
								perform: (attype at: i) first
								with: valeur]
						ifFalse:
							[aCell
								perform: (attype at: i) first
								with:
									(valeur = 'nil'
										ifFalse: [valeur perform: (attype at: i) last]
										ifTrue: [nil])]].
			dataLine close].
	aStream close
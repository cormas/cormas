model saving&loading EV
readVSFileOLD: evFileName
	
	| stream entity line methodName colR colG colB newSymbol end key classExist image |
	stream := evFileName asFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	["Lecture du fichier, ligne par ligne"
	stream atEnd]
		whileFalse:
			[line := (stream upTo: Character cr) readStream.
			key := (line upTo: Character space) asSymbol.
			classExist := true.
			entity := self cormasModelClass environment
				at: key
				ifAbsent: [classExist := false].
			classExist
				ifTrue:
					[methodName := line upTo: Character space.
					methodName = 'image'
						ifTrue: [image := self loadOldImageOf: entity line: line].
					(methodName ~= 'image' and: [methodName ~= 'dicoCouleur'])
						ifTrue:
							[methodName = 'Bitmap'
								ifTrue: [self loadBitmapImageOf: entity line: line]
								ifFalse:
									[self loadVectorialImage: methodName of: entity line: line]	"en fait c'est le nom de la classe"].
					methodName = 'dicoCouleur'
						ifTrue:
							[end := line upTo: Character space.
							end isEmpty
								ifFalse:
									[newSymbol := end asSymbol.
									colR := (line upTo: Character space) asNumber.
									colG := (line upTo: Character space) asNumber.
									colB := (line upTo: Character space) asNumber.
									entity colorsDict
										at: newSymbol
										put: (ColorValue red: colR green: colG blue: colB).
									(methodName = 'image' and: [image isNotNil])
										ifTrue:
											["Adaptation Cormas 2005: l'image stock√©e dans 'image' est recopi√©e dans povDict avec la cl√© newSymbol"
											entity povDict at: newSymbol put: image]]]].
			line close].
	stream close
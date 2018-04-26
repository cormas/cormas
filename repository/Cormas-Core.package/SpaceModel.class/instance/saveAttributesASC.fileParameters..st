import - export
saveAttributesASC: attributes fileParameters: aList
	
	| stream firstValue type firstPatch dicoAttConv patch a c position file askFileName aPrefix |
	askFileName := true.
	attributes size > 1
		ifTrue:
			[(self cormas confirm:
					'Do you want to use a same prefix for the names of all the asc files?')
				ifTrue:
					[aPrefix := self cormas request:
							'Enter a prefix that will be used for all the asc files'.
					aPrefix = '' ifTrue: [^nil].
					askFileName := false]].
	aPrefix ifNil: [aPrefix := ''].
	attributes
		do:
			[:att | 
			file := (Cormas mapsPath: self cormasModelClass name)
				construct: aPrefix , att , '.asc'.
			askFileName
				ifTrue:
					[file := Dialog
						requestNewFileName:
							(UserMessage defaultString: 'Save as' key: #saveas)
						default: file.
					file isEmpty ifTrue: [^nil].
					file := file asFilename].
			stream := file asFilename writeStream.
			stream
				nextPutAll: 'ncols	';
				nextPut: Character space;
				nextPutAll: column printString;
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'nrows	';
				nextPut: Character space;
				nextPutAll: line printString;
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'xllcorner	';
				nextPut: Character space.
			xll isNil
				ifTrue: [stream nextPutAll: (aList at: 1)]
				ifFalse: [stream nextPutAll: xll printString].
			stream nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'yllcorner	';
				nextPut: Character space.
			yll isNil
				ifTrue: [stream nextPutAll: (aList at: 2)]
				ifFalse: [stream nextPutAll: yll printString].
			stream nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'cellSize	';
				nextPut: Character space.
			cellSize isNil
				ifTrue: [stream nextPutAll: (aList at: 4)]
				ifFalse: [stream nextPutAll: cellSize printString].
			stream nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'NODATA_value	';
				nextPut: Character space;
				nextPutAll: (aList at: 4);
				nextPutAll: '\' withCRs.
			dicoAttConv := Dictionary new.
			firstPatch := self elementaryEntities
				detect: [:p | (p perform: att asSymbol) isNil not]
				ifNone: [nil].
			firstPatch isNil
				ifTrue: [firstValue := nil]
				ifFalse: [firstValue := firstPatch perform: att asSymbol].
			firstValue isSymbol
				ifTrue:
					[type := '(Symbol)'.
					dicoAttConv
						at: att asSymbol
						put: #asString]
				ifFalse:
					[(firstValue isKindOf: Number)
						ifTrue:
							[type := '(Number)'.
							dicoAttConv
								at: att asSymbol
								put: #printString]
						ifFalse:
							[firstValue isString
								ifTrue:
									[type := '(String)'.
									dicoAttConv
										at: att asSymbol
										put: #asString]
								ifFalse:
									[(firstValue isKindOf: Boolean)
										ifTrue:
											[type := '(Boolean)'.
											dicoAttConv
												at: att asSymbol
												put: #printString]
										ifFalse:
											[type := '(nil)'.
											dicoAttConv
												at: att asSymbol
												put: #printString]]]].
			1
				to: line
				do:
					[:i | 
					1
						to: column
						do:
							[:j | 
							position := (i - 1) * column + j.
							patch := self elementaryEntities at: position.
							a := att asSymbol.
							c := dicoAttConv at: a.
							stream nextPutAll: ((patch perform: a) perform: c).
							position \\ column = 0
								ifFalse: [stream nextPutAll: ' ']
								ifTrue: [i = line ifFalse: [stream nextPutAll: '\' withCRs]]]].
			stream close]
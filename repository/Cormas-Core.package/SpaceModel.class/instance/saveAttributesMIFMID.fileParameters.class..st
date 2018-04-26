private - import - export
saveAttributesMIFMID: attributes fileParameters: aList class: aClass
	
	| stream firstValue type firstPatch dicoAttConv c maxX maxY minX minY |
	maxX := 0.
	maxY := 0.
	minX := 1000000000000.
	minY := 1000000000000.
	(self openedSpatialGrid drawing components
		select: [:f | f entityType = aClass])
		do:
			[:a | 
			a points
				do:
					[:aPoint | 
					aPoint x > maxX ifTrue: [maxX := aPoint x asFloat].
					aPoint y > maxY ifTrue: [maxY := aPoint y asFloat].
					aPoint x < minX ifTrue: [minX := aPoint x asFloat].
					aPoint y < minY ifTrue: [minY := aPoint y asFloat]]].	"(self spatialEntities at: aClass name)
		do: [:a | a image component vertices"
	stream := ((Cormas mapsPath: self cormasModelClass name) asString , '\'
		, aClass name printString , 'Cormas.mif') asFilename writeStream.
	stream
		nextPutAll: 'Version 300';
		nextPutAll: '\' withCRs.
	stream
		nextPutAll: 'Charset "WindowsLatin1"';
		nextPutAll: '\' withCRs.
	stream
		nextPutAll: 'Delimiter ","';
		nextPutAll: '\' withCRs.
	stream
		nextPutAll: 'CoordSys ';
		nextPutAll: (aList at: 1);
		nextPutAll: ' Units ';
		nextPutAll: (aList at: 2);
		nextPutAll: ' Bounds (';
		nextPutAll: minX printString;
		nextPutAll: ', ';
		nextPutAll: minY printString;
		nextPutAll: ') (';
		nextPutAll: maxX printString;
		nextPutAll: ', ';
		nextPutAll: maxY printString;
		nextPutAll: ')';
		nextPutAll: '\' withCRs.
	stream
		nextPutAll: 'Columns ';
		nextPutAll: attributes selections size printString;
		nextPutAll: '\' withCRs.
	dicoAttConv := Dictionary new.
	attributes selections
		do:
			[:att | 
			firstPatch := (self spatialEntities at: aClass name)
				detect: [:p | (p perform: att asSymbol) isNil not]
				ifNone: [nil].
			firstPatch isNil
				ifTrue: [firstValue := nil]
				ifFalse: [firstValue := firstPatch perform: att asSymbol].
			firstValue isSymbol
				ifTrue:
					[type := 'Text'.
					dicoAttConv
						at: att asSymbol
						put: #asString]
				ifFalse:
					[(firstValue isKindOf: Integer)
						ifTrue:
							[type := 'Integer'.
							dicoAttConv
								at: att asSymbol
								put: #printString]
						ifFalse:
							[(firstValue isKindOf: Float)
								ifTrue:
									[type := 'Float'.
									dicoAttConv
										at: att asSymbol
										put: #printString]
								ifFalse:
									[firstValue isString
										ifTrue:
											[type := 'char (20)'.
											dicoAttConv
												at: att asSymbol
												put: #asString]
										ifFalse:
											[(firstValue isKindOf: Boolean)
												ifTrue:
													[type := 'char (20)'.
													dicoAttConv
														at: att asSymbol
														put: #printString]
												ifFalse:
													[type := '(nil)'.
													dicoAttConv
														at: att asSymbol
														put: #printString]]]]].
			stream
				nextPutAll: att;
				nextPutAll: ' ';
				nextPutAll: type;
				nextPutAll: '\' withCRs].
	stream
		nextPutAll: 'Data ';
		nextPutAll: '\' withCRs.
	(self openedSpatialGrid drawing components
		select: [:f | f entityType = aClass])
		do:
			[:a | 
			"(self spatialEntities at: aClass name)
		do: 
			[:a | "
			stream
				nextPutAll: 'Region 1 ';
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: a points size printString;
				nextPutAll: '\' withCRs.
			a points
				do:
					[:aPoint | 
					stream
						nextPutAll: aPoint x asFloat printString;
						nextPutAll: ' ';
						nextPutAll: (minY + maxY - aPoint y asFloat) printString;
						nextPutAll: '\' withCRs]].
	stream close.
	stream := ((Cormas mapsPath: self cormasModelClass name) asString , '\'
		, aClass name printString , 'Cormas.mid') asFilename writeStream.
	(self spatialEntities at: aClass name)
		do:
			[:a | 
			attributes selections
				do:
					[:b | 
					c := dicoAttConv
						at: b asSymbol
						ifAbsent: [nil].
					c isNil
						ifTrue: [stream nextPutAll: '0']
						ifFalse: [stream nextPutAll: ((a perform: b asSymbol) perform: c)].
					attributes selections last = b ifFalse: [stream nextPutAll: ',']].
			stream nextPutAll: '\' withCRs].
	stream close
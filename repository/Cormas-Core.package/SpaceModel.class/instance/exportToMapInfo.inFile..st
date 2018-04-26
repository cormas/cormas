private - import - export
exportToMapInfo: attributes inFile: file
	
	| stream firstValue firstPatch dicoAttConv patch a c collec |
	stream := file asFilename writeStream.
	stream nextPutAll: 'num,'.
	dicoAttConv := Dictionary new.
	attributes
		do:
			[:att | 
			firstPatch := self elementaryEntities
				detect: [:p | (p perform: att asSymbol) isNil not]
				ifNone: [nil].
			firstPatch isNil
				ifTrue: [firstValue := nil]
				ifFalse: [firstValue := firstPatch perform: att asSymbol].
			firstValue isSymbol
				ifTrue:
					[dicoAttConv
						at: att asSymbol
						put: #asString]
				ifFalse:
					[firstValue cormasHelper isTypeNumber
						ifTrue:
							[dicoAttConv
								at: att asSymbol
								put: #printString]
						ifFalse:
							[firstValue isString
								ifTrue:
									[dicoAttConv
										at: att asSymbol
										put: #asString]
								ifFalse:
									[dicoAttConv
										at: att asSymbol
										put: #printString]]].
			stream
				nextPutAll: att;
				nextPutAll:
						(att = attributes last
								ifFalse: [',']
								ifTrue: ['\' withCRs])].
	collec := Cormas
		sort: self elementaryEntities
		byIncreasing: #numLine
		thenByIncreasing: #numCol.
	1
		to: collec size - 1
		do:
			[:i | 
			patch := collec at: i.
			stream nextPutAll: i printString , ','.
			attributes
				do:
					[:att | 
					a := att asSymbol.
					c := dicoAttConv at: a.
					stream
						nextPutAll: ((patch perform: a) perform: c);
						nextPutAll:
								(att = attributes last
										ifFalse: [',']
										ifTrue: ['\' withCRs])]].
	patch := self elementaryEntities last.
	stream nextPutAll: collec size printString , ','.
	attributes
		do:
			[:att | 
			a := att asSymbol.
			c := dicoAttConv at: a.
			stream
				nextPutAll: ((patch perform: a) perform: c);
				nextPutAll:
						(att = attributes last
								ifFalse: [',']
								ifTrue: [''])].
	stream close
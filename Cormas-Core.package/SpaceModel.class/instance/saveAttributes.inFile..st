private - import - export
saveAttributes: attributes inFile: file
	"Save the attribut of the cells on a file.env 
attributes <OrderedCollection> ex: OrderedCollection ('seed' 'context')
file <Filename> ex: aFATFilename('d:\vw7nc\cormas\Models\TSE\maps\titi.env')"
	
	| stream firstValue type firstPatch dicoAttConv patch a c bgColor |
	stream := file writeStream.	" Ecriture des 4 premieres lignes : topologie de la grille "
	stream
		nextPutAll: 'dimensions	';
		nextPutAll: line printString;
		nextPutAll: ' ';
		nextPutAll: column printString;
		nextPutAll: '\' withCRs.
	stream
		nextPutAll: 'cloture	';
		nextPutAll: boundaries asString;
		nextPutAll: '\' withCRs.
	stream
		nextPutAll: 'connexite	';
		nextPutAll: nbNeighbours asString;
		nextPutAll: '\' withCRs.	" Ecriture de la couleur du background de la grille spatiale"
	bgColor := self vue drawing fillColor.
	bgColor ifNil: [bgColor := ColorValue gray].
	stream
		nextPutAll: 'backgroundColor	';
		nextPutAll:
				bgColor red printString , ' ' , bgColor green printString , ' '
						, bgColor blue printString;
		nextPutAll: '\' withCRs.	" 5√®me ligne : attributs a sauver, ainsi que leur type (on perd cette info car on les sauve au format string "
	stream nextPutAll: 'attributs	'.
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
					[type := '(Symbol)'.
					dicoAttConv
						at: att asSymbol
						put: #asString]
				ifFalse:
					[firstValue cormasHelper isTypeNumber
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
									[firstValue cormasHelper isTypeBoolean
										ifTrue: [type := '(Boolean)']
										ifFalse:
											[firstValue cormasHelper isTypeEntity
												ifTrue: [type := '(Entity)']
												ifFalse: [type := '(nil)']].
									dicoAttConv
										at: att asSymbol
										put: #printString]]].
			stream
				nextPutAll: att , type;
				nextPutAll:
						(att = attributes last
								ifFalse: [' ']
								ifTrue: ['\' withCRs])].	" Fin du fichier : 1 ligne pour les valeurs des attributs de chaque cellule de la grille "
	1
		to: self elementaryEntities size - 1
		do:
			[:i | 
			patch := self elementaryEntities at: i.
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
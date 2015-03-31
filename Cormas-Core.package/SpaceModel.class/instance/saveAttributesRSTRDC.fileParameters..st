import - export
saveAttributesRSTRDC: attributes fileParameters: aList
	
	| stream firstPatch firstValue typeAtt a typeData |
	attributes selections
		do:
			[:att | 
			stream := ((Cormas mapsPath: self cormasModelClass name) asString , '\' ,
					att , 'Cormas.rst') asFilename writeStream.
			firstPatch := self elementaryEntities
				detect: [:p | (p perform: att asSymbol) isNil not]
				ifNone: [nil].
			firstPatch isNil
				ifTrue: [firstValue := nil]
				ifFalse: [firstValue := firstPatch perform: att asSymbol].
			firstValue isSymbol
				ifTrue:
					[self cormas
						warn:
							'The type can only be byte, integer of real.' , att , ' is not exportable'.
					stream close.
					^nil]
				ifFalse:
					[(firstValue isKindOf: Number)
						ifTrue:
							[typeAtt := #printString.
							firstValue isInteger
								ifTrue: [typeData := 'integer']
								ifFalse: [typeData := 'real']]
						ifFalse:
							[self cormas
								warn:
									'The type can only be byte, integer of real.' , att , ' is not exportable'.
							stream close.
							^nil]].
			self elementaryEntities
				do:
					[:patch | 
					a := att asSymbol.
					stream nextPutAll: ((patch perform: a) perform: typeAtt).
					stream nextPutAll: '\' withCRs].
			stream close.
			stream := ((Cormas mapsPath: self cormasModelClass name) asString , '\'
				, att , 'Cormas.rdc') asFilename writeStream.
			stream
				nextPutAll: 'file format ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 1);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'file title  ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 2);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'data type   ';
				nextPutAll: ': ';
				nextPutAll: typeData;
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'file type   ';
				nextPutAll: ': ';
				nextPutAll: 'ascii';
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'columns     ';
				nextPutAll: ': ';
				nextPutAll: column printString;
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'rows        ';
				nextPutAll: ': ';
				nextPutAll: line printString;
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'ref. system ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 3);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'ref. units  ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 4);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'unit dist.  ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 5);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'min. X      ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 6);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'max. X      ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 7);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'min. Y      ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 8);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'max. Y      ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 9);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'pos''n error ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 10);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'resolution  ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 11);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'min. value  ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 12);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'max. value  ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 13);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'display min ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 14);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'display max ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 15);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'value units ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 16);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'value error ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 17);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'flag value  ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 18);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'flag def''n ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 19);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'legend cats ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 20);
				nextPutAll: '\' withCRs.
			stream close]
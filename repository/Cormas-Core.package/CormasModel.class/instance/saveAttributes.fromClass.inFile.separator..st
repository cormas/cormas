private - util_files
saveAttributes: attributes fromClass: aClass inFile: aStringOrFilename separator: aChar
	"Save the attributes of the intances of aClass on a file 'aStringOrFilename'  
attributes <OrderedCollection> ex: OrderedCollection ('seed' 'context')
file <Filename> ex: aFATFilename('d:\vw7nc\cormas\Models\TSE\data\titi.txt') or
file <String> ex: 'titi.txt'  it will be save into data/"
	
	| stream dicoAttConv instance a c filename instances |
	filename := self stringToFilename: aStringOrFilename.
	instances := self perform: (self getterForEntityClass: aClass).
	instances isEmpty ifTrue: [^nil].
	stream := filename appendStream.	" attributs a sauver, ainsi que leur type (on perd cette info car on les sauve au format string "	"stream nextPutAll: 'attributes	'."
	dicoAttConv := self getAttributesType: attributes fromInstances: instances.
	attributes
		do:
			[:att | 
			| typ |
			typ := (dicoAttConv at: att asSymbol) last.
			stream
				nextPutAll: att asSymbol , typ;
				nextPutAll:
						(att = attributes last
								ifFalse: [aChar asSymbol asString]
								ifTrue: ['\' withCRs])].	" Fin du fichier : 1 ligne pour les valeurs des attributs de chaque instance "
	1
		to: instances size - 1
		do:
			[:i | 
			instance := instances at: i.
			attributes
				do:
					[:att | 
					a := att asSymbol.
					c := (dicoAttConv at: a) first.
					stream
						nextPutAll: ((instance perform: a) perform: c);
						nextPutAll:
								(att = attributes last
										ifFalse: [aChar asSymbol asString]
										ifTrue: ['\' withCRs])]].
	instance := instances last.
	attributes
		do:
			[:att | 
			a := att asSymbol.
			c := (dicoAttConv at: a) first.
			stream
				nextPutAll: ((instance perform: a) perform: c);
				nextPutAll:
						(att = attributes last
								ifFalse: [aChar asSymbol asString]
								ifTrue: ['\' withCRs])].
	stream close
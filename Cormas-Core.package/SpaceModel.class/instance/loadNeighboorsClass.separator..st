CSE (general) - import - export
loadNeighboorsClass: class separator: aChar
	
	| stream portableFilename ligne dataVector item id anEntity |
	portableFilename := (Cormas mapsPath: self cormasModelClass name)
		construct: class name asString , '_Neighboors.agg'.
	portableFilename asFilename exists
		ifFalse:
			[^self cormas warn: portableFilename asString , ' is missing !!!'].
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	(self spatialEntities isNil
		or:
			[self spatialEntities isEmpty
				or:
					[(self spatialEntities includesKey: class name) not
						or: [(self spatialEntities at: class name) isEmpty]]])
		ifTrue:
			[self cormas warn: 'pb !!!'.
			self halt].	"self resetSpatialEntity: class."
	stream := portableFilename asFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	[stream atEnd]
		whileFalse:
			[ligne := (stream upTo: Character cr) readStream.
			dataVector := OrderedCollection new.
			[ligne atEnd]
				whileFalse:
					[item := ligne upTo: aChar.
					dataVector add: item asNumber].
			ligne close.
			id := dataVector first.
			anEntity := self getInstanceOfClass: class fromId: id.
			anEntity neighbourhood: OrderedCollection new.
			dataVector remove: id.
			dataVector
				do:
					[:anID | anEntity neighbourhood add: (self getInstanceOfClass: class fromId: anID)]].
	stream close
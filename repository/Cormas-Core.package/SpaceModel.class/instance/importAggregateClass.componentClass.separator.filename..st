import - export
importAggregateClass: class componentClass: cClass separator: aChar filename: aStringOrFileName
	
	| stream portableFilename ligne dataVector item id nbComponents collec aggregate |
	aStringOrFileName isString
		ifTrue:
			[portableFilename := (Cormas mapsPath: self cormasModelClass name)
				construct: aStringOrFileName]
		ifFalse: [portableFilename := aStringOrFileName].
	portableFilename asFilename exists
		ifFalse:
			[^self cormas warn: portableFilename asString , ' is missing !!!'].
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	(self spatialEntities isNil
		or:
			[self spatialEntities isEmpty
				or:
					[(self spatialEntities includesKey: cClass name) not
						or: [(self spatialEntities at: cClass name) isEmpty]]])
		ifTrue:
			[self cormas warn: 'pb !!!'.
			self halt].
	self resetCompoundSpatialEntity: class andTheirComponents: cClass.
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
			dataVector remove: id.
			nbComponents := dataVector first.
			dataVector remove: nbComponents.
			dataVector size = nbComponents
				ifFalse:
					[self cormas warn: 'pb !!!'.
					self halt]
				ifTrue:
					[collec := (self spatialEntities at: cClass name)
						select: [:i | dataVector includes: i id].
					collec size = nbComponents
						ifFalse:
							[self cormas warn: 'pb !!!'.
							self halt]
						ifTrue:
							[aggregate := class new: self.
							aggregate addSilentlyComponents: collec.
							(self spatialEntities at: class name) add: aggregate]]].
	stream close.
	self cormasModel
		perform: ('the' , class name asString , 's:') asSymbol
		with: (self spatialEntities at: class name).
	self dispatchCompoundSpatialEntity: class
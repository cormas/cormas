util
testParcelsRequired: fileNameSt
	
	| stream line parcels |
	parcels := OrderedCollection new.
	stream := fileNameSt asFilename readStream.
	[stream atEnd]
		whileFalse:
			[line := (stream upTo: Character cr) tokensBasedOn: Character space.
			(line includes: 'subclass:')
				ifTrue:
					[line first = 'ExternalInterface' ifTrue: [parcels add: 'DLLCC' -> ''].
					line first = 'DdemlClient' ifTrue: [parcels add: 'DDEML' -> '']]].
	stream close.
	Parcel setFileCachesTo: [Dictionary new].
	Cursor wait
		showWhile:
			[parcels
				do:
					[:pname | 
					Parcel
						handleParcelSignalsDo:
							[Parcel
								ensureLoadedParcel: pname key
								withVersion: pname value
								for: nil]]]
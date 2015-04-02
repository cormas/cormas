model saving&loading EV
vsFile_old
	"export the POVs of the model as EV file. The file name is equal to the version of the model"
	
	| fileNameEv stream |
	fileNameEv := (self class modelPath: self cormasModelClass name)
		construct:
			(self cormasModelClass version tokensBasedOn: $.) first , '.ev'.
	stream := fileNameEv asFilename writeStream.
	self cormasModelClass visualizedClasses
		do:
			[:entity | 
			(self cormasModelClass spatialClasses includes: entity)
				ifFalse:
					[stream nextPutAll: entity name , ' image '.
					entity image class = EntityPOV
						ifFalse: [stream nextPutAll: 'figurine\' withCRs]
						ifTrue: [entity image exportIn: stream]].
			(entity colorsDict isNil or: [entity colorsDict isEmpty])
				ifTrue:
					[stream nextPutAll: entity name , ' dicoCouleur '.
					stream nextPutAll: '\' withCRs]
				ifFalse:
					[entity colorsDict
						keysAndValuesDo:
							[:k :v | 
							stream nextPutAll: entity name , ' dicoCouleur '.
							stream
								nextPutAll:
									k asString , ' ' , v red printString , ' ' , v green printString , ' '
										, v blue printString.
							stream nextPutAll: '\' withCRs]]].
	stream close
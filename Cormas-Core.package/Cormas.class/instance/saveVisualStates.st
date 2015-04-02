model saving&loading EV
saveVisualStates
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
					["IMAGES des ENTITES (plus couleurs pour les VectorialPOV // pour les BitmapPOV r√©f√©rence au nom du symbole associ√©"
					entity povDict
						keysAndValuesDo:
							[:k :im | 
							stream nextPutAll: entity name , ' '.
							(im isVectorialPOV or: [im isArcPOV])
								ifFalse:
									[stream
										nextPutAll:
											'Bitmap ' , k asString , ' ' , im position , '\' withCRs	"c'est un bitmap"]
								ifTrue:
									[stream nextPutAll: im class name asString , ' '.
									stream nextPutAll: k asString , ' '.
									im exportIn: stream]]].	"COLOR of the SPATIALIZED ENTITIES"
			(self cormasModelClass spatialClasses includes: entity)
				ifTrue:
					[entity colorsDict isEmpty
						ifTrue:
							[stream nextPutAll: entity name , ' dicoCouleur '.
							stream nextPutAll: '\' withCRs]
						ifFalse:
							[entity colorsDict
								keysAndValuesDo:
									[:k :v | 
									stream nextPutAll: entity name , ' dicoCouleur '.
									v isNil
										ifTrue: [stream nextPutAll: k asString]
										ifFalse:
											[stream
												nextPutAll:
													k asString , ' ' , v red printString , ' ' , v green printString , ' '
														, v blue printString].
									stream nextPutAll: '\' withCRs]]]].
	stream close
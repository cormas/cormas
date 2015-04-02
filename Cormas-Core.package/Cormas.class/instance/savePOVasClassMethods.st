model saving&loading POV
savePOVasClassMethods
	
	self cormasModelClass spatialClasses
		do:
			[:aClass | 
			aClass colorsDict
				keysAndValuesDo:
					[:aSymbol :aColor | 
					PovSetter_SpatialEntity new saveSpatialEntityPOVcolor: aColor intoClass:
							aClass symbol: aSymbol]].
	self cormasModelClass occupantClasses
		do:
			[:aClass | 
			aClass povDict
				keysAndValuesDo:
					[:aSymbol :aPOV | 
					(aClass inheritsFrom: ArcEntity)
						ifTrue:
							[PovSetter_Arc new saveArcPOV: aPOV intoClass: aClass symbol: aSymbol]
						ifFalse:
							[aPOV isBitmapPOV
								ifTrue:
									[PovSetter_Agent new saveBitmapPOV: aPOV intoClass: aClass symbol: aSymbol]
								ifFalse:
									[PovSetter_Agent new saveVectorialPOV: aPOV intoClass: aClass symbol:
											aSymbol]]]]
initialize-release
imageOS
	
	^imageOS
		ifNil:
			[imageOS := EntityPOVView new
				model:
					(VectorialElementaryPOV
						new:
							(Rectangle
								origin: 0 @ 0
								extent: 87 @ 87) asPolyline)]
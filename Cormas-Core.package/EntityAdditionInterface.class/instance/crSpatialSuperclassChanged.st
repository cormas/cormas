changed
crSpatialSuperclassChanged
	
	(self builder notNil and: [self builder window isActive])
		ifTrue:
			[self builder window
				label:
					'Create a kind of '
						,
							(self spatialEntitySuperclass value asString
								copyFrom: 14
								to: self spatialEntitySuperclass value asString size)]
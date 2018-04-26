initialize-release
openOn: aModel
	
	cormasModel := aModel.
	self prepareClasses ifNil: [^nil].
	self linkedSpaceInterface
		ifNotNil:
			[builder := self allButOpenInterface: #windowLocatedOnly.
			entityChoices value isEmpty
				ifFalse: [self entity setValue: entityChoices value first].
			builder window
				label:
					builder window label , ' >View '
						,
							(self linkedSpaceInterface view class allInstances
								indexOf: self linkedSpaceInterface view) printString.
			self linkedSpaceInterface manipInstancesController
				ifNil:
					[builder
						openAt:
							(Cormas
								originPointOfWindowExtent: builder window extent
								toPlaceOnSideOf: self linkedSpaceInterface builder window)]
				ifNotNil:
					[builder
						openAt:
							(Cormas
								originPointOfWindowExtent: builder window extent
								toPlaceOnSideOf: self linkedSpaceInterface builder window
								andBelow:
									self linkedSpaceInterface manipInstancesController builder window)]]
		ifNil:
			[builder := self allButOpenInterface: #windowSpec.
			self entity value: entityChoices value first.
			builder window open].
	self changeEntity
initialize-release
openOn: aModel
	
	cormasModel := aModel.
	self prepareClasses.
	builder := self allButOpenInterface: #windowSpec.
	entityChoices value isEmpty
		ifFalse: [self entity value: entityChoices value first].
	self linkedSpaceInterface
		ifNotNil:
			[builder window
				label:
					builder window label , ' >View '
						,
							(self linkedSpaceInterface view class allInstances
								indexOf: self linkedSpaceInterface view) printString.
			self linkedSpaceInterface createInstancesController
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
									self linkedSpaceInterface createInstancesController builder window)]]
		ifNil: [builder window open]
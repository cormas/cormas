adding-removing
loadFigureCompoundSpatialEntity: aCompoundEntityRef withComponents: componentsRef povSelector: selectorName andInfo: infoName
	
	| fig |
	fig := self
		addFigureForSpatialPov:
			(self model povOfCompoundSpatialEntity: aCompoundEntityRef withComponents:
					componentsRef forSelector: selectorName andInfo: infoName).
	selectorName = #nil
		ifTrue:
			[fig
				transparent;
				lineWidth: 3]
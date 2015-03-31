adding-removing
redisplayCompoundSpatialEntity: aCompoundEntityRef withComponents: componentsRef
	
	| oldPov selectorName infoName |
	oldPov := (self findRegisteredFigureFor: aCompoundEntityRef) model.
	selectorName := oldPov name.
	infoName := oldPov infoName.
	self removeEntity: aCompoundEntityRef.
	self loadFigureCompoundSpatialEntity: aCompoundEntityRef withComponents:
			componentsRef povSelector: selectorName andInfo: infoName
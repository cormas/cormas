initialisation
copyPovFrom: parentInterface
	
	self spaceModel: parentInterface spaceModel.
	self activeSpatialEntity: parentInterface activeSpatialEntity.
	delimiterSize := parentInterface delimiterSize copy.
	fillDico := parentInterface fillDico copy.
	povMethodDico := parentInterface povMethodDico copy.
	infoMethodDico := parentInterface infoMethodDico copy.
	isTimeTitleDisplayed := parentInterface isTimeTitleDisplayed.
	isTimeFieldDisplayed := parentInterface isTimeFieldDisplayed
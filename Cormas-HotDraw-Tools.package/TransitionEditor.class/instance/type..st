accessing
type: aType
	
	self eventType value: aType event.
	self transition value: aType class transition.
	self figureList selections: aType figureClasses.
	self conditionList selection: (Array with: true).
	self selectCharacters: aType characters
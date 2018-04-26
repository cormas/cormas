display
displayGrid
	"Resize the window firstly, to fit to the spaceModel, then display the grid with the default pov of the elementary spatialEntities.
	Called when 
	- a new instance of SpaceInterface is opened, or
	- the model is reinitialized"
	
	| povSelector |
	self resizeWindow.	"self drawing
		addFiguresForSpatialPovs: self spaceModel elementaryEntitiesDefaultPovs.  en fait ce n'est plus n√©cessaire car changePov s'en charge"	"refresh POV if necessary"
	povSelector := self povMethodDico
		at: self activeSpatialEntity name
		ifAbsent: [#nil].
	povSelector = #nil
		ifFalse:
			[self
				changePov: povSelector
				ofEntity: self activeSpatialEntity]
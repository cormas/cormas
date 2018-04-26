menu - actions
squared
	"model patchShape ~= #squared ifTrue: 
			[model patchShape: #squared.
			model nbNeighbours: #four.
			model createCells.
			model createCellsImages.
			model displayOn: model vue graphicsContext.
			model displayOn: model vue buffer graphicsContext.
			self shapeChanged]"
	
	
private - irregular polygons creation
loadMifMid: fileName entity: class neighbourhood: test
	"Load a mif and associated mif files. Calculus the neighbourhood calculus of each cell, if 'test' is required"
	
	self readMif: fileName entity: class.	"set the bounds of the grid. The result is stored into 'bound' class variable of Cell"
	(self spatialEntities at: class name)
		do:
			[:b | 
			b outline
				do:
					[:aPoint | 
					b bounds origin: (b bounds origin min: aPoint).
					b bounds corner: (b bounds corner max: aPoint)]].	"self updateIncludedEntities: (self spatialEntities at: class name)"
	(self spatialEntities at: class name) isEmpty
		ifFalse:
			[self readMid: fileName entity: class.
			self setBounds: (self spatialEntities at: class name).
			test
				ifTrue:
					[self voisinsPolygonesNoeuds: (self spatialEntities at: class name)].
			self vues do: [:aView | aView createImagesForSpatialEntity22: class]]
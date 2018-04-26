menu actions
delimiter: aInteger
	
	delimiter := aInteger.
	(self figuresOfEntity: self model activeSpatialEntity)
		do: [:aFig | aFig lineWidth: aInteger]
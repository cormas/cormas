private - init
release: aClass
	
	super release.
	(self spatialEntities at: aClass name) do: [:e | e spaceModel: nil]
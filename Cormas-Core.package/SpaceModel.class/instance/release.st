ESE initialize-release
release
	
	self dependents
		do:
			[:spv | 
			spv closeAndUnschedule.
			spv release].
	super release	"	self spatialEntities notNil ifTrue: [self spatialEntities do: [:aCollec | aCollec do: [:e | e release]]]"	"-> Mis en commantaire car les entit√©s n''ont plus de dependents'"
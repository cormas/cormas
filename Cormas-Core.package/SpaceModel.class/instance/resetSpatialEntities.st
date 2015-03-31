private - init
resetSpatialEntities
	
	| newColl |
	self spatialEntities: Dictionary new.
	self cormasModelClass spatialClasses
		do:
			[:aSpatialClass | 
			newColl := self cormasModel initializeTheEntity: aSpatialClass.
			self spatialEntities
				at: aSpatialClass name
				put: newColl].
	self changed: #removeAllFigures	"all the figures of the spaceInterfaces have to be deleted"
opening
openSpaceInterface
	"open a SpaceInterface on remoteSpaceModel"
	
	self elementaryEntitiesDefaultPovs isEmpty
		ifTrue:
			[self
				createCellsPovWithReferences:
					(EntityReference onEntities: self elementaryEntities)].
	^SpaceInterface openAndDisplay: self
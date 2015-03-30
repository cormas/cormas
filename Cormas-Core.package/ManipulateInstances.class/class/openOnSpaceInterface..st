instance creation
openOnSpaceInterface: aSpaceInterface
	
	| aWin |
	aWin := super new.
	aSpaceInterface manipInstancesController: aWin.
	aWin linkedSpaceInterface: aSpaceInterface.
	aWin openOn: aSpaceInterface cormasModel.
	aWin targetEntities value: #allEntities.
	aWin toBePerformed value: #inspect.
	aSpaceInterface drawing selections isEmpty
		ifFalse:
			[aSpaceInterface
				updateEntitiesSelectionWith: aSpaceInterface drawing selections
				lastFigureSelected: aSpaceInterface drawing selections last]
announcement handling
dragEnd: ann

	| potentialCells situatedEntity potentialCellViews|
	ann element translateTo: ghost position.
	potentialCellViews := ann element view elements asOrderedCollection select: [:e |
	((e ~= ann element) and: [ e trachelShape encompassingRectangle intersects: ghost trachelShape encompassingRectangle])].
	potentialCells := potentialCellViews asOrderedCollection collect: [:pcv | pcv model ].
	potentialCells := potentialCells select: [:mods | (mods class ~= self class) and: [ mods class isSpatialEntityElementClass]].
	situatedEntity := ann element model.
	(CMAgent allSubclasses contains: [:cmc | cmc =  situatedEntity class]) ifTrue: [
		situatedEntity moveTo: (Cormas selectRandomlyFrom: potentialCells) ]
	ifFalse: [ situatedEntity isMovedTo: (Cormas selectRandomlyFrom: potentialCells) ].
	ghost remove.
	ghost := nil.
	ann element view signalUpdate.

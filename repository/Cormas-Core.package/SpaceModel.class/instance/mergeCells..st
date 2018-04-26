private - regular cells - instance creation
mergeCells: listOfCells
	"Merge the cells of  listOfCells in one cell. The id of the new cell = the id of the first cell. Set the neighbours of the new cell and the new shape. The other cells are removed."
	
	| newCell neighbours componentsPovs anEntityPOV minID newEntities |
	listOfCells size < 2 ifTrue: [^nil].
	newCell := listOfCells first.	"set the edge of newCell"
	self boundaries = #torroidal
		ifFalse: [listOfCells do: [:p | p edge ifTrue: [newCell edge: true]]].	"set the neighbours of newCell"
	neighbours := OrderedCollection new.
	listOfCells do: [:c | neighbours addAll: c neighbourhood].
	listOfCells do: [:c | neighbours remove: c ifAbsent: nil].
	newCell neighbourhood: neighbours asOrderedCollection.	"agg := self basicCreateAggregate: SpatialEntityAggregate from: listOfCells."	"set the POV of newCell"
	componentsPovs := OrderedCollection new.
	listOfCells
		do:
			[:c | componentsPovs add: (self elementaryEntitiesDefaultPovs at: c id)].
	anEntityPOV := VectorialCompositePOV newFrom: componentsPovs.
	anEntityPOV entityReference: (EntityReference on: newCell).
	self elementaryEntitiesDefaultPovs
		at: newCell id
		put: anEntityPOV.	"remove the other cells"
	listOfCells removeFirst.
	componentsPovs removeFirst.
	self elementaryEntitiesDefaultPovs removeAll: componentsPovs.
	self elementaryEntities: self elementaryEntities asOrderedCollection.
	listOfCells do: [:c | self elementaryEntities remove: c ifAbsent: nil].
	listOfCells
		do:
			[:c | 
			c destroyed: true.
			self cormasModel
				registerEntityChange: #removeEntity
				from: (EntityReference on: c)].	"MAJ des cells voisines"
	neighbours
		do:
			[:c | 
			c neighbourhood: c neighbourhood asOrderedCollection.
			c neighbourhood removeAllSuchThat: [:n | listOfCells includes: n].
			(c neighbourhood includes: newCell)
				ifFalse: [c neighbourhood add: newCell]].	"Reparation des IDs"
	minID := newCell id.
	listOfCells do: [:c | c id < minID ifTrue: [minID := c id]].
	newCell id: minID.
	newEntities := self elementaryEntities
		asSortedCollection: [:a :b | a id < b id].
	1
		to: newEntities size
		do: [:i | (newEntities at: i) id: i].
	newCell class CurrentId: newEntities size.
	gridCellShape := #irregular.	"newCells notification also dispatch the request to remoteSpaceModels to rebuild the cell figures"
	self
		sendCellsToClientSpaceModels:
			(EntityReference onEntities: self elementaryEntities)	"dispatch the info that cells have been modifyed to all opened spaceInterfaces"	"self changed: #newCells"
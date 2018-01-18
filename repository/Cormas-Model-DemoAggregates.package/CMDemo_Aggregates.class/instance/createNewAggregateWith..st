procedures
createNewAggregateWith: setCell

	| fe |

	fe := CMFragmentedForest newWith: setCell.
	fe id: CMFragmentedForest CurrentId.
	fe components: OrderedCollection new.
	fe components addAll: setCell.
	setCell do: [ : c | c theCSE at: #CMFragmentedForest put: fe ].
	(self spaceModel spatialEntities at: #CMFragmentedForest) add: fe.
	fe spaceModel: self spaceModel.
	self theFragmentedForests add: fe.
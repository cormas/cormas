initialize-release
prepareClasses
	
	| modelClasses |
	modelClasses := OrderedCollection new.
	modelClasses add: cormasModel cellClass name.
	modelClasses
		addAll: (cormasModel compoundSpatialClasses collect: [:cl | cl name]).
	modelClasses
		addAll:
			((cormasModel socialClasses select: [:cl | cl isSituatedClass])
				collect: [:cl | cl name]).
	modelClasses
		addAll:
			((cormasModel passiveObjectClasses select: [:cl | cl isSituatedClass])
				collect: [:cl | cl name]).
	majorKeys := SelectionInList with: modelClasses.	"asSortedCollection"
	majorKeys selectionIndexHolder onChangeSend: #changedExample to: self
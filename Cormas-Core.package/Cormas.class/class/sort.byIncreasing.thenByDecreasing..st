+ utilities - collection
sort: collec byIncreasing: att1 thenByDecreasing: att2
	"Purpose: Sort a collection of objects (entities) that have the same attributes att1 and att2, first according to an increasing order of att1, then according to an decreasing value of att2.
Arguments: collec is the collection to be sorted. at1 and aat2 are the names (in symbol) of the attributes
Example: Cormas sort: (self theTrees) byIncreasing: #age thenByDecreasing: #height"
	
	| oc temp tutu |
	oc := OrderedCollection new.
	temp := (collec
		asSortedCollection: [:i :j | (i perform: att1) < (j perform: att1)])
		asOrderedCollection.
	[temp isEmpty]
		whileFalse:
			[tutu := temp select: [:i | (temp first perform: att1) = (i perform: att1)].
			oc
				addAllLast:
					(tutu asSortedCollection: [:i :j | (i perform: att2) > (j perform: att2)]).
			temp removeAll: tutu].
	^oc
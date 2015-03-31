landscape indices
shannon: attribute
	"Answer the Shannon index of the attribute of SpatialEntity suchThat:
    Ha = - SumOf [ occuranceOf(attribut) . ln(occuranceOf(attribut)) ] 
    attribute = <Symbol>"
	
	| cells totCells sum pi setOfValues |
	cells := self cormasModel theESE asArray.	"pour optimisation"
	totCells := cells size.
	totCells = 0 ifTrue: [^0].
	sum := 0.
	setOfValues := (cells collect: [:a | a perform: attribute]) asSet.
	setOfValues
		do:
			[:val | 
			pi := (cells select: [:c | (c perform: attribute) = val]) size / totCells.
			sum := sum + (pi * pi ln)].
	^sum negated
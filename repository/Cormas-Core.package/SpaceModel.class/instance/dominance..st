landscape indices
dominance: attribute
	"Compute dominance according to the attribute"

	| numberCells sum n pi classes |
	numberCells := self line * self column.
	sum := 0.
	classes := (self cormasModel theESE collect: [ :a | a perform: attribute ]) asSet.
	n := classes size.
	classes
		do: [ :i | 
			pi := (self cormasModel theESE select: [ :a | (a perform: attribute) = i ]) size
				/ numberCells.
			sum := sum + (pi * pi ln) ].
	^ n ln + sum
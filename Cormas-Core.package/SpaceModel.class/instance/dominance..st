landscape indices
dominance: attribute
	"return the data (a number) to be recorded"
	
	| totCells sum n pi classes |
	totCells := self line * self column.
	sum := 0.
	classes := (self cormasModel theESE collect: [:a | a perform: attribute])
		asSet.
	n := classes size.
	classes
		do:
			[:i | 
			pi := (self cormasModel theESE select: [:a | (a perform: attribute) = i])
				size / totCells.
			sum := sum + (pi * pi ln)].
	^n ln + sum
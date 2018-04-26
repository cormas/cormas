landscape indices
nClasses: anAttribute
	"Return the number of different values for anAttribute"

	^ (self cormasModel theESE collect: [ :a | a perform: anAttribute ]) asSet size
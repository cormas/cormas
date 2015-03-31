landscape indices
nClasses: anAttribute
	"return the data (a number) to be recorded"
	
	^(self cormasModel theESE collect: [:a | a perform: anAttribute]) asSet
		size
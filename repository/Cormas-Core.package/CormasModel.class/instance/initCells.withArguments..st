deprecated
initCells: initSelector withArguments: argumentCollection
	"The method initSelector <Symbol> with the arguments : argumentCollection, is send to each Cell instance"
	
	| cellClass |
	cellClass := self class cellClass ifNil: [^nil].
	cellClass CurrentId: 0.
	(self theEntities: cellClass)
		do:
			[:ese | 
			ese reset.
			ese perform: initSelector withArguments: argumentCollection]
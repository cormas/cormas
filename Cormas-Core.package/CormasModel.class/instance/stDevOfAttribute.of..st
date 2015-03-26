+ utilities - population metrics
stDevOfAttribute: att of: aCollecOrClass
	"Purpose: returns the standard Deviation  of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self stDevOfAttribute: #age of: Person
			 self stDevOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		standardDeviation:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
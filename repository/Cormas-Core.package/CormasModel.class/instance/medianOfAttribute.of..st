+ utilities - population metrics
medianOfAttribute: att of: aCollecOrClass
	"Purpose: returns the median of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self medianOfAttribute: #age of: Person
			 self medianOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		median:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
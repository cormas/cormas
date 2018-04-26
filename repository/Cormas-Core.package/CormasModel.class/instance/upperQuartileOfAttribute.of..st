+ utilities - population metrics
upperQuartileOfAttribute: att of: aCollecOrClass
	"Purpose: returns the upper quartile of the values of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self upperQuartileOfAttribute: #age of: Person
			 self upperQuartileOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		upperQuartile:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
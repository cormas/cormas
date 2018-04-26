+ utilities - population metrics
lowerQuartileOfAttribute: att of: aCollecOrClass
	"Purpose: returns the lower quartile of the values of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self lowerQuartileOfAttribute: #age of: Person
			 self lowerQuartileOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		lowerQuartile:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
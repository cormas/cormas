+ utilities - population metrics
varianceOfAttribute: att of: aCollecOrClass
	"Purpose: returns the variance of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self varianceOfAttribute: #age of: Person
			 self varianceOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		variance:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
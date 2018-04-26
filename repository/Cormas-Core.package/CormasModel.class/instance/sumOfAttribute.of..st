+ utilities - population metrics
sumOfAttribute: att of: aCollecOrClass
	"Purpose: returns the sum of values of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self sumOfAttribute: #age of: Person
			 self sumOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		sum:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
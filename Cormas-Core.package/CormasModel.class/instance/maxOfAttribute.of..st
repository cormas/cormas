+ utilities - population metrics
maxOfAttribute: att of: aCollecOrClass
	"Purpose: returns the max value of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self maxOfAttribute: #age of: Person
			 self maxOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		max:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
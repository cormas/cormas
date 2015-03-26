+ utilities - population metrics
minOfAttribute: att of: aCollecOrClass
	"Purpose: returns the min value of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self minOfAttribute: #age of: Person
			 self minOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		min:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
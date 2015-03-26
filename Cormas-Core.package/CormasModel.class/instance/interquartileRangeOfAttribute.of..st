+ utilities - population metrics
interquartileRangeOfAttribute: att of: aCollecOrClass
	"Purpose: returns the interquartile range of teh values of an attribute for a collection of entities (aCollecOrClass)
Argument: aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
Examples: self interquartileRangeOfAttribute: #age of: Person
			 self interquartileRangeOfAttribute: #age of: (self theBirds)"
	
	^Cormas
		interquartileRange:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
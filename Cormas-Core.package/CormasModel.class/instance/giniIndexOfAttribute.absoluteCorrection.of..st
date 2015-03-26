+ utilities - population metrics
giniIndexOfAttribute: att absoluteCorrection: aNumber of: aCollecOrClass
	"Purpose: Returns the gini for an attribute (which can include negative values) on a collection of entities (aCollecOrClass) 
See the 'giniIndexOfAttribute:of: method for more details on Gini index.
As the calculation of the Gini index requieres that individuals cannot have a negative value for the assessed attribute, and in  case the attribute you want to assess has negative values, the following method operates a translation of the attribute value.
Enter in the absoluteCorrection argument an amount equals or higher to the minimum negative value that your attribute may take.
Beware that this translation affects the absolute value of the Gini index.
(e.g. the Gini index calculated with an ''absoluteCorrection'' value of 1000 will not be the same than one calculated with a  ''absoluteCorrection'' value of 5000).
Arguments:
- aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
- att is the name of the attribute <aSymbol> Negative value are accepted .
- aNumber is a number
Examples: self giniIndexOfAttribute: #accountBalance absoluteCorrection: 5000 of: Person"
	
	^Cormas
		giniIndexOf:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
		absoluteCorrection: aNumber
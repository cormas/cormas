+ utilities - population metrics
giniIndexOfAttribute: att of: aCollecOrClass
	"Purpose: Returns the gini for an attribute on a collection of entities (aCollecOrClass)
The Gini coefficient is a number between 0 and 1, where 0 corresponds with perfect equality (where everyone has the same income) and 1 corresponds with perfect inequality (where one person has all the income, and everyone else has zero income). The Gini index is the Gini coefficient expressed in percentage form, and is equal to the Gini coefficient multiplied by 100.
Arguments:
- aCollecOrClass can be a collection of entities or the name of class, in which case all the entities of that class (including subclasses entities) will be included in the collection
- att is the name of the attribute <aSymbol> Negative values for that attribute are not allowed.
Examples: self giniIndexOfAttribute: #money of: Person
			 self giniIndexOfAttribute: #money of: (self thePersons select: [:p| p age between: 30 and:55)]

More: The Gini coefficient is a measure of inequality developed by the Italian statistician Corrado Gini and published in 1912.
It is a commonly used coefficient to measure income inequality in a society by institutions such as the World Bank and others.
While the Gini coefficient is mostly used to measure income inequality, it can also be used to measure other types of inequality.
For more details on the calculation and use of the Gini coefficient and index see http://en.wikipedia.org/wiki/Gini_coefficient"
	
	^Cormas
		giniIndexOf:
			((self allTheEntitiesOfClassOrCollec: aCollecOrClass) asOrderedCollection
				collect: [:e | e perform: att])
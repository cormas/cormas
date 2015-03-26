+ utilities - space metrics
shannon: anAttribute
	"Purpose : Returns the Shannon index of the attribute of SpatialEntity suchThat:
Ha = - SumOf [ occuranceOf(attribut) . ln(occuranceOf(attribut)) ] 
Argument: anAttribute  <Symbol> is the name of the attribute
Example: self shannon: #state"
	
	^self spaceModel shannon: anAttribute
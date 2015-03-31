setParameters
getDefaultParametersValues
	"get the defaultParameters, just selecting attributes of number type..
	defaultParameters is an OrderedCollection containing OrderedCollections as following : 
	( index-i : Class ; attributName asSymbol ; defaultValue ) 
	( index-i : Class ; attributName asSymbol ; defaultValue ) ..."
	
	^super getDefaultParametersValues
		select: [:aTriColl | aTriColl last respondsToArithmetic]
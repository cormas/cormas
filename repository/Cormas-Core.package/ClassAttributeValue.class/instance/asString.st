access as String
asString
	"Ex: 'Predator_energy: 12'  "
	
	^self classNameAsString , '_' , self attributeAsString , ': '
		, self currentValueAsString
private-buttons list
adaptButton: newButtonSpec toRepresent: attributeItem
	"Given aSpec and a prototype spec create a new spec for a 
	button containing proper label and model. Add 
	visual to the dictionary in builder."
	
	| sName iconName index |
	sName := attributeItem name.
	iconName := (sName , 'Icon') asSymbol.
	index := self attribute_List list indexOf: attributeItem.
	newButtonSpec model: ('attButton' , index printString) asSymbol.
	builder
		visualAt: iconName
		put: attributeItem buttonImage.
	newButtonSpec label: iconName	"	builder aspectAt: sName put: (self adaptorFor: aSpec value fullName)"
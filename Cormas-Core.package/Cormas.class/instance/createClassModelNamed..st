model entities
createClassModelNamed: aName
	"Create the NameSpace of the new model and its category then create the class of this model"
	
	| classBuilder nameSpace |
	nameSpace := self createSubModelsNameSpace: aName.
	classBuilder := ClassBuilder new.
	classBuilder
		environment: nameSpace;
		beFixed;
		superclass: CormasModel;
		className: aName asSymbol;
		instVarString: '';
		category: aName , 'Category'.
	^classBuilder reviseSystemSilently
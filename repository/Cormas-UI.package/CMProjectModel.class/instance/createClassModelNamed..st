accessing
createClassModelNamed: modelName
	" Generate a new class named modelName. Answer the new generated <Class> "
	
	| validClassName |
	
	validClassName := self validateCormasModelName: modelName.
	self codeGenerator 
		targetClassCategory: validClassName , 'Category';
		targetClass: validClassName;
		generateClassNamed: validClassName 
		superclass: CormasModel.
	self codeGenerator generateMethods.
	^ Smalltalk at: validClassName asSymbol
instance creation
newFromPreviousSetter: anAttributeSetter
	
	| inst |
	inst := self new.
	inst cormasModel: anAttributeSetter cormasModel.
	inst allAttributsList: anAttributeSetter allAttributsList.
	inst init.
	^inst
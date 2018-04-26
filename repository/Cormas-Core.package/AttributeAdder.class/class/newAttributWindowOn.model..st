instance creation
newAttributWindowOn: aClass model: cormasModel
	
	| inst |
	inst := self new.
	inst cormasModel: cormasModel.
	inst initForClass: aClass.
	^inst
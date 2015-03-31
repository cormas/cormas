instance creation
newOnClass: aClass
	
	| inst |
	inst := self new.
	inst setModelClass: aClass.
	^inst
instance creation
newOn: aCormasModelInstance
	
	| inst |
	inst := self new.
	inst cormasModel: aCormasModelInstance.
	inst init.
	^inst
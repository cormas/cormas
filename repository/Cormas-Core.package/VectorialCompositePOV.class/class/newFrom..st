instance creation
newFrom: aSetOfPovs
	
	| inst |
	inst := self new.
	inst addAll: aSetOfPovs.
	inst setDelimitors.
	^inst
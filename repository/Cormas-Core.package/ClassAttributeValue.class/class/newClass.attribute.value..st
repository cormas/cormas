new
newClass: aClass attribute: attributeSymbol value: value
	
	| inst |
	inst := self new.
	inst setClass: aClass attribut: attributeSymbol value: value.
	^inst
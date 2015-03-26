view creation
openOn: anObject attributesSpec: aDico
	
	| aInspector |
	aInspector := self new.
	aInspector attributesSpec: aDico.
	^self open: (aInspector inspect: anObject)
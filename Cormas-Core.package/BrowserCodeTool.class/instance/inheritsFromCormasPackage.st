menu
inheritsFromCormasPackage
	
	| aClass |
	aClass := self selectedClass.
	^(aClass inheritsFrom: CormasEntity) or: [aClass inheritsFrom: CormasModelOld]
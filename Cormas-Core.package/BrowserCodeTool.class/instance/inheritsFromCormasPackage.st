menu
inheritsFromCormasPackage
	
	| aClass |
	aClass := self selectedClass.
	^(aClass inheritsFrom: Entity) or: [aClass inheritsFrom: CormasModelOld]
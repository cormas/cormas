menu
inheritsFromCormasPackage
	
	| aClass |
	aClass := self selectedClass.
	^(aClass inheritsFrom: CMEntity) or: [aClass inheritsFrom: CormasModelOld]
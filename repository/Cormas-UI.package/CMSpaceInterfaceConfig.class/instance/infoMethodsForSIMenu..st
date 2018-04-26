overwrite spaceInterface
infoMethodsForSIMenu: aClass
	
	| infoList |
	infoList := (self infoMethodsFor: aClass) copy.
	infoList addFirst: #nil.
	^infoList
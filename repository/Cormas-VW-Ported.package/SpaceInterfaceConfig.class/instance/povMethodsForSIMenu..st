overwrite spaceInterface
povMethodsForSIMenu: aClass
	
	| povList |
	povList := (self povMethodsFor: aClass) copy.
	povList addFirst: #nil.
	^povList
menu
addEntityMethodsToMenuBuilder: mb
	
	| classes mb2 |
	mb beginSubMenuLabeled: 'Entity methods'.
	classes := (self selectedClass superClassesUntil: CMEntity)
		select: [:aClass | aClass environment fullName = 'CormasNS.Kernel'].
	mb2 := self addPublicMethodsOfClasses: classes toMenuBuilder: mb
		withSuffix: 'self'.
	mb2 endSubMenu.
	^mb2
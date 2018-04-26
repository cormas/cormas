menu
addModelClassMethodsToMenuBuilder: mb
	
	| classes mb2 |
	mb beginSubMenuLabeled: 'Class methods'.
	classes := Array with: CormasModelOld class.
	mb2 := self addPublicMethodsOfClasses: classes toMenuBuilder: mb
		withSuffix: 'self class'.
	mb2 endSubMenu.
	^mb2
menu
addModelMethodsToMenuBuilder: mb
	
	| classes mb2 |
	mb beginSubMenuLabeled: 'Model methods'.
	classes := Array with: CormasModel.
	mb2 := self addPublicMethodsOfClasses: classes toMenuBuilder: mb
		withSuffix: 'self'.
	mb2 endSubMenu.
	^mb2
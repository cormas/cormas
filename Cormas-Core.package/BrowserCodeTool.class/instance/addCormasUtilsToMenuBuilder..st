menu
addCormasUtilsToMenuBuilder: mb
	
	| classes mb2 |
	mb beginSubMenuLabeled: 'Cormas Utils'.
	classes := Array with: CormasOld class.
	mb2 := self addPublicMethodsOfClasses: classes toMenuBuilder: mb
		withSuffix: #CormasOld.
	mb2 endSubMenu.
	^mb2
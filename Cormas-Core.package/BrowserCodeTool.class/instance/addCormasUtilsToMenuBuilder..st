menu
addCormasUtilsToMenuBuilder: mb
	
	| classes mb2 |
	mb beginSubMenuLabeled: 'Cormas Utils'.
	classes := Array with: Cormas class.
	mb2 := self addPublicMethodsOfClasses: classes toMenuBuilder: mb
		withSuffix: #Cormas.
	mb2 endSubMenu.
	^mb2
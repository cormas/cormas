menus-access
menuCellshape
	
	| menuModify |
	menuModify := self menuModify.
	^(menuModify atNameKey: #cellshape) submenu
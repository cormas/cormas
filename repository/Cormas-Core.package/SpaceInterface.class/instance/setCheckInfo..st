menu-info
setCheckInfo: unMenu
	
	| class |
	self cormasModel
		ifNotNil:
			[unMenu menuItems
				do:
					[:item | 
					class := item label class.
					item submenu menuItems
						do:
							[:subItem | 
							subItem label = (self infoMethodDicoAt: class) asString
								ifTrue: [subItem beOn]
								ifFalse: [subItem beOff]]]].
	^unMenu
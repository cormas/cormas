menu-pov
setCheck: unMenu
	
	| class |
	self cormasModel
		ifNotNil:
			[unMenu menuItems
				do:
					[:item | 
					class := self classFromSymbol: item label.
					item submenu menuItems
						do:
							[:subItem | 
							subItem label = (self povMethodDicoAt: class) asString
								ifTrue: [subItem beOn]
								ifFalse: [subItem beOff]]]].
	^unMenu
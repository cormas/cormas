changed
listEntitesPassivesChanged
	
	| menu |
	menu := self builder menuAt: #passiveEntityMenu.
	self listPassiveEntities selection isNil
		ifTrue: [menu menuItems do: [:i | i disable]]
		ifFalse: [menu menuItems do: [:i | i enable]]
changed
listAgentsChanged
	
	| menu |
	menu := self builder menuAt: #socialEntityMenu.
	self listSocialEntities selection isNil
		ifTrue: [menu menuItems do: [:i | i disable]]
		ifFalse: [menu menuItems do: [:i | i enable]]
accessing
initializeMenuCustom
	
	| mb tmp lesPdv menuUpdated |
	mb := MenuBuilder new.
	self model fonction msgObs isNil
		ifTrue: [mb line]
		ifFalse:
			[tmp := self model fonction msgObs asList.
			tmp
				do:
					[:i | 
					lesPdv := (i organization listAtCategoryNamed: #pov) asOrderedCollection.
					mb beginSubMenuLabeled: i name asString.
					lesPdv do: [:a | mb add: a -> (i name , '*' , a) asSymbol].
					mb endSubMenu].
			tmp isEmpty ifFalse: [mb line]].
	menuUpdated := self model setCheck: mb menu.
	self model vue controller menuHolder value isNil not
		ifTrue:
			[menuUpdated
				selectionMemory: self model vue controller menuHolder selectionMemory]
		ifFalse: [self model vue controller menuHolder: menuUpdated].
	^menuUpdated
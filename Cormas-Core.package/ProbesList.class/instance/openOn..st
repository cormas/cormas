action
openOn: aCormasModel
	
	| win initialList |
	self cormasModel: aCormasModel.
	initialList := List new.
	initialList addFirst: 'Global'.
	initialList add: '---'.
	initialList
		addAll:
			(self cormasModel allClasses collect: [:c | c name asString])
				asSortedCollection.
	self listEntities list: initialList.
	self listEntities selectionIndexHolder onChangeSend: #listEntitiesChanged
		to: self.
	self listProbes selectionIndexHolder onChangeSend: #listProbesChanged to:
			self.
	self menuHolder: self class menuListProbes asValue.
	win := (self allButOpenInterface: #windowSpec) window.
	win openIn: (10 @ 20 extent: win minimumSize)
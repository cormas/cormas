menu
addUndefinedMethodItem
	
	<itemInMenu: #(#mainMenu) position: 20.01>
	^(MenuItem labeled: #AddMethod >> 'Add Method' << #browser)
		value: [self addUndefinedMethod];
		visible: [self findPotentialMNU notNil]
menu
renameInstanceVariableMenuItem
	
	<itemInMenu: #(#mainMenu #refactorMenu) position: 10>
	^(MenuItem
		labeled: #Re_nameVariableAsDots << #IDE >> 'Re&name Variable As...')
		visible: [self hasInstanceVariableSelected];
		value: #renameInstanceVariable;
		enablement: #hasInstanceVariableSelected;
		shortcutKeyCharacter: $N;
		shortcutModifiers: 3;
		yourself
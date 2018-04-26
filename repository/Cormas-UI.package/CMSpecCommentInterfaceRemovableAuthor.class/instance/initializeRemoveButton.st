initialization
initializeRemoveButton
	" Private - Set a remove button to remove the receiver from its owner "

	self removeButton
		label: '-';
		state: false;
		enabled: true;
		action: [ (self confirm: 'Are you sure you want to delete the selected author?')
				ifTrue: [ self owner remove: self ] ]
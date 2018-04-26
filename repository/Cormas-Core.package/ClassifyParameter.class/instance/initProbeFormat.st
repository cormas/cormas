initialize-release
initProbeFormat
	
	| initialList |
	initialList := List new.
	initialList
		add: 'last value';
		add: 'average per simulation';
		add: 'average on period...'.
	self probeFormat list: initialList.
	self probeFormat selectionIndexHolder value: (Set with: 1).
	probeFormat selectionIndexHolder onChangeSend: #changedProbeFormat to:
			self
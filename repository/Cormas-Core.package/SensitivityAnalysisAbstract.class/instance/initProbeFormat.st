initialize-release
initProbeFormat
	"	#rawLabel: 'all steps values' 
				#value: #allStepsValues ) 
			#(#{UI.MenuItem} 
				#rawLabel: 'simulation average' 
				#value: #simulationAverage ) 
			#(#{UI.MenuItem} 
				#rawLabel: 'average on periode...' 
				#value: #averageOnPeriode ) "
	
	| initialList |
	initialList := List new.
	initialList
		add: 'time series';
		add: 'last value';
		add: 'average per simulation';
		add: 'average on period...';
		add: 'averaged over repetitions'.
	self probeFormat list: initialList.
	self probeFormat selectionIndexHolder value: (Set with: 1).
	probeFormat selectionIndexHolder onChangeSend: #changedProbeFormat to:
			self
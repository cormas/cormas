menu
menuDisableSimulationGroup
	" Private - Disable all menu items within the Simulation group "

	{ 
		#tDisplayParams .
		#tSimInformation .
		#tSimpleStochAnalysis .
		#tOATSeqValues .
		#tOATPredefValues .
		#tMonteCarlo .
		#tClassifyByParams .
		#tCrossedSeqValues .
		#tCrossedPredefValues .
		#tStopRWebService 
	} do: [ : itemSel | self menuDisableItem: itemSel ]
menu
menuEnableSimulationGroup
	" Private - Enable all menu items within the Simulation group "

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
	} do: [ : itemSel | self menuEnableItem: itemSel ]

sensitivity
calculateSensitivity
	"formule: Sensib (prob.j) = ln(moy(prob_j.modif)) - ln (moy(prob_j.standard)) / ln (j.modif) - ln(J.stand).
dico : 'Dictionary (#vegetationBiomass->Dictionary (#Restrained_energy->0.171174 
												  #'Unrestrained class_harvestRate'->-0.0647275 
												  #''Restrained class_fertilityThreshold''->0.044081
												  #ECEC_unrestrainedInitialNumber->0.0131293 ... ) 
				#restrainedSize->Dictionary (#Restrained_energy->0.0 
											#''Unrestrained class_harvestRate''->0.0  ... ) 
				#unrestrainedSize->Dictionary (#Restrained_energy->0.0 
											   #''Unrestrained class_harvestRate''->0.0 ) )' "
	
	| dico |
	dico := Dictionary new.
	dataSaver probes keys
		do:
			[:key | 
			dico
				at: key
				put: (self sensitivityOfProbe: key)].
	self dataSaver saveSensitivityClassification: dico.
	^dico
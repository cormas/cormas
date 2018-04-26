sensitivity
sensitivityOfProbe: aProbeName
	"Answer a dictionary:
Dictionary (#Restrained_energy->0.171174 
		    #'Unrestrained class_harvestRate'->-0.0647275 
		   #'Restrained class_fertilityThreshold'->0.044081 
		  #ECEC_unrestrainedInitialNumber->0.0131293 
		  #'VegetationUnit class_K'->0.234738 
		  #'Restrained class_harvestRate'->0.0552551 
		  #'Unrestrained class_fertilityThreshold'->0.11595 
		  #Unrestrained_energy->0.0469096 
 		  #ECEC_restrainedInitialNumber->0.0949597 
		  #'VegetationUnit class_r'->0.814946 )

formule: Sensib (prob.j) = ln(moy(prob_j.modif)) - ln (moy(prob_j.standard)) / ln (j.modif) - ln(J.stand).
aProbeName = <Symbol>"
	
	| moyStandard dico |
	dico := Dictionary new.
	moyStandard := Cormas averageOf: (self getStandardDataOfProbe: aProbeName).
	self classAttribValueAnalysis_List list
		do:
			[:aCAV | 
			dico
				at: (aCAV classNameAsString , '_' , aCAV attributeAsString) asSymbol
				put:
					(self sensitivityOfProbe: aProbeName toParameter: aCAV standardAverage:
							moyStandard)].
	^dico
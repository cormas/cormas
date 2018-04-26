accessing
nbPts
	
	^nbPts ifNil: [cormasModel timeStep + 1]
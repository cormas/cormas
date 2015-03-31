adding-removing
addFiguresForOccupantPovsAndPatches: aCollectionOfPovAndPatch
	"Add the Figures of the Agents' POV.
Figures are adapted to my bounds and located on the center of the cell even if it is not loaded
returns the figures created"
	
	| aPov aPatchRef |
	^aCollectionOfPovAndPatch
		do:
			[:aPovAndPatch | 
			aPov := aPovAndPatch key.
			aPatchRef := aPovAndPatch value.
			self addFigureForOccupantPov: aPov on: aPatchRef]
adding-removing
addFiguresForArcPovsAndPatches: aCollectionOfPovAndPatch
	"Add the Figures of the Arc' POV."
	
	| aPov startPatchRef endPatchRef |
	^aCollectionOfPovAndPatch
		do:
			[:anArray | 
			aPov := anArray at: 1.
			startPatchRef := anArray at: 2.
			endPatchRef := anArray at: 3.
			self addFigureForArcPov: aPov start: startPatchRef end: endPatchRef]
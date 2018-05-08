examples
example1
	| aSim  aSpaceInterface listOf_RTElements aRefresh  squareShape aSpaceView aColorGradient |
	aSim := self initialize ; new.
	"enregistre les noms des 2 methodes pour initialiser et faire tourner le modele"
	aSim activeInit: #init ; activeControl: #step:.
	aSim initSimulation.
	aSpaceInterface := RTView new.
	squareShape := RTBox new size: 25. 
	"squareShape
		color: [ : aCell | 
			aCell biomass > 0.3
				ifTrue: [ Color green ]
				ifFalse: [Color red] ]."
		aColorGradient := RTMultiLinearColor new colors: (RTColorPalette sequential colors: 9 scheme: 'YlGnBu').
	squareShape color: (aColorGradient command: [ : aCell | aCell biomass / 10.0 ]).
		
	listOf_RTElements := squareShape elementsOn: aSim theCMECECVegetationUnitEPs.
	aSpaceInterface addAll: listOf_RTElements.
	aSpaceView := RTGridLayout new.
	aSpaceView
		gapSize: 0;
		lineItemsCount: aSim spaceModel line;
		on: aSpaceInterface elements.
	aSpaceInterface canvas camera focusOnCenterScaled.
	aRefresh := RTActiveAnimation new.
	aRefresh
		intervalInMilliseconds: 0;
		blockToExecute: [ aSim runStep.
			aSpaceInterface elements do: #updateShape ];
		inView: aSpaceInterface.
	aSpaceInterface openWithToolbar
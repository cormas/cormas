instance creation
openAndDisplayFigures: aSetOfFigures
	
	| interface parentInterface |
	interface := self new.
	parentInterface := aSetOfFigures first container model.
	interface copyPovFrom: parentInterface.
	interface targetPovs
		addAll:
			((aSetOfFigures select: [:fig | fig isTrackFigure not])
				collect: [:fig | fig model]).
	interface zoomInterfaceIsStatic: parentInterface zoomInterfaceIsStatic.
	interface openWithWindowMotionFromInitialFigures: aSetOfFigures.	"reglage des contours. Fait √† l'arrache..."
	interface drawing delimiter: parentInterface drawing delimiter.
	interface drawing delimiterColor: parentInterface drawing delimiterColor.
	Dev todo:
			'Code permettant de r√©cup√©rer la couleur et taille des d√©limiteurs des aggr√©gats
Le code a √©t√© mis en comentaire car √ßa plantait et que de toute fa√ßon il faut reprendre la fa√ßon de g√©rer la couleur et taille des d√©limiteurs des agg√©gats'.	"	(interface povMethodDico select: [:k | k = #delimitors]) keysAndValuesDo:[: k : povName| 
		|originCompFig compClass|  
		compClass := (interface activeSpatialEntity classFromSymbol: k). 
		originCompFig := parentInterface drawing components detect: [: cf| cf entityType =  compClass] ifNone: [nil].
		originCompFig isNil ifFalse:[
			(interface drawing  loadFiguresFrom: compClass povSelector: #nil) do: [:fig | fig transparent. fig lineWidth: originCompFig attributes lineWidth. fig lineColor: originCompFig attributes lineColor]]]."
	interface displayAllPovs.
	interface zoom.
	interface updateWindowName.
	^interface
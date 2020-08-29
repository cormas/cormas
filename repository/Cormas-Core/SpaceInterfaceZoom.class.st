Class {
	#name : #SpaceInterfaceZoom,
	#superclass : #SpaceInterface,
	#instVars : [
		'targetPovs'
	],
	#category : #'Cormas-Core-Space'
}

{ #category : #'instance creation' }
SpaceInterfaceZoom class >> openAndDisplayFigures: aSetOfFigures [
	| interface parentInterface |
	interface := self new.
	parentInterface := aSetOfFigures first container model.
	interface copyPovFrom: parentInterface.
	interface targetPovs
		addAll:
			((aSetOfFigures select: [ :fig | fig isTrackFigure not ])
				collect: [ :fig | fig model ]).
	interface
		zoomInterfaceIsStatic: parentInterface zoomInterfaceIsStatic.
	interface openWithWindowMotionFromInitialFigures: aSetOfFigures.	"reglage des contours. Fait √† l'arrache..."
	interface drawing delimiter: parentInterface drawing delimiter.
	interface drawing
		delimiterColor: parentInterface drawing delimiterColor.
	self flag:#TODO.
			"Code permettant de r√©cup√©rer la couleur et taille des d√©limiteurs des aggr√©gats
Le code a √©t√© mis en comentaire car √ßa plantait et que de toute fa√ßon il faut reprendre la fa√ßon de g√©rer la couleur et taille des d√©limiteurs des agg√©gats"
"	(interface povMethodDico select: [:k | k = #delimitors]) keysAndValuesDo:[: k : povName| 
		|originCompFig compClass|  
		compClass := (interface activeSpatialEntity classFromSymbol: k). 
		originCompFig := parentInterface drawing components detect: [: cf| cf entityType =  compClass] ifNone: [nil].
		originCompFig isNil ifFalse:[
			(interface drawing  loadFiguresFrom: compClass povSelector: #nil) do: [:fig | fig transparent. fig lineWidth: originCompFig attributes lineWidth. fig lineColor: originCompFig attributes lineColor]]]."
	interface displayAllPovs.
	interface zoom.
	interface updateWindowName.
	^ interface
]

{ #category : #'interface specs' }
SpaceInterfaceZoom class >> scrolledWindow [
	"Tools.UIPainter new openOnClass: self andSelector: #scrolledWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #space 
				#defaultString: 'space') 
			#min: #(Point 20 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 840 525 1182 868) 
			#flags: 4 
			#menu: #menuBar 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 28 0 0 1 0 1) 
				#flags: 11 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 4915 4915 4915)) 
				#component: #drawing) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 0 0 0 1 28 0) 
				#flags: 0 
				#component: #toolbar) #(CompositeSpecCollection 
				#collection: #(#(InputFieldSpec 
					#layout: #(LayoutSizedOrigin 40 0 1 0 48 21) 
					#name: #timeUnitName 
					#flags: 0 
					#isOpaque: true 
					#model: #timeUnitName 
					#isReadOnly: true) #(InputFieldSpec 
					#layout: #(LayoutFrame 0 0 0 0 41 0 22 0) 
					#name: #timeField 
					#model: #timeField 
					#isReadOnly: true 
					#type: #number 
					#formatString: '0')) 
				#compositeSpec: #(CompositeSpec 
					#layout: #(LayoutSizedOrigin -90 1.0 3 0.0 88 22) 
					#name: #Composite1)))))
]

{ #category : #'interface specs' }
SpaceInterfaceZoom class >> staticWindow [
	
	^self windowSpec
]

{ #category : #'drawing description' }
SpaceInterfaceZoom >> drawingClass [
	"What type of drawing should we create?"
	
	^SpaceViewZoom
]

{ #category : #'interface opening' }
SpaceInterfaceZoom >> openWithWindowMotionFromInitialFigures: aSetOfFigures [
	
	| win hauteur ratio largeur origine etendue winType aRectangle bdr |
	self zoomInterfaceIsStatic
		ifTrue: [winType := #staticWindow]
		ifFalse: [winType := #scrolledWindow].	"Calculus of the SpaceView dimensions"
	aRectangle := aSetOfFigures first bounds.
	aSetOfFigures do: [:fig | aRectangle := aRectangle merge: fig bounds].
	hauteur := (Screen default bounds height min: Screen default bounds width)
		/ 2.
	largeur := hauteur.
	ratio := aRectangle extent
		/ (aRectangle extent x min: aRectangle extent y).	"(61/23)@1"
	etendue := (largeur / ratio y) @ (hauteur / ratio x).
	origine := (Screen default bounds center x - (etendue / 2) x) @ 0.	"un degrad√© wunderbach"
	Screen default
		zoom:
			(aRectangle
				translatedBy:
					aSetOfFigures first container model spatialGridArea origin)
		to: (origine extent: etendue)
		duration: 200.	"First opening of the interface"
	bdr := self allButOpenInterface: winType.
	win := bdr window.
	win openIn: (origine extent: etendue).	"SpaceInterface adds decoration + menu + Tools bar. If interface is very thin, the menu may be of 2 or 3 lines. So we have to adapt the window size after opening the interface"
	self resizeWindow: win toOrigine: origine extent: etendue.	"	windowExtraHeight := 52.
	etendue x < largeur ifTrue:[ ((etendue x / etendue y) <  (246 / 525)) ifTrue:[ ((etendue x / etendue y) <  (144 / 525)) ifFalse:[windowExtraHeight := 80] ifTrue:[windowExtraHeight := 152]]].
	etendue x < 105 ifTrue:[windowExtraHeight := Screen default bounds height min: (windowExtraHeight + (5*(105 - etendue x)))].
	etendue := ((etendue x) @ (etendue y + windowExtraHeight))."	"windowExtraHeight :=(LookPreferences edgeDecorationPolicy markerThickness) + (win component components first bounds extent y) + ((win component components last component components at: 1) component bounds extent y)."	"	windowExtraHeight := win height - ((win component components last component components at: 1) component bounds extent y).
	win displayBox: ((origine + LookPreferences edgeDecorationPolicy markerThickness) rounded extent: (etendue + (1@(windowExtraHeight + LookPreferences edgeDecorationPolicy markerThickness)))rounded)."
	self setMenuHolder
]

{ #category : #'interface opening' }
SpaceInterfaceZoom >> open_old [
	
	| bdr win hauteurOpt ratio largeurOpt origine etendue winType |
	self halt.
	self zoomInterfaceIsStatic
		ifTrue: [winType := #staticWindow]
		ifFalse: [winType := #scrolledWindow].
	bdr := self allButOpenInterface: winType.
	win := bdr window.
	hauteurOpt := Screen default bounds height / 2.
	ratio := self spaceModel absoluteBounds extent
		/
			(self spaceModel absoluteBounds extent x
				min: self spaceModel absoluteBounds extent y).	"(61/23)@1"
	largeurOpt := Screen default bounds width min: hauteurOpt.
	origine := Screen default bounds center.
	etendue := (largeurOpt / ratio y) @ ((85 + hauteurOpt) / ratio x).	"85 =~ la hauteur de la fenetre avec les Tools, menu et cadre"
	win openIn: (origine extent: etendue).
	self setMenuHolder
]

{ #category : #'menu - actions' }
SpaceInterfaceZoom >> reopen [
	"Open a new spatial grid with same properties"
	
	^self reopenFrom: self
]

{ #category : #'menu - actions' }
SpaceInterfaceZoom >> reopenFrom: parentInterface [
	"Open a new spatial grid with same properties than parentInterface"
	
	| interface |
	"interface := self copy open. √ßa se serait la solution id√©ale mais il reste des pbs de dependents et de drawing selections √† r√©gler..."
	interface := self class
		openAndDisplayFigures: parentInterface drawing displayedFigures.
	^interface
]

{ #category : #'interface opening' }
SpaceInterfaceZoom >> resizeWindow [
	"Resize the SpaceInterface window to fit the spaceModel configuration."
	"	| hauteur largeur origine etendue ratio aSetOfFigures aRectangle |

	aSetOfFigures := self targetPovs collect:[: pov | pov outline].
	aRectangle := aSetOfFigures first bounds.
	aSetOfFigures do: [:fig | aRectangle := aRectangle merge: fig bounds].
	hauteur := (Screen default bounds height min: (Screen default bounds width)) / 2.
	largeur := hauteur.
	ratio := aRectangle extent /
			(aRectangle extent x min: aRectangle extent y).
	etendue := (largeur / ratio y) @ (hauteur / ratio x).
	origine := (Screen default bounds center x - (etendue / 2) x) @ 0.
	self resizeWindow: self builder window toOrigine: origine extent: etendue."
	
	
]

{ #category : #'drawing description' }
SpaceInterfaceZoom >> setBasicTitle [
	"Set the title of the grid window"
	
	| pov |
	pov := self activeSpatialEntity name asString , ' -> '
		, (self povMethodDicoAt: self activeSpatialEntity) asString.
	basicTitle := 'Zoom ' , pov
]

{ #category : #display }
SpaceInterfaceZoom >> setBounds [
	
	self drawing
		bounds:
			(Rectangle
				origin: 10 @ 10
				corner: 200 @ 200)
]

{ #category : #accessing }
SpaceInterfaceZoom >> targetPovs [
	
	^targetPovs ifNil: [targetPovs := OrderedCollection new]
]

{ #category : #accessing }
SpaceInterfaceZoom >> targetPovs: aCollecOfPovs [
	
	targetPovs := aCollecOfPovs
]

{ #category : #zooming }
SpaceInterfaceZoom >> zoom [
	"Change the bounds of the spaceView components in order to fit the bounds of the targetsPov"
	
	self drawing zoomTo: self targetPovs
]

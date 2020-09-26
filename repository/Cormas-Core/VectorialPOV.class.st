Class {
	#name : #VectorialPOV,
	#superclass : #EntityPOV,
	#instVars : [
		'outline',
		'internalLines',
		'nbSegments',
		'isStroked',
		'color',
		'lineColor',
		'lineWidth',
		'position',
		'isDistortable'
	],
	#category : #'Cormas-Core-Interface'
}

{ #category : #viewCorrespondance }
VectorialPOV class >> asFigure [
	"^SpatialEntityFigure"
	
	self subclassResponsibility
]

{ #category : #accessing }
VectorialPOV >> asFigure_basic [
	
	self subclassResponsibility
]

{ #category : #private }
VectorialPOV >> calculPolyline: nbreSegments [
	"Set the outline attribut = to a Polyline"
	
	| points x y longueurArrete |
	longueurArrete := self sizeRatio * PovSetter standardCellBounds height /
			nbreSegments * 2.	"longueurArrete := 1."
	points := OrderedCollection new.
	Float pi / 2
		to: 5 / 2 * Float pi
		by: 2 * Float pi / nbreSegments
		do:
			[:angle | 
			x := 0 - (longueurArrete * angle cos).
			y := 0 - (longueurArrete * angle sin).
			points add: x @ y].
	outline := GPolygon newVertices: points
]

{ #category : #accessing }
VectorialPOV >> center [
	
	^self bounds center
]

{ #category : #accessing }
VectorialPOV >> color [
	
	^color	"ifNil:[color := ColorValue red]"
]

{ #category : #accessing }
VectorialPOV >> color: aColor [
	
	aColor isNil 
		ifTrue: [ ^ color := self color ].
	aColor class = Color 
		ifFalse: [ self inform: 'aColor isNil ! You must specify a color' ].
	color := aColor
]

{ #category : #private }
VectorialPOV >> exportIn: aStream [
	"Methode modifi√©e par NB le 10/1/2010"
	"Export the atributes value of the VectorialPOV into a stream, to save it on the disk (in .EV file)
Ex:  Robot VectorialElementaryPOV happy [followed by the attribute values of the VectorialPOV]
The attribute values saved are (in order) 
-the internal color of the shape (RGB format)
-outine color (RGB format)
-outline width
-relative size of the shape
-position of the shape in the cell
-the coordinates of the vertices of the polyline making the shape of the VectorialPOV"
	
	aStream
		nextPutAll:
			self color red printString , ' ' , self color green printString , ' '
				, self color blue printString , ' '.
	aStream
		nextPutAll:
			self lineColor red printString , ' ' , self lineColor green printString ,
					' ' , self lineColor blue printString , ' '.
	aStream nextPutAll: self lineWidth printString , ' '.
	aStream nextPutAll: self sizeRatio printString , ' '.
	aStream nextPutAll: self position asString , ' '.
	aStream nextPutAll: self outline vertices printString , ' '.	"aStream nextPutAll: self isStroked printString , ' '."	"stroke ne sert plus √† rien a priori dans Cormas MVC"
	aStream nextPutAll: '\' withCRs
]

{ #category : #private }
VectorialPOV >> getColorForPov: aSelectorName [
	"Returns a Color according to the POV (aSelectorName).
aSelectorName = <Symbol>.
A color may be define to see an entity on the grid but also on another space (ex: communication space)"
	
	self color: (self entity getColorForPov: aSelectorName).
	^self color
]

{ #category : #'initialize-release' }
VectorialPOV >> init [
	
	self
		nbSegments;
		lineWidth;
		isStroked;
		color;
		lineColor;
		position.
	super init
]

{ #category : #accessing }
VectorialPOV >> internalLines [
	"internalLines = the internal contours of a ring-like aggregate."
	
	^internalLines ifNil: [internalLines := OrderedCollection new]
]

{ #category : #accessing }
VectorialPOV >> internalLines: anObject [
	
	internalLines := anObject
]

{ #category : #accessing }
VectorialPOV >> isDistortable [
	
	^isDistortable ifNil: [isDistortable := true]
]

{ #category : #accessing }
VectorialPOV >> isDistortable: anObject [
	
	isDistortable := anObject
]

{ #category : #accessing }
VectorialPOV >> isStroked [
	
	^isStroked ifNil: [isStroked := false]
]

{ #category : #accessing }
VectorialPOV >> isStroked: b [
	
	isStroked := b.
	self changed: #stroked with: b
]

{ #category : #testing }
VectorialPOV >> isVectorialPOV [
	
	^true
]

{ #category : #accessing }
VectorialPOV >> lineColor [
	
	^ lineColor 
		ifNil: [ lineColor := Color black ]
]

{ #category : #accessing }
VectorialPOV >> lineColor: aColor [
	
	lineColor := aColor.
	self changed: #lineColor with: aColor
]

{ #category : #accessing }
VectorialPOV >> lineWidth [
	
	^lineWidth ifNil: [lineWidth := 1]
]

{ #category : #accessing }
VectorialPOV >> lineWidth: v [
	
	lineWidth := v.
	self changed: #lineWidth with: v
]

{ #category : #obsolete }
VectorialPOV >> loadFrom: uneImage [
	
	self halt	"isStroked := uneImage isStroked.
	imagePatch := uneImage imagePatch.
	nbSegments := uneImage nbSegments.
	sizeRatio := uneImage size.
	lineWidth := uneImage lineWidth.
	self calculWrapper"
]

{ #category : #accessing }
VectorialPOV >> nbSegments [
	
	^nbSegments ifNil: [nbSegments := self polyline]
]

{ #category : #transforming }
VectorialPOV >> nbSegments: n [
	
	nbSegments := n.
	self calculPolyline: n
]

{ #category : #accessing }
VectorialPOV >> outline [
	" = a Polyline"
	
	^outline
]

{ #category : #accessing }
VectorialPOV >> outline: aPolyline [
	
	outline := aPolyline
]

{ #category : #accessing }
VectorialPOV >> position [
	
	^position ifNil: [position := #center]
]

{ #category : #accessing }
VectorialPOV >> position: anObject [
	
	position := anObject
]

{ #category : #accessing }
VectorialPOV >> roundedOutline [
	" = a Polyline"
	
	| newPoints |
	newPoints := OrderedCollection new: outline vertices size.	"outline vertices do:[:point | newPoints add: ((point * 100) rounded / 100)]."
	outline vertices do: [:point | newPoints add: point rounded].
	^ GPolygon newVertices: newPoints
]

{ #category : #transforming }
VectorialPOV >> scaledBy: aScaleFactor [
	
	self subclassResponsibility
]

{ #category : #display }
VectorialPOV >> show [
	"Open an inspector showing self as figure"
	
	| fig |
	fig := self asFigure.	"self asFigure_basic."
	self isStroked
		ifTrue: [fig transparent]
		ifFalse: [fig opaque].
	fig fillColor: self color.
	fig lineColor: self lineColor.
	fig lineWidth: self lineWidth.
	fig inspect
]

Class {
	#name : #VectorialElementaryPOV,
	#superclass : #VectorialPOV,
	#category : #'Cormas-Core-Interface'
}

{ #category : #viewCorrespondance }
VectorialElementaryPOV class >> asFigure [
	^ VectorialFigure
]

{ #category : #'instance creation' }
VectorialElementaryPOV class >> circle [
	"ex : 
	(VectorialElementaryPOV circle) asFigure scaleBy: 5.  
or
	(VectorialElementaryPOV circleRadius: 40) asFigure 
 "

	^ self newNbSegments: 21
]

{ #category : #'instance creation' }
VectorialElementaryPOV class >> circleRadius: aNumber [
	"ex : 

	(VectorialElementaryPOV circleRadius: 40) asFigure 
"

	^ self new outline: (
		GCircle 
			center: (aNumber / 2) @ aNumber / 2 
			radius: aNumber) asPolyline
]

{ #category : #'instance creation' }
VectorialElementaryPOV class >> diamond [
	"ex : (VectorialElementaryPOV diamond) asFigure   "

	^ self newNbSegments: 4
]

{ #category : #'instance creation' }
VectorialElementaryPOV class >> fromPolyline: aPolyline [
	^ (self new outline: aPolyline) init
]

{ #category : #'instance creation' }
VectorialElementaryPOV class >> hexagon [
	"ex : (VectorialElementaryPOV hexagon) asFigure   "

	^ self newNbSegments: 6
]

{ #category : #'instance creation' }
VectorialElementaryPOV class >> new: aPolyline [
	^ (self new outline: aPolyline) init
]

{ #category : #'instance creation' }
VectorialElementaryPOV class >> newColor: color lineColor: linecolor lineWidth: linewidth sizeRatio: sizeR position: position vertices: vertices [
	" Ex:
(VectorialElementaryPOV newColor: ColorValue green lineColor: ColorValue red lineWidth: 1 sizeRatio: 1 position: #center vertices: ((Polyline fromRectangle: (Rectangle origin: 0@0 corner: 35@35)) vertices)  ) asFigure "
	
	| inst |
	inst := self new.
	inst color: color.
	inst lineColor: linecolor.
	inst lineWidth: linewidth.
	inst sizeRatio: sizeR.
	inst position: position.
	inst outline: (GPolygon newVertices: vertices).
	^inst
]

{ #category : #'instance creation' }
VectorialElementaryPOV class >> newLineWidth: lw nbSegments: nbs sizeRatio: sr isStroked: bool [
	"ex : (VectorialElementaryPOV newLineWidth: 3 nbSegments: 5 sizeRatio: 1.5 isStroked: false) asFigure   "
	
	| inst |
	inst := self new.
	inst lineWidth: lw.
	inst sizeRatio: sr.
	inst isStroked: bool.
	inst nbSegments: nbs.
	^inst
]

{ #category : #'instance creation' }
VectorialElementaryPOV class >> newNbSegments: nbSegments [
	"ex : (VectorialElementaryPOV newNbSegments: 8) asFigure   "
	
	| inst |
	inst := self new.
	inst calculPolyline: nbSegments.
	^inst
]

{ #category : #'instance creation' }
VectorialElementaryPOV class >> pentagon [
	"ex : (VectorialElementaryPOV pentagon) asFigure   "
	
	^self newNbSegments: 5
]

{ #category : #polyline }
VectorialElementaryPOV class >> polylineFromRadius: radius angleBetweenPoints: angleInDegrees [
	"Return a regular polygonal Polyline.
test:  (VectorialElementaryFigure polylineFromRadius: 30  angleBetweenPoints: 90) asFigure"
	"soit radius le rayon du cercle passant par tous les sommets du polygone, alors, la hauteur du polygone est de 2r, et la largeur de 2r cos 30¬∞ ( note: cos 30¬∞ = (3 sqrt)/2 = 0.866025 ), et un c√¥t√© mesure r. "
	
	| thePoints startPoint theAngle x y |
	thePoints := OrderedCollection new.
	startPoint := 0 @ radius.
	theAngle := angleInDegrees degreesToRadians.
	0
		to: 1
		by: 1
		do:
			[:verticeCounter | 
			x := startPoint x * (theAngle * verticeCounter) cos
				- (startPoint y * (theAngle * verticeCounter) sin).
			y := startPoint x * (theAngle * verticeCounter) sin
				+ (startPoint y * (theAngle * verticeCounter) cos).
			thePoints add: x @ y].
	thePoints add: ((thePoints at: 2) copy scaledBy: 1 @ -1).
	thePoints add: ((thePoints at: 1) copy scaledBy: 1 @ -1).
	thePoints add: ((thePoints at: 3) copy scaledBy: -1 @ 1).
	thePoints add: ((thePoints at: 2) copy scaledBy: -1 @ 1).
	thePoints add: (thePoints at: 1) copy.
	^  GPolygon newVertices: thePoints
]

{ #category : #'instance creation' }
VectorialElementaryPOV class >> triangle [
	"ex : (VectorialElementaryPOV triangle) asFigure   "
	
	^self newNbSegments: 3
]

{ #category : #private }
VectorialElementaryPOV >> asFigure [
	| inst |
	inst := self class asFigure new: self polyline.
	inst model: self.
	self isStroked
		ifFalse: [ inst opaque ].
	inst lineWidth: self lineWidth.
	inst lineColor: self lineColor.
	inst fillColor: self color.
	inst scaleBy: self sizeRatio.
	inst pov: self name.
	inst isDistortable: self isDistortable.
	^ inst
]

{ #category : #accessing }
VectorialElementaryPOV >> asFigure_basic [
	^ self class asFigure new: self polyline
]

{ #category : #accessing }
VectorialElementaryPOV >> asGeometric [
	^ self outline
]

{ #category : #accessing }
VectorialElementaryPOV >> bounds [
	^ self outline bounds
]

{ #category : #accessing }
VectorialElementaryPOV >> center [
	^ self outline bounds center
]

{ #category : #'initialize-release' }
VectorialElementaryPOV >> lineWidth: lw nbSegments: nbreSegments sizeRatio: sr ev: ev colR: colR colG: colG colB: colB [
	"called from 'cormas readVSFile' "

	lineWidth := lw.
	sizeRatio := sr.
	isStroked := ev.
	nbSegments := nbreSegments.
	color := Color red: colR green: colG blue: colB.
	self calculPolyline: nbreSegments
]

{ #category : #accessing }
VectorialElementaryPOV >> nbSegments [
	^ nbSegments ifNil: [ nbSegments := self polyline vertices size - 1 ]
]

{ #category : #accessing }
VectorialElementaryPOV >> points [
	^ self outline vertices
]

{ #category : #accessing }
VectorialElementaryPOV >> polyline [
	^ self outline
]

{ #category : #accessing }
VectorialElementaryPOV >> polyline: aPolyline [
	self outline: aPolyline
]

{ #category : #transforming }
VectorialElementaryPOV >> scaledBy: aScaleFactor [
	self outline: (self outline scaledBy: aScaleFactor)
]

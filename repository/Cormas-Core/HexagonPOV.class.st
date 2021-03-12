Class {
	#name : #HexagonPOV,
	#superclass : #VectorialElementaryPOV,
	#category : #'Cormas-Core-Legacy'
}

{ #category : #'instance creation' }
HexagonPOV class >> fromRadius: radius [
	"Return a regular hexagonal HexagonFigure  calculated from radius.
test:  (HexagonPOV fromRadius: 30) asFigure   "
	
	^self new: (self polylineFromRadius: radius)
]

{ #category : #'instance creation' }
HexagonPOV class >> fromSideLength: aLength [
	"Return a regular hexagonal HexagonFigure  calculated from the length of a side.
test:  (HexagonPOV fromSideLength: 30) asFigure"
	
	^self fromRadius: aLength
]

{ #category : #'instance creation' }
HexagonPOV class >> height: heigth length: length [
	"Return an irregular HexagonFigure, calculated from the heigth radius and length radius.
test: (HexagonPOV height: 80 length: 50) asFigure    "
	
	| radius |
	heigth < length
		ifTrue: [radius := heigth]
		ifFalse: [radius := length].
	^(self fromRadius: radius) scaledBy: (length / radius) @ (heigth / radius)
]

{ #category : #polyline }
HexagonPOV class >> polylineFromHeight: length length: heigth [
	"Return a hexagonal Polyline.
test:  (HexagonPOV polylineFromHeight: 30 length: 50)    "
	
	^(self height: heigth length: length) asGeometric
]

{ #category : #polyline }
HexagonPOV class >> polylineFromRadius: radius [
	"Return a regular hexagonal Polyline.
test:  HexagonFigure polylineFromRadius: 30   "
	"soit radius le rayon du cercle passant par tous les sommets de l'hexagone, alors, la hauteur de l'hexagone est de 2r, et la largeur de 2r cos 30¬∞ ( note: cos 30¬∞ = (3 sqrt)/2 = 0.866025 ), et un c√¥t√© mesure r. "
	
	^self polylineFromRadius: radius angleBetweenPoints: 60
]

{ #category : #accessing }
HexagonPOV >> nbSegments [
	
	^nbSegments ifNil: [nbSegments := 6]
]

{ #category : #accessing }
HexagonPOV >> radius [
	
	^(LineSegment
		from: (self points at: 1)
		to: (self points at: 2)) length
]

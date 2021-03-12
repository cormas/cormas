Class {
	#name : #BitmapPOV,
	#superclass : #EntityPOV,
	#instVars : [
		'bitmap',
		'position'
	],
	#category : #'Cormas-Core-Legacy'
}

{ #category : #'instance-creation' }
BitmapPOV class >> newFrom: image [
	"image must be a kind of PixelArray"
	
	| bi |
	bi := self new.
	bi bitmap: (Cormas construireOpaqueImageAvec: image).
	^bi
]

{ #category : #adjust }
BitmapPOV >> adjustedBitmapTo: aRectangle [
	"return a positive Integer if aWindowSize > (sizeRatio * self preferredBounds) otherwise a negative Integer"
	
	| aPoint v |
	"aPoint := aWindowSize extent / self rMax."
	aPoint := aRectangle extent / self bounds extent.
	v := aPoint x min: aPoint y.
	^v	"rounded"
]

{ #category : #private }
BitmapPOV >> asFigure [
	
	| inst |
	inst := self class asFigure new.
	inst bitmap: self bitmap.
	inst model: self.
	inst scaleBy: self sizeRatio.
	^inst
]

{ #category : #accessing }
BitmapPOV >> bitmap [
	
	^bitmap
]

{ #category : #accessing }
BitmapPOV >> bitmap: anObject [
	
	bitmap := anObject
]

{ #category : #accessing }
BitmapPOV >> bounds [
	
	^self bitmap bounds
]

{ #category : #accessing }
BitmapPOV >> center [
	
	^self bitmap bounds center
]

{ #category : #transforming }
BitmapPOV >> color: color [
	"do nothing"
	
	
]

{ #category : #testing }
BitmapPOV >> isBitmapPOV [
	
	^true
]

{ #category : #transforming }
BitmapPOV >> isDistortable [
	
	^false
]

{ #category : #accessing }
BitmapPOV >> position [
	
	^position ifNil: [position := #center]
]

{ #category : #accessing }
BitmapPOV >> position: anObject [
	
	position := anObject
]

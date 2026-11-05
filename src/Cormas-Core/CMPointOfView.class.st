Class {
	#name : 'CMPointOfView',
	#superclass : 'Object',
	#instVars : [
		'color',
		'shape',
		'size',
		'borderWidth',
		'borderColor',
		'tile'
	],
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'instanceCreation' }
CMPointOfView class >> color: aColor [

	^ self new
		color: aColor
		yourself
]

{ #category : 'instanceCreation' }
CMPointOfView class >> color: aColor shape: aSymbol [

	^ self new
		color: aColor;
		shape: aSymbol;
		yourself
]

{ #category : 'instanceCreation' }
CMPointOfView class >> color: aColor shape: aSymbol size: aNumber [

	^ self new
		color: aColor;
		shape: aSymbol;
		size: aNumber;
		yourself
]

{ #category : 'instanceCreation' }
CMPointOfView class >> color: aColor size: aNumber [

	^ self new
		color: aColor;
		size: aNumber;
		yourself
]

{ #category : 'accessing' }
CMPointOfView class >> shape: aSymbol [

	^ self new
		shape: aSymbol;
		yourself
]

{ #category : 'instanceCreation' }
CMPointOfView class >> shape: aSymbol size: aNumber [

	^ self new
		shape: aSymbol;
		size: aNumber;
		yourself
]

{ #category : 'accessing' }
CMPointOfView class >> size: aNumber [

	^ self new
		size: aNumber;
		yourself
]

{ #category : 'accessing' }
CMPointOfView class >> tile: aTile [

	^ self new
		tile: aTile;
		yourself
]

{ #category : 'accessing' }
CMPointOfView class >> tile: aTile size: aNumber [

	^ self new
		tile: aTile;
		size: aNumber;
		yourself
]

{ #category : 'accessing' }
CMPointOfView >> borderColor [

	^ borderColor ifNil: [ Color veryLightGray ]
]

{ #category : 'accessing' }
CMPointOfView >> borderColor: aColor [

	borderColor := aColor
]

{ #category : 'accessing' }
CMPointOfView >> borderWidth [

	^ borderWidth ifNil: [ 0.01 ]
]

{ #category : 'accessing' }
CMPointOfView >> borderWidth: aNumber [

	borderWidth := aNumber
]

{ #category : 'accessing' }
CMPointOfView >> color [

	^ color value ifNil: [ Color gray ]
]

{ #category : 'accessing' }
CMPointOfView >> color: aColor [

	color := aColor
]

{ #category : 'testing' }
CMPointOfView >> hasBorder [

	^ borderColor isNotNil or: [ borderWidth isNotNil ]
]

{ #category : 'testing' }
CMPointOfView >> hasColor [

	^ color isNotNil
]

{ #category : 'testing' }
CMPointOfView >> hasSize [

	^ size isNotNil
]

{ #category : 'initialization' }
CMPointOfView >> initialize [

	super initialize.

	shape := #circle
]

{ #category : 'testing' }
CMPointOfView >> isActiveOnANetwork [
	"Answer whether a network with this point of view decides how its links look. With no color, or a transparent one, and no size, its links show through, as cells do under an aggregate"

	^ self hasSize or: [ self hasColor and: [ self color alpha > 0 ] ]
]

{ #category : 'testing' }
CMPointOfView >> isForImage [

	^ tile isNotNil
]

{ #category : 'accessing' }
CMPointOfView >> outlineWidth [
	"Answer the width of the line around an aggregate. Its default is wider than the one of a cell border, as an outline is meant to be seen"

	^ borderWidth ifNil: [ 0.1 ]
]

{ #category : 'accessing' }
CMPointOfView >> shape [
	
	^ shape
]

{ #category : 'accessing' }
CMPointOfView >> shape: aSymbol [
	"Available shapes:
	
	o circle
	^ arrow
	s square
	p pentagon
	h hexagon
	+ plus
	d diamond
	* star"
	
	shape := aSymbol
]

{ #category : 'accessing' }
CMPointOfView >> size [

	^ size value ifNil: [ 0.3 ]
]

{ #category : 'accessing' }
CMPointOfView >> size: aNumber [

	size := aNumber
]

{ #category : 'accessing' }
CMPointOfView >> tile [

	^ tile
]

{ #category : 'accessing' }
CMPointOfView >> tile: aTile [

	tile := aTile
]

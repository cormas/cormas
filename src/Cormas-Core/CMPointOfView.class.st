Class {
	#name : 'CMPointOfView',
	#superclass : 'Object',
	#instVars : [
		'color',
		'shape',
		'size',
		'image',
		'borderWidth',
		'borderColor'
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
CMPointOfView class >> image: aForm [

	^ self new
		image: aForm;
		yourself
]

{ #category : 'accessing' }
CMPointOfView class >> image: aForm size: aNumber [

	^ self new
		image: aForm;
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
CMPointOfView >> borderColor [

	^ borderColor
]

{ #category : 'accessing' }
CMPointOfView >> borderColor: aColor [

	borderColor := aColor
]

{ #category : 'accessing' }
CMPointOfView >> borderWidth [

	^ borderWidth
]

{ #category : 'accessing' }
CMPointOfView >> borderWidth: aNumber [

	borderWidth := aNumber
]

{ #category : 'accessing' }
CMPointOfView >> color [
	
	^ color value
]

{ #category : 'accessing' }
CMPointOfView >> color: aColor [

	color := aColor
]

{ #category : 'accessing' }
CMPointOfView >> image [

	^ image
]

{ #category : 'accessing' }
CMPointOfView >> image: aForm [

	image := aForm
]

{ #category : 'initialization' }
CMPointOfView >> initialize [

	super initialize.
	
	color := Color gray.
	size := 0.3.
	shape := #circle.
	borderWidth := 0.01.
	borderColor := Color veryLightGray.
]

{ #category : 'testing' }
CMPointOfView >> isForImage [

	^ image isNotNil
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

	^ size value
]

{ #category : 'accessing' }
CMPointOfView >> size: aNumber [

	size := aNumber
]

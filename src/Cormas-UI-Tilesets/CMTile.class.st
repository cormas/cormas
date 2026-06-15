"
This is a structure for a tile (image) that allows us to combine different variants such as various sizes, themes, etc.
"
Class {
	#name : 'CMTile',
	#superclass : 'Object',
	#instVars : [
		'verySmallForm',
		'smallForm',
		'mediumForm',
		'largeForm'
	],
	#category : 'Cormas-UI-Tilesets-Core',
	#package : 'Cormas-UI-Tilesets',
	#tag : 'Core'
}

{ #category : 'constants' }
CMTile class >> largeExtent [

	^ 300@300
]

{ #category : 'constants' }
CMTile class >> mediumExtent [

	^ 100@100
]

{ #category : 'instance creation' }
CMTile class >> newFrom: aBase64String [

	^ self new
		initializeWithBase64: aBase64String;
		yourself
]

{ #category : 'instance creation' }
CMTile class >> newFromForm: aForm [

	^ self new
		initializeWithForm: aForm;
		yourself
]

{ #category : 'constants' }
CMTile class >> smallExtent [

	^ 48@48
]

{ #category : 'constants' }
CMTile class >> verySmallExtent [

	^ 15@15
]

{ #category : 'arithmetic' }
CMTile >> + aTile [

	^ self class newFromForm: (self largeForm + aTile largeForm)
		
]

{ #category : 'arithmetic' }
CMTile >> add: aTile scaledDownTo: aProportion [

	| topForm |
	topForm := aTile largeForm.
	topForm := topForm scaledToSize: (topForm extent * aProportion).
	
	^ self class newFromForm: (self largeForm + topForm)
		
]

{ #category : 'base64 conversion' }
CMTile >> formFromBase64: aString [

	^ Form fromBinaryStream: aString base64Decoded asByteArray readStream
]

{ #category : 'initialization' }
CMTile >> initializeWithBase64: aString [

	self initializeWithForm: (self formFromBase64: aString)
]

{ #category : 'initialization' }
CMTile >> initializeWithForm: aForm [

	| originalForm |
	originalForm := aForm.
	
	largeForm := originalForm scaledToSize: self class largeExtent.
	mediumForm := originalForm scaledToSize: self class mediumExtent.
	smallForm := originalForm scaledToSize: self class smallExtent.
	verySmallForm := originalForm scaledToSize: self class verySmallExtent
]

{ #category : 'accessing' }
CMTile >> largeForm [

	^ largeForm
]

{ #category : 'accessing' }
CMTile >> mediumForm [

	^ mediumForm
]

{ #category : 'accessing' }
CMTile >> smallForm [

	^ smallForm
]

{ #category : 'accessing' }
CMTile >> verySmallForm [

	^ verySmallForm
]

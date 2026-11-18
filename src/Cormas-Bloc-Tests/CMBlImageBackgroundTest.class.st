Class {
	#name : 'CMBlImageBackgroundTest',
	#superclass : 'TestCase',
	#instVars : [
		'folder',
		'directory'
	],
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'running' }
CMBlImageBackgroundTest >> assertTransparentIn: aForm at: aPoint [

	self assert: (aForm colorAt: aPoint) alpha < 0.05
]

{ #category : 'running' }
CMBlImageBackgroundTest >> draw: anImage [
	"The pixels of an 8 by 8 element that shows anImage"

	| element |
	element := BlElement new
		           extent: 8 @ 8;
		           background: (CMBlImageBackground
				            image: anImage
				            color: Color transparent
				            extent: 8 @ 8
				            scale: 1
				            folder: folder);
		           yourself.
	element forceLayout.
	^ element aeAsForm
]

{ #category : 'running' }
CMBlImageBackgroundTest >> hexIn: aForm at: aPoint [

	^ (aForm colorAt: aPoint) asHexString
]

{ #category : 'running' }
CMBlImageBackgroundTest >> setUp [

	super setUp.
	directory := FileSystem memory root / 'images'.
	directory ensureCreateDirectory.
	folder := CMBlImageFolder on: directory
]

{ #category : 'running' }
CMBlImageBackgroundTest >> stripes: colors width: aNumber height: anotherNumber [
	"A form made of vertical stripes of the given colors, each aNumber pixels wide"

	| form |
	form := Form extent: aNumber * colors size @ anotherNumber depth: 32.
	colors doWithIndex: [ :each :index |
			form
				fill: (index - 1 * aNumber @ 0 extent: aNumber @ anotherNumber)
				fillColor: each ].
	^ form
]

{ #category : 'tests' }
CMBlImageBackgroundTest >> testACombinedImageIsResizedAsAWhole [

	| form |
	self write: Color red named: 'soil'.
	self write: Color blue named: 'pond'.
	form := self draw:
		        ((CMImage named: 'soil')
		         + ((CMImage named: 'pond') size: 0.5) size: 0.5).
	self assert: (self hexIn: form at: 4 @ 4) equals: '0000FF'.
	self assert: (self hexIn: form at: 2 @ 4) equals: 'FF0000'.
	self assertTransparentIn: form at: 1 @ 1
]

{ #category : 'tests' }
CMBlImageBackgroundTest >> testASizedImageIsASquareOfThatFractionInTheCentre [

	| form |
	self write: Color red named: 'apple'.
	form := self draw: ((CMImage named: 'apple') size: 0.5).
	self assert: (self hexIn: form at: 4 @ 4) equals: 'FF0000'.
	self assertTransparentIn: form at: 1 @ 1.
	self assertTransparentIn: form at: 6 @ 6
]

{ #category : 'tests' }
CMBlImageBackgroundTest >> testAnImageCoversTheElementAndIsCroppedToItsCentre [

	| form |
	self
		write: (self
				 stripes: {
						 Color red.
						 Color green.
						 Color blue }
				 width: 4
				 height: 4)
		as: 'flag'.
	form := self draw: (CMImage named: 'flag').
	self assert: (self hexIn: form at: 2 @ 4) equals: '00FF00'.
	self assert: (self hexIn: form at: 5 @ 4) equals: '00FF00'
]

{ #category : 'tests' }
CMBlImageBackgroundTest >> testAnImageStaysSharpWhenZoomedIn [

	| element parent form |
	self
		write: (self
				 stripes: {
						 Color red.
						 Color blue.
						 Color red.
						 Color blue.
						 Color red.
						 Color blue.
						 Color red.
						 Color blue }
				 width: 1
				 height: 8)
		as: 'stripes'.
	element := BlElement new
		           extent: 4 @ 4;
		           background: (CMBlImageBackground
				            image: (CMImage named: 'stripes')
				            color: Color transparent
				            extent: 4 @ 4
				            scale: 2
				            folder: folder);
		           yourself.
	element transformDo: [ :transform |
			transform
				topLeftOrigin;
				scaleBy: 2 ].
	parent := BlElement new
		          extent: 8 @ 8;
		          addChild: element;
		          yourself.
	parent forceLayout.
	form := parent aeAsForm.
	self assert: (self hexIn: form at: 2 @ 4) equals: 'FF0000'.
	self assert: (self hexIn: form at: 3 @ 4) equals: '0000FF'
]

{ #category : 'tests' }
CMBlImageBackgroundTest >> testLayersAreLaidInOrder [

	| form |
	self write: Color red named: 'soil'.
	self write: Color blue named: 'pond'.
	form := self draw:
		        (CMImage named: 'soil')
		        + ((CMImage named: 'pond') size: 0.5).
	self assert: (self hexIn: form at: 4 @ 4) equals: '0000FF'.
	self assert: (self hexIn: form at: 1 @ 1) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlImageBackgroundTest >> testShiftMovesTheImageByAFractionOfTheElement [

	| form |
	self write: Color red named: 'apple'.
	form := self draw: ((CMImage named: 'apple')
			         size: 0.5;
			         shift: 0.25 @ 0;
			         yourself).
	self assert: (self hexIn: form at: 6 @ 4) equals: 'FF0000'.
	self assertTransparentIn: form at: 3 @ 4
]

{ #category : 'tests' }
CMBlImageBackgroundTest >> testTintColorsOnlyThePixelsOfTheImage [

	| form tinted |
	self write: Color white named: 'snow'.
	form := self draw: ((CMImage named: 'snow')
			         size: 0.5;
			         tint: (Color red alpha: 0.5);
			         yourself).
	tinted := form colorAt: 4 @ 4.
	self assert: tinted red > 0.95.
	self assert: (tinted green between: 0.4 and: 0.6).
	self assert: (tinted blue between: 0.4 and: 0.6).
	self assertTransparentIn: form at: 1 @ 1
]

{ #category : 'running' }
CMBlImageBackgroundTest >> write: aForm as: aName [

	directory / (aName , '.png') binaryWriteStreamDo: [ :stream |
		PNGReadWriter putForm: aForm onStream: stream ]
]

{ #category : 'running' }
CMBlImageBackgroundTest >> write: aColor named: aName [

	self write: (self stripes: { aColor } width: 4 height: 4) as: aName
]

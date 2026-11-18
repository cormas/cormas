Class {
	#name : 'CMBlImageElementTest',
	#superclass : 'CMBlTestCase',
	#instVars : [
		'directory'
	],
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'running' }
CMBlImageElementTest >> cellWithAspect: aBlock [

	| cell |
	cell := model cellAt: 1 at: 1.
	cell aspect: aBlock.
	^ cell
]

{ #category : 'running' }
CMBlImageElementTest >> setUp [

	super setUp.
	directory := FileSystem memory root.
	(directory / 'images') ensureCreateDirectory.
	CMBlImageTestModel folder: directory.
	model := CMBlImageTestModel new.
	model cellClass: CMBlTestCell.
	model
		createGridNumberOfRows: 2
		numberOfColumns: 2
		neighbourhood: 4
		closed: true
]

{ #category : 'running' }
CMBlImageElementTest >> spaceIn: aParent [

	| space |
	space := CMBlSpaceElement for: model.
	aParent addChild: space.
	aParent forceLayout.
	^ space
]

{ #category : 'running' }
CMBlImageElementTest >> tearDown [

	CMBlImageFolder forgetModel: CMBlImageTestModel.
	CMBlImageTestModel folder: nil.
	super tearDown
]

{ #category : 'tests' }
CMBlImageElementTest >> testACellShowsItsImage [

	| cell |
	self write: Color green named: 'grass'.
	cell := self cellWithAspect: [ :look | look image: 'grass' ].
	self
		assert: (self hexColorIn: (CMBlCellElement for: cell) at: 16 @ 16)
		equals: '00FF00'
]

{ #category : 'tests' }
CMBlImageElementTest >> testANewViewReadsTheImageFilesAgain [

	| cell |
	self write: Color green named: 'grass'.
	cell := self cellWithAspect: [ :look | look image: 'grass' ].
	self
		assert: (self hexColorIn: (CMBlCellElement for: cell) at: 16 @ 16)
		equals: '00FF00'.
	self write: Color red named: 'grass'.
	CMBlSpaceElement for: model.
	self
		assert: (self hexColorIn: (CMBlCellElement for: cell) at: 16 @ 16)
		equals: 'FF0000'
]

{ #category : 'tests' }
CMBlImageElementTest >> testASavedPictureShowsImagesSharply [
	"A cell is 1000 pixels wide in the picture, so each stripe of the image, 32 of its 1024 pixels, is about 31 pixels wide"

	| file form |
	self writeStripesNamed: 'stripes' side: 1024 stripeWidth: 32.
	model cells do: [ :each |
		each aspect: [ :look | look image: 'stripes' ] ].
	file := FileSystem memory / 'space.png'.
	(CMBlSpaceElement for: model) saveToPngFile: file.
	form := file binaryReadStreamDo: [ :stream |
		        PNGReadWriter formFromStream: stream ].
	self assert: (form colorAt: 516 @ 500) asHexString equals: 'FF0000'.
	self assert: (form colorAt: 547 @ 500) asHexString equals: '0000FF'
]

{ #category : 'tests' }
CMBlImageElementTest >> testAnAgentAddedToAZoomedViewShowsItsImageSharply [

	| parent space agent form |
	self writeStripesNamed: 'stripes' side: 64 stripeWidth: 1.
	parent := BlElement new extent: 64 @ 64.
	space := self spaceIn: parent.
	space zoomBy: 2 at: 0 @ 0.
	agent := model newEntity: CMBlTestAgent.
	agent aspect: [ :look |
			look
				image: 'stripes';
				shape: #square;
				size: 1 ].
	agent moveTo: (model cellAt: 1 at: 1).
	space refresh.
	form := self formOf: parent.
	self assert: (form colorAt: 10 @ 10) asHexString equals: 'FF0000'.
	self assert: (form colorAt: 11 @ 10) asHexString equals: '0000FF'
]

{ #category : 'tests' }
CMBlImageElementTest >> testAnAgentImageIsCutToItsShape [

	| agent element |
	self write: Color red named: 'apple'.
	agent := model newEntity: CMBlTestAgent.
	agent aspect: [ :look |
			look
				image: 'apple';
				shape: #circle;
				size: 1 ].
	element := CMBlAgentElement for: agent.
	self assert: (self hexColorIn: element at: 16 @ 16) equals: 'FF0000'.
	self assert: (self isTransparentIn: element at: 1 @ 1)
]

{ #category : 'tests' }
CMBlImageElementTest >> testCellsOfTheSameImageMeetWithoutASeam [
	"Zoomed so that cell edges fall in the middle of pixels, four cells showing the same image without borders look like one continuous area, also where their corners meet"

	| cells container form |
	self write: Color green named: 'grass'.
	cells := model cells collect: [ :each |
			         each aspect: [ :look |
					         look
						         image: 'grass';
						         borderThickness: 0 ].
			         (CMBlCellElement for: each)
				         position:
					         each columnNumber - 1 @ (each rowNumber - 1) * 32;
				         yourself ].
	container := BlElement new
		             extent: 60 @ 60;
		             background: Color white;
		             addChild: (BlElement new
				              extent: 100 @ 100;
				              transformDo: [ :transform |
						              transform
							              topLeftOrigin;
							              scaleBy: 0.7 ];
				              addChildren: cells;
				              yourself);
		             yourself.
	form := self formOf: container.
	self
		assert: ((0 to: 43) inject: 0 into: [ :count :x |
					 count + ((0 to: 43) count: [ :y |
						  (form colorAt: x @ y) asHexString ~= '00FF00' ]) ])
		equals: 0
]

{ #category : 'tests' }
CMBlImageElementTest >> testElementsShowingTheSameImageShareOneBackground [

	| aspect first second |
	self write: Color green named: 'grass'.
	aspect := [ :look | look image: 'grass' ].
	(model cellAt: 1 at: 1) aspect: aspect.
	(model cellAt: 1 at: 2) aspect: aspect.
	first := CMBlCellElement for: (model cellAt: 1 at: 1).
	second := CMBlCellElement for: (model cellAt: 1 at: 2).
	self assert: first background identicalTo: second background
]

{ #category : 'tests' }
CMBlImageElementTest >> testImagesStaySharpWhenTheViewIsZoomedIn [

	| parent space form |
	self writeStripesNamed: 'stripes' side: 64 stripeWidth: 1.
	model cells do: [ :each |
		each aspect: [ :look | look image: 'stripes' ] ].
	parent := BlElement new extent: 64 @ 64.
	space := self spaceIn: parent.
	space zoomBy: 2 at: 0 @ 0.
	form := self formOf: parent.
	self assert: (form colorAt: 10 @ 10) asHexString equals: 'FF0000'.
	self assert: (form colorAt: 11 @ 10) asHexString equals: '0000FF'
]

{ #category : 'tests' }
CMBlImageElementTest >> testTheColorShowsAroundASmallerImage [

	| cell element |
	self write: Color blue named: 'pond'.
	cell := self cellWithAspect: [ :look |
			        look
				        color: Color red;
				        image: ((CMImage named: 'pond') size: 0.5) ].
	element := CMBlCellElement for: cell.
	self assert: (self hexColorIn: element at: 16 @ 16) equals: '0000FF'.
	self assert: (self hexColorIn: element at: 2 @ 2) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlImageElementTest >> testUpdateChangesFromAColorToAnImage [

	| cell element |
	self write: Color green named: 'grass'.
	cell := self cellWithAspect: [ :look | look color: Color red ].
	element := CMBlCellElement for: cell.
	self assert: (self hexColorIn: element at: 16 @ 16) equals: 'FF0000'.
	cell aspect: [ :look | look image: 'grass' ].
	element update.
	self assert: (self hexColorIn: element at: 16 @ 16) equals: '00FF00'
]

{ #category : 'tests' }
CMBlImageElementTest >> testZoomingAViewMadeEmptyShowsNothingBeforeItsFirstUpdate [

	| parent space |
	self write: Color green named: 'grass'.
	model cells do: [ :each |
		each aspect: [ :look | look image: 'grass' ] ].
	parent := BlElement new extent: 32 @ 32.
	space := CMBlSpaceElement emptyFor: model observedBy: CMObserver new.
	parent addChild: space.
	space zoomBy: 4 at: 0 @ 0.
	self assert: (self isTransparentIn: parent at: 16 @ 16)
]

{ #category : 'running' }
CMBlImageElementTest >> write: aColor named: aName [

	| form |
	form := Form extent: 4 @ 4 depth: 32.
	form fillColor: aColor.
	directory / 'images' / (aName , '.png') binaryWriteStreamDo: [
		:stream | PNGReadWriter putForm: form onStream: stream ]
]

{ #category : 'running' }
CMBlImageElementTest >> writeStripesNamed: aName side: aNumber stripeWidth: anotherNumber [
	"A square image of vertical stripes, alternately red and blue"

	| form |
	form := Form extent: aNumber @ aNumber depth: 32.
	0 to: aNumber - 1 by: anotherNumber do: [ :x |
			form
				fill: (x @ 0 extent: anotherNumber @ aNumber)
				fillColor: ((x // anotherNumber) even
						 ifTrue: [ Color red ]
						 ifFalse: [ Color blue ]) ].
	directory / 'images' / (aName , '.png') binaryWriteStreamDo: [
		:stream | PNGReadWriter putForm: form onStream: stream ]
]

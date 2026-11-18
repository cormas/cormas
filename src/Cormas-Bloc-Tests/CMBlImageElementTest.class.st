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
	self writeStripesNamed: 'stripes'.
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
CMBlImageElementTest >> writeStripesNamed: aName [
	"A 64 by 64 image of vertical stripes, one pixel wide, alternately red and blue"

	| form |
	form := Form extent: 64 @ 64 depth: 32.
	0 to: 63 do: [ :x |
			form fill: (x @ 0 extent: 1 @ 64) fillColor: (x even
					 ifTrue: [ Color red ]
					 ifFalse: [ Color blue ]) ].
	directory / 'images' / (aName , '.png') binaryWriteStreamDo: [
		:stream | PNGReadWriter putForm: form onStream: stream ]
]

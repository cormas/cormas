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

{ #category : 'running' }
CMBlImageElementTest >> write: aColor named: aName [

	| form |
	form := Form extent: 4 @ 4 depth: 32.
	form fillColor: aColor.
	directory / 'images' / (aName , '.png') binaryWriteStreamDo: [
		:stream | PNGReadWriter putForm: form onStream: stream ]
]

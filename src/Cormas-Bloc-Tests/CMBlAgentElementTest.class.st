"
I test what the element named after me draws, by reading the pixels of the rendered element.

## Responsibility:

- Check colors, shapes, sizes and positions as they appear on screen.
- Check that `update` shows the changes made to the model.

## Collaborators:

- `CMBlTestCase`: builds the grid and reads the pixels.

## Public API and Key Messages

Expected pixel positions are worked out from the size of a cell, 32 pixels, and the geometry of each grid.
"
Class {
	#name : 'CMBlAgentElementTest',
	#superclass : 'CMBlTestCase',
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'tests' }
CMBlAgentElementTest >> centerOf: anElement [

	^ (self formOf: anElement) extent / 2
]

{ #category : 'private' }
CMBlAgentElementTest >> elementWithShape: aSymbol [
	"A cell-sized agent, not on any cell, so that its shape fills 32x32 pixels"

	| agent |
	agent := CMMockModel new newEntity: CMBlTestAgent.
	agent testPov:
		(CMPointOfView color: Color red shape: aSymbol size: 1).
	^ CMBlAgentElement for: agent
]

{ #category : 'tests' }
CMBlAgentElementTest >> testCircle [

	| element |
	element := self elementWithShape: #circle.

	self assert: (self hexColorIn: element at: 16 @ 16) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 16 @ 2) equals: 'FF0000'.
	self assert: (self isTransparentIn: element at: 2 @ 2)
]

{ #category : 'tests' }
CMBlAgentElementTest >> testDiamond [

	| element |
	element := self elementWithShape: #diamond.

	self assert: (self hexColorIn: element at: 16 @ 16) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 16 @ 3) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 3 @ 16) equals: 'FF0000'.
	self assert: (self isTransparentIn: element at: 3 @ 3)
]

{ #category : 'tests' }
CMBlAgentElementTest >> testExtentIsProportionalToCellSize [

	| agent element |
	agent := CMMockModel new newEntity: CMBlTestAgent.
	agent testPov:
		(CMPointOfView color: Color red shape: #square size: 0.5).

	element := CMBlAgentElement for: agent.

	self assert: (self formOf: element) extent equals: 16 @ 16
]

{ #category : 'tests' }
CMBlAgentElementTest >> testHexagon [

	| element |
	element := self elementWithShape: #hexagon.

	self assert: (self hexColorIn: element at: 16 @ 16) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 2 @ 16) equals: 'FF0000'.
	self assert: (self isTransparentIn: element at: 2 @ 2)
]

{ #category : 'tests' }
CMBlAgentElementTest >> testShowsColorOfPov [

	| cow |
	cow := CMMockModel new newEntity: CMMockCow.

	self
		assert: (self
				 hexColorIn: (CMBlAgentElement for: cow)
				 at: (self centerOf: (CMBlAgentElement for: cow)))
		equals: 'FF0000'
]

{ #category : 'tests' }
CMBlAgentElementTest >> testSquare [

	| element |
	element := self elementWithShape: #square.

	self assert: (self hexColorIn: element at: 16 @ 16) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 2 @ 2) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 29 @ 29) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlAgentElementTest >> testStar [
	"A star has a tip at the top, and a notch at the bottom"

	| element |
	element := self elementWithShape: #star.

	self assert: (self hexColorIn: element at: 16 @ 16) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 16 @ 3) equals: 'FF0000'.
	self assert: (self isTransparentIn: element at: 16 @ 29).
	self assert: (self isTransparentIn: element at: 3 @ 3)
]

{ #category : 'tests' }
CMBlAgentElementTest >> testTriangle [
	"An upright triangle has its tip at the top, and its base at the bottom"

	| element |
	element := self elementWithShape: #triangle.

	self assert: (self hexColorIn: element at: 16 @ 16) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 3 @ 29) equals: 'FF0000'.
	self assert: (self isTransparentIn: element at: 3 @ 3)
]

{ #category : 'tests' }
CMBlAgentElementTest >> testUnknownShapeRaisesClearError [

	| message |
	message := [
		           self elementWithShape: #arrowedLine.
		           nil ]
		           on: Error
		           do: [ :error | error messageText ].

	self assert: message isNotNil.
	self assert: (message includesSubstring: 'arrowedLine').
	self assert: (message includesSubstring: 'circle')
]

{ #category : 'tests' }
CMBlAgentElementTest >> testUpdateShowsNewPov [

	| agent element |
	agent := CMMockModel new newEntity: CMBlTestAgent.
	agent testPov:
		(CMPointOfView color: Color red shape: #square size: 1).
	element := CMBlAgentElement for: agent.

	agent testPov:
		(CMPointOfView color: Color blue shape: #square size: 1).
	element update.

	self assert: (self hexColorIn: element at: 16 @ 16) equals: '0000FF'
]

{ #category : 'tests' }
CMBlAgentElementTest >> testUpdateShowsNewShape [

	| agent element |
	agent := CMMockModel new newEntity: CMBlTestAgent.
	agent testPov:
		(CMPointOfView color: Color red shape: #square size: 1).
	element := CMBlAgentElement for: agent.

	agent testPov:
		(CMPointOfView color: Color red shape: #circle size: 1).
	element update.

	self assert: (self isTransparentIn: element at: 2 @ 2)
]

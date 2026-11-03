"
I check that tiles can be combined by drawing one on top of another.

## Responsibility:

- Check the result of combining two forms.
- Check that combining works on forms that were compressed by saving the image.

## Collaborators: 

- `CMTile` and `Form`: combine the images.

### Implementation Points

Pharo compresses forms when an image is saved. `Form>>hibernate` does the same in a test.
"
Class {
	#name : 'CMTileTest',
	#superclass : 'TestCase',
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'private' }
CMTileTest >> solidForm: aColor extent: aPoint [

	^ (Form extent: aPoint depth: 32)
		  fillColor: aColor;
		  yourself
]

{ #category : 'tests' }
CMTileTest >> testCombiningDrawsTheTopFormInTheCenter [

	| result |
	result := (self solidForm: Color red extent: 30 @ 30)
	          + (self solidForm: Color blue extent: 10 @ 10).

	self assert: (result colorAt: 15 @ 15) asHexString equals: '0000FF'.
	self assert: (result colorAt: 2 @ 2) asHexString equals: 'FF0000'
]

{ #category : 'tests' }
CMTileTest >> testCombiningFormsCompressedBySavingTheImage [

	| bottom top result |
	bottom := self solidForm: Color red extent: 30 @ 30.
	top := self solidForm: Color blue extent: 10 @ 10.
	bottom hibernate.
	top hibernate.

	result := bottom + top.

	self assert: (result colorAt: 15 @ 15) asHexString equals: '0000FF'.
	self assert: (result colorAt: 2 @ 2) asHexString equals: 'FF0000'
]

{ #category : 'tests' }
CMTileTest >> testCombiningKeepsTheOriginalForms [

	| bottom |
	bottom := self solidForm: Color red extent: 30 @ 30.
	bottom hibernate.

	bottom + (self solidForm: Color blue extent: 10 @ 10).

	self assert: (bottom colorAt: 15 @ 15) asHexString equals: 'FF0000'
]

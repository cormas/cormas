"
I test the defaults of `CMPointOfView`, and how it tells what was specified from what was left out.

## Responsibility:

- Check the color and border that cells and agents get by default.
- Check that a point of view knows whether a color or a border was specified.
- Check the width of the outline of an aggregate.

## Collaborators:

- `CMPointOfView`: the class under test.

## Public API and Key Messages

Run me as any `TestCase`.
"
Class {
	#name : 'CMPointOfViewTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests-Model',
	#package : 'Cormas-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
CMPointOfViewTest >> testColorCanBeABlock [

	| pov |
	pov := CMPointOfView color: [ Color red ].

	self assert: pov color equals: Color red.
	self assert: pov hasColor
]

{ #category : 'tests' }
CMPointOfViewTest >> testDefaultValues [

	| pov |
	pov := CMPointOfView new.

	self assert: pov color equals: Color gray.
	self assert: pov borderColor equals: Color veryLightGray.
	self assert: pov borderWidth equals: 0.01.
	self assert: pov outlineWidth equals: 0.1
]

{ #category : 'tests' }
CMPointOfViewTest >> testHasBorder [

	self deny: CMPointOfView new hasBorder.
	self assert: (CMPointOfView new borderColor: Color red) hasBorder.
	self assert: (CMPointOfView new borderWidth: 0.2) hasBorder
]

{ #category : 'tests' }
CMPointOfViewTest >> testHasColor [

	self deny: CMPointOfView new hasColor.
	self assert: (CMPointOfView color: Color red) hasColor.
	self assert: (CMPointOfView color: Color transparent) hasColor
]

{ #category : 'tests' }
CMPointOfViewTest >> testSpecifiedBorderColorIsAnswered [

	self
		assert: (CMPointOfView new borderColor: Color red) borderColor
		equals: Color red
]

{ #category : 'tests' }
CMPointOfViewTest >> testSpecifiedWidthIsUsedForBorderAndOutline [

	| pov |
	pov := CMPointOfView new borderWidth: 0.2.

	self assert: pov borderWidth equals: 0.2.
	self assert: pov outlineWidth equals: 0.2
]

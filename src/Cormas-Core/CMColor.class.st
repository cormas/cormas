"
I represent a color in Cormas: a `Color` with extra named constants and utilities that turn numbers into colors. Points of view use me to choose how entities look.

## Responsibility:

- Provide named colors, on my class side.
- Pick a color from a number, cycling through the named colors.
- Interpolate a color for a value within a range.

## Public API and Key Messages

- `colorOfNumber:` answers the named color at a position in `colorNames`.
- `colorValue:min:max:color:` answers a shade of a color for a value in a range.
- `colorValue:min:color:max:color:` answers a blend of two colors for a value in a range.

```
CMColor colorOfNumber: 65
```

"
Class {
	#name : 'CMColor',
	#superclass : 'Color',
	#category : 'Cormas-Core-Helpers',
	#package : 'Cormas-Core',
	#tag : 'Helpers'
}

{ #category : 'as yet unclassified' }
CMColor class >> azure [
	<script: 'self azure inspect'>
	^ Color fromHexString: '0080FE'
]

{ #category : 'constants' }
CMColor class >> black [
	<script: 'self black inspect'>
	^ Color black
]

{ #category : 'accessing' }
CMColor class >> blue [
	<script: 'self blue inspect'>
	^ Color fromHexString: '1034A6'
]

{ #category : 'accessing - defaults' }
CMColor class >> brown [
	<script: 'self brown inspect'>
	^ Color fromHexString: '7E481C'
]

{ #category : 'utilities - colors' }
CMColor class >> colorNames [
	"Returns an array of color names: (#red #yellow #green...)"
	"Ex: (CMColor colorNames collect: [:s | CMColor perform: s]) inspect"

	| colorSpecs |
	
	colorSpecs :=
		Color defaultColors,
		Color defaultColors2,
		Color defaultColors3,
		Color defaultColors4.
	
	^ Array streamContents: [ :stream |
		  1 to: colorSpecs size by: 4 do: [ :i |
		  stream nextPut: (colorSpecs at: i) ] ]
]

{ #category : 'constants' }
CMColor class >> copper [
	<script: 'self copper inspect'>
	^ Color fromHexString: 'B87333'
]

{ #category : 'accessing - defaults' }
CMColor class >> gold [
	<script: 'self gold inspect'>
	^ Color fromHexString: 'E5B80B'
]

{ #category : 'constants' }
CMColor class >> green [
	<script: 'self green inspect'>
	^ Color fromHexString: '00b44c'
]

{ #category : 'as yet unclassified' }
CMColor class >> olympic [
	<script: 'self olympic inspect'>
	^ Color fromHexString: '008ECC'
]

{ #category : 'accessing - defaults' }
CMColor class >> orange [
	<script: 'self orange inspect'>
	^ Color fromHexString: 'FF7417'
]

{ #category : 'constants' }
CMColor class >> red [
	<script: 'self red inspect'>
	^ Color fromHexString: 'B90E0A'
]

{ #category : 'constants' }
CMColor class >> tangerine [
	<script: 'self tangerine inspect'>
	^ Color fromHexString: 'F28500'
]

{ #category : 'as yet unclassified' }
CMColor class >> tiffanyBlue [
	<script: 'self tiffanyBlue inspect'>
	^ Color fromHexString: '0ABAB5'
]

{ #category : 'see class side' }
CMColor >> seeClassSide [
]
